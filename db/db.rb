
require 'sqlite3'
require 'active_record'
require_relative '../app/models/db_schema'
require_relative '../lib/ruuuby/module/attribute/extendable/attribute_syntax_cache'
require_relative '../app/models/application_record'
require_relative '../app/models/ruuuby_release'
require_relative '../app/models/ruuuby_feature'
require_relative '../app/models/ruuuby_changelog'

ActiveRecord::Base.establish_connection(
    adapter: 'sqlite3',
    database: ':memory:'
)

# ⚠️: JUST STARTING POINT, tons of TODOs here
ActiveRecord::Schema.define do
  create_table :ruuuby_releases, force: true do |t|
    t.integer :vmajor, limit: 1
    t.integer :vminor, limit: 1
    t.integer :vtiny, limit: 1

    t.index [:vmajor, :vminor, :vtiny], unique: true
  end
  create_table :ruuuby_features, force: true do |t|
    t.integer :id_num
    t.string :description

    t.index :id_num, unique: true
  end
  create_table :ruuuby_changelogs, force: true do |t|
    t.integer :ruuuby_version_id
    t.integer :ruuuby_feature_id
    t.string :description
  end

end
