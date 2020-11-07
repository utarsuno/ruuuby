# encoding: UTF-8

#class CreateRuuubyGem < ActiveRecord::Migration[6.0]
class CreateRuuubyGem < RuuubyDBMigration

  DB_FILE_NAME = '01_ruuuby_gem.sql'

  # @return [Boolean]
  def self.up_verify
    needed_funcs = %w(ruuuby_release_get_id ruuuby_feature_get_id ruuuby_feature_add ruuuby_release_add
ruuuby_feature_behavior_add ruuuby_gem_add ruuuby_gem_add_dev ruuuby_gem_add_prod ruuuby_gem_add_recommended
ruuuby_gem_update ruuuby_gem_remove ruuuby_gem_get_id ruuuby_gem_latest_changelog_id ruuuby_gem_current_version
ruuuby_release_gem_changelogs)

    needed_tables = %w(ruuuby_releases ruuuby_features ruuuby_feature_behaviors ruuuby_gems ruuuby_gem_changelogs)

    needed_funcs_found = !(needed_funcs.∀.any? {|elem| !self.∃⨍_sql?(elem)})

    needed_table_found = !(needed_tables.∀.any? {|elem| !self.∃table?(elem)})

    needed_funcs_found && needed_table_found
  end

  def self.up
    create_table :ruuuby_releases do |t|
      t.string :version, :null => false, :unique => true
      t.json :changelogs, :null => true, :unique => false
    end

    create_table :ruuuby_features do |t|
      t.string :uid, :null => false, :unique => true
      t.boolean :is_optional, :null => false, :unique => false
      t.string :desc_self, :null => false, :unique => true
    end

    create_table :ruuuby_feature_behaviors do |t|
      t.string :uid, :null => false, :unique => true
      t.string :desc_self, :null => false, :unique => true

      t.references :ruuuby_features, foreign_key: { references: :ruuuby_features }
    end

    create_table :ruuuby_gems do |t|
      t.string :name, :null => false, :unique => true
      t.text :url_gem, :null => true, :unique => true
      t.text :url_git, :null => true, :unique => true
      t.boolean :env_dev, :null => false, :unique => false
      t.boolean :env_prod, :null => false, :unique => false
      t.string :ref_source, :null => true, :unique => false
      t.string :ref_version, :null => true, :unique => false
      #t.timestamps
    end

    create_table :ruuuby_gem_changelogs do |t|
      t.string :version_current, :null => false, :unique => false
      t.boolean :is_version_latest, :null => false, :unique => false

      t.references :ruuuby_gem, foreign_key: { references: :ruuuby_gems }
      t.references :ruuuby_releases, foreign_key: { references: :ruuuby_releases }
    end

    execute(self.read_sql_rollout_file(DB_FILE_NAME))
    execute(self.read_sql_seed_file(DB_FILE_NAME))

    if $ruuuby.engine.stats_ext['RUUUBY_ENV'] == 'test'
      self.up_verify
    else
      puts 'env is not{test} skipping verification'
    end
  end

  def self.down
    drop_table :ruuuby_gem_changelogs
    drop_table :ruuuby_gems
    drop_table :ruuuby_releases
    drop_table :ruuuby_feature_behaviors
    drop_table :ruuuby_features

    execute(self.read_sql_rollback_file(DB_FILE_NAME))
  end

end

#ActiveRecord::Base.connection.execute(sql)

class ::RuuubyGem < ::ApplicationRecord

  # @param [String] gem_name
  def self.[](gem_name)
    🛑str❓('gem_name', gem_name)
    ::RuuubyGem.where('name = ?', [gem_name]).limit(1).first
  end

  # @return [Array]
  def version_updates; ::RuuubyGemChangelog.where('ruuuby_gem_id = ?', self.id).to_a; end

end

class ::RuuubyGemChangelog < ::ApplicationRecord

  # @param [String] gem_name
  def self.[](id)
    🛑str❓('id', id)
    ::RuuubyGemChangelog.where('id = ?', [id]).limit(1).first
  end

  def self.history(for_version)
    🛑str❓('for_version', for_version)
    ::RuuubyGemChangelog.where('version_ruuuby = ?', [for_version]).to_a
  end

end
