# encoding: UTF-8

require_relative '../lib/ruuuby/ruuuby/ruuuby_orm'

💎.orm.ensure_loaded_schema
💎.orm.ensure_loaded_db_connection

ActiveRecord::Schema.define do

  create_table :ruuuby_dirs, force: true do |t|
    t.string :path_full, :null => false, unique: true
    t.string :name, :null => false, unique: false
    t.boolean :is_virtual, :default => false, :null => false
  end

  create_table :ruuuby_files, force: true do |t|
    t.string :path_full, :null => false, unique: true
    t.string :name, :null => false, unique: false
    t.string :extensions, :null => false, unique: false
    t.boolean :is_virtual, :default => false, :null => false

    t.references :ruuuby_dir, index: true, foreign_key: { references: :ruuuby_dirs }
  end

  create_table :ruuuby_releases, force: true do |t|
    t.integer :vmajor, limit: 1, :null => false
    t.integer :vminor, limit: 1, :null => false
    t.integer :vtiny, limit: 1, :null => false

    t.boolean :released, :default => false, :null => false

    t.index [:vmajor, :vminor, :vtiny], unique: true
  end

  create_table :ruuuby_features, force: true do |t|
    t.integer :id_num, :null => false
    t.string :description, :null => false

    t.index :id_num, unique: true
  end

  create_table :ruuuby_changelogs, force: true do |t|
    t.integer :ruuuby_version_id, :null => false
    t.integer :ruuuby_feature_id, :null => false
    t.string  :description, :null => false
  end

  create_table :git_commits, force: true do |t|
    # non-abbreviated
    t.string :commit_hash, unique: true, :null => false

    # non-relative
    t.string :commit_author_date, unique: true, :null => false

    # commit message
    t.string :commit_subject, :null => false

    #unique: false,

    # ideally unique should be set to{true} as commit messages would be more meaningful w/o duplicates
    #t.index :commit_subject, unique: false

    #t.index [:commit_subject, :commit_hash], unique: true

    t.references :ruuuby_release, index: true, foreign_key: { references: :ruuuby_releases }
  end

end
