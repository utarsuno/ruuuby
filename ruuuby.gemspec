#encoding: UTF-8

Gem::Specification.new do |gem|
  gem.name                  = 'ruuuby'
  gem.version               = '0.0.15'
  gem.summary               = %q{wip: increase quality of Ruby coding life}
  gem.description           = %q{wip: flavored modifications & extensions for increased quality of Ruby coding life}
  gem.authors               = ["Uladzislau Tarsunou"]
  gem.homepage              = 'https://github.com/utarsuno/ruuuby'
  gem.license               = 'MIT'
  gem.required_ruby_version = Gem::Requirement.new('>= 2.7.0')
  gem.platform              = Gem::Platform.local
  gem.post_install_message  = "Gem{ruuuby, v0.0.15} has just been installed, cheers!"
  _ = gem.metadata
  _['homepage_uri']          = gem.homepage
  _['source_code_uri']       = "#{gem.homepage}.git"
  _['changelog_uri']         = "#{gem.homepage}/blob/master/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  #gem.files                  = Dir.chdir(File.expand_path('..', __FILE__)) do
  #  `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  #end
  gem.bindir                = 'bin'
  gem.executables           = gem.files.grep(%r{^bin/}) { |f| File.basename(f) }
  #gem.test_files             = gem.files.grep(%r{^(test|spec|features)/})
  #gem.test_files             = Dir.glob('spec/**/*.rb')
  gem.require_paths         = %w(lib ext)

  gem.rdoc_options = %w(-x ext --main README.rdoc)

  gem.files = Dir.glob('ext/**/*.{c,rb}') + Dir.glob('lib/**/*.rb')
  gem.extensions << 'ext/ruby_class_mods/extconf.rb'

  require_relative 'conditionals/gem_dependencies'
  ::RuuubyConfigs::GemDependencies::EnvironmentDevelopment::ALL_GEMS.each do |gem_name, gem_version|
    gem.add_development_dependency gem_name, "~> #{gem_version}"
  end
  ::RuuubyConfigs::GemDependencies::EnvironmentRuntime::ALL_GEMS.each do |gem_name, gem_version|
    gem.add_runtime_dependency gem_name, "~> #{gem_version}"
  end

end
