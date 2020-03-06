
require 'set'

module ::RuuubyConfigs

  module GemDependencies

    GEM_TTY_COMMAND     = :'tty-command'
    GEM_BUNDLER         = :bundler
    GEM_RAKE            = :rake
    GEM_RSPEC           = :rspec
    GEM_RDOC            = :rdoc
    GEM_RAKE_COMPILER   = :'rake-compiler'
    GEM_RSPEC_BENCHMARK = :'rspec-benchmark'

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
          'rspec-benchmark': '0.5.1'
      }.merge!(::RuuubyConfigs::GemDependencies::EnvironmentRuntime::ALL_GEMS)
    end

  end

end