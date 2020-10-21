# encoding: UTF-8

# -------------------------------------------- ⚠️ --------------------------------------------

# `💎`
module ::Ruuuby::MetaData

  # for base gem documentation @see: https://github.com/swipely/docker-api
  #
  # TODO: https://docs.docker.com/registry/spec/api/
  # TODO: https://registry.hub.docker.com/v2/
  # TODO: https://hub.docker.com/_/alpine?tab=tags
  # TODO: https://hub.docker.com/_/nginx/
  #
  # TODO: docs.docker.com/registry/spec/api
  #
  # TODO: https://runnable.com/docker/advanced-docker-compose-configuration
  #
  # TODO: https://docs.docker.com/network/
  # TODO: https://docs.docker.com/network/iptables/
  # TODO: https://runnable.com/docker/basic-docker-networking
  #
  # helpful CLI commands:
  #  --------------------------------------------------------------------------------------------------------
  #  | scenario                          | command/template/example                              | source   |
  #  | --------------------------------- | ----------------------------------------------------- | -------- |
  #  | get container ID by name match    | `docker ps -aqf "name=containername"`                 | https://stackoverflow.com/questions/34496882/get-docker-container-id-from-container-name |
  #  | local multi-stage build           | `docker build --target build_base` -t build_env_dev . |          |
  #  --------------------------------------------------------------------------------------------------------
  #
  # helpful references:
  # |---------------------------------------------------------------------------------------------
  # | for info on                          | reference url                                       |
  # | ------------------------------------ | --------------------------------------------------- |
  # | docker ENV VARs                      | https://docs.docker.com/compose/reference/envvars/  |
  # ----------------------------------------------------------------------------------------------
  #
  # | term          | notes                                                                                                      | source |
  # | ------------- | ---------------------------------------------------------------------------------------------------------- | ------ |
  # | `volumes`     | preferred over `bind mounts`  ; paths are created within Docker's storage space and also managed by Docker | 0x0    |
  # | `bind mounts` | limited compared to `volumes` ; paths "on the host machine is mounted into a container"                    | 0x1    |
  #
  # `🐋`
  #
  # `💎.engine.api_locale.api_docker`
  class DockerAPI < ::Ruuuby::MetaData::EngineComponentAPICLI

    include ::Ruuuby::Attribute::Connectable

    attr_accessor :services

    # @param [Object] engine
    def initialize(engine, project_name)
      super(engine, 'docker')
      @project_name = project_name
      #TODO: cached_services
    end

    # `wip`
    #
    # @return [Boolean]
    def healthy?
      self.healthy_env_api_versions? && self.healthy_env_compose_configs? && ::ENV['COMPOSE_PROJECT_NAME'] == 'ruuuby'
    end

    # @return [Boolean]
    def healthy_env_api_versions?; ::ENV['DOCKER_API_VERSION'] == '1.40' && ::ENV['COMPOSE_API_VERSION'] == '1.40'; end

    # @return [Boolean]
    def healthy_env_compose_configs?; ::ENV['COMPOSE_CONVERT_WINDOWS_PATHS'] == '1' && ::ENV['COMPOSE_PATH_SEPARATOR'] == ':'; end

    # @param [String] network_name
    #
    # @raise [ArgumentError]
    #
    # @return [Boolean]
    def ∃🌐?(network_name); ::Docker::Network.∃?(network_name); end

    # @param [String] container_name
    #
    # @raise [ArgumentError]
    #
    # @return [Boolean]
    def ∃🐋?(container_name)
      begin
        self[container_name]
        return true
      rescue
        return false
      end
    end

    # @param [String] container_name
    #
    # @raise [ArgumentError]
    #
    # @return [Boolean]
    def ∄🐋?(container_name); !(self.∃🐋?(container_name)); end

    # @param [String] network_name
    #
    # @raise [ArgumentError]
    #
    # @return [Docker::Network]
    def find_🌐(network_name); ::Docker::Network.fetch(network_name); end

    # @param [String] container_id
    #
    # @raise [ArgumentError]
    #
    # @return [Docker::Container]
    def find_🐋_by_id(container_id)
      🛑str❓('container_id', container_id)
      result = ::Docker::Container.get(container_id)
      🛑 ::ArgumentError.new("| c{🐋}-> m{find_🐋_by_id} got result for ID{#{result}} but match{#{result.to_s}} should not have type{#{result.Ⓣ}} |") unless result.ⓣ == ::Docker::Container
      result
    end

    # @return [Array] an array of all the alive containers
    def ∀🐋; ::Docker::Container.all(all: true); end

