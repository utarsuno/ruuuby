# coding: UTF-8

require_relative '../lib/ruuuby/ruuuby/ruuuby_orm'

💎.orm.ensure_loaded_schema
💎.orm.ensure_loaded_db_connection

ActiveRecord::Schema.define do

  # --------------------------------------------------------------------------------------------------------------------
  #  ___                  __
  # |__  |\ | |  |  |\/| /__`
  # |___ | \| \__/  |  | .__/
  # --------------------------------------------------------------------------------------------------------------------

  #create_table :file_encoding, force: true do |t|
  #end

  # --------------------------------------------------------------------------------------------------------------------
  #  __  ___            __        __   __     ___       __        ___  __
  # /__`  |   /\  |\ | |  \  /\  |__) |  \     |   /\  |__) |    |__  /__`
  # .__/  |  /~~\ | \| |__/ /~~\ |  \ |__/     |  /~~\ |__) |___ |___ .__/
  #
  # --------------------------------------------------------------------------------------------------------------------

  create_table :ruuuby_dirs, force: true do |t|
    t.string :path_full, :null => false, unique: true
    t.string :name, :null => false, unique: false

    t.boolean :is_virtual #, :default => false, :null => false

    t.references :parent_dir  #, index: true, foreign_key: { references: :ruuuby_dirs,  }
  end

  create_table :ruuuby_files, force: true do |t|
    t.string :path_full, :null => false, unique: true
    t.string :name #, :null => true, unique: false
    t.string :extensions #, :null => true, unique: false
    t.boolean :is_virtual #, :null => false, :unique => false

    #t.integer :expected_encoding?, limit: 1, :null => false

    t.references :ruuuby_dir, index: true, foreign_key: { references: :ruuuby_dirs }
  end

  # NOTE: eventually will utilize other gems & HTTP requests for retrieving information, ORM fields will potentially need to drastically adapt
  create_table :ruuuby_gems, force: true do |t|
    t.string :name, :null => false, unique: true
    t.string :url_gem, :null => false, unique: true

    t.string :version_current, :null => false, unique: false
    t.string :version_latest, :null => true, unique: false

    t.boolean :is_development, :null => false, unique: false
    t.boolean :is_runtime, :null => false, unique: false

    t.string :ref_source, :null => true, unique: false
    t.string :ref_version, :null => true, unique: false

    t.string :tags, :null => true, unique: false

    t.references :ruuuby_release, index: true, foreign_key: { references: :ruuuby_releases }
  end

  create_table :ruuuby_releases, force: true do |t|

    # optional
    t.string :description, :null => true

    t.integer :vmajor, limit: 1, :null => false
    t.integer :vminor, limit: 1, :null => false
    t.integer :vtiny, limit: 1, :null => false

    # 'cached calculations'
    t.integer :num_commits, :null => false, :default => 0
    t.integer :num_gems_added, :null => false, :default => 0
    t.boolean :released, :default => false, :null => false

    t.index [:vmajor, :vminor, :vtiny], unique: true
  end

  create_table :ruuuby_features, force: true do |t|
    t.integer :id_num, :null => false
    t.string :description, :null => false

    t.index :id_num, unique: true
  end

  create_table :ruuuby_feature_behaviors, force: true do |t|
    t.integer :id_num, :null => false
    t.string :description, :null => false

    t.references :ruuuby_feature, index: true, foreign_key: { references: :ruuuby_features}
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
    t.datetime :commit_author_date, unique: true, :null => false

    # commit message
    t.string :commit_subject, :null => false

    # release_tag_name if this commit is the final commit in a release AND has a tag pointed at it
    t.string :release_tag, :null => true

    t.references :ruuuby_release, index: true, foreign_key: { references: :ruuuby_releases }
  end

end
