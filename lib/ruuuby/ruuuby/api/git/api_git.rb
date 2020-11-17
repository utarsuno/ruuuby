# encoding: UTF-8

# -------------------------------------------- ⚠️ --------------------------------------------

# `💎`
module ::Ruuuby::MetaData

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
  # | using IDE for gitdiff          | https://brian.pontarelli.com/2013/10/25/using-idea-for-git-merging-and-diffing/           | 0x7          |
  # | TODO: look into                | https://github.com/so-fancy/diff-so-fancy                                                |              |
  # | TODO: look into                | https://git-scm.com/book/en/v2/Customizing-Git-Git-Hooks                                 |              |
  # |                                |                                                                                          |              |
  # | TODO: (libgit2)                | https://libgit2.org/docs/guides/101-samples/                                             |              |
  # | TODO: (libgit2)                | https://git-scm.com/book/en/v2/Appendix-B%3A-Embedding-Git-in-your-Applications-Libgit2  |              |
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
  # `$git`
  #
  # `💎.engine.api_locale.api_git`
  class GitAPI < ::Ruuuby::MetaData::EngineComponentAPICLI
    attribute_lazy_loadable('rugged', true)

    def initialize(engine)
      super(engine, 'git')
      @repo         = nil
      @branch_names = nil
      @release_tags = nil
    end

    def repo
      if @repo.nil?
        self.class.ensure_lazy_loaded
        require_relative 'conditional'
        @repo = ::Rugged::Repository.new(@engine.path_base)
      end
      @repo
    end

    # @return [Rugged::Commit]
    def last_commit; self.repo.last_commit; end

    # @param [String] attribute_key
    # @param [Hash]   expected_key_val_pairs
    #
    # @raise [ArgumentError]
    #
    # @return [Boolean]
    def ∃attribute?(attribute_key, expected_key_val_pairs)
      🛑str❓('attribute_key', attribute_key)
      🛑hsh❓('expected_key_val_pairs', expected_key_val_pairs)
      result = self.repo.fetch_attributes(attribute_key)
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
      🛑str❓('sha', sha)
      begin
        self.repo.lookup(sha).ⓣ == ::Rugged::Commit
      rescue ::Rugged::OdbError
        return false
      end
    end

    def changes(subset=true)
      deltas = []
      diffs  = self.repo.index.diff
      diffs.each_delta{|d| deltas << [d.size_delta, d.new_file[:path], d]}
      deltas.sort!{|a, b| a[0] <=> b[0]}
      deltas
    end

    def changes_smallest
      f             = $git.changes.map{|n| [n[0].to_f.abs, n[1], n[2]]}.sort!{|a,b| a[0] <=> b[0]}[0][2]
      path          = f.new_file[:path]
      puts "PATH:\n#{path}"
      found_changes = self.run_cmd("--no-pager diff --unified=0 " + path)
    end

    # $git.changes.map{|n| [n[0].to_f.abs, n[1], n[2]]}.sort!{|a,b| a[0] <=> b[0]}

    def changes_fixing_encoding
      _changes = self.changes.map{|node| [node[0], node[1]]}.reject{|node| node[0].to_f.abs != 2.0}

      _changes.each do |size, path|
        found_changes = self.run_cmd("--no-pager diff --unified=0 #{path}")
        if found_changes[-1].include?('+# encoding: UTF-8')
          puts "path{#{path}} can be auto-added (it only includes fix first line in file marking the encoding type of{UTF-8})"
          self.run_cmd("--no-pager add #{path}")
        end
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
        curr_commit = self.repo.last_commit
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
    def remote_release_current; self.release_tags[-1]; end

    # @return [Array]
    def remote_release_previous; self.release_tags[-2]; end

    # _______________________________________________________________
    #  __   __        ___    __   __
    # /  ` /  \ |\ | |__  | / _` /__`
    # \__, \__/ | \| |    | \__> .__/
    # _______________________________________________________________

    # @example
    #
    #   > to create the following config:
    #
    #   [diff "image"]
    #	    textconv=exif
    #	    cachetextconv=true
    #
    #   > run these commands:
    #
    #   $git.configs.store('diff.image.textconv','exif')
    #   $git.configs.store('diff.image.cachetextconv','true')
    #
    # @return [Rugged::Config]
    def configs; self.repo.config; end

    # _______________________________________________________________
    #       ___           ___          __        ___  __        __
    # |__| |__   /\  |     |  |__|    /  ` |__| |__  /  ` |__/ /__`
    # |  | |___ /~~\ |___  |  |  |    \__, |  | |___ \__, |  \ .__/
    # _______________________________________________________________

    # @param [Boolean] perform_full_check
    #
    # @raise [ArgumentError]
    #
    # @return [Boolean]
    def healthy?(perform_full_check=false)
      🛑bool❓('perform_full_check', perform_full_check)
      is_healthy = self.healthy_repo?
      if perform_full_check
        !(!is_healthy || self.∃fixable_syntax_errors? || self.∃index_conflicts?) && ::Rugged.libgit2_version == [1, 0, 1]
      else
        is_healthy
      end
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
    def healthy_repo?; (!self.repo.bare?) && (!self.repo.empty?) && (!self.repo.head_unborn?) && (!self.repo.head_detached?) && (!self.repo.shallow?); end

    # `$git.∃index_conflicts?`
    #
    # @return [Boolean]
    def ∃index_conflicts?; self.repo.index.conflicts?; end

    # `$git.∃fixable_syntax_errors?`
    #
    # @return [Boolean]
    def ∃fixable_syntax_errors?; self.run_cmd('diff --check') == [] || self.run_cmd('diff --cached --check') == []; end

    # _______________________________________________________________
    #  __        __        ___  __      ___    ___       __   __
    # /  `  /\  /  ` |__| |__  |  \    |__  | |__  |    |  \ /__`
    # \__, /~~\ \__, |  | |___ |__/    |    | |___ |___ |__/ .__/
    # _______________________________________________________________

    # @param [Array] version
    #
    # @raise [ArgumentError]
    def release_tag_for_version(version)
      🛑ary❓('version', version)
      self.release_tags.each {|t| return t[2] if t[0] == version}
      false
    end

    # @param [*] version
    def release_commit_for_version(version); self.release_tags.each {|t| return t[1] if t[0] == version}; false; end

    # @param [Array] version
    #
    # @return [Boolean]
    def ∃tag_for_version?(version)
      self.release_tag_for_version(version) != false
    end

    # @param [Array] version
    def find_release_tag(version); self.release_tags.each {|t| return t[2] if t[0] == version}; false; end

    # @param [Array] version
    def find_release_commit(version); self.release_tags.each {|t| return t[1] if t[0] == version}; false; end

    # @param [Array] version
    #
    # @raise [RuntimeError]
    def find_release_tag!(version); 🛑 ::RuntimeError.new("| m{find_release_tag!} did not find version{#{version.to_s}} |") unless (!self.release_tag_for_version(version)); end

    # @raise [RuntimeError]
    #
    # @return [Array]
    def release_tags
      if @release_tags.∅?
        @release_tags = []
        self.repo.references.each('refs/tags/*') do |ref|
          ref_annotation = ref.target
          🛑 ::RuntimeError.new("unexpected Class{#{ref_annotation.Ⓣ}}-> m{release_tags}, 2nd-obj{#{ref_annotation.to_s}}") unless ref_annotation.ⓣ == ::Rugged::Tag::Annotation
          ref_commit     = ref_annotation.target
          🛑 ::RuntimeError.new("unexpected Class{#{ref_commit.Ⓣ}}-> m{release_tags}, 3ʳᵈ-obj{#{ref_commit.to_s}}") unless ref_commit.ⓣ == ::Rugged::Commit
          #@release_tags << [ref.name.to_s.♻️⟶('v').split('.').map(&:to_i), ref_commit.oid]
          @release_tags << [ref.name.to_s.♻️⟶('v').split('.').map(&:to_i), ref_commit, ref_annotation]
        end
        @release_tags.sort!{|a,b| a <=> b }
        #@release_tags.sort!{|a,b| a <=> b }.reverse!
      end
      @release_tags
    end

    # @return [Array]
    def branch_names; @branch_names = self.repo.branches.each_name.sort if @branch_names.∅?; @branch_names; end

  end # end: Class{GitAPI}
end

# -------------------------------------------- ⚠️ --------------------------------------------
