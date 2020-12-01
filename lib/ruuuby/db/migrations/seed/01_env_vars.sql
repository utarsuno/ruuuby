--() { :; }; exec psql -f "$0"

-- -------------------------------------------- ⚠️ --------------------------------------------
-- testing purposes
-- -------------------------------------------- ⚠️ --------------------------------------------

BEGIN TRANSACTION;

INSERT INTO env_var_tiers
    (the_desc,tier_err_if_missing,tier_optional,tier_ignore,tier_err_if_present)
VALUES
    ('tier_err_if_missing',TRUE,FALSE,FALSE,FALSE),
    ('tier_optional',FALSE,TRUE,FALSE,FALSE),
    ('tier_ignore',FALSE,FALSE,TRUE,FALSE),
    ('tier_err_if_present',FALSE,FALSE,FALSE,TRUE);

INSERT INTO env_var_groups (group_name) VALUES
    ('rbenv'),
    ('ruuuby_compiling'),
    ('brew'),
    ('docker');

-- ---------------------------------------------------------------------------------------------------------------------
-- @see https://github.com/rbenv/rbenv
--CALL env_var_add('rbenv', 'tier_err_if_present', 'RBENV_VERSION', 'specifies version of Ruby to be used, overrides global & application-specific version');
--CALL env_var_add('rbenv', 'tier_err_if_missing', 'RBENV_ROOT',    'specifies location for Ruby versions and shims');
--CALL env_var_add('rbenv', 'tier_optional',       'RBENV_DEBUG',   'add verbose debug info');

-- TODO: look into utilizing
--CALL env_var_add('rbenv', 'tier_optional',       'RBENV_HOOK_PATH', 'list of paths searched against for rbenv hooks');
--CALL env_var_add('rbenv', 'tier_err_if_present', 'RBENV_DIR',       'directory starting path to search for `.ruby-version` files');
-- ---------------------------------------------------------------------------------------------------------------------

--CALL env_var_add('ruuuby_compiling', 'ARCHFLAGS', 'specifies the OS architecture to compile/run for');

-- TODO: add tests ensuring these have an effect (for 3.0.0preview1 specifically)
--CALL env_var_add('ruuuby_compiling', 'RUBY_GC_HEAP_INIT_SLOTS', '');
--CALL env_var_add('ruuuby_compiling', 'RUBY_GC_HEAP_FREE_SLOTS', '');
--CALL env_var_add('ruuuby_compiling', 'RUBY_GC_HEAP_GROWTH_FACTOR', '');
--CALL env_var_add('ruuuby_compiling', 'RUBY_GC_HEAP_GROWTH_MAX_SLOTS', '');
--CALL env_var_add('ruuuby_compiling', 'RUBY_GC_HEAP_FREE_SLOTS_MIN_RATIO', '');
--CALL env_var_add('ruuuby_compiling', 'RUBY_GC_HEAP_FREE_SLOTS_MAX_RATIO', '');
--CALL env_var_add('ruuuby_compiling', 'RUBY_GC_MALLOC_LIMIT_MAX', '');

--CALL env_var_add('brew', 'HOMEBREW_NO_ANALYTICS', 'toggle for homebrew analytics');

--CALL env_var_add('docker', 'DOCKER_API_VERSION', '');
--CALL env_var_add('docker', 'COMPOSE_API_VERSION', '');
--CALL env_var_add('docker', 'COMPOSE_CONVERT_WINDOWS_PATHS', '');
--CALL env_var_add('docker', 'COMPOSE_FORCE_WINDOWS_HOST', '');
--CALL env_var_add('docker', 'COMPOSE_PATH_SEPARATOR', '');
--CALL env_var_add('docker', 'COMPOSE_PROJECT_NAME', '');

COMMIT TRANSACTION
