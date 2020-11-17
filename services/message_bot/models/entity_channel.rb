# encoding: UTF-8

class CreateEntityChannel < RuuubyDBMigration

  def self.up
    create_table :entity_channels do |t|
      t.string :name,      :null => false
      t.json   :meta_data, :null => true
    end

    add_index :entity_channels, :name, unique: true
  end

  def self.down
    ♻️index(:entity_channels, :name)
    ♻️table!(:entity_channels)
  end
end

class EntityChannel < ApplicationRecord

end
