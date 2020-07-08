# encoding: UTF-8

# -------------------------------------------- ⚠️ --------------------------------------------

class ::RuuubyFeature < ::ApplicationRecord

  has_many :ruuuby_feature_behaviors, class_name: 'RuuubyFeatureBehavior'
  has_many :ruuuby_changelogs, class_name: 'RuuubyChangelog'

  module EnumFlagState
    # @type [Integer]
    STATE_NULL        = 0
    # @type [Integer]
    STATE_NEEDS_MERGE = 1
    # @type [Integer]
    STATE_WIP         = 2
    # @type [Integer]
    STATE_STABLE      = 4
  end

  module EnumFlags
    # @type [Integer]
    CHANGELOG_TYPE_KCLASS_METHOD_ADDED = 0
  end

  # @return [Integer]
  def self.num_stable; num_where(*['flag_state = ?', EnumFlagState::STATE_STABLE]); end

  # @return [Integer]
  def self.num_wip; num_where(*['flag_state = ?', EnumFlagState::STATE_WIP]); end

  # @return [Integer]
  def self.num_todo; num_where(*['flag_state = ?', EnumFlagState::STATE_NULL]); end

  # @return [Integer]
  def self.num_needing_merge; num_where(*['flag_state = ?', EnumFlagState::STATE_NEEDS_MERGE]); end

  # _________________________________________________________________________________________________________________
  #      ___ ___  __     __       ___  ___  __
  #  /\   |   |  |__) | |__) |  |  |  |__  /__`
  # /~~\  |   |  |  \ | |__) \__/  |  |___ .__/
  # ________________________________________________________________________________________________________________ */

  # useful components for building `Regular Expressions`
  module Syntax
    # @type [String]
    UID                  = '(f?)\d\d'.❄️
    # @type [String]
    SQL_UID              = 'id_num = ?'.❄️
    # @type [String]
    DOCS_FEATURE_MAPPING = '| f\d\d | (.*)? |'.❄️
    ❄️
  end

  include ::Ruuuby::ORMAttribute::Includable::UID

  # _________________________________________________________________________________________________________________
  #  __   __
  # /  \ |__)  |\/|
  # \__/ |  \  |  |
  # ________________________________________________________________________________________________________________ */

  validates :description, presence: true
  validates :id_num, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def self.spawn(id_num, description, flag_state=::RuuubyFeature::EnumFlagState::STATE_NULL, feature_tags=[])
    if flag_state.nil?
      ::RuuubyFeature.create!(id_num: id_num, description: description, tags: feature_tags.to_s)
    else
      ::RuuubyFeature.create!(id_num: id_num, description: description, flag_state: flag_state, tags: feature_tags.to_s)
    end
  end

  # @param [RuuubyRelease] ruuuby_release
  # @param [String]        method_name
  # @param [String]        kclass
  #
  # @return [RuuubyChangelog]
  def spawn_kclass_method(ruuuby_release, method_name, kclass)
    changelog                   = ::RuuubyChangelog.spawn(ruuuby_release, self, "+m{#{method_name}}->c{#{kclass}}")
    changelog['applies_to']     = ::RuuubyFeature.orm_Ⓣ_🐍
    changelog['metadata_flag']   = ::RuuubyFeature::EnumFlags::CHANGELOG_TYPE_KCLASS_METHOD_ADDED
    changelog['value_previous'] = method_name
    changelog['value_applied']  = kclass
    changelog.save!
    self.save!
    ruuuby_release.save!
    changelog
  end

  # @param [RuuubyRelease] ruuuby_release
  # @param [String]        kclass
  # @param [Array]         method_names
  #
  # @return [RuuubyChangelog]
  def spawn_kclass_methods(ruuuby_release, kclass, method_names)
    method_names.∀ do |method_name|
      self.spawn_kclass_method(ruuuby_release, method_name, kclass)
    end
  end

  # @param [Array] ary_of_strings
  def spawn_behaviors(ary_of_strings)
    ary_of_strings.∀ₓᵢ do |x, i|
      ::RuuubyFeatureBehavior.spawn(i, x, self)
    end
  end

  def ∋?(behavior)
    unless behavior.is_a?(::RuuubyFeatureBehavior)
      raise "provided behavior{#{behavior.to_s}} is not a feature-behavior"
    end
    self.ruuuby_feature_behaviors.where('id = ?', behavior.id).first == behavior
  end

  # _________________________________________________________________________________________________________________
  #   __   __   ___  __       ___  __   __   __
  #  /  \ |__) |__  |__)  /\   |  /  \ |__) /__`
  #  \__/ |    |___ |  \ /~~\  |  \__/ |  \ .__/
  # ________________________________________________________________________________________________________________ */

  # @param [String] raw_uid the version UID of the RuuubyRelease with or without the starting 'v'
  #
  # @raise [WrongParamType]
  #
  # @return [Array] new array with one element ∈ ℕ
  def self.parse_uid_str(raw_uid)
    🛑str❓(:raw_uid, raw_uid)
    raw_uid = raw_uid[1..raw_uid.length-1] if raw_uid.start_with?('f')
    [raw_uid].η̂!(:∈𝕎𝕊)
  end

  def self.generate_query_uid(*args)
    🛑 ::ArgumentError.new("| c{RuuubyFeature}-> m{generate_query_uid} received no args |") if args.∅?
    if args.length == 1 && args[0].str? && args[0].match?(::RuuubyFeature.syntax_uid)
      return ::RuuubyFeature.generate_query_uid(*(self.parse_uid_str(args[0])))
    end
    🛑nums❓(args, :∈𝕎𝕊)
    ::RuuubyFeature.where(::RuuubyFeature::Syntax::SQL_UID, args[0].to_i)
  end

  🙈

  def cache_calculate(cache_key)
    case(cache_key)
    when :uid
      if self.id_num < 10
        return "f0#{self.id_num.to_s}"
      else
        return "f#{self.id_num.to_s}"
      end
    when :uid_components
      return [self.id_num]
    else
      raise "c{RuuubyFeature}-> m{cache_calculate} did not recognize cache_key{#{cache_key.to_s}} of type{#{cache_key.Ⓣ}}"
    end
  end

end

# -------------------------------------------- ⚠️ --------------------------------------------
