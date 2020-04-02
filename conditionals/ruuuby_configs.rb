
require 'set'

module ::RuuubyConfigs

  module NamingSchema
    RUUUBY_NAME_GEM       = 'ruuuby'.freeze
    RUUUBY_NAME_EXTENSION = 'ruby_class_mods'.freeze
  end

  module Extensions
    module RubyClassMods
      PATH_CONF = 'ext/ruby_class_mods/extconf.rb'.freeze
    end
  end

  module Requirements
    RUBY_VERSION          = '2.7.0'.freeze
    RUBY_VERSION_PATCH    = 0
    RUBY_VERSION_REVISION = '647ee6f091eafcce70ffb75ddf7e121e192ab217'.freeze
    RUBY_PLATFORM         = 'x86_64-darwin18'.freeze
  end

  module GemDependencies

    GEM_TTY_COMMAND     = :'tty-command'
    GEM_BUNDLER         = :bundler
    GEM_RAKE            = :rake
    GEM_RSPEC           = :rspec
    GEM_RDOC            = :rdoc
    GEM_RAKE_COMPILER   = :'rake-compiler'
    GEM_RSPEC_BENCHMARK = :'rspec-benchmark'
    GEM_SQLITE3         = :sqlite3
    GEM_ACTIVERECORD    = :activerecord
    GEM_RUUUBY          = :ruuuby

    module EnvironmentInternal
      ALL_GEMS = {ruuuby: '0.0.25'}
    end

    module EnvironmentRuntime
      ALL_GEMS = {'tty-command': '0.9.0'}
    end

    module EnvironmentDevelopment
      ALL_GEMS = {
          'bundler': '2.1.4',
          'rake': '13.0.1',
          'rspec': '3.9.0',
          'rdoc': '6.2.1',
          'rake-compiler': '1.1.0',
          'rspec-benchmark': '0.5.1',
          'sqlite3': '1.4.2',
          'activerecord': '5.2.4.1',
      }.merge!(::RuuubyConfigs::GemDependencies::EnvironmentRuntime::ALL_GEMS)
    end

  end

end
