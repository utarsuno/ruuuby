
# -------------------------------------------- ⚠️ --------------------------------------------

class RuuubyChangelog < ApplicationRecord

  # @return [RuuubyChangelog]
  def self.spawn(ruuuby_version_id, ruuuby_feature_id, description)
    version_id = ruuuby_version_id.int? ? ruuuby_version_id : ruuuby_version_id.id
    feature_id = ruuuby_feature_id.int? ? ruuuby_feature_id : ruuuby_feature_id.id
    RuuubyChangelog.create!(ruuuby_version_id: version_id, ruuuby_feature_id: feature_id, description: description)
  end

  def docs_changelog
    if self.description.start_with?('+m')
      text = self.description[3..self.description.length-1]
      func_name = text[0..text.index('}')-1]
      text = text[func_name.length+1..text.length-1]
      if text.length > 0
        class_name = text[4..-2]
        #puts "CLASS_NAME: {#{class_name}}"
        ruuuby_feature = RuuubyFeature.where('id = ?', self.ruuuby_feature_id).first
        return "| `#{class_name}` | `#{func_name}` | `#{ruuuby_feature.uid}` |"
      end
      raise RuntimeError.new("RuuubyChangelog#docs_changelog, description{#{self.description}}")
      #puts "text: {#{text}}"
      #puts "FUNC_NAME: {#{func_name}}"
      #func_name
    else
      raise RuntimeError.new("RuuubyChangelog#docs_changelog, description{#{self.description}}")
    end
  end

end

# -------------------------------------------- ⚠️ --------------------------------------------
