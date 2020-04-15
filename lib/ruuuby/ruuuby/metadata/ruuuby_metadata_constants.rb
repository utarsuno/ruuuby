# coding: UTF-8

# -------------------------------------------- ⚠️ --------------------------------------------

module ::Ruuuby

  # information and utilities that define and work w/ aspects of `Ruuuby`
  module MetaData

    module Paths
      # @type [String]
      BASE    = (::File.dirname(::File.dirname(::File.dirname(::File.dirname(::File.dirname(__FILE__)))))).freeze

      # @type [String]
      DIR_SPEC = "#{BASE}/spec".freeze

      # @type [String]
      DIR_SPEC_HELPERS = "#{DIR_SPEC}/helpers".freeze

      # @type [String]
      DIR_TMP = "#{BASE}/tmp".freeze

      # @type [String]
      DIR_LIB = "#{BASE}/lib".freeze

      # @type [String]
      DIR_APP = "#{BASE}/app".freeze

      # @type [String]
      DIR_DB  = "#{BASE}/db".freeze

      # @type [String]
      DIR_EXT = "#{BASE}/ext".freeze

      module SpecificFiles
        LOGGING          = "#{DIR_TMP}/ruuuby.log".freeze

        # @type [String]
        SEED             = "#{DIR_DB}/seed.rb".freeze

        # @type [String]
        SEED_GIT_COMMITS = "#{DIR_DB}/seeds/git_commits.rb".freeze

        # @type [String]
        RUUUBY_README    = "#{BASE}/README.md".freeze

        # @type [String]
        RUUUBY_VERSION   = "#{DIR_LIB}/ruuuby/version.rb".freeze

        # @type [String]
        HELPER_DB        = "#{DIR_SPEC_HELPERS}/helper_db.rb".freeze

        # @type [String]
        HELPER_PERFORMANCE = "#{DIR_SPEC_HELPERS}/helper_performance.rb".freeze
      end
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

      # @type [Encoding] expected encoding is `::Encoding::UTF_8`
      RUBY_ENCODING         = __ENCODING__

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

    module QA

      module Full
        TAG  = :full
        NAME = 'full'.freeze
      end

      module DB
        TAG  = :db
        NAME = 'db'.freeze
        ADDITIONAL_REQUIRES = ["-I #{::Ruuuby::MetaData::Paths::SpecificFiles::SEED}"]
      end

      module Performance
        TAG  = :performance
        NAME = 'performance'.freeze
        ADDITIONAL_REQUIRES = []
      end

      module Audits
        TAG  = :audits
        NAME = 'audit'.freeze
        ADDITIONAL_REQUIRES = []
      end

      module Unit
        TAG  = :unit
        NAME = 'unit'.freeze
      end

      # @type [Array]
      DEFAULT_RSPEC_TASK_OPTS = ['--format progress', '--color', '--require spec_helper'].freeze

      # @type [Array]
      SINGULAR_TEST_MODES     = [QA::DB::TAG, QA::Audits::TAG, QA::Performance::TAG].freeze

      # @param [Module] category_module
      #
      # @return [Array]
      def self.generate_rspec_task_options(category_module)
        the_tag = category_module::TAG
        case(the_tag)
        when QA::Unit::TAG
          additional_opts = []
          SINGULAR_TEST_MODES.each do |tag|
            additional_opts << "--tag ~@#{tag.to_s}"
          end
          return (QA::DEFAULT_RSPEC_TASK_OPTS + additional_opts)
        when QA::Full::TAG
          return (QA::DEFAULT_RSPEC_TASK_OPTS + ['--warnings'])
        when QA::Performance::TAG, QA::Audits::TAG, QA::DB::TAG
          additional_opts = ["--tag @#{the_tag.to_s}"]
          SINGULAR_TEST_MODES.each do |other_tag|
            unless the_tag == other_tag
              additional_opts << "--tag ~@#{other_tag.to_s}"
            end
          end
          return (QA::DEFAULT_RSPEC_TASK_OPTS + additional_opts)
        else
          raise "Unrecognized rspec tag{#{the_tag.to_s}}"
        end
      end

    end

  end

end

# -------------------------------------------- ⚠️ --------------------------------------------
