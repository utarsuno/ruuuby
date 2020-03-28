# encoding: UTF-8

module RuuubyDBSchema

  module Tables
    RUUUBY_RELEASE   = 'ruuuby_releases'.❄️
    RUUUBY_FEATURE   = 'ruuuby_features'.❄️
    RUUUBY_CHANGELOG = 'ruuuby_changelogs'.❄️
    ALL              = [RUUUBY_RELEASE, RUUUBY_FEATURE, RUUUBY_CHANGELOG].❄️
    ❄️
  end

  def self.get_connection_schema
    ActiveRecord::Schema.connection
  end

  def self.get_connection_base
    ActiveRecord::Base.connection
  end

end

=begin
module Ruuuby

  module MetaData

    class RuuubyVersionControl

      def initialize
        @all_versions = RuuubyRelease.all.to_ary
      end

      def docs_features

      end

      def docs_changelog
        @all_docs ||= []
        if @all_docs.∅? && !(@all_versions.∅?)
          @all_versions.∀ do |ruuuby_release|
            ruuuby_release.docs_changelog.∀ do |docs_line|
              @all_docs << docs_line
            end
          end
        end
        @all_docs
      end

    end

  end

end
=end
