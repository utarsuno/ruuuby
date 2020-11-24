# encoding: UTF-8

# --------------------------------------------- ⚠️ ---------------------------------------------

module ::Ruuuby::MetaData

  class DBConnection
    include ::Ruuuby::Attribute::Connectable

    attr_reader :configs, :connection_pool, :connection

    # @param [Hash, String] configs
    #
    # @raise [ArgumentError]
    def initialize(configs)
      if configs.str?
        @configs = ::File::YAML.read(configs)
      else
        🛑hsh❓('configs', configs)
        @configs = configs
      end
    end

    def obtain_connection
      if 💎.engine.stats_ext['F92_B01'] || 💎.engine.stats_ext['F92_B02']
        @connection_pool = ::ActiveRecord::Base.establish_connection(@configs)
        @connection      = @connection_pool.connection
      elsif 💎.engine.stats_ext['F92_B02']
        @connection = ::PG::Connection.new(@configs)
      else
        🛑 RuntimeError.new("| c{DBConnection}-> m{obtain_connection} has unknown lib-backend{#{💎.engine.stats_ext['F92_B02'].to_s}} |")
      end
      💎.engine.info("connected to DB of w/ configs{#{@configs.to_s}}")
      @connection
    end

    def ♻️_connection!; @connection.disconnect! unless @connection.nil?; end

  end

  # @see https://api.rubyonrails.org/classes/ActiveRecord/ConnectionAdapters/PostgreSQLAdapter.html#method-c-create_unlogged_tables
  class DBConnectionPostgreSQL < ::Ruuuby::MetaData::DBConnection

    # @param [Hash, String] configs or yaml file path
    def initialize(configs)
      super(configs)
    end

    # @param [String] sql
    #
    # @raise [ArgumentError]
    def sql(sql)
      🛑str❓('sql', sql)
      puts "executing sql{#{sql}}"
        #@connection.execute(sql)
        @connection.exec_query(sql)
    end

    # TODO: ruuuby specific DB class
    def ∃⨍?(func_name); self.sql("SELECT does_func_exist('#{func_name}');").rows[0][0]; end

    # TODO: ruuuby specific DB class
    def ∃table?(table_name); self.sql("SELECT does_table_exist('#{table_name}');").rows[0][0]; end

    def db_size
      self.sql("SELECT db_size_bytes FROM db_size_stats() WHERE dat_name = 'env_test';").rows[0]
    end

    def refresh_stats(table_name)
      self.sql("ANALYZE #{table_name};")
    end

    # @param [String]  table_name
    # @param [Boolean] update_cache
    #
    # @return [Integer]
    def num_rows(table_name, update_cache=false)
      refresh_stats(table_name) if update_cache
      self.sql("SELECT table_row_count_estimate('#{table_name}');").rows[0][0]
    end

    def _connected?; @connection != nil; end

    def _connect; self.obtain_connection; end

    def _disconnect; @connection.close; end

  end

end

# --------------------------------------------- ⚠️ ---------------------------------------------
