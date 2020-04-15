# coding: UTF-8

# -------------------------------------------- ⚠️ --------------------------------------------

module Ruuuby

  # information and utilities that define and work w/ aspects of `Ruuuby`
  module MetaData

    class RuuubyORM
      include ::Ruuuby::Attribute::Includable::RuuubySingleton

      def initialize
        @all_versions = nil
        @table_names  = []
        @connected    = false
        @loaded       = false
        @seeds_loaded = false
      end

      module SchemaORM

        # @type [String]
        DB_ADAPTER = 'sqlite3'.❄️

        # @type [String]
        DB_DB      = ':memory:'.❄️

        # ar_internal_metadata

        module SchemaRuuubyFeatures
        end
        module SchemaRuuubyChangelogs
        end
        module SchemaRuuubyReleases
        end
        module SchemaGitCommits
        end
        module SchemaRuuubyDirs
        end
        module SchemaRuuubyFiles
        end

        # @type [Array]
        ALL_ORM_SCHEMAS = [SchemaRuuubyReleases, SchemaRuuubyFeatures, SchemaRuuubyChangelogs, SchemaGitCommits, SchemaRuuubyDirs, SchemaRuuubyFiles].❄️
      end

      # @return [Array]
      def get_versions
        if @all_versions.∅?
          @all_versions = ::RuuubyRelease.all.to_ary
        end
        @all_versions
      end

      # @return [Array]
      def get_table_names
        if @table_names.∅?
          ::Ruuuby::MetaData::RuuubyORM::SchemaORM::ALL_ORM_SCHEMAS.∀ do |orm_schema|
            @table_names << orm_schema.to_s.♻️⟶∞('::Schema').to_🐍
          end
        end
        @table_names
      end

      # TODO: def docs_changelog

      # ----------------------------------------------------------------------------------------------------------------

      def get_connection_schema ; ::ActiveRecord::Schema.connection ; end

      def get_connection_base   ; ::ActiveRecord::Base.connection   ; end

      # ----------------------------------------------------------------------------------------------------------------

      # @return [Boolean] true, if the db-connection had not yet been loaded and did so this function-call
      def ensure_loaded_db_connection
        unless @connected
          adapter = 💎.meta_orm::DB_ADAPTER
          db      = 💎.meta_orm::DB_DB
          ActiveRecord::Base.establish_connection(adapter: adapter, database: db)
          💎.info("Connected to db of type{#{adapter.to_s}} with connection to/type{#{db.to_s}}")
          @connected = true
          return true
        end
        false
      end

      # @return [Boolean] true, if the seeds had not yet been loaded and did so this function-call
      def ensure_loaded_seeds
        unless @seeds_loaded
          require_relative '../../../db/seeds/ruuuby_features'
          require_relative '../../../db/seeds/ruuuby_releases/ruuuby_releases'
          require_relative '../../../db/seeds/git_commits'
          💎.info('loaded db seeds')
          @seeds_loaded = true
          return true
        end
        false
      end

      # @return [Boolean] true, if the schema had not yet been loaded and did so this function-call
      def ensure_loaded_schema
        unless @loaded
          require 'sqlite3'
          require 'active_record'
          require_relative '../../../app/model_attributes/extendable/uid'
          require_relative '../../../app/model_attributes/includable/uid'
          require_relative '../../../app/models/application_record'
          require_relative '../../../app/models/ruuuby_release'
          require_relative '../../../app/models/ruuuby_feature'
          require_relative '../../../app/models/ruuuby_changelog'
          require_relative '../../../app/models/git_commit'
          require_relative '../../../app/models/ruuuby_dir'
          require_relative '../../../app/models/ruuuby_file'
          💎.info('loaded needed DB files')
          @loaded = true
          return true
        end
        false
      end

    end # end: {RuuubyORM}

  end

end

module ::Ruuuby

  # information and utilities that define and work w/ aspects of `Ruuuby`
  module MetaData

    # @return [Ruuuby::MetaData::RuuubyORM]
    def self.orm ; ::Ruuuby::MetaData::RuuubyORM.instance ; end
  end

end

# -------------------------------------------- ⚠️ --------------------------------------------
