
# -------------------------------------------- ⚠️ --------------------------------------------

class RuuubyRelease < ApplicationRecord
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
        feats += "`#{f.feature_id}`, "
      end
      feats = feats[0..feats.length-3]
    else
      feats = features.to_s.empty? ? '' : "`#{features.feature_id}`"
    end
    self.files_added << [path, reference, notes, feats]
  end

  def add_entry_to_changelog(feature, description)
    self.changelog << RuuubyChangelog.spawn(self, feature, description)
  end

  # @return [Array]
  def docs_changelog
    changes = []
    changes << "\n---\n\n# #{self.version}\n"
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

  # @param [Integer] major
  # @param [Integer] minor
  # @param [Integer] tiny
  #
  # @return [RuuubyRelease]
  def self.by_version(major, minor, tiny)
    RuuubyRelease.where('vmajor = ? AND vminor = ? AND vtiny = ?', major, minor, tiny).first
  end

  # @return [String] vM.m.T (M: Major, m: minor, T: tiny)
  def version
    "v#{self.vmajor.to_s}.#{self.vminor.to_s}.#{self.vtiny.to_s}"
  end

  alias_method :uid, :version
end

# -------------------------------------------- ⚠️ --------------------------------------------
