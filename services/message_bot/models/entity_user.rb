# encoding: UTF-8

class CreateEntityUser < RuuubyDBMigration

  def self.up
    create_table :entity_users do |t|
      t.string :name,      :null => false
      t.json   :meta_data, :null => true
    end

    add_index :entity_users, :name, unique: true
  end

  def self.down
    ♻️index(:entity_users, :name)
    ♻️table!(:entity_users)
  end
end

class EntityUser < ApplicationRecord

end
