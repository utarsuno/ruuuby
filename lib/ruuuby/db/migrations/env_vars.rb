# encoding: UTF-8

#class CreateRuuubyGem < ActiveRecord::Migration[6.0]
class CreateEnvVars < RuuubyDBMigration

  DB_FILE_NAME = '01_env_vars.sql'

  def self.up

    create_table :env_var_groups do |t|
      t.string :group_name, :null => false

      t.index :group_name, unique: true
    end

    create_table :env_var_tiers do |t|
      t.string :the_desc, :null => false

      t.boolean :tier_err_if_present, :null => false
      t.boolean :tier_optional, :null => false
      t.boolean :tier_ignore, :null => false
      t.boolean :tier_err_if_missing, :null => false

      t.index :the_desc, unique: true
    end

    create_table :env_vars do |t|
      t.string :the_key, :null => false
      t.string :the_desc, :null => false

      t.index :the_key, unique: true
      t.index :the_desc, unique: true

      t.references :env_var_groups, foreign_key: { references: :env_var_groups }
    end

    create_table :env_var_sets do |t|
      t.string :the_val, :null => false

      t.references :env_var_tiers, foreign_key: { references: :env_var_tiers }
      t.references :env_vars, foreign_key: { references: :env_vars }

      t.index :env_vars_id, unique: true
    end

    execute(self.read_sql_rollout_file(DB_FILE_NAME))
    execute(self.read_sql_seed_file(DB_FILE_NAME))
  end

  def self.down
    ♻️index(:env_vars, :the_key)
    ♻️index(:env_vars, :the_desc)

    ♻️index(:env_var_sets, :env_vars_id)

    ♻️index(:env_var_groups, :group_name)

    ♻️index(:env_var_tiers, :the_desc)

    ♻️table(:env_var_sets)
    ♻️table(:env_vars)
    ♻️table(:env_var_tiers)
    ♻️table(:env_var_groups)

    execute(self.read_sql_rollback_file(DB_FILE_NAME))
  end

end

class ::EnvVars < ::ApplicationRecord

end

class ::EnvVarTiers < ::ApplicationRecord

end

class ::EnvVarGroups < ::ApplicationRecord

end

class ::EnvVarSets < ::ApplicationRecord

end
