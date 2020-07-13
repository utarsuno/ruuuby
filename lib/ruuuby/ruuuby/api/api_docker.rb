# encoding: UTF-8

# -------------------------------------------- ⚠️ --------------------------------------------

# `💎`
module ::Ruuuby

  # information and utilities that define and work w/ aspects of `Ruuuby`
  module MetaData

    # TODO: https://docs.docker.com/registry/spec/api/
    # TODO: https://registry.hub.docker.com/v2/
    # TODO: https://hub.docker.com/_/alpine?tab=tags
    # TODO: https://hub.docker.com/_/nginx/
    #
    # TODO: docs.docker.com/registry/spec/api
    #
    # `💎.engine.api_docker`
    class DockerAPI < ::Ruuuby::MetaData::RuuubyAPIComponent

      attr_reader :repo, :last_commit, :configs, :expected_docker_api_version

      # @param [Object] engine
      # @param [String] expected_docker_api_version
      def initialize(engine, expected_docker_api_version)
        super(engine)
        @expected_docker_api_version = expected_docker_api_version

        # TODO: flag to track if Docker daemon is currently running
        #  * unix:///var/run/docker.sock
      end

      def _calculate_version
        💎.engine.api.run_cmd!('docker --version')
      end

    end # end: Class{DockerAPI}
  end
end

# TODO: https://docs.docker.com/engine/api/v1.24/
# TODO: https://docs.docker.com/engine/api/v1.40/

# -------------------------------------------- ⚠️ --------------------------------------------
