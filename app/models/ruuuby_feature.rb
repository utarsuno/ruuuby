
# -------------------------------------------- ⚠️ --------------------------------------------

class RuuubyFeature < ApplicationRecord

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

  include ::ApplicationRecord::ORMAttributeUID
  include ::Ruuuby::Attribute::Includable::SyntaxCache

  validates :description, presence: true
  validates :id_num, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def self.spawn(id_num, description)
    RuuubyFeature.create!(id_num: id_num, description: description)
  end

  def audits ; @audits ||= [] ; end

  # @return [String]
  def docs_feature_mapping
    "| #{self.uid} | #{self.description} |"
  end

  # @param [String] raw_uid the version UID of the RuuubyRelease with or without the starting 'v'
  #
  # @raise [WrongParamType]
  #
  # @return [Array] new array with one element ∈ ℕ
  def self.parse_uid_str(raw_uid)
    🛑str❓(:raw_uid, raw_uid)
    raw_uid = raw_uid[1..raw_uid.length-1] if raw_uid.start_with?('f')
    [raw_uid].η̂!(:ℕ)
  end

  def self.generate_query_uid(*args)
    🛑 ArgumentError.new("| c{Class}-> m{generate_query_uid} received no args |") if args.∅?
    if args.length == 1 && args[0].str? && args[0].match?(::RuuubyFeature.cache_fetch(::RuuubyFeature::Syntax::UID))
      return RuuubyFeature.generate_query_uid(*(self.parse_uid_str(args[0])))
    end
    🛑ℤ❓($PRM_MANY, args)
    RuuubyFeature.where(::RuuubyFeature::Syntax::SQL_UID, args[0].to_i)
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
      raise "c{RuuubyFeature}-> m{cache_calculate} did not recognize cache_key{#{cache_key.to_s}} of type{#{cache_key.class.to_s}}"
    end
  end

end

# -------------------------------------------- ⚠️ --------------------------------------------
