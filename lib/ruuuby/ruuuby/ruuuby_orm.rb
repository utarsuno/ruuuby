# coding: UTF-8

# -------------------------------------------- ⚠️ --------------------------------------------

module Ruuuby

  # information and utilities that define and work w/ aspects of `Ruuuby`
  module MetaData

    class RuuubyORM
      include ::Ruuuby::Attribute::Includable::RuuubySingleton

      attr_accessor :ruuuby_file_version

      def initialize
        @connected    = false
        @loaded       = false
        @seeds_loaded = false
      end

      def get_upcoming_changelog
        orm_version = ::RuuubyRelease.get_version_next
        orm_version.docs_changelog.∀ do |l|
          puts l
        end
      end

      # wip
      def full_project_check
        path    = "#{💎.api_git.repo.workdir}.ruby-version"
        content = ::File.read(path).to_s
        ruuuby  = @ruuuby_file_version.generate_source.to_s

        if content == ruuuby
          💎.debug("file{#{path}} is healthy")
        else
          💎.debug("file{#{path}} does not match{#{ruuuby}}")
        end
      end

      # ----------------------------------------------------------------------------------------------------------------

      def get_connection_schema; ::ActiveRecord::Schema.connection; end

      def get_connection_base; ::ActiveRecord::Base.connection; end

      # ----------------------------------------------------------------------------------------------------------------

      # @return [Boolean] true, if the db-connection had not yet been loaded and did so this function-call
      def ensure_loaded_db_connection
        unless @connected
          adapter = 'sqlite3'
          db      = ':memory:'
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
          require_relative '../../../db/seeds/ruuuby_feature_behaviors'
          require_relative '../../../db/seeds/ruuuby_releases/past'
          require_relative '../../../db/seeds/ruuuby_releases/active_or_recent'
          require_relative '../../../db/seeds/ruuuby_dirs'
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
          require_relative '../../../app/models/ruuuby_gem'
          require_relative '../../../app/models/ruuuby_feature'
          require_relative '../../../app/models/ruuuby_feature_behavior'
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
    def self.orm; ::Ruuuby::MetaData::RuuubyORM.ℹ; end
  end

end

# -------------------------------------------- ⚠️ --------------------------------------------
