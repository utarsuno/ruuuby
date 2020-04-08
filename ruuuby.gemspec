# encoding: UTF-8

Gem::Specification.new do |gem|
  require_relative 'lib/ruuuby/version'
  require_relative 'lib/ruuuby/ruuuby/ruuuby_metadata'

  ruuuby_metadata = ::Ruuuby::MetaData
  ruuuby_urls     = ruuuby_metadata::References

  gem_version     = ::Ruuuby::VERSION

  gem.name                  = 'ruuuby'
  gem.version               = gem_version
  gem.summary               = 'wip: increase quality of Ruby coding life'
  gem.description           = '{wip: flavored modifications & extensions for increased quality of Ruby coding life}'
  gem.authors               = ["Uladzislau Tarsunou"]
  gem.homepage              = ruuuby_urls::URI_HOME
  gem.license               = 'MIT'
  gem.required_ruby_version = Gem::Requirement.new(">= #{ruuuby_metadata::BuiltWith::RUBY_VERSION}")
  gem.platform              = Gem::Platform.local
  gem.post_install_message  = "Gem{ruuuby, v#{gem_version.to_s}} has just been installed, cheers!"
  gem_metadata              = gem.metadata

  gem_metadata['homepage_uri']      = ruuuby_urls::URI_HOME
  gem_metadata['source_code_uri']   = ruuuby_urls::URI_GIT
  gem_metadata['changelog_uri']     = ruuuby_urls::URI_CHANGELOG
  gem_metadata['documentation_uri'] = ruuuby_urls::URI_DOCUMENTATION

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

  gem.files = Dir.glob('ext/**/*.{c,rb,h}') + Dir.glob('lib/**/*.rb')
  gem.files -= Dir.glob('lib/ide_helper.rb')
  gem.extensions << 'ext/ruby_class_mods/extconf.rb'

  ruuuby_metadata::BuiltWith::GemDependencies::Environment::Development::ALL_GEMS.each do |gem_name, gem_version|
    gem.add_development_dependency(gem_name, "~> #{gem_version}")
  end

  ruuuby_metadata::BuiltWith::GemDependencies::Environment::Runtime::ALL_GEMS.each do |gem_name, gem_version|
    gem.add_development_dependency(gem_name, "~> #{gem_version}")
    gem.add_runtime_dependency(gem_name, "~> #{gem_version}")
  end

end
