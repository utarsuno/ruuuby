# coding: UTF-8

# -------------------------------------------- ⚠️ --------------------------------------------

module ::Ruuuby

  # information and utilities that define and work w/ aspects of `Ruuuby`
  module MetaData

    # `💎.api`
    class RuuubyAPI
      include ::Ruuuby::Attribute::Includable::RuuubySingleton

      def initialize
      end

      def info_release_state
        release_current = 💎.api_git.remote_release_current
        #release_previous = 💎.api_git.remote_release_previous

        puts "the last released version was{#{release_current.to_s}}"
      end

      🙈

    end
  end

end

module ::Ruuuby
  # information and utilities that define and work w/ aspects of `Ruuuby`
  module MetaData
    def self.api; ::Ruuuby::MetaData::RuuubyAPI.ℹ; end
  end
end

# -------------------------------------------- ⚠️ --------------------------------------------
