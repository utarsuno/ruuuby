# encoding: UTF-8

class RuuubyDBMigration < ActiveRecord::Migration[6.0]

  # @return [String]
  def self.read_sql_file(relative_ending); ::File.read("#{💎.engine.path_base}lib/ruuuby/db/migrations/#{relative_ending}"); end

  # @return [String]
  def self.read_sql_rollout_file(relative_ending); self.read_sql_file("rollout/#{relative_ending}"); end

  # @return [String]
  def self.read_sql_rollback_file(relative_ending); self.read_sql_file("rollback/#{relative_ending}"); end

  # @return [String]
  def self.read_sql_seed_file(relative_ending); self.read_sql_file("seed/#{relative_ending}"); end

end

#class CreateRuuubyGem < ActiveRecord::Migration[6.0]
class CreateRuuubyGem < RuuubyDBMigration

  DB_FILE_NAME = '00_ruuuby_gem.sql'

  def self.up
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

    # temp table
    create_table :ruuuby_gem_changelogs do |t|
      t.string :version_current
      t.string :version_ruuuby

      t.references :ruuuby_gem, foreign_key: { references: :ruuuby_gems }
    end

    execute(self.read_sql_rollout_file(DB_FILE_NAME))
    execute(self.read_sql_seed_file(DB_FILE_NAME))
  end

  def self.down
    drop_table :ruuuby_gem_changelogs
    drop_table :ruuuby_gems

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
