# encoding: UTF-8

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
  validates :num_gems_added, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  has_many :git_commits, class_name: 'GitCommit', :dependent => :delete_all
  has_many :ruuuby_gems, class_name: 'RuuubyGem', :dependent => :delete_all
  has_many :ruuuby_changelogs, class_name: 'RuuubyChangelog', :dependent => :delete_all

  before_save :on_before_save

  def self.spawn(major, minor, tiny, description=nil); ::RuuubyRelease.create!(vmajor: major, vminor: minor, vtiny: tiny, description: description); end

  def add_gem(gem_name, gem_version, for_development, for_runtime, tags, ref_source, ref_version)
    the_gem = ::RuuubyGem.spawn(gem_name, gem_version, for_development, for_runtime, tags, ref_source, ref_version,self)
    unless self.ruuuby_gems.include?(the_gem)
      self.ruuuby_gems << the_gem
    end
    self.save!
    ruuuby_changelog = the_gem.spawn_version_initial(self, ::RuuubyFeature.find_by_uid(15), gem_version)
    unless self.ruuuby_changelogs.include?(ruuuby_changelog)
      self.ruuuby_changelogs << ruuuby_changelog
    end
    self.save!
    the_gem
  end

  # @return [Array]
  def get_docs2
    the_docs = []
    the_docs << "\n---\n\n# `#{self.uid}`\n\n"

    unless self.comments.empty?
      self.comments.∀ do |comment|
        the_docs << " * #{comment}\n"
      end
      the_docs << "\n"
    end

    gem_changes = self._get_changelog_for_ruuuby_gems
    gem_changes.∀ do |gem_change|
      the_docs << gem_change
    end

    unless self.paths_added.empty?
      the_docs << "| path added | reference | notes | feature(s) |\n"
      the_docs << "| ----: | ---- | ---- | ---- |\n"
      self.paths_added.each do |c|
        c1 = c[1].empty? ? '' : "`#{c[1]}`"
        the_docs << "| #{c[0]} | #{c1} | #{c[2]} | #{c[3]} |\n"
      end
      the_docs << "\n"
    end

    unless self.paths_removed.empty?
      the_docs << "| path removed | notes |\n"
      the_docs << "| ----: | ---- |\n"
      self.paths_added.each do |c|
        c1 = c[1].empty? ? '' : "`#{c[1]}`"
        the_docs << "| #{c[0]} | #{c1} | #{c[2]} | #{c[3]} |\n"
      end
      the_docs << "\n"
    end

    the_docs << "| context | method(s) added | feature(s) |\n"
    the_docs << "| ---: | :--- | ---: |\n"
    self.ruuuby_changelogs.each do |ruuuby_changelog|
      if ruuuby_changelog.applies_to == ::RuuubyFeature.orm_Ⓣ_🐍
        the_docs << ruuuby_changelog.docs_changelog
      end
    end
    the_docs
  end

  # @param [RuuubyFeature] ruuuby_feature
  # @param [String]        method_name
  # @param [String]        kclass
  #
  # @return [RuuubyChangelog]
  def spawn_kclass_method(ruuuby_feature, method_name, kclass)
    ruuuby_changelog = ruuuby_feature.spawn_kclass_method(self, method_name, kclass)
    unless self.ruuuby_changelogs.include?(ruuuby_changelog)
      self.ruuuby_changelogs << ruuuby_changelog
      self.save!
    end
    ruuuby_changelog
  end

  # @param [RuuubyFeature] ruuuby_feature
  # @param [String]        kclass
  # @param [Array]         method_names
  #
  # @return [RuuubyChangelog]
  def spawn_kclass_methods(ruuuby_feature, kclass, method_names)
    method_names.∀ do |method_name|
      ruuuby_feature.spawn_kclass_method(self, method_name, kclass)
    end
  end

  # @param [RuuubyGem] ruuuby_gem
  # @param [String]    new_version
  #
  # @return [RuuubyChangelog]
  def update_gem(ruuuby_gem, new_version)
    ruuuby_changelog = ruuuby_gem.spawn_version_update(self, ::RuuubyFeature.find_by_uid(15), new_version)
    self.ruuuby_changelogs << ruuuby_changelog unless self.ruuuby_changelogs.include?(ruuuby_changelog)
    self.save!
    ruuuby_changelog
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

  # @param [String] path
  # @param [String] notes
  def path_removed(path, notes='')
    self.paths_removed << [path.∅? ? '' : "`#{path.to_s}`", notes]
  end

  # @param [String]                       path
  # @param [String]                       reference
  # @param [String]                       notes
  # @param [String, Array, RuuubyFeature] features
  def path_added(path, reference='', notes='', features='')
    path      = path.∅? ? '' : "`#{path}`"
    reference = reference.∅? ? '' : "#{reference}"
    feats     = ''
    if features.ary?
      features.each do |f|
        feats += "`#{f.uid}`, "
      end
      feats = feats[0..feats.length-3]
    else
      feats = features.to_s.∅? ? '' : "`#{features.uid}`"
    end
    self.paths_added << [path, reference, notes, feats]
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
          self.vtiny <=> them.vtiny
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

  # @return [Integer]
  def self.num_released; self.num_where(*['released = ?', true]); end

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
    🛑 ::ArgumentError.new("| c{RuuubyRelease}-> m{generate_query_uid} received no args |") if args.∅?
    if args.length == 1 && args[0].str? && args[0].match?(::RuuubyRelease.syntax_uid)
      return ::RuuubyRelease.generate_query_uid(*(self.parse_uid_str(args[0])))
    end
    🛑nums❓(args, :∈𝕎𝕊)
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

  # cached fields

  # @return [Array]
  def comments; @comments ||= []; end

  # @return [Array]
  def paths_added; @paths_added ||= []; end

  # @return [Array]
  def paths_removed; @paths_removed ||= []; end

  🙈

  def _get_changelog_for_ruuuby_gems
    content = []
    content << "| gem updated | version previous | version current |\n"
    content << "| ----: | :---: | :---- |\n"
    results = ::RuuubyChangelog.where('ruuuby_release_id = ? AND applies_to = ?', self.id, ::RuuubyGem.orm_Ⓣ_🐍)
    results.each do |gem_change|
      gem_name = gem_change.applies_to_uid
      the_gem  = ::RuuubyGem.find_by_name(gem_name)
      content << the_gem.source_for_changelog
    end
    content << "\n" unless content.∅?
    content
  end

  def on_before_save
    self.num_gems_added   = self.ruuuby_gems.length
    self.num_gems_updated = ::RuuubyChangelog.num_where('ruuuby_release_id = ? AND applies_to = ? AND metadata_flag = ?', self.id, ::RuuubyGem.orm_Ⓣ_🐍, ::RuuubyGem::EnumFlags::CHANGELOG_TYPE_VERSION_UPDATED)
    is_released           = self.released?
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
