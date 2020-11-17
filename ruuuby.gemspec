# encoding: UTF-8

::Gem::Specification.new do |gem|
  require_relative 'lib/ruuuby/version'

  gem.name                      = 'ruuuby'
  gem.version                   = ::Ruuuby::VERSION
  gem.summary                   = 'migration wip'
  gem.description               = 'migration wip'
  gem.authors                   = ["Uladzislau Tarsunou"]
  gem.homepage                  = 'https://github.com/utarsuno/ruuuby'
  gem.license                   = 'MIT'
  gem.required_ruby_version     = ">= #{::Ruuuby::VERSION_RUBY}"
  gem.required_rubygems_version = ">= #{::Ruuuby::VERSION_BUNDLER}"
  gem.installed_by_version      = ::Ruuuby::VERSION_BUNDLER

  gem.platform                  = ::Gem::Platform.local
  gem.post_install_message      = "Gem{ruuuby, v#{::Ruuuby::VERSION}} has just been installed, cheers!"
  _md                           = gem.metadata
  _md['homepage_uri']           = gem.homepage
  #_md['source_code_uri']        = "#{gem.homepage}.git"
  _md['source_code_uri']        = "#{gem.homepage}/tree/v#{::Ruuuby::VERSION}"
  _md['changelog_uri']          = "https://raw.githubusercontent.com/utarsuno/ruuuby/master/History.txt"
  _md['documentation_uri']      = gem.homepage

  gem.requirements              = [
      'mac or Linux based OS',
      'C-compiler',
      '(atm) building gem requires working from git code source, not just gem',
  ]
  gem.bindir                    = 'bin'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  #gem.files                  = Dir.chdir(File.expand_path('..', __FILE__)) do
  #  `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  #end

  #gem.test_files    = Dir.glob('spec/**/*.rb')
  #gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})

  gem.require_paths = %w(lib ext)
  gem.rdoc_options  = %w(-x ext --main README.rdoc)
  gem.files          = ::Dir.glob('ext/**/*.{c,rb,h}') + ::Dir.glob('lib/**/*.{rb}')
  gem.extensions    = %w(ext/ruby_class_mods/extconf.rb)

  gem.add_development_dependency(:bunny, '~> 2.17.0')
  gem.add_development_dependency(:rake, '~> 13.0.1')
  gem.add_development_dependency(:rspec, '~> 3.10.0')
  gem.add_development_dependency(:rdoc, '~> 6.2.1')
  gem.add_development_dependency(:'docker-api', '~> 2.0.0')
  gem.add_development_dependency(:'rspec-benchmark', '~> 0.6.0')
  gem.add_development_dependency(:'rake-compiler', '~> 1.1.1')
  gem.add_development_dependency(:'tty-command', '~> 0.10.0')
  gem.add_development_dependency(:finite_machine, '~> 0.14.0')
  gem.add_development_dependency(:pg, '~> 1.2.3')
  gem.add_development_dependency(:activerecord, '~> 6.1.0.rc1')

  gem.add_development_dependency(:open3, '~> 0.1.0')

  gem.add_runtime_dependency(:'tty-command', '~> 0.10.0')
  gem.add_runtime_dependency(:finite_machine, '~> 0.14.0')
end
