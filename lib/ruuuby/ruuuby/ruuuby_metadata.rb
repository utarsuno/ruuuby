
# TODO: autoload this file, NOT require

module ::Ruuuby

  module MetaData

    module BuiltWith
      RUBY_VERSION          = '2.7.0'.freeze
      RUBY_VERSION_PATCH    = 0
      RUBY_VERSION_REVISION = '647ee6f091eafcce70ffb75ddf7e121e192ab217'.freeze
      RUBY_PLATFORM         = 'x86_64-darwin18'.freeze

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

        module Environment
          module Runtime
            ALL_GEMS = {'tty-command': '0.9.0'}
          end
          module Development
            ALL_GEMS = {
                'bundler': '2.1.4',
                'rake': '13.0.1',
                'rspec': '3.9.0',
                'rdoc': '6.2.1',
                'rake-compiler': '1.1.0',
                'rspec-benchmark': '0.5.1',
                'sqlite3': '1.4.2',
                'activerecord': '5.2.4.1',
            }
          end
        end # end{Environment}

      end

    end

    module References
      URI_HOME          = 'https://github.com/utarsuno/ruuuby'.freeze
      URI_GIT           = "#{URI_HOME}.git".freeze
      URI_CHANGELOG     = "#{URI_HOME}/blob/master/CHANGELOG.md".freeze
      URI_DOCUMENTATION = "#{URI_HOME}/tree/master/help".freeze
    end

  end

  module Routines

    # TODO: to be completed in v0.0.26
    def update_version_string_across_files
      version_next = RuuubyRelease.get_next_version_uid
      version_next = [1..version_next.length]

      version_curr = RuuubyRelease.get_latest_version_uid
      version_curr = [1..version_curr.length]

      puts "THE CURRENT VERSION IS {#{version_curr}}"
      puts "THE NEXT VERSION IS {#{version_curr}}"
    end

  end

end
