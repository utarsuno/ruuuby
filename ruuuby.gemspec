# coding: UTF-8

Gem::Specification.new do |gem|
  require_relative 'lib/ruuuby/version'

  gem.name                  = 'ruuuby'
  gem.version               = ::Ruuuby::VERSION
  gem.summary               = 'wip: increase quality of Ruby coding life'
  gem.description           = '{wip: flavored modifications & extensions for increased quality of Ruby coding life}'
  gem.authors               = ["Uladzislau Tarsunou"]
  gem.homepage              = 'https://github.com/utarsuno/ruuuby'
  gem.license               = 'MIT'
  gem.required_ruby_version = Gem::Requirement.new(">= #{RUBY_VERSION}")
  gem.platform              = Gem::Platform.local
  gem.post_install_message  = "Gem{ruuuby, v#{::Ruuuby::VERSION.to_s}} has just been installed, cheers!"
  _md                       = gem.metadata
  _md['homepage_uri']       = gem.homepage
  _md['source_code_uri']    = "#{gem.homepage}.git"
  _md['changelog_uri']      = "#{gem.homepage}/blob/master/CHANGELOG.md"
  _md['documentation_uri']  = "#{gem.homepage}/tree/master/help"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  #gem.files                  = Dir.chdir(File.expand_path('..', __FILE__)) do
  #  `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  #end
  gem.bindir        = 'bin'
  gem.executables   = gem.files.grep(%r{^bin/}) { |f| File.basename(f) }
  #gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  #gem.test_files    = Dir.glob('spec/**/*.rb')
  gem.require_paths = %w(lib ext)
  gem.rdoc_options  = %w(-x ext --main README.rdoc)
  gem.files          = Dir.glob('ext/**/*.{c,rb,h}') + Dir.glob('lib/**/*.rb')
  gem.extensions << 'ext/ruby_class_mods/extconf.rb'

  # ╔═════════════════════════════════════════════════════════════════════════════╗
  # ║ 0x0) ./bin/console_db  ║ 0x1) puts @ruuuby_gemspec.generate_source          ║
  # ╠═════════════════════════════════════════════════════════════════════════════╣
  gem.add_development_dependency(:bundler, '~> 2.2.0.rc.1')                      #║
  gem.add_development_dependency(:rake, '~> 13.0.1')                             #║
  gem.add_development_dependency(:rspec, '~> 3.9.0')                             #║
  gem.add_development_dependency(:rdoc, '~> 6.2.1')                              #║
  gem.add_development_dependency(:'docker-api', '~> 1.34.2')                     #║
  gem.add_development_dependency(:'rspec-benchmark', '~> 0.6.0')                 #║
  gem.add_development_dependency(:'rake-compiler', '~> 1.1.1')                   #║
  gem.add_development_dependency(:'tty-command', '~> 0.9.0')                     #║
  gem.add_development_dependency(:sqlite3, '~> 1.4.2')                           #║
  gem.add_development_dependency(:pg, '~> 1.2.3')                                #║
  gem.add_development_dependency(:activerecord, '~> 5.2.4.3')                    #║
  gem.add_development_dependency(:schema_plus_foreign_keys, '~> 0.1.8')          #║
  gem.add_development_dependency(:rugged, '~> 1.0.1')                            #║
  gem.add_development_dependency(:'rubygems-update', '~> 3.2.0.rc.1')            #║
  # ╠═════════════════════════════════════════════════════════════════════════════╣
  gem.add_runtime_dependency(:'tty-command', '~> 0.9.0')                         #║
  # ╠═════════════════════════════════════════════════════════════════════════════╣
  gem.installed_by_version = '3.2.0.rc.1'                                        #║
  # ╚═════════════════════════════════════════════════════════════════════════════╝

end
