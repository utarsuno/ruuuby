# coding: UTF-8

# -------------------------------------------- ⚠️ --------------------------------------------

module ::Ruuuby

  # information and utilities that define and work w/ aspects of `Ruuuby`
  module MetaData

    class RuuubyAPI
      include ::Ruuuby::Attribute::Includable::RuuubySingleton

      attr_reader :commit_history

      def initialize
        @commit_history   = ''
        @unparsed_commits = []
        @git_configs       = ''
      end

      # 💎.api.sync_git_commit_history
      #
      def sync_git_commit_history
        all_commits       = self.commit_history
        last_verified_hash = GitCommit.get_latest.commit_hash

        unless last_verified_hash == all_commits[0][0]
          💎.debug('Commits are not synced, syncing them now')
          all_commits.each do |commit|
            if commit[0] == last_verified_hash
              break
            else
              @unparsed_commits << commit
            end
          end
          version_of_those_commits = @unparsed_commits[0][2].dup.♻️⟵(' ')
          version_of_those_commits = version_of_those_commits.split('.').map!{|n| n.to_i}
          the_version              = version_of_those_commits.join('_')
          file_lines                = []
          💎.debug('----------------------------')
          @unparsed_commits.reverse_each do |single_commit|
            file_lines << "@v#{the_version}.spawn_git_commit('#{single_commit[2]}', '#{single_commit[1].to_s.as_iso8601}', '#{single_commit[0]}')"
          end
          if file_lines.length > 0
            path_file = ::Ruuuby::MetaData::Paths::SpecificFiles::SEED_GIT_COMMITS
            puts "Ensuring file{#{path_file}} is ready for release..."
            ::File.insert_lines_before_expr(path_file, file_lines, "#NEXT_VERSION_HERE")
            puts "updated, done!"

            # TODO: DYNAMICALLY UPDATE THE ORM STATE HERE!!!
          end
          💎.debug('----------------------------')
        else
          puts "git commits are currently synced"
          💎.debug("git commits are currently synced")
        end
      end

      def sync_version_number
        version_next = RuuubyRelease.get_version_next.uid
        version_next = version_next[1..version_next.length]

        version_curr = RuuubyRelease.get_version_curr.uid_components.join('.')

        💎.debug("Ruuuby's current-version{#{version_curr}}, the next version is{#{version_next}}")

        # TODO: AUTOMATION, if files had changes made, automate and/or make note in relation to then needed GIT operations

        💎.debug('----------------------------')
        self.api_routine_update_version_file(version_curr, version_next)
        💎.debug('----------------------------')
        self.api_routine_update_readme_file(version_curr, version_next)
        💎.debug('----------------------------')
      end

      🙈

      def api_routine_update_version_file(version_current, version_next)
        self.api_routine_update_file(
            ::Ruuuby::MetaData::Paths::SpecificFiles::RUUUBY_VERSION,
            "VERSION = '#{version_current}'.freeze",
            "VERSION = '#{version_next}'.freeze",
            1
        )
      end

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

      # ---

      def commit_history
        if @commit_history.∅?
          cmd             = 💎.cli.new(💎.cli::Syntax::GitCommands::COMMIT_HISTORY)
          output          = cmd.run
          @commit_history = Ruuuby::Routine::CommandCLI::Syntax::GitCommands.parse_commit_history(output)
        end
        @commit_history
      end

      def git_configs
        if @git_configs.∅?
          cmd         = 💎.cli.new(💎.cli::Syntax::GitCommands::CMD_LIST_CONFIGS)
          output      = cmd.run
          @git_configs = output
        end
        @git_configs
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
