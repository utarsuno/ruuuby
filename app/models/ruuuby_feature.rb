
# -------------------------------------------- ⚠️ --------------------------------------------

class RuuubyFeature < ApplicationRecord

  # useful components for building `Regular Expressions`
  module Syntax

    # @type [String]
    UID                  = 'f\d\d'.❄️

    # @type [String]
    DOCS_FEATURE_MAPPING = '| f\d\d | (.*)? |'.❄️

    ❄️
  end


  include ::ApplicationRecord::ORMAttributeUID
  include ::ApplicationRecord::ORMAttributeCache

  validates :description, presence: true
  validates :id_num, presence: true

  class FeatureAudit
    attr_reader :description, :passed
    def initialize(description, audit_func)
      @passed      = nil
      @description = description
      @audit_func  = audit_func
    end
  end

  def self.spawn(id_num, description)
    RuuubyFeature.create!(id_num: id_num, description: description)
  end

  def self.by_id_num(id_num)
    RuuubyFeature.where('id_num = ?', id_num).first
  end

  def audits
    @audits ||= []
  end

  # @return [String]
  def docs_feature_mapping
    "| #{self.uid} | #{self.description} |"
  end

  🙈

  # @return [String] fNN (let N >= 0)
  def cache_calculate_uid
    return "f0#{self.id_num.to_s}" if self.id_num < 10
    "f#{self.id_num.to_s}"
  end

end

# -------------------------------------------- ⚠️ --------------------------------------------
