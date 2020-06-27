# coding: UTF-8

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

      attr_reader :repo, :last_commit, :configs

      def initialize(engine)
        super(engine)
      end

      def _calculate_version
        💎.engine.api.run_cmd!('docker --version')
      end

    end # end: Class{DockerAPI}
  end
end

# -------------------------------------------- ⚠️ --------------------------------------------
