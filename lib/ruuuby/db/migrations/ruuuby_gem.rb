# encoding: UTF-8

#class CreateRuuubyGem < ActiveRecord::Migration[6.0]
class CreateRuuubyGem < RuuubyDBMigration

  DB_FILE_NAME = '00_ruuuby_gem.sql'

  # @return [Boolean]
  def self.up_verify
    needed_funcs = %w(ruuuby_release_id ruuuby_feature_id ruuuby_feature_add ruuuby_release_add
ruuuby_feature_behavior_add ruuuby_gem_add ruuuby_gem_add_dev ruuuby_gem_add_prod ruuuby_gem_add_recommended
ruuuby_gem_update ruuuby_gem_remove ruuuby_gem_id ruuuby_gem_latest_changelog_id ruuuby_gem_current_version
ruuuby_release_gem_changelogs)

    needed_tables = %w(ruuuby_releases ruuuby_features ruuuby_feature_behaviors ruuuby_gems ruuuby_gem_changelogs)

    needed_funcs_found = !(needed_funcs.∀.any? {|elem| !self.∃⨍_sql?(elem)})

    needed_table_found = !(needed_tables.∀.any? {|elem| !self.∃table?(elem)})

    needed_funcs_found && needed_table_found
  end

  def self.up
    create_table :ruuuby_releases do |t|
      t.string :version, :null => false
      t.json :changelogs, :null => true
      t.timestamp :dt_released, :null => true

      t.index :version, unique: true
    end
    add_index :ruuuby_releases, :version, unique: true

    create_table :ruuuby_features do |t|
      t.string :uid, :null => false, :unique => true
      t.boolean :is_optional, :null => false
      t.string :desc_self, :null => false, :unique => true
    end
    add_index :ruuuby_features, :uid, unique: true

    create_table :ruuuby_feature_behaviors do |t|
      t.string :uid, :null => false, :unique => true
      t.string :desc_self, :null => false, :unique => true
      # TODO: t.boolean :is_optional, :null => false
      t.references :ruuuby_features, foreign_key: { references: :ruuuby_features }
    end
    add_index :ruuuby_feature_behaviors, :uid, unique: true

    # TODO: ruuuby_feature_groups
    # TODO: ruuuby_feature_behaviors_ptrs

    create_table :ruuuby_gems do |t|
      t.string :name, :null => false, :unique => true
      t.text :url_gem, :null => true, :unique => true
      t.text :url_git, :null => true, :unique => true
      t.boolean :env_dev, :null => false
      t.boolean :env_prod, :null => false
      t.string :ref_source, :null => true
      t.string :ref_version, :null => true
      #t.timestamps
    end

    create_table :ruuuby_gem_changelogs do |t|
      t.string :version_current, :null => false
      t.boolean :is_version_latest, :null => false

      t.references :ruuuby_gem, foreign_key: { references: :ruuuby_gems }
      t.references :ruuuby_releases, foreign_key: { references: :ruuuby_releases }
    end

    execute(self.read_sql_rollout_file(DB_FILE_NAME))
    execute(self.read_sql_seed_file(DB_FILE_NAME))

    #if $ruuuby.engine.stats_ext['RUUUBY_ENV'] == 'test'
    #  self.up_verify
    #else
    #  puts 'env is not{test} skipping verification'
    #end
  end

  def self.down
    ♻️index(:ruuuby_releases, :version)
    ♻️index(:ruuuby_features, :uid)
    ♻️index(:ruuuby_feature_behaviors, :uid)

    ♻️table!(:ruuuby_gem_changelogs)
    ♻️table!(:ruuuby_gems)
    ♻️table!(:ruuuby_releases)
    ♻️table!(:ruuuby_feature_behaviors)
    ♻️table!(:ruuuby_features)

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
