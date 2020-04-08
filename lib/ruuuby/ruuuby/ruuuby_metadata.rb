
# TODO: autoload this file, NOT require

# -------------------------------------------- ⚠️ --------------------------------------------

module ::Ruuuby

  module MetaData

    module Vocabulary

      # @type [Symbol]
      MATH_SET_NATURAL_NUMBERS = :ℕ

      # @type [Symbol]
      NO_NORMALIZER = :none

      # @type [Symbol]
      NORMALIZER_NO_EMPTY = :'!∅'

    end

    module BuiltWith

      # @type [String]
      RUBY_VERSION          = '2.7.0'.freeze

      # @type [Integer]
      RUBY_VERSION_PATCH    = 0

      # @type [String]
      RUBY_VERSION_REVISION = '647ee6f091eafcce70ffb75ddf7e121e192ab217'.freeze

      # @type [String]
      RUBY_PLATFORM         = 'x86_64-darwin18'.freeze

      module GemDependencies

        # @type [Symbol]
        GEM_TTY_COMMAND     = :'tty-command'

        # @type [Symbol]
        GEM_BUNDLER         = :bundler

        # @type [Symbol]
        GEM_RAKE            = :rake

        # @type [Symbol]
        GEM_RSPEC           = :rspec

        # @type [Symbol]
        GEM_RDOC            = :rdoc

        # @type [Symbol]
        GEM_RAKE_COMPILER   = :'rake-compiler'

        # @type [Symbol]
        GEM_RSPEC_BENCHMARK = :'rspec-benchmark'

        # @type [Symbol]
        GEM_SQLITE3         = :sqlite3

        # @type [Symbol]
        GEM_ACTIVERECORD    = :activerecord

        # @type [Symbol]
        GEM_RUUUBY          = :ruuuby

        module Environment
          module Runtime
            # @type [Hash]
            ALL_GEMS = {'tty-command': '0.9.0'}
          end
          module Development
            # @type [Hash]
            ALL_GEMS = {
                'bundler': '2.1.4',
                'rake': '13.0.1',
                'rspec': '3.9.0',
                'rdoc': '6.2.1',
                'rake-compiler': '1.1.0',
                'rspec-benchmark': '0.5.1',
                'sqlite3': '1.4.2',
                'activerecord': '5.2.4.1',
                'schema_plus_foreign_keys': '0.1.8'
            }
          end
        end # end{Environment}
      end # end{GemDependencies}
    end # end{BuiltWith}

    module References

      # @type [String]
      URI_HOME          = 'https://github.com/utarsuno/ruuuby'.freeze

      # @type [String]
      URI_GIT           = "#{URI_HOME}.git".freeze

      # @type [String]
      URI_CHANGELOG     = "#{URI_HOME}/blob/master/CHANGELOG.md".freeze

      # @type [String]
      URI_DOCUMENTATION = "#{URI_HOME}/tree/master/help".freeze

      # @type [String]
      URI_ATOM          = "https://rubygems.org/gems/ruuuby/versions.atom".freeze
    end

  end

end

# -------------------------------------------- ⚠️ --------------------------------------------
