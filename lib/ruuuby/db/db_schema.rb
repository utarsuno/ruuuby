# encoding: UTF-8

=begin
ActiveRecord::Schema.define do

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

  create_table :ruuuby_releases, force: true do |t|

    # optional
    t.string :description, :null => true

    #t.string :comments, :null => true

    t.integer :vmajor, limit: 1, :null => false
    t.integer :vminor, limit: 1, :null => false
    t.integer :vtiny, limit: 1, :null => false

    t.integer :ruuuby_changelogs_count

    # 'cached calculations'
    t.integer :num_gems_added, :null => false, :default => 0
    t.integer :num_gems_updated, :null => false, :default => 0
    t.boolean :released, :null => false, :default => false

    t.index [:vmajor, :vminor, :vtiny], unique: true
  end

  create_table :ruuuby_features, force: true do |t|
    t.integer :id_num, :null => false
    t.string :description, :null => false, :unique => true

    t.integer :ruuuby_changelogs_count

    # | flag bitwise position | description        |
    # | -------------------- | ------------------ |
    # | 0                    | empty, to be added in future versions |
    # | 1                    | needs to be removed/merged            |
    # | 2                    | wip                                   |
    # | 4                    | stable                                |
    t.integer :flag_state, :null => false, :default => 0

    t.string :tags, :null => true

    t.index :id_num, unique: true
  end

  create_table :ruuuby_feature_behaviors, force: true do |t|
    t.integer :id_num, :null => false
    t.string :description, :null => false, :unique => true

    t.boolean :is_optional, :default => false, :null => false

    t.references :ruuuby_feature, index: true, foreign_key: { references: :ruuuby_features}
  end

  create_table :ruuuby_changelogs, force: true do |t|
    t.string  :description, :null => false, :unique => false

    t.string :applies_to, :null => true, :unique => false
    t.string :applies_to_uid, :null => true, :unique => false
    t.integer :metadata_flag, limit: 1, :null => true, :unique => false
    t.integer :changelog_index, :null => false, :unique => true, :default => 0

    t.string :value_previous, :null => true, :unique => false
    t.string :value_applied, :null => true, :unique => false

    t.references :ruuuby_release, index: true, foreign_key: { references: :ruuuby_releases }
    t.references :ruuuby_feature, index: true, foreign_key: { references: :ruuuby_features }
  end

end
=end
