# coding: UTF-8

# -------------------------------------------- ⚠️ --------------------------------------------

module ::Ruuuby

  # information and utilities that define and work w/ aspects of `Ruuuby`
  module MetaData

    class RuuubyAPI
      include ::Ruuuby::Attribute::Includable::RuuubySingleton

      attr_reader :commit_history

      def initialize
      end

      # TODO: wip
      def sync_git_commit_history
        orm_version_current = ::RuuubyRelease.get_version_curr
        if orm_version_current.git_commits.empty?
          🛑 RuntimeError.new("current RuuubyRelease{#{orm_version_current.uid.to_s}} has no git commits")
        end
        last_release_commit = orm_version_current.get_commit_newest
        commits_to_sync     = 💎.api_git.fetch_commits_until(last_release_commit.commit_hash)

        if commits_to_sync.∅?
          puts 'no commits to sync'
        else
          raise 'wip'
        end

        commits_to_sync
      end

      🙈

      # TODO: refactor, should just be 1 param(expected_version)
      def api_routine_update_version_file(version_current, version_next)
        self.api_routine_update_file(
            ::Ruuuby::MetaData::Paths::SpecificFiles::RUUUBY_VERSION,
            "VERSION = '#{version_current}'.freeze",
            "VERSION = '#{version_next}'.freeze",
            1
        )
      end

      # TODO: refactor, should just be 1 param(expected_version)
      def api_routine_update_readme_file(version_current, version_next)
        self.api_routine_update_file(
            ::Ruuuby::MetaData::Paths::SpecificFiles::RUUUBY_README,
            "| `gem 'ruuuby', '~> #{version_current}'`",
            "| `gem 'ruuuby', '~> #{version_next}'`",
            1
        )
      end

      def api_routine_update_file(path_file, the_expr, the_replacement, num_matches)
        💎.debug("Ensuring file{#{path_file}} is ready for release...")
        puts "Ensuring file{#{path_file}} is ready for release..."
        num_matched = ::File.replace_expr_with(path_file, the_expr, the_replacement, num_matches)
        if num_matched >= num_matches
          💎.debug('updated, done!')
          puts 'updated, done!'
        else
          💎.debug('done!')
          puts 'done!'
        end
        num_matched
      end

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
