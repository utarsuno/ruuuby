# encoding: UTF-8

# -------------------------------------------- ⚠️ --------------------------------------------

class ::RuuubyRelease < ::ApplicationRecord

  module Remote

    # @return [Array] the UID components of the latest released version of Ruuuby
    def self.curr_uid; $git.release_tags[-1][0]; end

    # @return [Array] the UID components of the latest released version of Ruuuby
    def self.prev_uid; $git.release_tags[-2][0]; end

  end

  module Version

    def self.wip; self.curr.next; end

    # @return [RuuubyRelease]
    def self.curr; ::RuuubyRelease.where('released = ?', true).order('vmajor DESC').order('vminor DESC').order('vtiny DESC').limit(1).first; end

    # @return [RuuubyRelease]
    def self.prev; ::RuuubyRelease.where('released = ?', true).order('vmajor DESC').order('vminor DESC').order('vtiny DESC').limit(2)[1]; end

  end

  # _________________________________________________________________________________________________________________
  #      ___ ___  __     __       ___  ___  __
  #  /\   |   |  |__) | |__) |  |  |  |__  /__`
  # /~~\  |   |  |  \ | |__) \__/  |  |___ .__/
  # ________________________________________________________________________________________________________________ */

  # useful components for syntax parsing
  module Syntax

    # @type [String]
    UID     = '(v?)\d.\d.\d(\d?)( ((version)|(release)))?'

    # @type [String]
    SQL_UID = 'vmajor = ? AND vminor = ? AND vtiny = ?'

  end

  include ::Comparable
  include ::Ruuuby::ORMAttribute::Includable::UID

  # _________________________________________________________________________________________________________________
  #  __   __
  # /  \ |__)  |\/|
  # \__/ |  \  |  |
  # ________________________________________________________________________________________________________________ */

  validates :vmajor, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :vminor, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :vtiny, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  has_many :ruuuby_changelogs, class_name: 'RuuubyChangelog', :dependent => :delete_all

  before_save :on_before_save

  def self.spawn(major, minor, tiny, description=nil)
    release = ::RuuubyRelease.create!(vmajor: major, vminor: minor, vtiny: tiny, description: description)
    release
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

  def add_comments(comments)
    if comments.ary?
      comments.each do |c|
        self.comments << c
      end
    else
      self.comments << comments
    end
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

  # @return [RuuubyRelease, Boolean, NilClass]
  def prev
    if @prev == nil
      @prev = ::RuuubyRelease.where('id < ?', [self.id]).order('id DESC').limit(1).first
      if @prev == nil
        @prev = false
      end
    end
    @prev
  end

  # @param [RuuubyRelease] ruuuby_release
  #
  # @raise [ArgumentError, RuntimeError]
  def prev=(ruuuby_release)
    if @prev == nil
      🛑 ::ArgumentError.new("| c{RuuubyRelease}-> m{prev=} provided obj of type{#{ruuuby_release.Ⓣ}}, not the required type{RuuubyRelease} |")
      @prev = ruuuby_release
      unless @prev.next?
        @prev.next = self
      end
    else
      🛑 ::RuntimeError.new("| c{RuuubyRelease}-> m{prev=} tried setting ref to previous version as{#{ruuuby_release.uid}} for self{#{self.uid}} when previous is already marked as{#{self.prev.uid}} |")
    end
  end

  # @return [Boolean]
  def next?; self.next.class == ::RuuubyRelease; end

  # @return [Boolean]
  def prev?; self.next.class == ::RuuubyRelease; end

  # @return [RuuubyRelease, Boolean, NilClass]
  def next
    if @next == nil
      @next = ::RuuubyRelease.offset(self.id).limit(1).first
      if @next == nil
        @next = false
      end
    end
    @next
  end


  # @param [RuuubyRelease] ruuuby_release
  #
  # @raise [ArgumentError, RuntimeError]
  def next=(ruuuby_release)
    if @next == nil
      🛑 ::ArgumentError.new("| c{RuuubyRelease}-> m{next=} provided obj of type{#{ruuuby_release.Ⓣ}}, not the required type{RuuubyRelease} |")
      @next = ruuuby_release
      unless @next.prev?
        @next.prev = self
      end
    else
      🛑 ::RuntimeError.new("| c{RuuubyRelease}-> m{next=} tried setting ref to next version as{#{ruuuby_release.uid}} for self{#{self.uid}} when next is already marked as{#{self.prev.uid}} |")
    end
  end


  def latest_release?
    self.released?
  end

  # @return [Integer]
  def self.num_released; self.num_where(*['released = ?', true]); end

  # @param [String] version_str the version UID of the RuuubyRelease with or without the starting 'v'
  #
  # @raise [ArgumentError]
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

  # @return [Boolean]
  def ∃release_tag?; !!($git.∃tag_for_version?(self.uid_components)); end

  def release_tag; $git.find_release_tag(self.uid_components); end

  def release_commit; $git.find_release_commit(self.uid_components); end

  # @return [Array]
  def comments; @comments ||= []; end

  # @return [Array]
  def paths_added; @paths_added ||= []; end

  🙈

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
