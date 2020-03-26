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
