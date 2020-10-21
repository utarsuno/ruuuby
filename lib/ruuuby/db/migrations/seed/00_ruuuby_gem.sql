
-- -------------------------------------------- ⚠️ --------------------------------------------
-- testing purposes
-- -------------------------------------------- ⚠️ --------------------------------------------

CALL ruuuby_gem_add('0.0.1', 'bundler', '2.1.4', true, false, '::Bundler', '::VERSION', NULL);
CALL ruuuby_gem_add('0.0.1', 'rake', '13.0.1', true, false, '::Rake', '::VERSION', NULL);
CALL ruuuby_gem_add('0.0.1', 'rspec', '3.9.0', true, false, '::Rspec', '::Version::STRING', NULL);
CALL ruuuby_gem_add('0.0.1', 'rdoc', '6.2.1', true, false, '::Rdoc', '::VERSION', NULL);

CALL ruuuby_gem_add('0.0.4', 'rspec-benchmark', '0.5.1', true, false, '::RSpec::Benchmark', '::VERSION', NULL);

CALL ruuuby_gem_add('0.0.7', 'rake-compiler', '1.1.0', true, false, NULL, NULL, NULL);

CALL ruuuby_gem_add('0.0.14', 'tty-command', '0.9.0', true, false, '::TTY::Command', '::VERSION', NULL);

CALL ruuuby_gem_add('0.0.18', 'sqlite3', '1.4.2', true, false, '::SQLite3', '::VERSION');
CALL ruuuby_gem_add('0.0.18', 'activerecord', '5.2.4.1', true, false, '::ActiveRecord', '::VERSION::STRING', NULL);

CALL ruuuby_gem_add('0.0.27', 'schema_plus_foreign_keys', '0.1.8', true, false, NULL, NULL, NULL);

CALL ruuuby_gem_add('0.0.35', 'rugged', '1.0.0', true, false, '::Rugged', '::VERSION', NULL);

CALL ruuuby_gem_add('0.0.39', 'rubygems-update', '3.1.2', false, false, '::Gem', '.rubygems_version.to_s', NULL);
CALL ruuuby_gem_update('0.0.39', 'rubygems-update', '3.1.4');
CALL ruuuby_gem_update('0.0.39', 'activerecord', '5.2.4.3');

CALL ruuuby_gem_update('0.0.44', 'rugged', '1.0.1');
CALL ruuuby_gem_update('0.0.44', 'rspec-benchmark', '0.6.0');

CALL ruuuby_gem_update('0.0.45', 'bundler', '2.2.0.rc.1');

CALL ruuuby_gem_update('0.0.47', 'rake-compiler', '1.1.1');
CALL ruuuby_gem_update('0.0.47', 'rubygems-update', '3.2.0.rc.1');

CALL ruuuby_gem_add('0.0.48', 'pg', '1.2.3', true, false, '::PG', '::VERSION', NULL);
CALL ruuuby_gem_add('0.0.48', 'docker-api', '1.34.2', true, false, '::Docker', '::VERSION', NULL);

CALL ruuuby_gem_update('0.0.49', 'docker-api', '2.0.0.pre.1');

CALL ruuuby_gem_update('0.1.0.pre.0', 'docker-api', '2.0.0');
CALL ruuuby_gem_add('0.1.0.pre.0',    'bunny', '2.17.0', true, false, '::Bunny', '::VERSION', NULL);
CALL ruuuby_gem_add('0.1.0.pre.0',    'finite_machine', '0.14.0', true, true, '::FiniteMachine', '::VERSION', NULL);

CALL ruuuby_gem_remove('0.1.0.pre.0', 'bundler');
CALL ruuuby_gem_remove('0.1.0.pre.0', 'rubygems-update');

CALL ruuuby_gem_remove('0.1.0.pre.0', 'rugged');
CALL ruuuby_gem_remove('0.1.0.pre.0', 'schema_plus_foreign_keys');
CALL ruuuby_gem_remove('0.1.0.pre.0', 'sqlite3');
