require_relative 'lib/ruuuby/version'

Gem::Specification.new do |gem|
  gem.name                  = Ruuuby.name.downcase
  gem.version               = Ruuuby::Version::VERSION
  gem.summary               = %q{wip: increase quality of Ruby coding life}
  gem.description           = %q{wip: flavored modifications & extensions for increased quality of Ruby coding life}
  gem.authors               = ["Uladzislau Tarsunou"]
  gem.email                 = %w(utarsuno@gmail.com)
  gem.homepage              = 'https://github.com/utarsuno/ruuuby'
  gem.license               = 'MIT'
  gem.required_ruby_version = Gem::Requirement.new('>= 2.7.0')
  gem.platform              = Gem::Platform.local
  gem.post_install_message  = "Gem{ruuuby, v0.0.7} has just been installed, cheers!"
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
  gem.bindir                = 'exe'
  gem.executables           = gem.files.grep(%r{^exe/}) { |f| File.basename(f) }
  gem.require_paths         = %w(lib)

  gem.files = Dir.glob("ext/**/*.{c,rb}") + Dir.glob("lib/**/*.rb")
  gem.extensions << 'ext/ruby_class_mods/extconf.rb'

  #s.files = Dir.glob("ext/**/*.{c,rb}") + Dir.glob("lib/**/*.rb")
  #s.extensions << "ext/faye_websocket/extconf.rb"

  gem.add_development_dependency 'rake-compiler' #TODO: Mark version

end