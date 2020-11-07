# encoding: UTF-8

# --------------------------------------------- ⚠️ ---------------------------------------------

# ----------------------------------------------------------------------------------------------------------------
#def get_connection_schema; ::ActiveRecord::Schema.connection; end
#def get_connection_base; ::ActiveRecord::Base.connection; end
# ----------------------------------------------------------------------------------------------------------------

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
      if 💎.engine.stats_ext['F92_B01'] && 💎.engine.stats_ext['F92_B02']
        @connection_pool = ::ActiveRecord::Base.establish_connection(@configs)
        @connection      = @connection_pool.connection
      elsif 💎.engine.stats_ext['F92_B01']
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

    # @type [String]
    SQL_GET_ALL_TABLE_NAMES = "SELECT table_name FROM information_schema.tables WHERE table_type='BASE TABLE' AND table_schema='public';"

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
      #@connection.exec(sql)
      @connection.execute(sql)
    end

    # @param [String] fields
    # @param [String] table
    # @param [String] conditional_where
    #
    # @raise [ArgumentError]
    def sql_select_one(fields, table, conditional_where='')
      🛑str❓('fields', fields)
      🛑str❓('table', table)
      🛑str❓('conditional_where', conditional_where)
      conditional_str = ''
      unless conditional_where == ''
        conditional_str = " WHERE #{conditional_where} "
      end
      query = "SELECT #{fields} FROM #{table}#{conditional_str}LIMIT 1;"
      puts "executing sql{#{query}}"
      @connection.exec(query).values.first[0]
    end

    def _connected?; @connection != nil; end

    def _connect; self.obtain_connection; end

    def _disconnect; @connection.close; end

  end

end

# --------------------------------------------- ⚠️ ---------------------------------------------
