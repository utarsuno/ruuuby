# encoding: UTF-8

class RuuubyDBMigration < ActiveRecord::Migration[6.0]

  # @return [String] relative_ending
  def self.read_sql_file(relative_ending); ::File.read("#{💎.engine.path_base}lib/ruuuby/db/migrations/#{relative_ending}"); end

  # @return [String] relative_ending
  def self.read_sql_rollout_file(relative_ending); self.read_sql_file("rollout/#{relative_ending}"); end

  # @return [String] relative_ending
  def self.read_sql_rollback_file(relative_ending); self.read_sql_file("rollback/#{relative_ending}"); end

  # @return [String] relative_ending
  def self.read_sql_seed_file(relative_ending); self.read_sql_file("seed/#{relative_ending}"); end

  # @param  [String] func_name
  #
  # @return [Boolean]
  def self.∃⨍_sql?(func_name)
    begin
      res = execute("SELECT does_func_exist('#{func_name}')").values
      res = res[0][0]
      return res
    rescue ActiveRecord::StatementInvalid, PG::UndefinedFunction => e
      #throw e
      return false
    rescue StandardError => e
      throw e
    end
  end

  # @param  [String] table_name
  #
  # @return [Boolean]
  def ∃table?(table_name); table_exists?(table_name); end

  # @param [Symbol] table_name
  # @param [Symbol] fields
  def ♻️index(table_name, fields)
    remove_index(table_name, fields) if index_exists?(table_name, fields)
  end

  # @param [Symbol] table_name
  # @param [Symbol] fields
  def ♻️index!(table_name, fields); remove_index(table_name, fields); end

  # @param [Symbol] table_name
  def ♻️table(table_name); drop_table(table_name, if_exists: true); end

  # @param [Symbol] table_name
  def ♻️table!(table_name); drop_table(table_name); end

end
