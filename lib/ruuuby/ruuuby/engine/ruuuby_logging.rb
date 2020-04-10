
module ::Ruuuby

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
      MODE_NONE   = :none

      # @type [Symbol]
      MODE_STDOUT = :stdout

      # @type [Symbol]
      MODE_FILE   = :log_file

      # @type [Symbol]
      ALL_MODES   = [MODE_NONE, MODE_STDOUT, MODE_FILE]

      # @param [Symbol] mode_value
      #
      # @return [Symbol]
      def self.validate_mode(mode_value)
        🛑sym❓(:mode_value, mode_value)
        unless RuuubyLogging::ALL_MODES.∋?(mode_value)
          raise "RuuubyLogging static-func{validate} got an invalid mode_value{#{mode_value.to_s}}"
        end
        mode_value
      end

    end

  end

end
