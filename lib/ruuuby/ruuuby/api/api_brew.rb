# coding: UTF-8

# -------------------------------------------- ⚠️ --------------------------------------------

# `💎`
module ::Ruuuby

  # information and utilities that define and work w/ aspects of `Ruuuby`
  module MetaData

    # TODO: https://github.com/Homebrew/brew/releases
    class BrewAPI < ::Ruuuby::MetaData::RuuubyAPIComponent

      def initialize(engine)
        super(engine)
      end

      def execute_cmd_doctor
        self.run_cmd!('brew doctor')
      end

      # `wip`
      def execute_cmd_cleanup; self.run_cmd!('brew cleanup --verbose'); end

      # @param [String] package_name
      #
      # @raise [ArgumentError]
      def execute_cmd_prefix_of(package_name)
        🛑str❓(:package_name, package_name)
        @engine.api.run_cmd!("brew --prefix #{package_name}")
      end

      def _calculate_version
        @engine.api.run_cmd!('brew --version')
      end

      # TODO:
      #  - 'brew info <package>', ex: 'brew info ruby-build' helps indicate the dependencies{autoconf, pk-config, readline}

    end # end: Class{BrewAPI}
  end
end

# -------------------------------------------- ⚠️ --------------------------------------------
