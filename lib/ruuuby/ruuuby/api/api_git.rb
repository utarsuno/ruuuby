# encoding: UTF-8

# -------------------------------------------- ⚠️ --------------------------------------------

# `💎`
module ::Ruuuby

  # information and utilities that define and work w/ aspects of `Ruuuby`
  module MetaData

    # helpful CLI commands:
    #  ---------------------------------------------------------------------------------------------------------
    #  | scenario                                           | {reference) command/template                     |
    #  | -------------------------------------------------- | ------------------------------------------------ |
    #  | human readable view of staging                     | `git diff --cached --stat`                       |
    #  | human readable view of commits                     | `git log --pretty=format:"%H|%ad|%s" --date=iso` |
    #  | human readable view of current configs applied      | `git config --list --show-origin --show-scope`    |
    #  | for script: get num files w/ diffs                  | `git diff --cached --numstat | wc -l`            |
    #  | alternative for `git status`                       | `git status --porcelain=v2 -b`                   |
    #  | clone only latest data, save time & network-data   | `git clone --depth 1 <git_url>`                  |
    #  | check for any fixable text/file/syntax issues        | `git diff --cached --check`                      |
    #  | check if file is tracked (not tracked if no output) | `git ls-files <path_name>`                        |
    #  ---------------------------------------------------------------------------------------------------------
    #
    #  helpful resources
    # --------------------------------------------------------------------------------------------------------------------------------------------
    # | scenario(s)                    | resource                                                                                 | reference_id |
    # | ------------------------------ | ---------------------------------------------------------------------------------------- | ------------ |
    # | list of relating git functions | https://github.com/libgit2/libgit2sharp/wiki/LibGit2Sharp-Hitchhiker's-Guide-to-Git      | 0x0          |
    # | base gem documentation         | https://github.com/libgit2/rugged                                                        | 0x1          |
    # | provides version list overview | https://en.wikipedia.org/wiki/Git                                                        | 0x2          |
    # | tips n tricks                  | https://community.lsst.org/t/git-tips-and-tricks/3169/2                                  | 0x3          |
    # | useful settings esp. w/ MacOS  | https://gist.github.com/trey/2722934                                                     | 0x4          |
    # | (not utilized/tested yet)      | https://gist.github.com/brandonsimpson/54d9e085c9fde5e6ad3a                              | 0x5          |
    # | turning off status hints       | https://stackoverflow.com/questions/55463863/how-to-turn-off-the-help-hints-in-git-output | 0x6          |
    # | TODO: look into                | https://github.com/so-fancy/diff-so-fancy                                                |              |
    # | TODO: look into                | https://git-scm.com/book/en/v2/Appendix-B%3A-Embedding-Git-in-your-Applications-Libgit2  |              |
    # | TODO: look into                | https://git-scm.com/book/en/v2/Customizing-Git-Git-Hooks                                 |              |
    # --------------------------------------------------------------------------------------------------------------------------------------------
    #
    # terminology:
    #  - repository:
    #    ‣ git mainly operates on the `.git` directory, not the entire filesystem
    #    ‣ you can have a repo within a repo
    #
    #  - commits:
    #    ‣ snapshot composed of contents of all files as is
    #    ‣ there is a custom space-efficient compression algorithm used by git (but otherwise this is cause of any size bloat from .git)
    #    ‣ composed of: commit_message, author, parents(commit(s) that this commit points-to/follows), name(SHA of the commit-obj)
    #
    #  - branches:
    #    ‣ convention for a logical/linear trail of git-commits
    #
    #  - tags:
    #    ‣ similair to branches but they are a fixed pointer of a specific commit
    #
    #  - index/staging-area:
    #    ‣ convention for a 'holding area' for changes to the current working directory, only these changes to `index/staging` are what get applied to the next `git commit` (so regardless of the state of the current working directory)
    #
    # misc notes:
    #  ‣ any two `disparate` commits chosen will have a common ancestor that can be found by traversing down both commit's pointer chains until reaching the common ancestor node
    #  ‣ "git tree" mathematically is a DAG (`directed asyclic graph`), note: every `tree` is a DAG but vise-versa is not implied (@see https://dev.to/nichartley/whats-a-git-tree-5149)
    #  ‣ `origin/master` vs `origin master`: https://stackoverflow.com/questions/18137175/in-git-what-is-the-difference-between-origin-master-vs-origin-master
    #
    # `💎.engine.api_locale.api_git`
    class GitAPI < ::Ruuuby::MetaData::RuuubyAPIComponentCLI

      attr_reader :repo

      def initialize(engine)
        super(engine, 'git')
        @repo         = ::Rugged::Repository.new(@engine.path_base)
        # cached fields
        @index        = @repo.index
        @branch_names = []
        @release_tags = []
      end

      # @return [Rugged::Commit]
      def last_commit; @repo.last_commit; end

      # @return [Rugged::Config]
      def configs; @repo.config; end

      # @param [String] attribute_key
      # @param [Hash]   expected_key_val_pairs
      #
      # @raise [ArgumentError]
      #
      # @return [Boolean]
      def ∃attribute?(attribute_key, expected_key_val_pairs)
        🛑str❓('attribute_key', attribute_key)
        🛑hsh❓('expected_key_val_pairs', expected_key_val_pairs)
        result = @repo.fetch_attributes(attribute_key)
        if result.length == expected_key_val_pairs.length
          expected_key_val_pairs.∀ do |key, value|
            if result.∃🔑?(key)
              if result[key] != value
                return false
              end
            else
              return false
            end
          end
          true
        else
          false
        end
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

      # @return [Array]
      def version_libgit2; ::Rugged.libgit2_version; end

      # _______________________________________________________________
      #       ___           ___          __        ___  __        __
      # |__| |__   /\  |     |  |__|    /  ` |__| |__  /  ` |__/ /__`
      # |  | |___ /~~\ |___  |  |  |    \__, |  | |___ \__, |  \ .__/
      # _______________________________________________________________

      # @see https://github.com/desktop/desktop/issues/5057
      #  - "usually the `UNBORN HEAD` error happens when you are attempting to publish a branch that has no commits"
      #
      # @see https://stackoverflow.com/questions/5540883/whats-the-practical-difference-between-a-bare-and-non-bare-repository
      #  - "a bare repository does not have a default remote origin repository"
      #
      # @see https://www.git-tower.com/learn/git/faq/detached-head-when-checkout-commit
      #  - "when a specific commit is checkout out instead of a branch : `detached head`"
      #
      # @param [Boolean] perform_full_check
      #
      # @raise [ArgumentError]
      #
      # @return [Boolean]
      def healthy?(perform_full_check=false)
        🛑bool❓('perform_full_check', perform_full_check)
        is_healthy = self.healthy_repo?
        if perform_full_check
          !(!is_healthy || self.∃fixable_syntax_errors? || self.∃index_conflicts?) && self.version_libgit2 == [1, 0, 1]
        else
          is_healthy
        end
      end

      # @return [Boolean]
      def healthy_repo?; (!@repo.bare?) && (!@repo.empty?) && (!@repo.head_unborn?) && (!@repo.head_detached?) && (!@repo.shallow?); end

      # `💎.engine.api_locale.api_git.∃index_conflicts?`
      #
      # @return [Boolean]
      def ∃index_conflicts?; @index.conflicts?; end

      # `💎.engine.api_locale.api_git.∃fixable_syntax_errors?`
      #
      # @return [Boolean]
      def ∃fixable_syntax_errors?; self.run_cmd('diff --check') == [] || self.run_cmd('diff --cached --check') == []; end

      # _______________________________________________________________
      #  __        __        ___  __      ___    ___       __   __
      # /  `  /\  /  ` |__| |__  |  \    |__  | |__  |    |  \ /__`
      # \__, /~~\ \__, |  | |___ |__/    |    | |___ |___ |__/ .__/
      # _______________________________________________________________

      # @return [Array]
      def release_tags
        if @release_tags.∅?
          @repo.references.each('refs/tags/*') do |ref|
            ref_annotation = ref.target
            🛑 ::RuntimeError.new("unexpected Class{#{ref_annotation.Ⓣ}}, func{release_tags}, 2nd-obj{#{ref_annotation.to_s}}") unless ref_annotation.ⓣ == ::Rugged::Tag::Annotation
            ref_commit     = ref_annotation.target
            🛑 ::RuntimeError.new("unexpected Class{#{ref_commit.Ⓣ}}, func{release_tags}, 3ʳᵈ-obj{#{ref_commit.to_s}}") unless ref_commit.ⓣ == ::Rugged::Commit
            @release_tags << [ref.name.to_s.♻️⟶('v').split('.').map(&:to_i), ref_commit.oid]
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
