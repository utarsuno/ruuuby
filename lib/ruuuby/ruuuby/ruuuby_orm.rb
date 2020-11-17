# encoding: UTF-8

# -------------------------------------------- ⚠️ --------------------------------------------

# `💎.engine.orm`
module Ruuuby::MetaData
  class RuuubyORM < ::Ruuuby::MetaData::EngineComponentAPI

    attr_reader :db_orm

    def initialize(engine)
      super(engine)
      path_relative = engine.stats_ext['RUUUBY_CONFIGS']
      if engine.stats_ext['F92_B02'] == true
        @db_orm = ::Ruuuby::MetaData::DBConnectionPostgreSQL.new("#{engine.path_base}#{path_relative}")
        @db_orm.obtain_connection
      else
        🛑 ::RuntimeError.new("| o{💎.engine.orm}-> m{initialize} called with invalid val{#{engine.stats_ext['F92_B02'].to_s}} for env{F92_B02} |")
      end
    end

    def on_engine_exit; @db_orm.♻️_connection!; end

  end # end: {RuuubyORM}
end

# -------------------------------------------- ⚠️ --------------------------------------------
