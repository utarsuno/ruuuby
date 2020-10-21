# encoding: UTF-8

dir_base                   = ::RuuubyDir.spawn(💎.engine.path_base, 'ruuuby', false)
@dir_ext                   = dir_base.spawn_dir('ext/', 'ext', false)
@dir_ext_ruby_class_mods   = @dir_ext.spawn_dir('ruby_class_mods/', 'ruby_class_mods', false)
@dir_db                    = dir_base.spawn_dir('db/', 'db', false)
@dir_seeds                 = @dir_db.spawn_dir('seeds/', 'seeds', false)
@dir_seeds_ruuuby_releases = @dir_seeds.spawn_dir('ruuuby_releases/', 'ruuuby_releases', false)
dir_base.spawn_file('.gitignore', 'gitignore', '', false)
dir_base.spawn_file('.gitattributes', 'gitattributes', '', false)
@ruuuby_gemspec            = dir_base.spawn_file('ruuuby.gemspec', 'ruuuby', '.gemspec', false)
dir_base.spawn_file('Rakefile', 'Rakefile', '', false)
dir_base.spawn_file('Gemfile', 'Gemfile', '', false)
@ruuuby_readme             = dir_base.spawn_file('README.md', 'README', '.md', false)
