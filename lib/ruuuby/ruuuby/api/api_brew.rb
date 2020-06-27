# coding: UTF-8

# -------------------------------------------- ⚠️ --------------------------------------------

# `💎`
module ::Ruuuby

  # information and utilities that define and work w/ aspects of `Ruuuby`
  module MetaData

    # TODO: https://github.com/Homebrew/brew/releases
    class BrewAPI < ::Ruuuby::MetaData::RuuubyAPIComponent

      attr_reader :repo, :last_commit, :configs

      def initialize(engine)
        super(engine)
      end

      def _calculate_version
        💎.engine.api.run_cmd!('brew --version')
      end

      # TODO:
      #  - 'brew info <package>', ex: 'brew info ruby-build' helps indicate the dependencies{autoconf, pk-config, readline}

    end # end: Class{BrewAPI}
  end
end

# -------------------------------------------- ⚠️ --------------------------------------------
