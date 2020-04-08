
require 'sqlite3'
require 'active_record'
require_relative '../lib/ruuuby/module/attribute/extendable/syntax_cache'
require_relative '../app/models/application_record'
require_relative '../app/models/ruuuby_release'
require_relative '../app/models/ruuuby_feature'
require_relative '../app/models/ruuuby_changelog'
require_relative '../app/models/git_commit'

ActiveRecord::Base.establish_connection(
    adapter: 'sqlite3',
    database: ':memory:'
)

# ⚠️: JUST STARTING POINT, tons of TODOs here
ActiveRecord::Schema.define do

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
    t.string :description, :null => false
  end

  create_table :git_commits, force: true do |t|
    # non-abbreviated
    t.string :commit_hash, :null => false

    # non-relative
    t.string :commit_author_date, :null => false

    # commit message
    t.string :commit_subject, :null => false

    t.references :ruuuby_release, index: true, foreign_key: { references: :ruuuby_releases }
  end

end
