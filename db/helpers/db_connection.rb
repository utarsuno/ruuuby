# encoding: UTF-8

# --------------------------------------------- ⚠️ ---------------------------------------------

module ::Ruuuby

  class DBConnection

    attr_reader :configs, :connection_pool, :connection

    def initialize(configs)
      @configs = configs
    end

    def obtain_connection
      @connection_pool = ::ActiveRecord::Base.establish_connection(@configs)
      @connection      = @connection_pool.connection
      💎.engine.info("Connected to DB of w/ configs{#{@configs.to_s}}")
      @connection
    end

    def ♻️_connection!; @connection.disconnect! unless @connection.nil?; end

  end

  # @see https://api.rubyonrails.org/classes/ActiveRecord/ConnectionAdapters/PostgreSQLAdapter.html#method-c-create_unlogged_tables
  class DBConnectionPostgreSQL < ::Ruuuby::DBConnection

    # @param [Hash] configs
    #
    # @raise [ArgumentError]
    def initialize(configs)
      🛑hsh❓('configs', configs)
      super(configs)
    end

    # @param [String] sql
    #
    # @raise [ArgumentError]
    def sql(sql)
      🛑hsh❓('sql', sql)
      #@connection.execute(sql)
      @connection.execute_query(sql)
    end

  end

  class DBConnectionMemorySQLite3 < ::Ruuuby::DBConnection
    def initialize
      super({adapter: 'sqlite3', database: ':memory:'})
    end
  end

end

# --------------------------------------------- ⚠️ ---------------------------------------------
