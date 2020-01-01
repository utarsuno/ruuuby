require_relative 'lib/ruuuby/version'

Gem::Specification.new do |spec|
  spec.name                  = Ruuuby.name.downcase
  spec.version               = Ruuuby::VERSION
  spec.summary               = %q{wip: increase quality of Ruby coding life}
  spec.description           = %q{wip: flavored modifications & extensions for increased quality of Ruby coding life}
  spec.authors               = ["Uladzislau Tarsunou"]
  spec.email                 = ["utarsuno@gmail.com"]
  spec.homepage              = 'https://github.com/utarsuno/ruuuby.git'
  spec.license               = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new(">= 2.7.0")
  spec.platform              = Gem::Platform.local
  spec.post_install_message  = "GEM[ruuuby-extensions] has just been installed, cheers!"
  _ = spec.metadata
  _['homepage_uri']          = "#{spec.homepage}.git"
  _['source_code_uri']       = spec.metadata['homepage_uri']
  _['source_code_uri']       = "#{spec.homepage}/master/CHANGELOG.md"
  _['changelog_uri']         = "#{spec.homepage}/master/README.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files                  = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir                = 'exe'
  spec.executables           = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths         = ['lib']
end
