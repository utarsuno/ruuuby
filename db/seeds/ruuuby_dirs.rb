# encoding: UTF-8

dir_base                   = ::RuuubyDir.spawn(💎.engine.path_base, 'ruuuby', false)
@dir_ext                   = dir_base.spawn_dir('ext/', 'ext', false)
@dir_ext_ruby_class_mods   = @dir_ext.spawn_dir('ruby_class_mods/', 'ruby_class_mods', false)
@dir_db                    = dir_base.spawn_dir('db/', 'db', false)
@dir_seeds                 = @dir_db.spawn_dir('seeds/', 'seeds', false)
@dir_seeds_ruuuby_releases = @dir_seeds.spawn_dir('ruuuby_releases/', 'ruuuby_releases', false)
@ruuuby_file_version        = dir_base.spawn_file('.ruby-version', 'ruby-version', '.ruby-version', false)
dir_base.spawn_file('.gitignore', 'gitignore', '', false)
dir_base.spawn_file('.gitattributes', 'gitattributes', '', false)
@ruuuby_gemspec            = dir_base.spawn_file('ruuuby.gemspec', 'ruuuby', '.gemspec', false)
dir_base.spawn_file('Rakefile', 'Rakefile', '', false)
dir_base.spawn_file('Gemfile', 'Gemfile', '', false)
@ruuuby_readme             = dir_base.spawn_file('README.md', 'README', '.md', false)

@ruuuby_gemspec.define_singleton_method(:generate_source) do
  spacing          = "\t"
  divider          = "#{spacing}# ╠═════════════════════════════════════════════════════════════════════════════╣\n"
  gemspec_var      = 'gem'
  gems_development = ''
  gems_runtime     = ''
  gems_misc        = ''
  output           = "#{spacing}# ╔═════════════════════════════════════════════════════════════════════════════╗\n"
  needed_len       = output.length
  output           += "#{spacing}# ║ 0x0) ./bin/console_db  ║ 0x1) puts @ruuuby_gemspec.generate_source          ║\n"
  output           += "#{spacing}# ╠═════════════════════════════════════════════════════════════════════════════╣\n"
  ::RuuubyGem.all.each do |g|
    if g.name == 'rubygems-update'
      gem_misc = "#{spacing}#{gemspec_var}.installed_by_version = '#{g.version_current.to_s}'"
      while gem_misc.length < needed_len - 3
        gem_misc += ' '
      end
      gem_misc  += "#║\n"
      gems_misc += gem_misc
    end
    if g.is_development
      gem_dev = "#{spacing}#{gemspec_var}.add_development_dependency(#{g.name.to_sym.as_source_ruby}, '~> #{g.version_current.to_s}')"
      while gem_dev.length < needed_len - 3
        gem_dev += ' '
      end
      gem_dev += "#║\n"
      gems_development += gem_dev
    end
    if g.is_runtime
      gem_runtime = "#{spacing}#{gemspec_var}.add_runtime_dependency(#{g.name.to_sym.as_source_ruby}, '~> #{g.version_current.to_s}')"
      while gem_runtime.length < needed_len - 3
        gem_runtime += ' '
      end
      gem_runtime  += "#║\n"
      gems_runtime += gem_runtime
    end
  end
  output += gems_development
  output += divider
  output += gems_runtime
  output += divider
  output += gems_misc
  output += "#{spacing}# ╚═════════════════════════════════════════════════════════════════════════════╝\n"
  output
end

@ruuuby_file_version.define_singleton_method(:generate_source) do
  "#{RUBY_VERSION}\n"
end

💎.engine.orm.ruuuby_file_version=@ruuuby_file_version