=begin
    # @param [String]  container_name
    # @param [Boolean] exact_match
    #
    # @raise [ArgumentError, RuntimeError]
    #
    # @return [Docker::Network]
    def zz(container_name, exact_match=false)
      🛑str❓('container_name', container_name)
      🛑bool❓('exact_match', exact_match)
      if exact_match
        results = self.run_cmd("ps -aqf \"name=^#{container_name}$\"")
      else
        results = self.run_cmd("ps -aqf \"name=#{container_name}\"")
      end
      if results.∅?
        🛑 ::ArgumentError.new("| c{🐋}-> m{[]} found no matches w/ container-name{#{container_name.to_s}} |")
      elsif results.ary?
        🛑 ::ArgumentError.new("| c{🐋}-> m{[]} found{#{results.length.to_s}} matches, max-allowed is{1} |") if results.length > 1
        self.find_🐋_by_id(results[0])
      else
        self.find_🐋_by_id(results)
      end
    end
=end

    # @param [String]  container_name
    #
    # @raise [ArgumentError, RuntimeError]
    #
    # @return [Docker::Network]
    def [](container_name)
      🛑str❓('container_name', container_name)
      self.∀🐋.each do |d|
        if d.info['State'] == 'running' && d.name?(container_name)
          return ::Docker::Container.get(d.id)
        end
      end
      🛑 ::ArgumentError.new("| c{🐋}-> m{[]} found no matches w/ container-name{#{container_name.to_s}} |")
    end


    def test(container_name)
      🐋.∀🐋.each do |d|
        if d.info['State'] == 'running' && d.name?(container_name)
          return d
        end
      end
      false
    end

    # @param [String] network_name
    #
    # @raise [ArgumentError]
    def ♻️_🌐(network_name); ::Docker::Network.♻️!(network_name); end

    # @raise [RuntimeError]
    #
    # @return [String]
    def version_compose
      @version_compose = self._run_compose_cmd('--version') if @version_compose.nil?
      @version_compose
    end

    🙈

    def _connected?; ::Docker.ping == 'OK'; end

    # @see https://stackoverflow.com/questions/40080887/how-do-i-restart-docker-for-mac-from-the-terminal
    def _disconnect; @engine.api.run_apple_script!('quit app "Docker"'); end

    # @see https://superuser.com/questions/1105087/starting-docker-for-mac-from-the-command-line
    #
    # @param [Boolean] wait_for_connection
    def _connect(wait_for_connection)
      self.run_cmd_raw('open --hide --background -a Docker')
      unless wait_for_connection
        delta_ms      = 77.0
        delta_seconds = delta_ms / 1000.0
        until self.connected?
          @engine.debug("program set to sleep for{#{delta_ms.to_s}} ms")
          sleep(delta_seconds)
          delta_ms     *= ::Float::RATIO_GOLDEN
          delta_seconds = delta_ms / 1000.0
          if delta_ms > 1337 * 3
            delta_ms /= 2
          end
        end
      end
    end

    # @raise [RuntimeError]
    #
    # @return [String]
    def _run_compose_cmd(cmd); @engine.api.run_cmd!("docker-compose #{cmd}"); end

  end # end: Class{DockerAPI}
end

# TODO: https://docs.docker.com/engine/api/v1.24/
# TODO: https://docs.docker.com/engine/api/v1.40/
# TODO: https://container42.com/2016/03/27/docker-quicktip-7-psformat/
#
# TODO: https://stackoverflow.com/questions/16064957/how-to-check-in-applescript-if-an-app-is-running-without-launching-it-via-osa

# -------------------------------------------- ⚠️ --------------------------------------------

# resources
# 0x0) https://docs.docker.com/storage/volumes/
# 0x1) https://docs.docker.com/storage/bind-mounts/
