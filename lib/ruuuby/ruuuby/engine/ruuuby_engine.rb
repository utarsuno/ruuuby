# coding: UTF-8

module ::Ruuuby

  # information and utilities that define and work w/ aspects of `Ruuuby`
  module MetaData

    # `💎.engine`
    class RuuubyEngine

      class << self
        def get_mem_stats(val_a, val_b)
          💎.engine.ext_mem_stats = {before: val_a, after: val_b}
        end
      end

      module Syntax
        FEATURE_BEHAVIOR = 'b\d\d({\w+})?'
      end

      include ::Ruuuby::Attribute::Includable::SyntaxCache
      include ::Singleton

      attr_reader :logger, :state_flag, :logging_level, :logging_mode, :api, :api_git

      attr_accessor :ext_mem_stats

      # state flags
      # | 0 | not started |
      # | 1 | engine started |
      # | 2 | engined stopped |

      def initialize
        @state_flag      = 0
        @logger         = nil
        @echo_to_stdout = false
        @logging_mode   = nil
        @logging_level  = ::Logger::DEBUG
        @api            = ::Ruuuby::MetaData::RuuubyAPI.new(self)
        @api_git        = ::Ruuuby::MetaData::GitAPI.new(self)
        @orm            = nil
      end

      # @raise [RuntimeError] if called more than once
      def warm_up
        if @state_flag == 0
          self.setup_logger
          self.gc.total_memory_usage_current('starting-up') if @logging_level == ::Logger::INFO
          @state_flag += 1
        else
          🛑 RuntimeError.new("| RuuubyEngine should only be warmed up once |")
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
      #
      # @see https://ruby-doc.org/core-2.7.1/GC.html
      # @see https://ruby-doc.org/core-2.7.1/GC/Profiler.html
      module F22B00

        # @return [Hash] the result from func{verify_compaction_references}
        def self.verify
          ::GC.verify_internal_consistency
          ::GC.verify_transient_heap_internal_consistency
          result = ::GC.verify_compaction_references
          💎.engine.debug(result.to_s)
          result
        end

        # @return [Boolean] true, if the GC has `stress` mode enabled
        def self.overclocked?; ::GC.stress != false; end

        # @return [Boolean] true, if the GC Profiler is currently enabled
        def self.profiler?; ::GC::Profiler.enabled?; end

        # @return [Integer]
        def self.total_memory_usage_current(message)
          # command from: https://stackoverflow.com/questions/7220896/get-current-ruby-process-memory-usage
          out         = 💎.engine.api.run_cmd!("ps ax -o pid,rss | grep -E \"^[[:space:]]*#{$$}\"")
          just_memory = out.♻️⟶(' ').strip.to_i
          in_mb       = (just_memory / 1024.0)
          💎.engine.info("pid[#{$$.to_s}] #{message} w/ current memory-usage at: {#{just_memory.to_s}} kb == {#{in_mb.to_s}} mb")
          just_memory
        end

        # @return [Integer]
        def self.total_memory_usage_peak; ::Ruuuby::MetaData::RuuubyEngine.memory_peak_this_runtime; end

        # @return [Hash] output of `::GC::INTERNAL_CONSTANTS`
        #def self.info; ::GC::INTERNAL_CONSTANTS; end
      end

      # @see https://ruby-doc.org/core-2.7.0/RubyVM/MJIT.html
      module F22B01

        # @return [Boolean]
        def self.enabled?; ::RubyVM::MJIT.enabled?; end

        # @return [Boolean]
        def self.pause; ::RubyVM::MJIT.pause; end

        # @return [Boolean]
        def self.resume; ::RubyVM::MJIT.resume; end

      end

      # @return [Module]
      def gc; ::Ruuuby::MetaData::RuuubyEngine::F22B00; end

      # @return [Module]
      def jit; ::Ruuuby::MetaData::RuuubyEngine::F22B01; end

      🙈

      def setup_logger
        if ENV.∃🔑?('RUUUBY_F01')
          logging_modes = ENV.parse_feature_behaviors('RUUUBY_F01', 5, 0, 3)
          if logging_modes.∋?('b00')
            if logging_modes.length == 1
              self._create_default_logger_and_level
            else
              🛑 RuntimeError.new("| RuuubyEngine got multiple mode settings for ENV_VAR{RUUUBY_F01}, val{#{logging_modes.to_s}}, when mode(none){b00} was applied |")
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
              🛑 RuntimeError.new("| RuuubyEngine got multiple mode settings for ENV_VAR{RUUUBY_F01}, val{#{logging_modes.to_s}}, when mode(none){b00} was applied |")
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
              🛑 RuntimeError.new("| RuuubyEngine; investigate unexpected-scenario |")
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
          @logger = ::Logger.new(::File.open("#{@api_git.repo.workdir}/tmp/ruuuby.log", ::File::WRONLY | ::File::APPEND | ::File::CREAT), 'daily')
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
          🛑 RuntimeError.new("| RuuubyEngine got invalid @logging_mode{#{@logging_mode.to_s}} w/ type{#{@logging_mode.class.to_s} for func{_create_logger} |")
        end
        unless @logger.nil?
          @logger.level= @logging_level
        end
        💎.engine.debug("logger created w/ mode{#{logging_mode.to_s}} and logging-level{#{@logging_level.to_s}}")
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
