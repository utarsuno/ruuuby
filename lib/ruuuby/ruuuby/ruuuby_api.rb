
# -------------------------------------------- ⚠️ --------------------------------------------

module ::Ruuuby

  class RuuubyAPI
    include Singleton

    attr_reader :commit_history

    def self.instance ; @@instance ||= new ; end

    def initialize
      @last_commit    = ''
      @commit_history = ''
      @git_configs     = ''
    end

    def get_last_commit
      if @last_commit.∅?
        @last_commit                 = self.commit_history[0]
        @last_commit_parsed_version  = @last_commit[2].dup.♻️⟵(' ')
        @last_commit_version_as_nums = @last_commit_parsed_version.split('.').map!{|n| n.to_i}
        @last_commit_parsed_version  = @last_commit_parsed_version.gsub!('.', '_')
      end
      @last_commit
    end

    def prepare_for_version_update
      last_commit  = self.get_last_commit

      version_next = RuuubyRelease.get_version_next.uid
      version_next = version_next[1..version_next.length]

      version_curr = RuuubyRelease.get_version_curr.uid_components.join('.')

      puts "Ruuuby's current-version{#{version_curr}}, the next version is{#{version_next}}, the last commit was {#{@last_commit_parsed_version.to_s}}"

      num_commits = RuuubyRelease.get_version_curr.git_commits

      if num_commits.length == 0
        puts "----------------------------"
        the_version     = last_commit[2].♻️⟵(' ').gsub!('.', '_')
        the_version_txt = "@#{the_version}.spawn_git_commit('#{last_commit[2]}', '#{last_commit[1]}', '#{last_commit[0]}')"
        self.api_routine_update_file_git_commits(the_version_txt)
        puts "----------------------------"
        self.api_routine_update_version_file(version_curr, version_next)
        puts "----------------------------"
        self.api_routine_update_readme_file(version_curr, version_next)
        puts "----------------------------"
      else
        puts "----------------------------"
        puts "[db/seeds/git_commits.rb] is synced"
        puts "assuming [README.md] is synced"
        puts "assuming [lib/ruuuby/version.rb] is synced"
        puts "----------------------------"
      end
    end

    # ---

    def api_routine_update_file_git_commits(text_to_add)
      path_file = ::Ruuuby::MetaData::Paths::SpecificFiles::SEED_GIT_COMMITS
      print "Ensuring file{#{path_file}} is ready for release..."
      ::File.insert_line_before_expr(path_file, text_to_add, "#NEXT_VERSION_HERE")
      puts "updated, done!"
    end

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
      print "Ensuring file{#{path_file}} is ready for release..."
      num_matched = ::File.replace_expr_with(path_file, the_expr, the_replacement, num_matches)
      if num_matched >= num_matches
        puts "updated, done!"
      else
        puts "done!"
      end
      num_matched
    end

    # ---

    def commit_history
      if @commit_history.∅?
        cmd             = Ruuuby::Routine::CommandCLI.new(Ruuuby::Routine::CommandCLI::Syntax::GitCommands::COMMIT_HISTORY)
        output          = cmd.run
        @commit_history = Ruuuby::Routine::CommandCLI::Syntax::GitCommands.parse_commit_history(output)
      end
      @commit_history
    end

    def git_configs
      if @git_configs.∅?
        cmd             = Ruuuby::Routine::CommandCLI.new(Ruuuby::Routine::CommandCLI::Syntax::GitCommands::CMD_LIST_CONFIGS)
        output          = cmd.run
        @git_configs     = output
      end
      @git_configs
    end

  end

end

# -------------------------------------------- ⚠️ --------------------------------------------
