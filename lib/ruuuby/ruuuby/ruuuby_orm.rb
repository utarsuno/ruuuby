# encoding: UTF-8

# -------------------------------------------- ⚠️ --------------------------------------------

# `💎`
module Ruuuby

  # information and utilities that define and work w/ aspects of `Ruuuby`
  module MetaData

    # `💎.engine.orm`
    class RuuubyORM < ::Ruuuby::MetaData::RuuubyAPIComponent

      attr_accessor :ruuuby_file_version, :state_flag, :expected_tables, :ruuuby_release_obj_curr

      # state_flag
      # | 0 | no db libs |
      # | 1 | db libs loaded |
      # | 2 | schema loaded |
      # | 3 | db connected to |
      # | 4 | db tables loaded |
      # | 5 | db seeds loaded |

      def initialize(engine)
        super(engine)
        @state_flag       = 0
        @expected_tables = {
            orm: %w(ruuuby_releases ruuuby_gems ruuuby_features ruuuby_feature_behaviors ruuuby_changelogs git_commits ruuuby_dirs ruuuby_files),
            application_record: %w(ar_internal_metadata)
        }
      end

      def info_release_state
        release_current = @engine.api_git.remote_release_current
        #release_previous = 💎.engine.api_git.remote_release_previous

        puts "the last released version was{#{release_current.to_s}}"
      end

      # ----------------------------------------------------------------------------------------------------------------

      def execute_raw_sql(sql); self.get_connection_base.execute(sql); end

      def get_connection_schema; ::ActiveRecord::Schema.connection; end

      def get_connection_base; ::ActiveRecord::Base.connection; end

      # ----------------------------------------------------------------------------------------------------------------

      # @return [Boolean] true, if the db-connection had not yet been loaded and did so this function-call
      def ensure_loaded_db_connection
        if @state_flag == 2
          adapter = 'sqlite3'
          db      = ':memory:'
          ::ActiveRecord::Base.establish_connection(adapter: adapter, database: db)
          @engine.info("Connected to db of type{#{adapter.to_s}} with connection to/type{#{db.to_s}}")
          @state_flag += 1
        else
          🛑 RuntimeError.new("| RuuubyEngine w/ func{ensure_loaded_db_connection} tried to move to state{3} when currently in state{#{@state_flag.to_s}} |")
        end
      end

      def ensure_loaded_db_tables
        if @state_flag == 3
          require_relative '../../../db/db_schema'
          @engine.info('loaded db tables')
          @state_flag += 1
        else
          🛑 RuntimeError.new("| RuuubyEngine w/ func{ensure_loaded_db_tables} tried to move to state{3} when currently in state{#{@state_flag.to_s}} |")
        end
      end

      # @return [Boolean] true, if the seeds had not yet been loaded and did so this function-call
      def ensure_loaded_seeds(allow_lazy_load=false)
        if @state_flag == 4
          require_relative '../../../db/seeds/ruuuby_features'
          require_relative '../../../db/seeds/ruuuby_feature_behaviors'
          require_relative '../../../db/seeds/ruuuby_releases/past'
          require_relative '../../../db/seeds/ruuuby_releases/active_or_recent'
          require_relative '../../../db/seeds/ruuuby_dirs'
          require_relative '../../../db/seeds/git_commits'
          @engine.info('loaded db seeds')
          @state_flag += 1
        elsif allow_lazy_load && @state_flag < 4
          self.ensure_up_to(5)
        else
          🛑 RuntimeError.new("| RuuubyEngine w/ func{ensure_loaded_seeds} tried to move to state{5} when currently in state{#{@state_flag.to_s}} |")
        end
      end

      def ensure_loaded_db_libs
        if @state_flag == 0
          require 'sqlite3'
          require 'active_record'
          @engine.info('loaded db libs')
          @state_flag += 1
        else
          🛑 RuntimeError.new("| RuuubyEngine w/ func{ensure_loaded_db_libs} tried to move to state{1} when currently in state{#{@state_flag.to_s}} |")
        end
      end

      # @return [Boolean] true, if the schema had not yet been loaded and did so this function-call
      def ensure_loaded_schema
        if @state_flag == 1
          require_relative '../../../app/model_attributes/extendable/uid'
          require_relative '../../../app/model_attributes/includable/uid'
          require_relative '../../../app/models/application_record'
          @expected_tables[:orm].∀{|orm_name| require_relative "../../../app/models/#{orm_name}"}
          @engine.info('loaded needed DB files')
          @state_flag += 1
        else
          🛑 RuntimeError.new("| RuuubyEngine w/ func{ensure_loaded_schema} tried to move to state{2} when currently in state{#{@state_flag.to_s}} |")
        end
      end

      #    ___                      __                          ___                                              __
      #  /'___\                    /\ \                        /\_ \                                            /\ \__
      # /\ \__/  ___   _ __        \_\ \     __   __  __     __\//\ \     ___   _____     ___ ___      __    ___\ \ ,_\
      # \ \ ,__\/ __`\/\`'__\      /'_` \  /'__`\/\ \/\ \  /'__`\\ \ \   / __`\/\ '__`\ /' __` __`\  /'__`\/' _ `\ \ \/
      #  \ \ \_/\ \L\ \ \ \/      /\ \L\ \/\  __/\ \ \_/ |/\  __/ \_\ \_/\ \L\ \ \ \L\ \/\ \/\ \/\ \/\  __//\ \/\ \ \ \_
      #   \ \_\\ \____/\ \_\      \ \___,_\ \____\\ \___/ \ \____\/\____\ \____/\ \ ,__/\ \_\ \_\ \_\ \____\ \_\ \_\ \__\
      #    \/_/ \/___/  \/_/       \/__,_ /\/____/ \/__/   \/____/\/____/\/___/  \ \ \/  \/_/\/_/\/_/\/____/\/_/\/_/\/__/
      #                                                                           \ \_\
      #                                                                            \/_/

      # wip
      def full_project_check
        path    = "#{@engine.path_base}.ruby-version"
        content = ::File.read(path).to_s
        ruuuby  = @ruuuby_file_version.generate_source.to_s

        if content == ruuuby
          @engine.debug("file{#{path}} is healthy")
        else
          @engine.debug("file{#{path}} does not match{#{ruuuby}}")
        end
      end

      # wip
      def get_upcoming_changelog; @ruuuby_release_obj_curr.get_docs2.∀{|content| puts content}; end

      # @return [String]
      def print_info_readme_feat_types
        feats_stable        = ::RuuubyFeature.num_stable
        feats_wip           = ::RuuubyFeature.num_wip
        feats_todo          = ::RuuubyFeature.num_todo
        feats_needing_merge = ::RuuubyFeature.num_needing_merge
        "`#{feats_stable.to_s}`:`#{feats_wip.to_s}`:`#{feats_needing_merge.to_s}`:`#{feats_todo.to_s}`"
      end

      🙈

      def ensure_up_to(depth)
        if @state_flag == 0 && depth >= 1
          self.ensure_loaded_db_libs
          self.ensure_loaded_schema
          self.ensure_loaded_db_connection
          self.ensure_loaded_db_tables
          self.ensure_loaded_seeds
        elsif @state_flag == 1 && depth >= 2
          self.ensure_loaded_schema
          self.ensure_loaded_db_connection
          self.ensure_loaded_db_tables
          self.ensure_loaded_seeds
        elsif @state_flag == 2 && depth >= 3
          self.ensure_loaded_db_connection
          self.ensure_loaded_db_tables
          self.ensure_loaded_seeds
        elsif @state_flag == 3 && depth >= 4
          self.ensure_loaded_db_tables
          self.ensure_loaded_seeds
        elsif @state_flag == 4 && depth >= 5
          self.ensure_loaded_seeds
        end
      end

    end # end: {RuuubyORM}

  end
end

# -------------------------------------------- ⚠️ --------------------------------------------

# TODO: switch to Postgres (gem 'pg')
# TODO: https://api.rubyonrails.org/classes/ActiveRecord/ConnectionAdapters/PostgreSQLAdapter.html
# TODO: https://medium.com/carwow-product-engineering/5-things-i-wish-my-grandfather-told-me-about-activerecord-and-postgres-93416faa09e7
