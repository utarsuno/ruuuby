# coding: UTF-8

# -------------------------------------------- ⚠️ --------------------------------------------

class ::RuuubyRelease < ApplicationRecord

  # useful components for syntax parsing
  module Syntax

    # @type [String]
    UID     = '(v?)\d.\d.\d(\d?)( ((version)|(release)))?'.❄️

    # @type [String]
    SQL_UID = 'vmajor = ? AND vminor = ? AND vtiny = ?'.❄️

    ❄️
  end

  include ::Comparable
  include ::Ruuuby::ORMAttribute::Includable::UID

  validates :vmajor, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :vminor, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :vtiny, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :num_commits, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :num_gems_added, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  has_many :git_commits, class_name: 'GitCommit', :dependent => :delete_all
  has_many :ruuuby_gems, class_name: 'RuuubyGem', :dependent => :delete_all

  before_save :on_before_save

  # TODO: delete (actually use the created ORM obj)
  module AttributeChangelog

    class InternalRuuubyChangelog
      def initialize(orm_owner)
        @orm_owner = orm_owner
        @changelog = []
      end

      def add_entry(feature, description)
        @changelog << RuuubyChangelog.spawn(@orm_owner, feature, description)
      end

      def added_method_to_class(feature, method_name, nucleotide_name)
        self.add_entry(feature, "+m{#{method_name.to_s}}->c{#{nucleotide_name.to_s}}")
      end

      def added_methods_to_class(feature, added_methods)
        added_methods.each do |am|
          self.added_method_to_class(feature, am[0], am[1])
        end
      end

      def added_global_func(feature, func_name)
        self.added_method_to_class(feature, func_name, ::Kernel)
      end

      # @return [Array]
      def get_docs
        return [] if @changelog.empty?
        the_docs = []
        the_docs << "| class | method(s) added | feature(s) |\n"
        the_docs << "| --- | --- | --- |\n"
        @changelog.each do |c|
          the_docs << c.docs_changelog
        end
        the_docs
      end
    end

    def changelog
      @changelog ||= AttributeChangelog::InternalRuuubyChangelog.new(self)
    end

  end

  include ::RuuubyRelease::AttributeChangelog

  def self.spawn(major, minor, tiny, description=nil); ::RuuubyRelease.create!(vmajor: major, vminor: minor, vtiny: tiny, description: description); end

  def comments ; @comments ||= [] ; end
  def files_added ; @files_added ||= [] ; end
  def files_removed ; @files_removed ||= [] ; end

  def add_gem(gem_name, gem_version, for_development, for_runtime, tags, ref_source, ref_version)
    self.ruuuby_gems << RuuubyGem.spawn(gem_name, gem_version, for_development, for_runtime, tags, ref_source, ref_version,self)
  end

  def add_comments(comments)
    if comments.ary?
      comments.each do |c|
        self.comments << c
      end
    else
      self.comments << comments
    end
  end

  def remove_file(path, notes='')
    path = path.to_s.empty? ? '' : "`#{path.to_s}`"
    self.files_removed << [path, notes]
  end

  def add_file(path, reference='', notes='', features='')
    path      = path.to_s.empty? ? '' : "`#{path.to_s}`"
    reference = reference.to_s.empty? ? '' : "`#{reference.to_s}`"
    feats     = ''
    if features.ary?
      features.each do |f|
        feats += "`#{f.uid}`, "
      end
      feats = feats[0..feats.length-3]
    else
      feats = features.to_s.empty? ? '' : "`#{features.uid}`"
    end
    self.files_added << [path, reference, notes, feats]
  end

  def add_entry_to_changelog(feature, description)
    self.changelog << RuuubyChangelog.spawn(self, feature, description)
  end

  # @return [Array]
  def docs_changelog
    changes = []
    changes << "\n---\n\n# #{self.uid}\n"
    unless self.ruuuby_gems.empty?
      self.ruuuby_gems.all.each do |g|
        self.comments << "add `gem '#{g.name}', '~> #{g.version_current.to_s}'`"
      end
    end
    unless @comments.empty?
      @comments.each do |c|
        changes << " * #{c}"
      end
    end
    unless @files_added.empty?
      changes << "\n"
      changes << "| path added | reference | notes | feature(s) |\n"
      changes << "| ---: | --- | --- | --- |\n"
      @files_added.each do |c|
        c1 = c[1].empty? ? '' : "`#{c[1]}`"
        changes << "| #{c[0]} | #{c1} | #{c[2]} | #{c[3]} |\n"
      end
      changes << "\n"
    end
    unless @files_removed.empty?
      changes << "\n"
      changes << "| path removed | notes |\n"
      changes << "| ---: | --- |\n"
      @files_removed.each do |f|
        changes << "| #{f[0]} | #{f[1]} |\n"
      end
      changes << "\n"
    end
    changes += self.changelog.get_docs
    changes
  end

  # @param [RuuubyRelease] them
  #
  # @raise [ArgumentError] if them is not a +RuuubyRelease+
  #
  # @return [Integer] 1 for >, 0 for ==, -1 for <
  def <=>(them)
    if them.is_a?(::RuuubyRelease)
      if self.vmajor > them.vmajor
        return 1
      elsif self.vmajor < them.vmajor
        return -1
      else
        if self.vminor > them.vminor
          return 1
        elsif self.vminor < them.vminor
          return -1
        else
          if self.vtiny > them.vtiny
            return 1
          elsif self.vtiny < them.vtiny
            return -1
          else
            return 0
          end
        end
      end
    else
      nil
    end
  end

  # @return [RuuubyRelease]
  def self.get_version_prev; ::RuuubyRelease.where('released = ?', true).order('vmajor DESC').order('vminor DESC').order('vtiny DESC').limit(2)[1]; end

  # @return [RuuubyRelease]
  def self.get_version_curr; ::RuuubyRelease.where('released = ?', true).order('vmajor DESC').order('vminor DESC').order('vtiny DESC').limit(1).first; end

  # @return [RuuubyRelease]
  def self.get_version_next; ::RuuubyRelease.where('released = ?', false).order('vmajor DESC').order('vminor DESC').order('vtiny DESC').limit(1).first; end

  # @return [GitCommit]
  def spawn_git_commit(*args); ::GitCommit.spawn(*args, self); end

  # @param [String] version_str the version UID of the RuuubyRelease with or without the starting 'v'
  #
  # @raise [WrongParamType]
  #
  # @return [Array] new array with 3 elements for each corresponding version identifying component
  def self.parse_uid_str(version_str)
    🛑str❓(:version_str, version_str)
    version_str = version_str[1..version_str.length-1] if version_str.start_with?('v')
    version_str = version_str.♻️⟵(' ') if version_str.∋?(' ')
    version_str.split('.').η̂!(:∈𝕎𝕊)
  end

  def self.generate_query_uid(*args)
    🛑 ArgumentError.new("| c{RuuubyRelease}-> m{generate_query_uid} received no args |") if args.∅?
    if args.length == 1 && args[0].str? && args[0].match?(::RuuubyRelease.syntax_uid)
      return RuuubyRelease.generate_query_uid(*(self.parse_uid_str(args[0])))
    end
    🛑num❓($PRM_MANY, args, :∈𝕎𝕊)
    ::RuuubyRelease.where(::RuuubyRelease::Syntax::SQL_UID, args[0].to_i, args[1].to_i, args[2].to_i)
  end

  # @return [GitCommit]
  def get_commit_newest
    🛑 RuntimeError.new("| c{RuuubyRelease}-> m{get_commit_newest} can't run w/ no git_commits |") if self.git_commits.empty?
    self.git_commits.order('commit_author_date DESC').limit(1).first
  end

  # @return [GitCommit]
  def get_commit_oldest
    🛑 RuntimeError.new("| c{RuuubyRelease}-> m{get_commit_oldest} can't run w/ no git_commits |") if self.git_commits.empty?
    self.git_commits.order('commit_author_date ASC').limit(1).first
  end

  # @return [Boolean]
  def has_release_tag?
    num_matches = 0
    self.git_commits.all.each do |gc|
      if gc.has_release_tag?
        @the_release_tag = gc
        num_matches += 1
      end
    end
    if num_matches > 1
      🛑 RuntimeError.new("| c{RuuubyRelease}-> m{has_release_tag?} self{#{self.to_s}} has{#{num_matches.to_s}} commits w/ release tags |") if self.git_commits.empty?
    elsif num_matches == 1
      return true
    else
      return false
    end
  end

  def get_release_commit
    if self.has_release_tag?
      return @the_release_tag
    else
      raise '@the_release_tag not set'
    end
  end

  🙈

  def on_before_save
    self.num_commits    = self.git_commits.length
    self.num_gems_added = self.ruuuby_gems.length
    is_released         = self.released?
    if is_released == nil || !is_released
      if self.has_release_tag?
        self.released = true
      end
    end
  end

  # @param [Symbol] cache_key
  #
  # @raise [RuntimeError]
  #
  # @return [Array]
  def cache_calculate(cache_key)
    case(cache_key)
    when :uid
      return "v#{self.vmajor.to_s}.#{self.vminor.to_s}.#{self.vtiny.to_s}"
    when :uid_components
      return [self.vmajor, self.vminor, self.vtiny]
    else
      raise "c{RuuubyRelease}-> m{cache_calculate} did not recognize cache_key{#{cache_key.to_s}} of type{#{cache_key.Ⓣ}}"
    end
  end

end

# -------------------------------------------- ⚠️ --------------------------------------------
