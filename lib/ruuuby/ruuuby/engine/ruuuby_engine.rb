# coding: UTF-8

module ::Ruuuby

  # information and utilities that define and work w/ aspects of `Ruuuby`
  module MetaData

    class RuuubyEngine
      module Syntax
        FEATURE_BEHAVIOR = 'b\d\d({\w+})?'
      end

      include ::Ruuuby::Attribute::Includable::SyntaxCache

      include ::Ruuuby::Attribute::Includable::RuuubySingleton

      attr_reader :logger, :warmed_up, :logging_level, :logging_mode

      def initialize
        @warmed_up      = nil
        @logger         = nil
        @echo_to_stdout = false
        @logging_mode   = nil
        @logging_level  = ::Logger::DEBUG
      end

      # @raise [RuntimeError] if called more than once
      def warm_up
        if @warmed_up == nil
          self.setup_logger
          @warmed_up = true
        else
          🛑 RuntimeError.new("| RuuubyEngine should only be warmed up once |")
        end
      end

      # @raise [RuntimeError] if called when the engine isn't currently warm
      def cool_down
        if @warmed_up
          unless @logger == nil
            if @logging_level == ::Logger::DEBUG
              self.print_program_pid_and_memory
            end
            💎.debug('closing logger!')
            @logger.close
          end
        else
          🛑 RuntimeError.new("| RuuubyEngine can only be cooled down when warm |")
        end
      end

      # @param [String] content
      def info(content)
        unless @logger == nil
          @logger.info(content)
          if @echo_to_stdout
            puts content
          end
        end
      end

      # @param [String] content
      def debug(content)
        unless @logger == nil
          @logger.debug(content)
          if @echo_to_stdout
            puts content
          end
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
      #
      # @see https://ruby-doc.org/core-2.7.1/GC.html
      # @see https://ruby-doc.org/core-2.7.1/GC/Profiler.html
      module F22

        # @return [Hash] the result from func{verify_compaction_references}
        def self.verify
          ::GC.verify_internal_consistency
          ::GC.verify_transient_heap_internal_consistency
          result = ::GC.verify_compaction_references
          💎.debug(result.to_s)
          result
        end

        # @return [Boolean] true, if the GC has `stress` mode enabled
        def self.overclocked?; ::GC.stress != false; end

        # @return [Boolean] true, if the GC Profiler is currently enabled
        def self.profiler?; ::GC::Profiler.enabled?; end

        # @return [Hash] output of `::GC::INTERNAL_CONSTANTS`
        #def self.info; ::GC::INTERNAL_CONSTANTS; end
      end

      def gc; ::Ruuuby::MetaData::RuuubyEngine::F22; end

      🙈

      def print_program_pid_and_memory
        # command from: https://stackoverflow.com/questions/7220896/get-current-ruby-process-memory-usage
        cmd = Ruuuby::Routine::CommandCLI.new("ps ax -o pid,rss | grep -E \"^[[:space:]]*#{$$}\"")
        cmd.run
        pid, size = cmd.out.strip.split.map(&:to_i)
        💎.info("pid[#{pid.to_s}] terminating with current memory usage at [#{size.to_s}kB]")
      end

      def setup_logger
        if ENV.∃🔑?('RUUUBY_F01')
          logging_modes = ENV.parse_feature_behaviors('RUUUBY_F01', 5, 0, 3)
          if logging_modes.∋?('b00') && logging_modes.length > 1
            🛑 RuntimeError.new("| RuuubyEngine got multiple mode settings for ENV_VAR{RUUUBY_F01}, val{#{logging_modes.to_s}}, when mode(none){b00} was applied |")
          else
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
            end
            if logging_modes.∋?('b04')
              self._set_logging_level(logging_modes.find{|i| i.∋?('b04')})
            end
          end
        else
          self._create_logger('b00')
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
          @logger.level= @logging_level
      end

      def _create_logger(logging_mode)
        @logging_mode = logging_mode
        @logger       = self.get_logger(@logging_mode)
        💎.debug("logger created w/ mode{#{logging_mode.to_s}}")
      end

      def get_logger(logging_mode)
        case(logging_mode)
        when 'b01'
          ::Logger.new(STDOUT)
        when 'b02'
          ::Logger.new(STDERR)
        when 'b03'
          ::Logger.new(::File.open("#{💎.api_git.repo.workdir}/tmp/ruuuby.log", ::File::WRONLY | ::File::APPEND | ::File::CREAT), 'daily')
        else
          nil
        end
      end

    end # end: {RuuubyEngine}

    # @return [::Ruuuby::MetaData::RuuubyEngine]
    def self.engine; ::Ruuuby::MetaData::RuuubyEngine.ℹ; end

    # @return [::Ruuuby::MetaData::RuuubyORM]
    def self.orm; ::Ruuuby::MetaData::RuuubyORM.ℹ; end

    # @return [::Ruuuby::Routine::CommandCLI]
    def self.cli; ::Ruuuby::Routine::CommandCLI; end

    # @param [String] content
    def self.info(content)
      🛑str❓(:content, content)
      💎.engine.info(content)
    end

    # @param [String] content
    def self.debug(content)
      🛑str❓(:content, content)
      💎.engine.debug(content)
    end

  end # end: {MetaData}

end
