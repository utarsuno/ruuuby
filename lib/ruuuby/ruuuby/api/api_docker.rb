# encoding: UTF-8

# -------------------------------------------- ⚠️ --------------------------------------------

# 3ʳᵈ_party gem class
class Docker::Network

  def self.♻️_by_name(network_name)
    self.find_by_name(network_name).delete
  end

  # @param [String] network_name
  #
  # @raise [ArgumentError]
  #
  # @return [Docker::Network]
  def find_by_name(network_name)
    🛑str❓('network_name', network_name)
    ::Docker::Network.all.∀{|network| return network if network.info['Name'] == network_name}
    🛑 ::ArgumentError.new("| c{DockerAPI}-> m{find_by_name} was not able to find a network w/ the name{#{network_name.to_s}}")
  end

end

# `💎`
module ::Ruuuby

  # information and utilities that define and work w/ aspects of `Ruuuby`
  module MetaData

    # for base gem documentation @see: https://github.com/swipely/docker-api
    #
    # TODO: https://docs.docker.com/registry/spec/api/
    # TODO: https://registry.hub.docker.com/v2/
    # TODO: https://hub.docker.com/_/alpine?tab=tags
    # TODO: https://hub.docker.com/_/nginx/
    #
    # TODO: docs.docker.com/registry/spec/api
    #
    # helpful CLI commands:
    #  -----------------------------------------------------------------------------------------
    #  | scenario                          | command/template                        | source   |
    #  | --------------------------------- | --------------------------------------- | -------- |
    #  | get container ID by name match    | `docker ps -aqf "name=containername"`   | https://stackoverflow.com/questions/34496882/get-docker-container-id-from-container-name |
    #  -----------------------------------------------------------------------------------------
    #
    # `🐋`
    #
    # `💎.engine.api_locale.api_docker`
    class DockerAPI < ::Ruuuby::MetaData::RuuubyAPIComponent

      attr_accessor :services
      attr_reader :version_compose

      # @param [Object] engine
      def initialize(engine)
        super(engine)
      end

      # `wip`
      #
      # @return [Boolean]
      def healthy?
        ENV['DOCKER_API_VERSION'] == '1.40' && ENV['COMPOSE_API_VERSION'] == '1.40' && ENV['COMPOSE_CONVERT_WINDOWS_PATHS'] == '1' && ENV['COMPOSE_PATH_SEPARATOR'] == ':'
      end

      # @return [Boolean] true, if the `Docker Engine` is currently running
      def connected?
        ::Docker.ping == 'OK'
      rescue
        false
      end

      # @param [String] network_name
      #
      # @return [Boolean]
      def ∃🌐?(network_name)
        self.find_🌐_by_name(network_name).ⓣ == Docker::Network
      rescue
        false
      end

      # @param [String] network_name
      #
      # @return [Boolean]
      def ∃🐋?(network_name)
        self.find_🐋_by_name(network_name).ⓣ == Docker::Container
      rescue
        false
      end

      # @param [String] network_name
      #
      # @raise [ArgumentError]
      #
      # @return [Docker::Network]
      def find_🌐_by_name(network_name)
        🛑str❓('network_name', network_name)
        ::Docker::Network.all.∀{|network| return network if network.info['Name'] == network_name}
        🛑 ::ArgumentError.new("| c{DockerAPI}-> m{find_🌐_by_name} was not able to find a network w/ name{#{network_name.to_s}} |")
      end

      # @param [String] container_id
      #
      # @raise [ArgumentError]
      #
      # @return [Docker::Container]
      def find_🐋_by_id(container_id)
        🛑str❓('container_id', container_id)
        result = ::Docker::Container.get(container_id)
        🛑 ::ArgumentError.new("| c{DockerAPI}-> m{find_🐋_by_id} got result for ID{#{result}} but match{#{result.to_s}} should not have type{#{result.Ⓣ}} |") unless result.ⓣ == ::Docker::Container
        result
      end

      # @see https://stackoverflow.com/questions/34496882/get-docker-container-id-from-container-name
      #
      # @param [String]  container_name
      # @param [Boolean] exact_match
      #
      # @raise [ArgumentError, RuntimeError]
      #
      # @return [Docker::Network]
      def find_🐋_by_name(container_name, exact_match=false)
        🛑str❓('container_name', container_name)
        🛑bool❓('exact_match', exact_match)
        if exact_match
          results = 💎.engine.api.run_cmd!("docker ps -aqf \"name=^#{container_name}$\"")
        else
          results = 💎.engine.api.run_cmd!("docker ps -aqf \"name=#{container_name}\"")
        end
        if results.∅?
          🛑 ::ArgumentError.new("| c{DockerAPI}-> m{find_🐋_by_name} found no matches w/ container-name{#{container_name.to_s}} |")
        elsif results.ary?
          🛑 ::ArgumentError.new("| c{DockerAPI}-> m{find_🐋_by_name} found{#{results.length.to_s}} matches, max-allowed is{1} |") if results.length > 1
          self.find_🐋_by_id(results[0])
        else
          self.find_🐋_by_id(results)
        end
      end

      # @param [String] network_name
      #
      # @raise [ArgumentError]
      def ♻️_🌐_by_name(network_name)
        network = self.find_🌐_by_name(network_name)
        network.delete
      end

      # TODO: temporary
      def create_needed_ruuuby_network
        🛑 ::ArgumentError.new("| c{DockerAPI}-> m{create_needed_ruuuby_network} was called when the network{ruuuby_network} already exists ") if ∃🌐?('ruuuby_network')
        @engine.api.run_cmd!('docker network create -d bridge --subnet 192.168.0.0/24 --gateway 192.168.0.1 ruuuby_network')
      end

      def version_compose
        if @version_compose.nil?
          @version_compose = @engine.api.run_cmd!('docker-compose --version')
        end
        @version_compose
      end

      def _calculate_version
        @engine.api.run_cmd!('docker --version')
      end

    end # end: Class{DockerAPI}
  end
end

# TODO: https://docs.docker.com/engine/api/v1.24/
# TODO: https://docs.docker.com/engine/api/v1.40/
# TODO: https://container42.com/2016/03/27/docker-quicktip-7-psformat/

# -------------------------------------------- ⚠️ --------------------------------------------
