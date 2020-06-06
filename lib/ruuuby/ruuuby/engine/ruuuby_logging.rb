# encoding: UTF-8

module ::Ruuuby

  # information and utilities that define and work w/ aspects of `Ruuuby`
  module MetaData

    class RuuubyEngine

      # @see https://ruby-doc.org/stdlib-2.7.0/libdoc/logger/rdoc/Logger/Severity.html
      #
      #==logging levels
      # [DEBUG]   "low-level information, mostly for developers"
      # [ERROR]   "a handleable error condition"
      # [FATAL]   "an unhandleable error that results in a program crash"
      # [INFO]    "generic (useful) information about system operation"
      # [UNKNOWN] "an unknown message that should always be logged"
      module RuuubyLogging
        # @type [Symbol]
        MODE_NONE             = 'none'.❄️
        # @type [Symbol]
        MODE_STDOUT           = 'stdout'.❄️
        # @type [Symbol]
        MODE_FILE             = 'file'.❄️
        # @type [Symbol]
        MODE_STDERR           = 'stderr'.❄️
        # @type [Symbol]
        ALL_MODE_TYPES        = [RuuubyLogging::MODE_NONE, RuuubyLogging::MODE_STDOUT, RuuubyLogging::MODE_STDERR, RuuubyLogging::MODE_FILE].❄️
        # @type [Array]
        MODE_DUAL_FILE_STDOUT = [MODE_FILE, MODE_STDOUT].❄️
        # @type [Array]
        MODE_DUAL_FILE_STDERR = [MODE_FILE, MODE_STDERR].❄️
        # @type [Array]
        ALL_DUAL_MODES        = [MODE_DUAL_FILE_STDOUT, MODE_DUAL_FILE_STDERR].❄️

        # @param [String] logging_mode
        #
        # @return [Logger, nil]
        def self.create_logger(logging_mode)
          case(logging_mode)
          when RuuubyEngine::RuuubyLogging::MODE_STDOUT
            return ::Logger.new(STDOUT)
          when RuuubyEngine::RuuubyLogging::MODE_STDERR
            return ::Logger.new(STDERR)
          when RuuubyEngine::RuuubyLogging::MODE_FILE
            return ::Logger.new(::File.open("#{💎.api_git.repo.workdir}/tmp/ruuuby.log", ::File::WRONLY | ::File::APPEND | ::File::CREAT), 'daily')
          else
            return nil
          end
        end

        # @param [String] mode_value
        #
        # @return [Array] all the mode types
        def self.validate_logging_mode(mode_value)
          🛑str❓(:mode_value, mode_value)
          if mode_value.∋?('|')
            nodes         = mode_value.split('|')
            logging_types = []
            nodes.each do |n|
              unless n.∅?
                🛑 RuntimeError.new("| RuuubyEngine got invalid individual val{#{n.to_s}} from arg(#{mode_value.to_s}) for ENV_VAR{RUUUBY_LOGGING_MODE} |") unless RuuubyLogging::ALL_MODE_TYPES.∋?(n)
                logging_types << n
              end
            end
            if logging_types.≈≈(MODE_DUAL_FILE_STDOUT)
              return MODE_DUAL_FILE_STDOUT
            elsif logging_types.≈≈(MODE_DUAL_FILE_STDERR)
              return MODE_DUAL_FILE_STDERR
            else
              🛑 RuntimeError.new("| RuuubyEngine got invalid val{#{mode_value.to_s}} for ENV_VAR{RUUUBY_LOGGING_MODE} |") unless RuuubyLogging::ALL_MODE_TYPES.∋?(logging_types)
            end
          else
            🛑 RuntimeError.new("| RuuubyEngine got invalid val{#{mode_value.to_s}} for ENV_VAR{RUUUBY_LOGGING_MODE} |") unless RuuubyLogging::ALL_MODE_TYPES.∋?(mode_value)
            return [mode_value]
          end
        end

      end

    end

  end

end
