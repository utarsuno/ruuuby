--() { :; }; exec psql -f "$0"

-- -------------------------------------------- ⚠️ --------------------------------------------
-- testing purposes
-- -------------------------------------------- ⚠️ --------------------------------------------

BEGIN TRANSACTION;

--             ___
--            /\_ \
--  _ __    __\//\ \      __     __      ____     __    ____
-- /\`'__\/'__`\\ \ \   /'__`\ /'__`\   /',__\  /'__`\ /',__\
-- \ \ \//\  __/ \_\ \_/\  __//\ \L\.\_/\__, `\/\  __//\__, `\
--  \ \_\\ \____\/\____\ \____\ \__/.\_\/\____/\ \____\/\____/
--   \/_/ \/____/\/____/\/____/\/__/\/_/\/___/  \/____/\/___/

CALL ruuuby_release_add('0.0.0');
CALL ruuuby_release_add('0.0.1');
CALL ruuuby_release_add('0.0.2');
CALL ruuuby_release_add('0.0.3');
CALL ruuuby_release_add('0.0.4');
CALL ruuuby_release_add('0.0.5');
CALL ruuuby_release_add('0.0.6');
CALL ruuuby_release_add('0.0.7');
CALL ruuuby_release_add('0.0.8');
CALL ruuuby_release_add('0.0.9');
CALL ruuuby_release_add('0.0.10');
CALL ruuuby_release_add('0.0.11');
CALL ruuuby_release_add('0.0.12');
CALL ruuuby_release_add('0.0.13');
CALL ruuuby_release_add('0.0.14');
CALL ruuuby_release_add('0.0.15');
CALL ruuuby_release_add('0.0.16');
CALL ruuuby_release_add('0.0.17');
CALL ruuuby_release_add('0.0.18');
CALL ruuuby_release_add('0.0.19');
CALL ruuuby_release_add('0.0.20');
CALL ruuuby_release_add('0.0.21');
CALL ruuuby_release_add('0.0.22');
CALL ruuuby_release_add('0.0.23');
CALL ruuuby_release_add('0.0.24');
CALL ruuuby_release_add('0.0.25');
CALL ruuuby_release_add('0.0.26');
CALL ruuuby_release_add('0.0.27');
CALL ruuuby_release_add('0.0.28');
CALL ruuuby_release_add('0.0.29');
CALL ruuuby_release_add('0.0.30');
CALL ruuuby_release_add('0.0.31');
CALL ruuuby_release_add('0.0.32');
CALL ruuuby_release_add('0.0.33');
CALL ruuuby_release_add('0.0.34');
CALL ruuuby_release_add('0.0.35');
CALL ruuuby_release_add('0.0.36');
CALL ruuuby_release_add('0.0.37');
CALL ruuuby_release_add('0.0.38');
CALL ruuuby_release_add('0.0.39');
CALL ruuuby_release_add('0.0.40');
CALL ruuuby_release_add('0.0.41');
CALL ruuuby_release_add('0.0.42');
CALL ruuuby_release_add('0.0.43');
CALL ruuuby_release_add('0.0.44');
CALL ruuuby_release_add('0.0.45');
CALL ruuuby_release_add('0.0.46');
CALL ruuuby_release_add('0.0.47');
CALL ruuuby_release_add('0.0.48');
CALL ruuuby_release_add('0.0.49');
CALL ruuuby_release_add('0.1.0.pre.0');
CALL ruuuby_release_add('0.1.0.pre.1');
CALL ruuuby_release_add('0.1.0.pre.2');
CALL ruuuby_release_add('0.1.0.pre.3');

--76.20%  Ruby
--16.06%  C
--3.85%   JavaScript
--1.84%   Dockerfile
--1.77%   SQL
--0.18%   Shell
--0.05%   HTML
--0.04%   CSS
CALL ruuuby_release_add('0.1.0.pre.4');

