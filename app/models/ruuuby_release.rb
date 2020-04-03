
# -------------------------------------------- ⚠️ --------------------------------------------

class RuuubyRelease < ApplicationRecord

  # useful components for syntax parsing
  module Syntax

    # @type [String]
    UID     = '(v?)\d.\d.\d(\d?)'.❄️

    # @type [String]
    SQL_UID = 'vmajor = ? AND vminor = ? AND vtiny = ?'.❄️

    ❄️
  end

  include ::ApplicationRecord::ORMAttributeUID
  include ::ApplicationRecord::ORMAttributeCache

  validates :vmajor, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :vminor, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :vtiny, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  #validates_uniqueness_of :vtiny, scope: [:vmajor, :vminor]

  #has_many :ruuuby_features, class_name: 'RuuubyFeature'
  #has_many :ruuuby_feature_deltas, class_name: 'RuuubyFeatureDelta'
  #has_and_belongs_to_many :ruuuby_feature_deltas, class_name: 'RuuubyFeatureDelta'

  #has_many :ruuuby_feature_deltas, class_name: 'RuuubyFeatureDelta', foreign_key: 'ruuuby_feature_delta_id'
  #has_many :ruuuby_features, through: :ruuuby_feature_deltas

  module AttributeChangelog

    class InternalRuuubyChangelog
      def initialize(orm_owner)
        @orm_owner = orm_owner
        @changelog = []
      end

      def add_entry(feature, description)
        @changelog << RuuubyChangelog.spawn(@orm_owner, feature, description)
      end

      def added_method_to_class(feature, method_name, class_name)
        self.add_entry(feature, "+m{#{method_name.to_s}}->c{#{class_name.to_s}}")
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

  include RuuubyRelease::AttributeChangelog

  def self.spawn(major, minor, tiny)
    RuuubyRelease.create!(vmajor: major, vminor: minor, vtiny: tiny)
  end

  def gems_added ; @gems_added ||= [] ; end
  def comments ; @comments ||= [] ; end
  def files_added ; @files_added ||= [] ; end
  def files_removed ; @files_removed ||= [] ; end

  def add_gem(gem_name, gem_version)
    self.gems_added << [gem_name, gem_version]
    self.comments << "add `gem '#{gem_name}', '~> #{gem_version}'`"
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

  def self.generate_query_uid(*args)
    🛑 ArgumentError.new("| c{Class}-> m{generate_query_uid} received no args |") if args.∅?
    if args.length == 1 && args[0].str? && args[0].match?(RuuubyRelease.cache_fetch(RuuubyRelease::Syntax::UID))
      return RuuubyRelease.generate_query_uid(*(self.parse_version_str(args[0])))
    end
    🛑ℤ❓($PRM_MANY, args)
    RuuubyRelease.where(::RuuubyRelease::Syntax::SQL_UID, args[0].to_i, args[1].to_i, args[2].to_i)
  end

  # @param [RuuubyRelease] ruuuby_release
  #
  # @raise [ArgumentError] raised if parameter provided of not of Class(`RuuubyRelease`)
  #
  # @return [Boolean] true, if version of self is less than the compared(`RuuubyRelease`)
  def <(ruuuby_release)
    🛑 ArgumentError.new("| c{RuuubyRelease}-> m{<} got arg(ruuuby_release) w/ type{#{ruuuby_release.class.to_s}} when a{RuuubyRelease} is required |") unless ruuuby_release.is_a?(RuuubyRelease)
    return true if self.vmajor < ruuuby_release.vmajor
    return true if self.vminor < ruuuby_release.vminor
    return true if self.vtiny  < ruuuby_release.vtiny
    false
  end

  # @param [RuuubyRelease] ruuuby_release
  #
  # @raise [ArgumentError] raised if parameter provided of not of Class(`RuuubyRelease`)
  #
  # @return [Boolean] true, if version of self is greater than the compared(`RuuubyRelease`)
  def >(ruuuby_release)
    🛑 ArgumentError.new("| c{RuuubyRelease}-> m{<} got arg(ruuuby_release) w/ type{#{ruuuby_release.class.to_s}} when a{RuuubyRelease} is required |") unless ruuuby_release.is_a?(RuuubyRelease)
    return true if self.vmajor > ruuuby_release.vmajor
    return true if self.vminor > ruuuby_release.vminor
    return true if self.vtiny  > ruuuby_release.vtiny
    false
  end

  # @return [String] the version UID of the next future release
  def self.get_next_version_uid
    latest_version = RuuubyRelease.where('released = ?', true).last
    "v#{latest_version.vmajor.to_s}.#{latest_version.vminor.to_s}.#{(latest_version.vtiny + 1).to_s}"
  end

  # @return [String] the version UID of the latest release
  def self.get_latest_version_uid
    RuuubyRelease.where('released = ?', true).last.uid
  end

  🙈

  # @param [String|Symbol] version_str the version UID of the RuuubyRelease with or without the starting 'v'
  #
  # @raise [WrongParamType]
  #
  # @return [Array] new array with 3 elements for each corresponding version identifying component
  def self.parse_version_str(version_str)
    🛑str❓(:version_str, version_str)
    version_str = version_str[1..version_str.length-1] if version_str.start_with?('v')
    args        = version_str.split('.')
    args.η̂!(:ℕ)
  end

  # @return [String] vM.m.T (M: Major, m: minor, T: tiny)
  def cache_calculate_uid
    "v#{self.vmajor.to_s}.#{self.vminor.to_s}.#{self.vtiny.to_s}"
  end

end

# -------------------------------------------- ⚠️ --------------------------------------------
