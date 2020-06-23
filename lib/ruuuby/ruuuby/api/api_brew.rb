# coding: UTF-8

# -------------------------------------------- ⚠️ --------------------------------------------

# `💎`
module ::Ruuuby

  # information and utilities that define and work w/ aspects of `Ruuuby`
  module MetaData

    # TODO: https://github.com/Homebrew/brew/releases
    class BrewAPI < ::Ruuuby::MetaData::RuuubyEngineComponent

      attr_reader :repo, :last_commit, :configs

      def initialize(engine)
        super(engine)
      end

    end # end: Class{BrewAPI}
  end
end

# -------------------------------------------- ⚠️ --------------------------------------------
