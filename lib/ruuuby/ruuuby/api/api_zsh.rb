# encoding: UTF-8

# -------------------------------------------- ⚠️ --------------------------------------------

# `💎.engine.api_zsh`
module ::Ruuuby
  # information and utilities that define and work w/ aspects of `Ruuuby`
  module MetaData

    class ZshAPI < ::Ruuuby::MetaData::RuuubyAPIComponentCLI

      module Scripts
        # @type [String]
        GET_LOCAL_IP = 'get_local_ip'

        module DockerCompose
          # @type [String]
          RUN_CLEAN_UP = 'clean'

          module Compose
            # @type [String]
            DEV_START = 'dev_run'

            # @type [String]
            DEV_STOP  = 'dev_down'

            # @type [String]
            DEV_BUILD = 'dev_build'
          end
        end

      end

      def initialize(engine)
        super(engine, 'zsh')
      end

      # @param [String] script_name
      #
      # @raise [ArgumentError, RuntimeError]
      #
      # @return [String, Array]
      def run_script(script_name)
        🛑str❓('script_name', script_name)
        case script_name
        when Ruuuby::MetaData::ZshAPI::Scripts::GET_LOCAL_IP
          self.run_cmd("./bin/zsh/#{script_name}.zsh")
        when Ruuuby::MetaData::ZshAPI::Scripts::Docker::Compose::DEV_RUN
          self.run_cmd("./bin/zsh/docker_compose/#{script_name}.zsh")
        else
          🛑 ::RuntimeError.new("| {ZshAPI}-> m{run_script} does not recognize script_name{#{script_name}} |")
        end
      end

    end

  end
end

# -------------------------------------------- ⚠️ --------------------------------------------