-- TODO: @see https://github.com/rbenv/rbenv/wiki/Authoring-plugins#rbenv-hooks
-- TODO: @see https://githooks.com/
-- TODO: @see https://medium.com/@sairamkrish/git-branching-strategy-for-true-continuous-delivery-eade4435b57e
-- TODO: @see https://proandroiddev.com/how-to-set-up-an-efficient-development-workflow-with-git-and-ci-cd-5e8916f6bece
--CALL ruuuby_release_add('0.1.0.pre.5');

--    ___                __
--  /'___\              /\ \__
-- /\ \__/   __     __  \ \ ,_\  __  __  _ __    __    ____
-- \ \ ,__\/'__`\ /'__`\ \ \ \/ /\ \/\ \/\`'__\/'__`\ /',__\
--  \ \ \_/\  __//\ \L\.\_\ \ \_\ \ \_\ \ \ \//\  __//\__, `\
--   \ \_\\ \____\ \__/.\_\\ \__\\ \____/\ \_\\ \____\/\____/
--    \/_/ \/____/\/__/\/_/ \/__/ \/___/  \/_/ \/____/\/___/

CALL ruuuby_feature_add(0::smallint, FALSE, 'utilize non-ascii to enable quicker to read code');

CALL ruuuby_feature_add(40::smallint, TRUE, 'provide an `API` for `Docker` operations w/ a light layer over gem{`docker-api`}');
CALL ruuuby_feature_add(41::smallint, TRUE, 'provide an `API` for `Brew` operations');
CALL ruuuby_feature_add(42::smallint, TRUE, 'provide an `API` for `RabbitMQ` operations w/ a light layer over gem{`bunny`}');
CALL ruuuby_feature_add(43::smallint, TRUE, 'provide an `API` for `Iconv`');
CALL ruuuby_feature_add(44::smallint, TRUE, 'provide an `API` for `ZSH`');
CALL ruuuby_feature_add(46::smallint, TRUE, 'provide an `API` for `Bundler`');
CALL ruuuby_feature_add(47::smallint, TRUE, 'provide an `API` for `Gem`');

CALL ruuuby_feature_add(92::smallint, TRUE, 'enable building with specific DB support loaded');
CALL ruuuby_feature_add(93::smallint, TRUE, 'offer help in managing custom scripts, functionality, and anything else needed for too niche of scenarios to consider adding as a feature or even a conditionally-loadable feature');
CALL ruuuby_feature_add(94::smallint, TRUE, 'enable a `WebAssembly` based build (for `JS`/`WebGL`)');
CALL ruuuby_feature_add(95::smallint, TRUE, 'enable a pure `Ruby` only build');
CALL ruuuby_feature_add(96::smallint, TRUE, 'support multiple Operation Systems');
CALL ruuuby_feature_add(97::smallint, TRUE, 'offer custom builds of `Ruuuby` to support only the needed/wanted unicode/symbols/emojis etc');
CALL ruuuby_feature_add(98::smallint, FALSE, '`C-extensions`');

--  __              __
-- /\ \            /\ \                         __
-- \ \ \____     __\ \ \___      __     __  __ /\_\    ___   _ __   ____
--  \ \ '__`\  /'__`\ \  _ `\  /'__`\  /\ \/\ \\/\ \  / __`\/\`'__\/',__\
--   \ \ \L\ \/\  __/\ \ \ \ \/\ \L\.\_\ \ \_/ |\ \ \/\ \L\ \ \ \//\__, `\
--    \ \_,__/\ \____\\ \_\ \_\ \__/.\_\\ \___/  \ \_\ \____/\ \_\\/\____/
--     \/___/  \/____/ \/_/\/_/\/__/\/_/ \/__/    \/_/\/___/  \/_/ \/___/

