# encoding: UTF-8

# -------------------------------------------- ⚠️ --------------------------------------------

# `💎`
module Ruuuby

  # information and utilities that define and work w/ aspects of `Ruuuby`
  module MetaData

    # `💎.engine.orm`
    class RuuubyORM < ::Ruuuby::MetaData::EngineComponentAPI

      attr_reader :db_orm

      def initialize(engine)
        super(engine)
        if engine.stats_ext['F92_B02'] == true
          @db_orm = ::Ruuuby::MetaData::DBConnectionPostgreSQL.new("#{engine.path_base}configs_local/db/dev.yml")
          @db_orm.obtain_connection
        else
          🛑 ::RuntimeError.new("| c{RuuubyORM}-> m{initialize} called with invalid val{#{engine.stats_ext['F92_B02'].to_s}} for env{F92_B02} |")
        end
      end

      def on_engine_exit; @db_orm.♻️_connection!; end

      #    ___                      __                          ___                                              __
      #  /'___\                    /\ \                        /\_ \                                            /\ \__
      # /\ \__/  ___   _ __        \_\ \     __   __  __     __\//\ \     ___   _____     ___ ___      __    ___\ \ ,_\
      # \ \ ,__\/ __`\/\`'__\      /'_` \  /'__`\/\ \/\ \  /'__`\\ \ \   / __`\/\ '__`\ /' __` __`\  /'__`\/' _ `\ \ \/
      #  \ \ \_/\ \L\ \ \ \/      /\ \L\ \/\  __/\ \ \_/ |/\  __/ \_\ \_/\ \L\ \ \ \L\ \/\ \/\ \/\ \/\  __//\ \/\ \ \ \_
      #   \ \_\\ \____/\ \_\      \ \___,_\ \____\\ \___/ \ \____\/\____\ \____/\ \ ,__/\ \_\ \_\ \_\ \____\ \_\ \_\ \__\
      #    \/_/ \/___/  \/_/       \/__,_ /\/____/ \/__/   \/____/\/____/\/___/  \ \ \/  \/_/\/_/\/_/\/____/\/_/\/_/\/__/
      #                                                                           \ \_\
      #                                                                            \/_/

      🙈

    end # end: {RuuubyORM}

  end
end

# -------------------------------------------- ⚠️ --------------------------------------------
