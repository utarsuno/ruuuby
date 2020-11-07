# encoding: UTF-8

#class CreateRuuubyGem < ActiveRecord::Migration[6.0]
class CreateUtils < RuuubyDBMigration

  DB_FILE_NAME = '00_utils.sql'

  def self.up

    create_table :ruuuby_tags do |t|
      t.string :name, :null => false, :unique => true
    end

    create_table :ruuuby_resource_types do |t|
      t.string :name, :null => false, :unique => true
    end

    create_table :ruuuby_resources do |t|
      t.string :name, :null => false, :unique => true
      t.json :content, :null => false, :unique => false
      t.string :extra_str_data, :null => true, :unique => false
      t.json :meta_data, :null => true, :unique => false

      t.references :ruuuby_resource_types, foreign_key: { references: :ruuuby_resource_types }
    end

    create_table :ruuuby_resource_tags do |t|
      t.references :ruuuby_resources, foreign_key: { references: :ruuuby_resources }
      t.references :ruuuby_tags, foreign_key: { references: :ruuuby_tags }
    end

    execute(self.read_sql_rollout_file(DB_FILE_NAME))
    execute(self.read_sql_seed_file(DB_FILE_NAME))
  end

  def self.down
    drop_table :ruuuby_resource_tags
    drop_table :ruuuby_tags
    drop_table :ruuuby_resources
    drop_table :ruuuby_resource_types

    #ActiveRecord::StatementInvalid

    execute(self.read_sql_rollback_file(DB_FILE_NAME))
  end

end

#ActiveRecord::Base.connection.execute(sql)

class ::RuuubyResources < ::ApplicationRecord

  # @param [String] gem_name
  def self.[](name)
    🛑str❓('name', gem_name)
    ::RuuubyResources.where('name = ?', [gem_name]).limit(1).first
  end

end
