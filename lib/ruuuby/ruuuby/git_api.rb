# coding: UTF-8

# -------------------------------------------- ⚠️ --------------------------------------------

# `💎`
module ::Ruuuby

  # information and utilities that define and work w/ aspects of `Ruuuby`
  module MetaData

    # for a list of relating `git` functions @see: https://github.com/libgit2/libgit2sharp/wiki/LibGit2Sharp-Hitchhiker's-Guide-to-Git
    #
    # for base gem documentation @see: https://github.com/libgit2/rugged
    #
    # terminology:
    #  - repository:
    #    * git mainly operates on the `.git` directory, not the entire filesystem
    #    * you can have a repo within a repo
    #  - commits:
    #    * snapshot composed of contents of all files as is
    #    * there is a custom space-efficient compression algorithm used by git (but otherwise this is cause of any size bloat from .git)
    #    * composed of: commit_message, author, parents(commit(s) that this commit points-to/follows), name(SHA of the commit-obj)
    #  - branches:
    #    * just a convention for a logical/linear trail of git-commits
    #  - tags:
    #    * similair to branches but they are a fixed pointer of a specific commit
    #
    # misc notes:
    #  - any two `disparate` commits chosen will have a common ancestor that can be found by traversing down both commit's pointer chains until reaching the common ancestor node
    #  - "git tree" mathematically is a DAG (`directed asyclic graph`), note: every `tree` is a DAG but vise-versa is not implied (@see https://dev.to/nichartley/whats-a-git-tree-5149)
    #  - `origin/master` vs `origin master`: https://stackoverflow.com/questions/18137175/in-git-what-is-the-difference-between-origin-master-vs-origin-master
    #
    # helpful CLI commands:
    #  - `git log --pretty=format:"%H|%ad|%s" --date=iso`
    #
    # ----------------------------------
    #
    # `💎.engine.api_git`
    class GitAPI < ::Ruuuby::MetaData::RuuubyAPIComponent

      attr_reader :repo, :last_commit, :configs

      def initialize(engine)
        super(engine)
        @repo         = ::Rugged::Repository.new(@engine.path_base)
        # cached fields
        @branch_names = []
        @release_tags = []
      end

      # @return [String]
      def path_gitignore; "#{@engine.path_base}.gitignore"; end

      # @return [Rugged::Commit]
      def last_commit; @repo.last_commit; end

      # @return [Rugged::Config]
      def configs; @repo.config; end

      # @see https://github.com/desktop/desktop/issues/5057
      #  - "usually the `UNBORN HEAD` error happens when you are attempting to publish a branch that has no commits"
      #
      # @see https://stackoverflow.com/questions/5540883/whats-the-practical-difference-between-a-bare-and-non-bare-repository
      #  - "a bare repository does not have a default remote origin repository"
      #
      # @see https://www.git-tower.com/learn/git/faq/detached-head-when-checkout-commit
      #  - "when a specific commit is checkout out instead of a branch : `detached head`"
      #
      # @return [Boolean]
      def healthy?
        (!@repo.bare?) && (!@repo.empty?) && (!@repo.head_unborn?) && (!@repo.head_detached?)
      end

      # @param [String] sha | the SHA to search for
      #
      # @raise [ArgumentError] if sha is not a +String+
      #
      # @return [Boolean] true, if the SHA was found as an existing GIT Commit
      def ∃commit?(sha)
        🛑str❓(:sha, sha)
        begin
        @repo.lookup(sha).ⓣ == ::Rugged::Commit
        rescue ::Rugged::OdbError
            return false
        end
      end

      # TODO: NEEDS TDD!!!
      #
      # @param [String] stop_sha
      #
      # @raise [RuntimeError]
      #
      # @return [Array]
      def fetch_commits_until(stop_sha)
        if self.∃commit?(stop_sha)
          all_commits = []
          curr_commit = @repo.last_commit
          if curr_commit.oid == stop_sha
            return []
          end
          while curr_commit.oid != stop_sha
            all_commits << [curr_commit.oid, curr_commit.to_s, curr_commit.message]
            if curr_commit.parents.length != 1
              🛑 RuntimeError.new("{fetch_commits_until} missing coverage, please see SHA{#{stop_sha}}")
            else
              curr_commit = curr_commit.parents[0]
            end
          end
          all_commits
        else
          🛑 RuntimeError.new("unable to find GitCommit w/ SHA-value{#{stop_sha}}")
        end
      end

      # @return [Array]
      def remote_release_current; self.release_tags[0]; end

      # @return [Array]
      def remote_release_previous; self.release_tags[1]; end

      # ____________________________________________________________
      #  __        __        ___  __      ___    ___       __   __
      # /  `  /\  /  ` |__| |__  |  \    |__  | |__  |    |  \ /__`
      # \__, /~~\ \__, |  | |___ |__/    |    | |___ |___ |__/ .__/
      # ____________________________________________________________

      def _calculate_version
        💎.engine.api.run_cmd!('git --version')
      end

      # @return [Array]
      def release_tags
        if @release_tags.∅?
          @repo.references.each('refs/tags/*') do |ref|
            first_target = ref.target
            if first_target.ⓣ == ::Rugged::Tag::Annotation
              second_target = @repo.lookup(ref.target.oid)
              if second_target.ⓣ == ::Rugged::Tag::Annotation
                third_target = second_target.target
                if third_target.ⓣ == ::Rugged::Commit
                  @release_tags << [ref.name.to_s.♻️⟶('v').split('.').map(&:to_i), third_target.oid]
                else
                  🛑 RuntimeError.new("unexpected Class{#{second_target.Ⓣ}}, func{release_tags}, 3rd-obj{#{third_target.to_s}}")
                end
              else
                🛑 RuntimeError.new("unexpected Class{#{second_target.Ⓣ}}, func{release_tags}, 2nd-obj{#{second_target.to_s}}")
              end
            else
              🛑 RuntimeError.new("unexpected Class{#{first_target.Ⓣ}}, func{release_tags}, 1st-obj{#{first_target.to_s}}")
            end
          end
          @release_tags.sort!{|a,b| a <=> b }.reverse!
        end
        @release_tags
      end

      # @return [Array]
      def branch_names
        if @branch_names.∅?
          @branch_names = @repo.branches.each_name.sort
        end
        @branch_names
      end

    end # end: Class{GitAPI}
  end # end: Module{MetaData}
end

# -------------------------------------------- ⚠️ --------------------------------------------

# TODO: https://gist.github.com/trey/2722934
# TODO: https://gist.github.com/brandonsimpson/54d9e085c9fde5e6ad3a
