# encoding: UTF-8

module ::Ruuuby

  # information and utilities that define and work w/ aspects of `Ruuuby`
  module MetaData

    # `💎.engine`
    class RuuubyEngine

      class << self; def _get_engine; 💎.engine; end; end

      module Syntax
        FEATURE_BEHAVIOR = 'b\d\d({\w+})?'
      end

      include ::Ruuuby::Attribute::Includable::SyntaxCache
      include ::Singleton

      attr_reader :logger, :state_flag, :logging_level, :logging_mode, :api, :api_git, :api_brew, :api_docker, :api_locale, :path_base

      attr_reader :gc, :jit, :source, :os

      attr_reader :stats_ext_timer, :stats_ext_compiler, :stats_ext, :stats_ext_mem_pre_load, :stats_ext_mem_post_load

      def print_ext_stats
        delta_ms   = @stats_ext_timer / 1000.0
        mem_start  = @stats_ext_mem_pre_load.to_f / 1024.0
        mem_end    = @stats_ext_mem_post_load.to_f / 1024.0
        @stats_ext = "extensions w/ compiler{#{@stats_ext_compiler}}, loaded in{#{delta_ms.to_s} ms}, w/ following pre/post-loaded-memory: {#{mem_start.to_s} MB -> #{mem_end.to_s} MB}"
        💎.engine.info(@stats_ext)
      end

      # state flags
      # | 0 | not started |
      # | 1 | engine started |
      # | 2 | engined stopped |
      def initialize
        @path_base      = "#{::File.dirname(::File.dirname(::File.dirname(::File.dirname(::File.dirname(__FILE__)))))}/"
        @state_flag      = 0
        @logger         = nil
        @echo_to_stdout = false
        @logging_mode   = nil
        @logging_level  = ::Logger::DEBUG
        @api_git        = ::Ruuuby::MetaData::GitAPI.new(self)
        @api_brew       = ::Ruuuby::MetaData::BrewAPI.new(self)
        @api            = ::Ruuuby::MetaData::RuuubyAPI.new(self, @api_brew)
        @api_docker     = ::Ruuuby::MetaData::DockerAPI.new(self, '1.40')
        @api_locale     = ::Ruuuby::MetaData::LocaleAPI.new(self)
        @orm            = nil

        @gc     = ::Ruuuby::MetaData::RuuubyEngine::F22B00
        @jit    = ::Ruuuby::MetaData::RuuubyEngine::F22B01
        @os     = ::Ruuuby::MetaData::RuuubyEngine::F22B05
        @source = ::Ruuuby::MetaData::RuuubyEngine::F22B06
      end

      # @raise [RuntimeError] if called more than once
      def warm_up
        if @state_flag == 0
          self.setup_logger
          self.gc.total_memory_usage_current('starting-up') if @logging_level == ::Logger::INFO
          @state_flag += 1
        else
          🛑 ::RuntimeError.new("| RuuubyEngine should only be warmed up once |")
        end
      end

      # @return [::Ruuuby::MetaData::RuuubyORM]
      def orm
        if @orm.nil?
          self.enable_orm
        end
        @orm
      end

      def enable_orm
        require_relative '../ruuuby_orm'
        @orm = ::Ruuuby::MetaData::RuuubyORM.new(self)
        @orm.ensure_loaded_db_libs
      end

      # @raise [RuntimeError] if called when the engine isn't currently warm
      def cool_down
        if @state_flag == 1
          unless @logger == nil
            self.gc.total_memory_usage_current('terminating') if @logging_level == ::Logger::INFO
            💎.engine.debug('closing logger!')
            @logger.close
          end
          @state_flag += 1
        else
          🛑 RuntimeError.new("| RuuubyEngine w/ func{cool_down} tried to move to state{2} when currently in state{#{@state_flag.to_s}} |")
        end
      end

      #    ___    __      _
      #  /'___\ /'__`\  /' \
      # /\ \__//\ \/\ \/\_, \
      # \ \ ,__\ \ \ \ \/_/\ \
      #  \ \ \_/\ \ \_\ \ \ \ \
      #   \ \_\  \ \____/  \ \_\
      #    \/_/   \/___/    \/_/
      #

      #    ___    ___       ___
      #  /'___\ /'___`\   /'___`\
      # /\ \__//\_\ /\ \ /\_\ /\ \
      # \ \ ,__\/_/// /__\/_/// /__
      #  \ \ \_/  // /_\ \  // /_\ \
      #   \ \_\  /\______/ /\______/
      #    \/_/  \/_____/  \/_____/
      #
      # TODO: implement once needed/more benefit in doing so
      #  * https://stackoverflow.com/questions/6067139/ruby-garbage-collect
      #  * https://stackoverflow.com/questions/11912750/ruby-big-array-and-memory
      #  * https://samsaffron.com/archive/2013/11/22/demystifying-the-ruby-gc
      #  * https://www.speedshop.co/2017/03/09/a-guide-to-gc-stat.html
      #  # https://bugs.ruby-lang.org/projects/ruby-master/wiki/RGenGC
      #  # https://medium.com/@zanker/the-ruby-vm-and-how-apps-break-part-2-e8b4620ad50d
      #  # https://github.com/ruby/ruby/blob/v2_7_0/gc.c#L258
      #
      # @see https://ruby-doc.org/core-2.7.1/GC.html
      # @see https://ruby-doc.org/core-2.7.1/GC/Profiler.html
      #
      # @see following sources for notes marked below:
      #  - http://tmm1.net/ruby21-rgengc/
      #  - https://engineering.appfolio.com/appfolio-engineering/2018/1/2/how-ruby-uses-memory
      #
      #  ‣ `Ruby` divides the heap into two sections:
      #    ‣ protected    | `FL_WB_PROTECTED`                                          | promotable to `oldgen`
      #    ‣ un-protected | missing `write-barrier`; un-safe access from `C-extension` | not promotable but can be remembered
      #
      #  ‣ `pages` in `heap` either belong in `eden` or `tomb`
      #    ‣ `eden`      | has pages w/ live objects
      #    ‣ `tomb`      | has pages w/o any objects
      #    ‣ `ruby_heap` | `tomb` + `eden`
      #
      #  ‣ expected stats: (⚠️: depends on version and build settings)
      #    ‣ object slot       | 40-bytes
      #    ‣ # of object slots | 408 (per 16kb memory page)
      #
      #  ‣ an object that does not fit into this 40 byte slot will get assigned both a slot and heap-space (usually allocated via standard `malloc` route)
      #
      # ==extension_functions
      #  - mem_usage_peak | returns Integer
      module F22B00

        # @return [Hash] the result from func{verify_compaction_references}
        def self.verify
          ::GC.verify_internal_consistency
          ::GC.verify_transient_heap_internal_consistency
          result = ::GC.verify_compaction_references
          💎.engine.debug(result.to_s)
          result
        end

        # @return [Integer]
        def self.total_memory_usage_current(message)
          # command from: https://stackoverflow.com/questions/7220896/get-current-ruby-process-memory-usage
          out    = 💎.engine.api.run_cmd!("ps ax -o pid,rss | grep -E \"^[[:space:]]*#{$$}\"")
          mem_kb = out.♻️⟶(' ').strip.to_i
          mem_mb = (just_memory / 1024.0)
          💎.engine.info("pid{#{$$.to_s}} #{message} w/ memory-usage currently at{#{mem_kb.to_s}} KB, equivalently: {#{mem_mb.to_s}} MB")
          mem_kb
        end

        def self.perform_full; ::GC.start(full_mark: true, immediate_sweep: true); end

        def self.perform_quick; ::GC.start(full_mark: false, immediate_sweep: false); end

        # @see source for formula & source credit: https://engineering.appfolio.com/appfolio-engineering/2018/1/2/how-ruby-uses-memory#
        #
        # @return [Float] the % of `heap memory` not being efficiently utilized
        def self.percentage_fragmentation
          stats              = ::GC.stat
          ratio_memory_filled = stats[:heap_live_slots].to_f / (stats[:heap_eden_pages] * self.stats_slots_per_heap_page)
          return 1.0 - ratio_memory_filled
        end

        # @return [Float] the % of `Ruby Objects` marked as `oldgen` and won't be scanned during a minor mark garbage collection
        def self.percentage_protected_from_minor_marks(with_remembered_objects_too=false)
          stats = ::GC.stat
          if with_remembered_objects_too
            ((stats[:old_objects] + stats[:remembered_wb_unprotected_objects]) / stats[:heap_live_slots].to_f) * 100.0
          else
            (stats[:old_objects] / stats[:heap_live_slots].to_f) * 100.0
          end
        end

        # @return [Boolean] true, if the GC has `stress` mode enabled
        def self.overclocked?; ::GC.stress != false; end

        # @return [Boolean] true, if the GC Profiler is currently enabled
        def self.profiler?; ::GC::Profiler.enabled?; end

        # ENV_VARs FOR GC
        #
        # # TODO: tune these for ex. a quick/short-lived script mode and for a long-process/server mode
        # # TODO: create ORM for ENV_VARs lol
        #
        # | ENV_VAR                          | default value     | notes                   |
        # | -------------------------------- | ----------------- | ----------------------- |
        # | GC_HEAP_INIT_SLOTS               | 10000             |                         |
        # | GC_HEAP_FREE_SLOTS               | 4096              |                         |
        # | GC_HEAP_GROWTH_FACTOR            | 1.8               |                         |
        # | GC_HEAP_GROWTH_MAX_SLOTS         | 0                 | 0 disables a max growth |
        # | GC_HEAP_OLDOBJECT_LIMIT_FACTOR   | 2.0               |                         |
        # | GC_HEAP_FREE_SLOTS_MIN_RATIO     | 0.20              |                         |
        # | GC_HEAP_FREE_SLOTS_GOAL_RATIO    | 0.40              |                         |
        # | GC_HEAP_FREE_SLOTS_MAX_RATIO     | 0.60              |                         |
        # | GC_MALLOC_LIMIT_MIN              | 16 * 1024 * 1024  | 16MB                    |
        # | GC_MALLOC_LIMIT_MAX              | 32 * 1024 * 1024  | 32MB                    |
        # | GC_MALLOC_LIMIT_GROWTH_FACTOR    | 1.4               |                         |
        # | GC_OLDMALLOC_LIMIT_MIN           | 16 * 1024 * 1024  |                         |
        # | GC_OLDMALLOC_LIMIT_GROWTH_FACTOR | 1.2               |                         |
        # | GC_OLDMALLOC_LIMIT_MAX           | 128 * 1024 * 1024 | 128MB                   |

        # @return [Float]
        def self.stats_bytes_per_object_slot; ::GC::INTERNAL_CONSTANTS[:RVALUE_SIZE].to_f; end

        # @return [Float]
        def self.stats_slots_per_heap_page; ::GC::INTERNAL_CONSTANTS[:HEAP_PAGE_OBJ_LIMIT].to_f; end

      end

      # @see https://ruby-doc.org/core-2.7.0/RubyVM/MJIT.html
      module F22B01

        # @return [Boolean]
        def self.enabled?; ::RubyVM::MJIT.enabled?; end

        # @return [Boolean]
        def self.pause; ::RubyVM::MJIT.pause; end

        # @return [Boolean]
        def self.resume; ::RubyVM::MJIT.resume; end
      end # end: {F22B01}

      module F22B05

        # @param [String]
        def self.current_user; ::Etc.getlogin; end

        # @return [Integer] the number of CPUs available to `Ruuuby`, not necessarily the number that exists in hardware
        def self.num_cpu_cores; ::Etc.nprocessors; end

      end # end: {F22B05}

      module F22B06

        # @param [String] ruby_code
        #
        # @raise [ArgumentError]
        #
        # @return [String]
        def self.get_compiled_code(ruby_code)
          🛑str❓(:ruby_code_str, ruby_code)
          ::RubyVM::InstructionSequence.compile(ruby_code).disassemble
        end
      end # end: {F22B06}

      🙈

      def setup_logger
        if ENV.∃🔑?('RUUUBY_F01')
          logging_modes = ENV.parse_feature_behaviors('RUUUBY_F01', 5, 0, 3)
          if logging_modes.∋?('b00')
            if logging_modes.length == 1
              self._create_default_logger_and_level
            else
              🛑 ::RuntimeError.new("| RuuubyEngine got multiple mode settings for ENV_VAR{RUUUBY_F01}, val{#{logging_modes.to_s}}, when mode(none){b00} was applied |")
            end
          else
            flag_b04 = logging_modes.find{|i| i.∋?('b04')}
            unless flag_b04.nil?
              self._set_logging_level(flag_b04)
            end
            flag_b01 = logging_modes.∋?('b01')
            flag_b02 = logging_modes.∋?('b02')
            flag_b03 = logging_modes.∋?('b03')
            if flag_b01 && flag_b02
              🛑 ::RuntimeError.new("| RuuubyEngine got multiple mode settings for ENV_VAR{RUUUBY_F01}, val{#{logging_modes.to_s}}, when mode(none){b00} was applied |")
            elsif flag_b01 && flag_b03
              @echo_to_stdout = true
              self._create_logger('b03')
              @logging_mode = %w(b01 b03)
            elsif flag_b01 && !flag_b03
              self._create_logger('b01')
            elsif flag_b02 && !flag_b03
              self._create_logger('b02')
            elsif flag_b03
              self._create_logger('b03')
            else
              🛑 ::RuntimeError.new("| RuuubyEngine; investigate unexpected-scenario |")
            end
          end
        else
          self._create_default_logger_and_level
        end
      end

      # @see https://ruby-doc.org/stdlib-2.7.0/libdoc/logger/rdoc/Logger/Severity.html
      #
      #==logging levels
      # [DEBUG]   "low-level information, mostly for developers"
      # [ERROR]   "a handleable error condition"
      # [FATAL]   "an unhandleable error that results in a program crash"
      # [INFO]    "generic (useful) information about system operation"
      # [UNKNOWN] "an unknown message that should always be logged"
      def _set_logging_level(val_b04)
        if val_b04.∋?('unknown')
          @logging_level = ::Logger::UNKNOWN
        elsif val_b04.∋?('fatal')
          @logging_level = ::Logger::FATAL
        elsif val_b04.∋?('error')
          @logging_level = ::Logger::ERROR
        elsif val_b04.∋?('warn')
          @logging_level = ::Logger::WARN
        elsif val_b04.∋?('info')
          @logging_level = ::Logger::INFO
        elsif val_b04.∋?('debug')
          @logging_level = ::Logger::DEBUG
        else
          🛑 RuntimeError.new("| RuuubyEngine got invalid arg for behavior{#{val_b04.to_s}} ENV_VAR{RUUUBY_F01} |")
        end
      end

      def _create_logger(logging_mode)
        @logging_mode = logging_mode
        case(@logging_mode)
        when 'b00'
          💎.engine.define_singleton_method(:info) do |content|
          end
          💎.engine.define_singleton_method(:debug) do |content|
          end
        when 'b01'
          @logger = ::Logger.new(STDOUT)
          💎.engine.define_singleton_method(:info) do |content|
            🛑str❓(:content, content)
            @logger.info(content)
          end
          💎.engine.define_singleton_method(:debug) do |content|
            🛑str❓(:content, content)
            @logger.debug(content)
          end
        when 'b02'
          @logger = ::Logger.new(STDERR)
          💎.engine.define_singleton_method(:info) do |content|
          end
          💎.engine.define_singleton_method(:debug) do |content|
          end
        when 'b03'
          @logger = ::Logger.new(::File.open("#{@path_base}tmp/ruuuby.log", ::File::WRONLY | ::File::APPEND | ::File::CREAT), 'daily')
          💎.engine.define_singleton_method(:info) do |content|
            🛑str❓(:content, content)
            @logger.info(content)
            puts content if @echo_to_stdout
          end
          💎.engine.define_singleton_method(:debug) do |content|
            🛑str❓(:content, content)
            @logger.debug(content)
            puts content if @echo_to_stdout
          end
        else
          🛑 ::RuntimeError.new("| RuuubyEngine got invalid @logging_mode{#{@logging_mode.to_s}} w/ type{#{@logging_mode.class.to_s} for func{_create_logger} |")
        end
        unless @logger.nil?
          @logger.level = @logging_level
        end
        💎.engine.info("logger created w/ mode{#{logging_mode.to_s}} and logging-level{#{@logging_level.to_s}}")
      end

      def _create_default_logger_and_level
        self._set_logging_level('error')
        self._create_logger('b00')
      end

    end # end: {RuuubyEngine}

    # @return [::Ruuuby::MetaData::RuuubyEngine]
    def self.engine; ::Ruuuby::MetaData::RuuubyEngine.instance; end

  end # end: {MetaData}

end

# TODO: for later; https://ruby-doc.org/core-2.5.1/Process.html#method-c-setpriority
# TODO: https://ruby-doc.org/core-2.5.1/Process.html
