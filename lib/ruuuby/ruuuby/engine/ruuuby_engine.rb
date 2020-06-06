# coding: UTF-8

module ::Ruuuby

  # information and utilities that define and work w/ aspects of `Ruuuby`
  module MetaData

    class RuuubyEngine
      include ::Ruuuby::Attribute::Includable::RuuubySingleton

      attr_reader :logger

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

    end # end: {RuuubyEngine}

    # @return [::Ruuuby::MetaData::RuuubyORM::SchemaORM]
    def self.meta_logging; ::Ruuuby::MetaData::RuuubyEngine::RuuubyLogging; end

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
