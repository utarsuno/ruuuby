# encoding: UTF-8

# -------------------------------------------- ⚠️ --------------------------------------------

class RuuubyChangelog < ApplicationRecord

  belongs_to :ruuuby_release, class_name: 'RuuubyRelease', counter_cache: true
  belongs_to :ruuuby_release, class_name: 'RuuubyFeature', counter_cache: true

  # @param [RuuubyRelease] ruuuby_release
  # @param [RuuubyFeature] ruuuby_feature
  #
  # @return [RuuubyChangelog]
  def self.spawn(ruuuby_release, ruuuby_feature, description)
    changelog = ::RuuubyChangelog.create!(description: description)
    changelog.save!
    unless ruuuby_release.ruuuby_changelogs.include?(self)
      ruuuby_release.ruuuby_changelogs << changelog
      ruuuby_release.save!
    end
    unless ruuuby_feature.ruuuby_changelogs.include?(self)
      ruuuby_feature.ruuuby_changelogs << changelog
      ruuuby_feature.save!
    end
    changelog
  end

  def docs_changelog
    if self.description.start_with?('+m')
      text      = self.description[3..self.description.length-1]
      func_name = text[0..text.index('}')-1]
      text      = text[func_name.length+1..text.length-1]
      if text.length > 0
        class_name     = text[4..-2]
        ruuuby_feature = RuuubyFeature.find_by_uid(self.ruuuby_feature_id)
        return "| `#{class_name}` | `#{func_name}` | `#{ruuuby_feature.uid}` |"
      end
      raise RuntimeError.new("RuuubyChangelog#docs_changelog, description{#{self.description}}")
    else
      raise RuntimeError.new("RuuubyChangelog#docs_changelog, description{#{self.description}}")
    end
  end

end

# -------------------------------------------- ⚠️ --------------------------------------------
