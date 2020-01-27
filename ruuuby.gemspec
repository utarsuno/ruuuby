#encoding: UTF-8

Gem::Specification.new do |gem|
  gem.name                  = 'ruuuby'
  gem.version               = '0.0.8'
  gem.summary               = %q{wip: increase quality of Ruby coding life}
  gem.description           = %q{wip: flavored modifications & extensions for increased quality of Ruby coding life}
  gem.authors               = ["Uladzislau Tarsunou"]
  gem.email                 = %w(utarsuno@gmail.com)
  gem.homepage              = 'https://github.com/utarsuno/ruuuby'
  gem.license               = 'MIT'
  gem.required_ruby_version = Gem::Requirement.new('>= 2.7.0')
  gem.platform              = Gem::Platform.local
  gem.post_install_message  = "Gem{ruuuby, v0.0.8} has just been installed, cheers!"
  _ = gem.metadata
  _['homepage_uri']          = gem.homepage
  _['source_code_uri']       = "#{gem.homepage}.git"
  _['source_code_uri']       = "#{gem.homepage}/blob/master/CHANGELOG.md"
  _['changelog_uri']         = "#{gem.homepage}/blob/master/README.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  #gem.files                  = Dir.chdir(File.expand_path('..', __FILE__)) do
  #  `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  #end
  #gem.bindir                = 'exe'
  gem.bindir                = 'bin'
  #gem.executables           = gem.files.grep(%r{^exe/}) { |f| File.basename(f) }
  gem.executables           = gem.files.grep(%r{^bin/}) { |f| File.basename(f) }
  #gem.test_files             = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths         = %w(lib ext)

  gem.rdoc_options = %w(-x ext --main README.rdoc)

  gem.files = Dir.glob("ext/**/*.{c,rb}") + Dir.glob("lib/**/*.rb")
  gem.extensions << 'ext/ruby_class_mods/extconf.rb'

  gem.add_development_dependency 'rake'           , '~> 13.0.1'
  gem.add_development_dependency 'rspec'          , '~> 3.9.0'
  gem.add_development_dependency 'rdoc'           , '~> 6.2.1'
  gem.add_development_dependency 'rake-compiler'  , '~> 1.1.0'
  gem.add_development_dependency 'rspec-benchmark', '~> 0.5.1'

  #gem.add_development_dependency 'locale', '~> 2.1.2'

end