CALL ruuuby_feature_behavior_add(0::smallint, 0::smallint, FALSE, '`η̂` to alias concept of `normalization`');
CALL ruuuby_feature_behavior_add(0::smallint, 1::smallint, FALSE, '`∅` to alias concept of `empty`');
CALL ruuuby_feature_behavior_add(0::smallint, 2::smallint, FALSE, '`∃` to alias concept of `does this(arg) exist?` and `∄` for inverse meaning');
CALL ruuuby_feature_behavior_add(0::smallint, 3::smallint, FALSE, '`𝔠` to alias concept of `cardinality`');
CALL ruuuby_feature_behavior_add(0::smallint, 4::smallint, TRUE, '`📅` to alias Class{`Date`}, `🕒` for{`🕒`}, and `📅🕒` for{`DateTime`}');
CALL ruuuby_feature_behavior_add(0::smallint, 5::smallint, TRUE, '`📁` to alias Class{`File`} and `🗄️` for{`Dir`}');

CALL ruuuby_feature_behavior_add(1::smallint, 0::smallint, TRUE, 'supports mode: none (empty methods called for logging)');
CALL ruuuby_feature_behavior_add(1::smallint, 1::smallint, TRUE, 'supports mode: stdout (log to console)');
CALL ruuuby_feature_behavior_add(1::smallint, 2::smallint, TRUE, 'supports mode: stderr (log only errors to console)');
CALL ruuuby_feature_behavior_add(1::smallint, 3::smallint, TRUE, 'supports mode: file (standard Ruby log file logging)');
CALL ruuuby_feature_behavior_add(1::smallint, 4::smallint, TRUE, 'supports setting the logging level');
CALL ruuuby_feature_behavior_add(1::smallint, 5::smallint, TRUE, 'supports running a hybrid of logging modes');

CALL ruuuby_feature_behavior_add(92::smallint, 0::smallint, TRUE, 'enable support for ActiveRecord');
CALL ruuuby_feature_behavior_add(92::smallint, 1::smallint, TRUE, 'enable support for pg for PostgreSQL');

-- TODO: refactor-ish
CALL ruuuby_feature_behavior_add(98::smallint, 0::smallint, FALSE, 'dynamically add `macros` w/ `mkmf` in order to (during pre-processing) include/exclude feature-code to be compiled w/ or w/o');
CALL ruuuby_feature_behavior_add(98::smallint, 1::smallint, FALSE, 'offer (to `Ruuuby`) access to `C` math functions, especially those involving higher precision');
CALL ruuuby_feature_behavior_add(98::smallint, 2::smallint, FALSE, 'simplify import/require statements & setup as much as possible');
-- | f98 | OpenAI | https://github.blog/2020-07-27-introducing-githubs-openapi-description/                       |
-- | f98 | OpenAI | https://github.com/OAI/OpenAPI-Specification                                                   |
-- | f98 | WebGL  | https://webgl2fundamentals.org/webgl/lessons/webgl-anti-patterns.html                         |
-- | f98 | WebGL  | https://support.apple.com/en-us/HT202823                                                      |
-- | f98 | WebGL  | https://stackoverflow.com/questions/6432838/what-is-the-correct-file-extension-for-glsl-shaders |

--    __      __    ___ ___     ____
--  /'_ `\  /'__`\/' __` __`\  /',__\
-- /\ \L\ \/\  __//\ \/\ \/\ \/\__, `\
-- \ \____ \ \____\ \_\ \_\ \_\/\____/
--  \/___L\ \/____/\/_/\/_/\/_/\/___/
--    /\____/
--    \_/__/

CALL ruuuby_gem_add_recommended('0.0.1', 'bundler', '2.1.4', '::Bundler', '::VERSION', NULL);
CALL ruuuby_gem_add_dev('0.0.1', 'rake', '13.0.1', '::Rake', '::VERSION', NULL);
CALL ruuuby_gem_add_dev('0.0.1', 'rspec', '3.9.0', '::Rspec', '::Version::STRING', NULL);
CALL ruuuby_gem_add_dev('0.0.1', 'rdoc', '6.2.1', '::Rdoc', '::VERSION', NULL);

CALL ruuuby_gem_add_dev('0.0.4', 'rspec-benchmark', '0.5.1', '::RSpec::Benchmark', '::VERSION', NULL);

