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
    #
    # ----------------------------------
    #
    # 💎.api_git
    class GitAPI
      include ::Ruuuby::Attribute::Includable::RuuubySingleton

      attr_reader :repo, :path_gitignore, :last_commit, :configs

      def initialize
        @repo           = ::Rugged::Repository.new(::Ruuuby::MetaData::Paths::BASE)
        @path_gitignore = "#{::Ruuuby::MetaData::Paths::BASE}/.gitignore"
        @last_commit    = @repo.last_commit
        @configs         = @repo.config
      end

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
        @repo.lookup(sha).class == ::Rugged::Commit
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

    end
  end
end

module ::Ruuuby
  # information and utilities that define and work w/ aspects of `Ruuuby`
  module MetaData
    def self.api_git; ::Ruuuby::MetaData::GitAPI.ℹ; end
  end
end

# -------------------------------------------- ⚠️ --------------------------------------------
