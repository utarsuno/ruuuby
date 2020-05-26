# coding: UTF-8

# -------------------------------------------- ⚠️ --------------------------------------------

# NOTE: eventually will utilize other gems & HTTP requests for retrieving information, ORM fields will potentially need to drastically adapt
class RuuubyGem < ApplicationRecord

  belongs_to :ruuuby_release, class_name: 'RuuubyRelease'

  # _________________________________________________________________________________________________________________
  #      ___ ___  __     __       ___  ___  __
  #  /\   |   |  |__) | |__) |  |  |  |__  /__`
  # /~~\  |   |  |  \ | |__) \__/  |  |___ .__/
  # ________________________________________________________________________________________________________________ */

  # _________________________________________________________________________________________________________________
  #  __   __
  # /  \ |__)  |\/|
  # \__/ |  \  |  |
  # ________________________________________________________________________________________________________________ */

  validates :name, presence: true
  validates :version_current, presence: true
  validates :url_gem, presence: true

  def self.find_by_name(gem_name)
    🛑str❓(:gem_name, gem_name)
    RuuubyGem.where('name = ?', [gem_name]).first
  end

  # @param [String]        gem_name
  # @param [String]        gem_version
  # @param [Boolean]       for_development
  # @param [Boolean]       for_runtime
  # @param [Array]         tags
  # @param [String]        ref_source
  # @param [String]        ref_version
  # @param [RuuubyRelease] ruuuby_release
  #
  # @return [RuuubyGem]
  def self.spawn(gem_name, gem_version, for_development, for_runtime, tags, ref_source, ref_version, ruuuby_release)
    ruuuby_gem = RuuubyGem.create!(
        name: gem_name,
        version_current: gem_version,
        is_development: for_development,
        is_runtime: for_runtime,
        tags: tags,
        ruuuby_release_id: ruuuby_release.id,
        ref_source: ref_source,
        ref_version: ref_version,
        url_gem: "https://rubygems.org/gems/#{gem_name}"
    )
    ruuuby_gem.save!
    ruuuby_gem
  end

  # _________________________________________________________________________________________________________________
  #   __   __   ___  __       ___  __   __   __
  #  /  \ |__) |__  |__)  /\   |  /  \ |__) /__`
  #  \__/ |    |___ |  \ /~~\  |  \__/ |  \ .__/
  # ________________________________________________________________________________________________________________ */


  #  __   ___        __        ___     ___  __   __            __            ___          ___
  # |__) |__   |\/| /  \ \  / |__     |__  |__) /  \  |\/|    |__) |  | |\ |  |  |  |\/| |__
  # |  \ |___  |  | \__/  \/  |___    |    |  \ \__/  |  |    |  \ \__/ | \|  |  |  |  | |___
  #

  def source_for_gemspec
    source = ''
    if self.name.∋?('-')
      name_as_source_sym = ":'#{self.name}'"
    else
      name_as_source_sym = ":#{self.name}"
    end
    if self.is_development
      source += "gem.add_development_dependency(#{name_as_source_sym}, '~> #{self.version_current}')\n"
    end
    if self.is_runtime
      source += "gem.add_runtime_dependency(#{name_as_source_sym}, '~> #{self.version_current}')\n"
    end
    source
  end

  def source_for_version_test
    initial_spacing = '      '
    source = ''
    if self.ref_source.str? && self.ref_version.str?
      full_ref = "#{self.ref_source}#{self.ref_version}"
      source += "#{initial_spacing}context 'for gem{#{self.name}}' do\n"
      source += "#{initial_spacing}  it 'has correct version{#{self.version_current}}' do\n"
      source += "#{initial_spacing}    expect(#{full_ref}).to eq('#{self.version_current}')\n"
      source += "#{initial_spacing}  end\n"
      source += "#{initial_spacing}end # end: {for gem{#{self.name}}}\n\n"
      source
    end
  end

  def source_for_readme
    gem_modes = ''
    if self.is_development && self.is_runtime
      gem_modes = "✅, ✅"
    elsif self.is_development
      gem_modes = "✅, ❌"
    elsif self.is_runtime
      gem_modes = "❌, ✅"
    end
    "| `#{self.name}` | [`#{self.version_current}`](#{self.url_gem}) | #{gem_modes} | `#{self.tags[2..self.tags.length-3]}` |\n"
  end

end

# -------------------------------------------- ⚠️ --------------------------------------------
