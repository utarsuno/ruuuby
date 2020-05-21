# coding: UTF-8

# -------------------------------------------- ⚠️ --------------------------------------------

class RuuubyFeatureBehavior < ApplicationRecord

  belongs_to :ruuuby_feature, class_name: 'RuuubyFeature'

  # _________________________________________________________________________________________________________________
  #      ___ ___  __     __       ___  ___  __
  #  /\   |   |  |__) | |__) |  |  |  |__  /__`
  # /~~\  |   |  |  \ | |__) \__/  |  |___ .__/
  # ________________________________________________________________________________________________________________ */

  # useful components for building `Regular Expressions`
  module Syntax
    # @type [String]
    UID     = '(b?)\d\d'.❄️
    # @type [String]
    SQL_UID = 'id_num = ?'.❄️
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

  # @return [RuuubyFeatureBehavior]
  def self.spawn(id_num, description, feature)
    feature_behavior = RuuubyFeatureBehavior.create!(id_num: id_num, description: description)
    feature_behavior.save!
    feature.ruuuby_feature_behaviors << feature_behavior
    feature.save!
    feature_behavior
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
    raw_uid = raw_uid[1..raw_uid.length-1] if raw_uid.start_with?('b')
    [raw_uid].η̂!(:∈𝕎)
  end

  def self.generate_query_uid(*args)
    🛑 ArgumentError.new("| c{RuuubyFeatureBehavior}-> m{generate_query_uid} received no args |") if args.∅?
    if args.length == 1 && args[0].str? && args[0].match?(::RuuubyFeatureBehavior.syntax_uid)
      return RuuubyFeatureBehavior.generate_query_uid(*(self.parse_uid_str(args[0])))
    end
    🛑num❓($PRM_MANY, args, :∈𝕎𝕊)
    RuuubyFeatureBehavior.where(::RuuubyFeatureBehavior::Syntax::SQL_UID, args[0].to_i)
  end

  🙈

  def cache_calculate(cache_key)
    case(cache_key)
    when :uid
      if self.id_num < 10
        return "b0#{self.id_num.to_s}"
      else
        return "b#{self.id_num.to_s}"
      end
    when :uid_components
      return [self.id_num]
    else
      raise "c{RuuubyFeatureBehavior}-> m{cache_calculate} did not recognize cache_key{#{cache_key.to_s}} of type{#{cache_key.class.to_s}}"
    end
  end

end

# -------------------------------------------- ⚠️ --------------------------------------------
