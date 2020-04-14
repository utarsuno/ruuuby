# encoding: UTF-8

module ::Ruuuby

  # information and utilities that define and work w/ aspects of `Ruuuby`
  module MetaData

    class RuuubyEngine
      include ::Singleton

      attr_reader :logger

      def self.instance ; @@instance ||= new ; end

      def initialize
        @warmed_up      = nil
        @logger         = nil
        @echo_to_stdout = false
        @logging_mode   = nil
      end

      # @raise [RuntimeError] if called more than once
      def warm_up
        if @warmed_up == nil
          @logging_mode = 💎::RuuubyEngine::RuuubyLogging.validate_logging_mode(ENV.fetch🔑('RUUUBY_LOGGING_MODE', 'none'))
          case(@logging_mode.length)
          when 1
            @logger = 💎::RuuubyEngine::RuuubyLogging.create_logger(@logging_mode[0])
            💎.debug("logger created w/ mode{#{@logging_mode[0]}}")
          when 2
            @logger         = 💎::RuuubyEngine::RuuubyLogging.create_logger(@logging_mode[0])
            @echo_to_stdout = true
            💎.debug("logger created w/ mode{#{@logging_mode.to_s}}")
          else
            @logger = nil
            🛑 RuntimeError.new("| RuuubyEngine internal error, evaluated @logging_mode.length to{#{@logging_mode.length.to_s}} |")
          end
          @warmed_up = true
        else
          🛑 RuntimeError.new("| RuuubyEngine should only be warmed up once |")
        end
      end

      # @raise [RuntimeError] if called when the engine isn't currently warm
      def cool_down
        if @warmed_up
          env_var_dbg = ENV.fetch🔑('RUUUBY_DBG', 'none')
          if env_var_dbg == 't'
            self.print_program_pid_and_memory
          end
          unless @logger == nil
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
        end
      end

      # @param [String] content
      def debug(content)
        unless @logger == nil
          @logger.debug(content)
        end
      end

      🙈

      def print_program_pid_and_memory
        # command from: https://stackoverflow.com/questions/7220896/get-current-ruby-process-memory-usage
        cmd = Ruuuby::Routine::CommandCLI.new("ps ax -o pid,rss | grep -E \"^[[:space:]]*#{$$}\"")
        cmd.run
        pid, size = cmd.out.strip.split.map(&:to_i)
        💎.info("pid[#{pid.to_s}] terminating with current memory usage at [#{size.to_s}kB]")
      end

    end

  end

end
