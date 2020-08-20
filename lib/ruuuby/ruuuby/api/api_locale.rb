# encoding: UTF-8

# -------------------------------------------- ⚠️ --------------------------------------------

# `💎`
module ::Ruuuby

  # information and utilities that define and work w/ aspects of `Ruuuby`
  module MetaData

    # TODO: automate searching for a file ex: 'find /path -name "file_name"'
    #
    # TODO: document https://gist.github.com/barnes7td/3804534
    #
    # TODO: https://www.cyberciti.biz/faq/download-a-file-with-curl-on-linux-unix-command-line/
    #  * (to provide alternative test verifications) automate downloading w/ curl, ex: `curl <URL> --output <SAVE_TO_PATH>`
    #
    # `💎.engine.api_locale`
    class LocaleAPI < ::Ruuuby::MetaData::RuuubyAPIComponent

      EXPECTED_LANG = 'en_US.UTF-8'

      def initialize(engine)
        super(engine)
        @api_docker    = nil
        @api_brew      = nil
        @api_iconv     = nil
        @api_git       = nil
        @cached_configs = nil
      end

      # @return [Ruuuby::MetaData::DockerAPI]
      def api_docker
        if @api_docker.∅?
          require 'docker'
          %w(network container service service_set).∀{|docker_lib| require_relative "docker/docker_#{docker_lib}"}
          require_relative 'docker/api_docker'
          @api_docker = ::Ruuuby::MetaData::DockerAPI.new(@engine, 'ruuuby')
        end
        @api_docker
      end

      #def api_docker; @api_docker = ::Ruuuby::MetaData::DockerAPI.new(@engine) if @api_docker.∅?; @api_docker; end

      # @return [Ruuuby::MetaData::BrewAPI]
      def api_brew; @api_brew = ::Ruuuby::MetaData::BrewAPI.new(@engine) if @api_brew.∅?; @api_brew; end

      # @return [Ruuuby::MetaData::IconvAPI]
      def api_iconv; @api_iconv = ::Ruuuby::MetaData::IconvAPI.new(@engine) if @api_iconv.∅?; @api_iconv; end

      # @return [Ruuuby::MetaData::GitAPI]
      def api_git
        if @api_git.∅?
          require 'rugged'
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
        ::ENV.∀🔑∃_value?(%w(LANG LANGUAGE LC_CTYPE LC_MESSAGES LC_ALL), ::Ruuuby::MetaData::LocaleAPI::EXPECTED_LANG)
      end

    end # end: Class{LocaleAPI}
  end
end

# -------------------------------------------- ⚠️ --------------------------------------------
