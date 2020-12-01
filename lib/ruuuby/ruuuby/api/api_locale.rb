# encoding: UTF-8

# -------------------------------------------- ⚠️ --------------------------------------------

# `💎`
module ::Ruuuby::MetaData

  # TODO: automate searching for a file ex: 'find /path -name "file_name"'
  #
  # TODO: document https://gist.github.com/barnes7td/3804534
  #
  # `💎.engine.api_locale`
  class LocaleAPI < ::Ruuuby::MetaData::EngineComponent

    def initialize(engine)
      super(engine)
      @api_docker     = nil
      @api_docker_dev = nil
      @api_brew       = nil
      @api_git        = nil
      @cached_configs  = nil
    end

    # @return [Ruuuby::MetaData::DockerAPI]
    def api_docker
      if @api_docker.∅?
        require 'docker'
        require_relative 'docker/attributes/findable'
        %w(network volume image container service service_set).∀{|docker_lib| require_relative "docker/docker_#{docker_lib}"}
        require_relative 'docker/api_docker'
        @api_docker = ::Ruuuby::MetaData::DockerAPI.new(@engine, 'ruuuby')
      end
      @api_docker
    end

    # @return [Ruuuby::MetaData::DockerAPI]
    def api_docker_dev
      self.api_docker if @api_docker.∅?
      if @api_docker_dev.∅?
        require_relative 'docker/conditional/docker_service_set_dev'
        @api_docker_dev = ::RuuubyServiceSetDev.new('http://localhost')
      end
      @api_docker_dev
    end

    # @return [Ruuuby::MetaData::BrewAPI]
    def api_brew; @api_brew = ::Ruuuby::MetaData::BrewAPI.new(@engine) if @api_brew.∅?; @api_brew; end

    # @return [Ruuuby::MetaData::GitAPI]
    def api_git
      if @api_git.∅?
        #require 'rugged'
        #require_relative 'git/conditional'
        @api_git = ::Ruuuby::MetaData::GitAPI.new(@engine)
      end
      @api_git
    end

    # @return [Hash]
    def cached_configs
      @cached_configs = ::File::YAML.read("#{@engine.path_base}configs_local/configs.yml") if @cached_configs.∅?
      @cached_configs
    end

    # @return [Boolean]
    def healthy?
      ::ENV['ARCHFLAGS'] == '-arch x86_64' && self.healthy_encoding?
    end

    🙈

    # @return [Boolean]
    def healthy_encoding?
      ::ENV.∀🔑∃_value?(%w(LANG LANGUAGE LC_CTYPE LC_MESSAGES LC_ALL), 'en_US.UTF-8')
    end

  end # end: Class{LocaleAPI}
end

# -------------------------------------------- ⚠️ --------------------------------------------
