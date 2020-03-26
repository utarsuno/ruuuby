
# -------------------------------------------- ⚠️ --------------------------------------------

class RuuubyRelease < ApplicationRecord
  include ::ApplicationRecord::ORMAttributeUID
  include ::ApplicationRecord::ORMAttributeCache

  validates :vmajor, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :vminor, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :vtiny, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  # useful components for building `Regular Expressions`
  module Syntax

    # @type [String]
    VERSION  = 'v\d.\d.\d(\d?)'.❄️

    # @type [String]
    FIND_UID = 'vmajor = ? AND vminor = ? AND vtiny = ?'.❄️

    ❄️
  end

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

  def gems_added
    @gems_added ||= []
  end

  def add_gem(gem_name, gem_version)
    self.gems_added << [gem_name, gem_version]
    self.comments << "add `gem '#{gem_name}', '~> #{gem_version}'`"
  end

  def comments
    @comments ||= []
  end

  def files_added
    @files_added ||= []
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

  def add_file(path, reference='', notes='', features='')

    path = path.to_s.empty? ? '' : "`#{path.to_s}`"

    reference = reference.to_s.empty? ? '' : "`#{reference.to_s}`"

    feats = ''
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
      changes << ""
      changes << "| added path | reference | notes | feature(s) |\n"
      changes << "| ---: | --- | --- | --- |\n"
      @files_added.each do |c|
        c1 = c[1].empty? ? '' : "`#{c[1]}`"
        changes << "| #{c[0]} | #{c1} | #{c[2]} | #{c[3]} |\n"
      end
      changes << "\n"
    end
    changes += self.changelog.get_docs
    changes
  end

  def self.generate_query_uid(*args)
    🛑 ArgumentError.new("| c{Class}-> m{generate_query_uid} received no args |") if args.∅?
    if args.length == 1 && args[0].str? && args[0].match?(RuuubyRelease.cache_fetch(RuuubyRelease::Syntax::VERSION))
      all_args = args[0][1..args[0].length-1]
      all_args = all_args.split('.')
      🛑ℤ❓(:'*all_args', all_args)
      return RuuubyRelease.generate_query_uid(*all_args)
    end
    🛑ℤ❓(:'*args', args)
    #RuuubyRelease.where('vmajor = ? AND vminor = ? AND vtiny = ?', args[0], args[1], args[2])
    RuuubyRelease.where(::RuuubyRelease::Syntax::FIND_UID, args[0], args[1], args[2])
  end

  🙈

  # @return [String] vM.m.T (M: Major, m: minor, T: tiny)
  def cache_calculate_uid
    "v#{self.vmajor.to_s}.#{self.vminor.to_s}.#{self.vtiny.to_s}"
  end

end

# -------------------------------------------- ⚠️ --------------------------------------------
