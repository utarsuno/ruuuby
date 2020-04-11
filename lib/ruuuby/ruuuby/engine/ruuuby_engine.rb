# encoding: UTF-8

module ::Ruuuby

  module MetaData

    class RuuubyEngine
      include ::Singleton

      attr_reader :logger

      def settings_logging=(env_val)
        🛑str❓(:env_val, env_val)
        @logging_mode = ::Ruuuby::MetaData::RuuubyEngine::RuuubyLogging.validate_mode(env_val.to_sym)
        case(@logging_mode)
        when ::Ruuuby::MetaData::RuuubyEngine::RuuubyLogging::MODE_STDOUT
          @logger = ::Logger.new(STDOUT)
        when ::Ruuuby::MetaData::RuuubyEngine::RuuubyLogging::MODE_FILE
          file     = ::File.open(💎.paths::SpecificFiles::LOGGING, ::File::WRONLY | ::File::APPEND | ::File::CREAT)
          @logger = ::Logger.new(file, 'daily')
        else
          @logger = ::Logger.new(STDERR)
        end
        💎.debug('logger created')
      end

    end

  end

end