CALL ruuuby_gem_add_dev('0.0.7', 'rake-compiler', '1.1.0', NULL, NULL, NULL);

CALL ruuuby_gem_add_prod('0.0.14', 'tty-command', '0.9.0', '::TTY::Command', '::VERSION', NULL);

CALL ruuuby_gem_add_dev('0.0.18', 'sqlite3', '1.4.2', '::SQLite3', '::VERSION');
CALL ruuuby_gem_add_dev('0.0.18', 'activerecord', '5.2.4.1', '::ActiveRecord', '::VERSION::STRING', NULL);

CALL ruuuby_gem_add_dev('0.0.27', 'schema_plus_foreign_keys', '0.1.8', NULL, NULL, NULL);

CALL ruuuby_gem_add_dev('0.0.35', 'rugged', '1.0.0', '::Rugged', '::VERSION', NULL);

CALL ruuuby_gem_add_recommended('0.0.39', 'rubygems-update', '3.1.2', '::Gem', '.rubygems_version.to_s', NULL);
CALL ruuuby_gem_update('0.0.39', 'rubygems-update', '3.1.4');
CALL ruuuby_gem_update('0.0.39', 'activerecord', '5.2.4.3');

CALL ruuuby_gem_update('0.0.44', 'rugged', '1.0.1');
CALL ruuuby_gem_update('0.0.44', 'rspec-benchmark', '0.6.0');

CALL ruuuby_gem_update('0.0.45', 'bundler', '2.2.0.rc.1');

CALL ruuuby_gem_update('0.0.47', 'rake-compiler', '1.1.1');
CALL ruuuby_gem_update('0.0.47', 'rubygems-update', '3.2.0.rc.1');

CALL ruuuby_gem_add_dev('0.0.48', 'pg', '1.2.3', '::PG', '::VERSION', NULL);
CALL ruuuby_gem_add_dev('0.0.48', 'docker-api', '1.34.2', '::Docker', '::VERSION', NULL);

CALL ruuuby_gem_update('0.0.49', 'docker-api', '2.0.0.pre.1');

CALL ruuuby_gem_update('0.1.0.pre.0', 'docker-api', '2.0.0');
CALL ruuuby_gem_add_dev('0.1.0.pre.0', 'bunny', '2.17.0', '::Bunny', '::VERSION', NULL);
CALL ruuuby_gem_add_prod('0.1.0.pre.0', 'finite_machine', '0.14.0', '::FiniteMachine', '::VERSION', NULL);

CALL ruuuby_gem_update('0.1.0.pre.0', 'rubygems-update', '3.2.0.rc.2');

CALL ruuuby_gem_remove('0.1.0.pre.0', 'rugged');
CALL ruuuby_gem_remove('0.1.0.pre.0', 'schema_plus_foreign_keys');
CALL ruuuby_gem_remove('0.1.0.pre.0', 'sqlite3');
CALL ruuuby_gem_update('0.1.0.pre.0', 'activerecord', '6.0.3.4');

CALL ruuuby_gem_update('0.1.0.pre.1', 'tty-command', '0.10.0');
CALL ruuuby_gem_update('0.1.0.pre.1', 'rspec', '3.10.0');

CALL ruuuby_gem_update('0.1.0.pre.2', 'activerecord', '6.1.0.rc1');

CALL ruuuby_gem_add_dev('0.1.0.pre.3', 'open3', '0.1.0');

CALL ruuuby_gem_update('0.1.0.pre.4', 'activerecord', '6.0.3.4');
CALL ruuuby_gem_add_recommended('0.1.0.pre.4', 'keycutter', '1.0.2', '::Keycutter', '::VERSION', NULL);
CALL ruuuby_gem_add_recommended('0.1.0.pre.4', 'github-linguist', '7.12.0', '::Linguist', '::VERSION', NULL);
CALL ruuuby_gem_add_recommended('0.1.0.pre.4', 'rails', '6.0.3.4', '::Rails', '.version', NULL);

-- ---------------------------------------------------------------------------------------------------------------------

COMMIT TRANSACTION;
