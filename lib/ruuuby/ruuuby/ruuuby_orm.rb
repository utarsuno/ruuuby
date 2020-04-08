# encoding: UTF-8

# -------------------------------------------- ⚠️ --------------------------------------------

module Ruuuby

  module MetaData

    class RuuubyORM
      include Singleton

      module SchemaORM
        module SchemaRuuubyFeatures
        end
        module SchemaRuuubyChangelogs
        end
        module SchemaRuuubyReleases
        end

        # @type [Array]
        ALL_ORM_SCHEMAS = [SchemaRuuubyReleases, SchemaRuuubyFeatures, SchemaRuuubyChangelogs].❄️
      end

      # @return [Array]
      def get_versions
        @all_versions ||= []
        if @all_versions.∅?
          @all_versions = RuuubyRelease.all.to_ary
        end
        @all_versions
      end

      # @return [Array]
      def get_table_names
        @table_names ||= []
        if @table_names.∅?
          Ruuuby::MetaData::RuuubyORM::SchemaORM::ALL_ORM_SCHEMAS.∀ do |orm_schema|
            @table_names << orm_schema.to_s.♻️⟶∞('::Schema').to_🐍
          end
        end
        @table_names
      end

      def get_connection_schema ; ActiveRecord::Schema.connection ; end

      def get_connection_base   ; ActiveRecord::Base.connection   ; end

      # TODO: def docs_changelog

      #class RoutineORMSyncGitCommit
      #end
    end

  end

end

# -------------------------------------------- ⚠️ --------------------------------------------
