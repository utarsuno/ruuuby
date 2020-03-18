
# -------------------------------------------- ⚠️ --------------------------------------------

class RuuubyFeature < ApplicationRecord
  #belongs_to :ruuuby_release, class_name: 'RuuubyRelease'
  #has_many :ruuuby_feature_deltas, class_name: 'RuuubyFeatureDelta'
  #has_and_belongs_to_many :ruuuby_feature_deltas, class_name: 'RuuubyFeatureDelta'

  #has_many :ruuuby_feature_deltas, class_name: 'RuuubyFeatureDelta', foreign_key: 'ruuuby_feature_delta_id'
  #has_many :ruuuby_releases, through: :ruuuby_feature_deltas

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
  def feature_id
    return "f0#{self.id_num.to_s}" if self.id_num < 10
    "f#{self.id_num.to_s}"
  end

  # @return [String]
  def docs_feature_mapping
    "| #{self.feature_id} | #{self.description} |"
  end

end

# -------------------------------------------- ⚠️ --------------------------------------------
