# encoding: UTF-8

# -------------------------------------------- ⚠️ --------------------------------------------

# NOTE: eventually will utilize other gems & HTTP requests for retrieving information, ORM fields will potentially need to drastically adapt
class ::RuuubyGem < ::ApplicationRecord

  belongs_to :ruuuby_release, class_name: 'RuuubyRelease'

  # _________________________________________________________________________________________________________________
  #      ___ ___  __     __       ___  ___  __
  #  /\   |   |  |__) | |__) |  |  |  |__  /__`
  # /~~\  |   |  |  \ | |__) \__/  |  |___ .__/
  # ________________________________________________________________________________________________________________ */

  module EnumFlags
    # @type [Integer]
    CHANGELOG_TYPE_CREATED         = 0

    # @type [Integer]
    CHANGELOG_TYPE_VERSION_UPDATED = 1
  end

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
    ::RuuubyGem.where('name = ?', [gem_name]).limit(1).first
  end

  # @param [Boolean] is_dev
  # @param [Boolean] is_runtime
  #
  # @raise [ArgumentError] if either param provided was not of type `bool`
  #
  # @return [ActiveRecord::Relation]
  def self.fetch_by_type(is_dev, is_runtime)
    🛑bools❓([is_dev, is_runtime])
    flag_val = 0
    flag_val += 1 if is_dev
    flag_val += 2 if is_runtime
    ::RuuubyGem.where('flag_dependency_type = ?', flag_val).all
  end

  # @param [String]        gem_name
  # @param [String]        gem_version
  # @param [Integer]       flag_dependency_type
  # @param [Array]         tags
  # @param [String]        ref_source
  # @param [String]        ref_version
  # @param [RuuubyRelease] ruuuby_release
  #
  # @return [RuuubyGem]
  def self.spawn(gem_name, gem_version, flag_dependency_type, tags, ref_source, ref_version, ruuuby_release)
    the_ruuuby_gem = ::RuuubyGem.create!(
        name: gem_name,
        version_current: gem_version,
        flag_dependency_type: flag_dependency_type,
        tags: tags,
        ruuuby_release_id: ruuuby_release.id,
        ref_source: ref_source,
        ref_version: ref_version,
        url_gem: "https://rubygems.org/gems/#{gem_name}"
    )
    the_ruuuby_gem.save!
    the_ruuuby_gem
  end

  # @param [RuuubyRelease] ruuuby_release
  # @param [RuuubyFeature] ruuuby_feature
  # @param [String]        new_version
  #
  # @return [RuuubyChangelog]
  def spawn_version_update(ruuuby_release, ruuuby_feature, new_version)
    # "update gem{`#{self.name}`} from version{`#{self.version_current}`} to version{`#{new_version}`}"
    changelog                    = ::RuuubyChangelog.spawn(ruuuby_release, ruuuby_feature, '')
    changelog['applies_to']      = ::RuuubyGem.orm_Ⓣ_🐍
    changelog['applies_to_uid']  = self.name
    changelog['metadata_flag']    = ::RuuubyGem::EnumFlags::CHANGELOG_TYPE_VERSION_UPDATED
    changelog['changelog_index'] = self.current_max_changelog_index + 1
    changelog['value_previous']  = self.version_current.to_s
    changelog['value_applied']   = new_version
    changelog.save!
    self['version_current']      = new_version
    self.save!
    changelog
  end

  # @param [RuuubyRelease] ruuuby_release
  # @param [RuuubyFeature] ruuuby_feature
  # @param [String]        new_version
  #
  # @return [RuuubyChangelog]
  def spawn_version_initial(ruuuby_release, ruuuby_feature, new_version)
    # "add gem{`#{self.name}`} w/ version{`#{new_version}`}"
    changelog                    = ::RuuubyChangelog.spawn(ruuuby_release, ruuuby_feature, '')
    changelog['applies_to']      = ::RuuubyGem.orm_Ⓣ_🐍
    changelog['applies_to_uid']  = self.name
    changelog['metadata_flag']    = ::RuuubyGem::EnumFlags::CHANGELOG_TYPE_CREATED
    changelog['changelog_index'] = 0
    changelog['value_previous']  = 'N/A'
    changelog['value_applied']   = new_version
    changelog.save!
    self['version_current']      = new_version
    self.save!
    changelog
  end

  # @return [Integer]
  def current_max_changelog_index; ::RuuubyChangelog.where('applies_to = ? AND applies_to_uid = ?', ::RuuubyGem.orm_Ⓣ_🐍, self.name).maximum('changelog_index'); end

  # @return [Boolean]
  def is_runtime; (self.flag_dependency_type & 2) != 0; end

  # @return [Boolean]
  def is_development; (self.flag_dependency_type & 1) != 0; end

  # _________________________________________________________________________________________________________________
  #   __   __   ___  __       ___  __   __   __
  #  /  \ |__) |__  |__)  /\   |  /  \ |__) /__`
  #  \__/ |    |___ |  \ /~~\  |  \__/ |  \ .__/
  # ________________________________________________________________________________________________________________ */

  #  __   ___        __        ___     ___  __   __            __            ___          ___
  # |__) |__   |\/| /  \ \  / |__     |__  |__) /  \  |\/|    |__) |  | |\ |  |  |  |\/| |__
  # |  \ |___  |  | \__/  \/  |___    |    |  \ \__/  |  |    |  \ \__/ | \|  |  |  |  | |___
  #

  def all_version_updates
    ::RuuubyChangelog.where('applies_to = ? AND applies_to_uid = ?', ::RuuubyGem.orm_Ⓣ_🐍, self.name)
  end

  # @return [RuuubyChangelog]
  def last_version_update
    ::RuuubyChangelog.where('applies_to = ? AND applies_to_uid = ? AND changelog_index = ?', ::RuuubyGem.orm_Ⓣ_🐍, self.name, self.current_max_changelog_index).first
  end

  # @param  [RuuubyChangelog, NilClass] previous_version
  #
  # @return [String]
  def source_for_changelog(previous_version=nil)
    if previous_version.nil?
      version_previous = self.last_version_update
    end
    "| `#{self.name}` | `#{version_previous.value_previous}` | `#{version_previous.value_applied}` |\n"
  end

end

# -------------------------------------------- ⚠️ --------------------------------------------
