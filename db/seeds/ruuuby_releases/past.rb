# encoding: UTF-8

@v0_0_00 = ::RuuubyRelease.spawn(0, 0, 0)
@v0_0_00.add_comments('initial project creation')

@v0_0_01 = ::RuuubyRelease.spawn(0, 0, 1)
@v0_0_01.add_gem('bundler', '2.1.4', 1, %w(CI), '::Bundler', '::VERSION')
@v0_0_01.add_gem('rake', '13.0.1', 1, %w(EXT), '::Rake', '::VERSION')
@v0_0_01.add_gem('rspec', '3.9.0', 1, %w(QA), '::RSpec', '::Version::STRING')
@v0_0_01.add_gem('rdoc', '6.2.1', 1, %w(DOC), '::RDoc', '::VERSION')

@v0_0_01.path_added('CHANGELOG.md', '', '', @f15)
@v0_0_01.path_added('lib/ruuuby/class/nil.rb', 'NilClass', '', @f04)
@v0_0_01.path_added('lib/ruuuby/enum/emoji.rb', '', 'Ruuuby::Enum::Emoji')
@v0_0_01.path_added('bin/audit', '', 'for running rdoc, rspecs, and coverage reports')
@v0_0_01.spawn_kclass_method(@f04, 'empty?', 'NilClass')

@v0_0_02 = ::RuuubyRelease.spawn(0, 0, 2)
@v0_0_02.spawn_kclass_method(@f06, 'bool?', 'Object')

@v0_0_03 = ::RuuubyRelease.spawn(0, 0, 3)
@v0_0_03.add_comments(
    [
        'modify `Ruuuby::Enum::Emoji` from `Strings` to `Symbols`',
        'fix gemspec to reflect correct git URLs'
    ]
)
@v0_0_03.path_added('lib/class/ary.rb', 'Array', '', [@f07, @f06])
@v0_0_03.path_added('lib/class/int.rb', 'Integer', '', @f06)
@v0_0_03.spawn_kclass_methods(@f06, 'Object', %w(int? ary?))
@v0_0_03.spawn_kclass_method(@f07, 'remove_empty!', 'Array')

@v0_0_04 = ::RuuubyRelease.spawn(0, 0, 4)
@v0_0_04.add_gem('rspec-benchmark', '0.5.1', 1, %w(QA), '::RSpec::Benchmark', '::VERSION')
#v0_0_04.add_comments('update `ruuuby.gemspec` to require ruby `2.7.0`')

@v0_0_05 = ::RuuubyRelease.spawn(0, 0, 5)
@v0_0_06 = ::RuuubyRelease.spawn(0, 0, 6)

@v0_0_07 = ::RuuubyRelease.spawn(0, 0, 7)
@v0_0_07.add_gem('rake-compiler', '1.1.0', 1, %w(EXT), nil, nil)

@v0_0_08 = ::RuuubyRelease.spawn(0, 0, 8)
@v0_0_09 = ::RuuubyRelease.spawn(0, 0, 9)
@v0_0_10 = ::RuuubyRelease.spawn(0, 0, 10)
@v0_0_11 = ::RuuubyRelease.spawn(0, 0, 11)
@v0_0_12 = ::RuuubyRelease.spawn(0, 0, 12)
@v0_0_13 = ::RuuubyRelease.spawn(0, 0, 13)

@v0_0_14 = ::RuuubyRelease.spawn(0, 0, 14)
@v0_0_14.add_gem('tty-command', '0.9.0', 3, %W(CLI), '::TTY::Command', '::VERSION')

@v0_0_15 = ::RuuubyRelease.spawn(0, 0, 15)
@v0_0_16 = ::RuuubyRelease.spawn(0, 0, 16)
@v0_0_17 = ::RuuubyRelease.spawn(0, 0, 17)

@v0_0_18 = ::RuuubyRelease.spawn(0, 0, 18)
@v0_0_18.add_comments(
    [
        'renaming existing func(`🛑str_or_ary❓`) to(`🛑countable❓`); it now checks for `Set` as well',
        'move all duplicated aliases (for playing nice with IDEs, happens from funcs created in `C-extension`) into `conditionals/ide_helper.rb`'
    ]
)
@v0_0_18.path_added('lib/ruuuby/class/io/file.rb', 'File', '', @f12)
@v0_0_18.path_added('lib/ruuuby/class/io/dir.rb', 'Dir', '', @f12)
#@v0_0_18.path_added('lib/ruuuby/types.rb', ::Ruuuby::VirtualTypes, 'adds (module-scoped) constants `🅱️`, `STRY`, `NUMS`, `COUNTABLES` ', @f06)
@v0_0_18.path_added('app/models/application_record.rb', 'ApplicationRecord', '', @f15)
@v0_0_18.path_added('app/models/ruuuby_changelog.rb', 'RuuubyChangelog', '', @f15)
@v0_0_18.path_added('app/models/ruuuby_feature.rb', 'RuuubyFeature', '', @f15)
@v0_0_18.path_added('app/models/ruuuby_release.rb', 'RuuubyRelease', '', @f15)
@v0_0_18.path_added('lib/ruuuby/class/method.rb', 'Method', '', '')
@v0_0_18.path_added('conditionals/ide_helper.rb', '', '', '')
@v0_0_18.path_added('db/db.rb', '', '', @f15)
@v0_0_18.path_added('db/seed.rb', '', '', @f15)

@v0_0_18.add_gem('sqlite3', '1.4.2', 1, %W(DB), '::SQLite3', '::VERSION')

@v0_0_18.add_gem('activerecord', '5.2.4.1', 1, %W(DB), '::ActiveRecord', '::VERSION::STRING')
@v0_0_18.spawn_kclass_methods(@f06, 'Object', %w(flt? num?))
@v0_0_18.spawn_kclass_method(@f10, '♾️?', 'Integer')
@v0_0_18.spawn_kclass_method(@f10, '♾️?', 'Numeric')
@v0_0_18.spawn_kclass_method(@f10, '🏠', 'Method')
@v0_0_18.spawn_kclass_methods(@f12, 'File', %w(∃?, dirname² dirname³))
@v0_0_18.spawn_kclass_method(@f12, '∃?', 'Dir')
@v0_0_18.spawn_kclass_methods(@f12, 'Kernel', %w(📁 📂 🗄️))

@v0_0_19 = ::RuuubyRelease.spawn(0, 0, 19)
@v0_0_19.add_comments(
    [
        "add data-validation and more narrowly define data types for `ORM`, still lots of TODOs here",
        "purge `ruuuby/version.rb` of all content except `constant String`: `VERSION` (as `ORM` functionality will cover prior needed use-cases)",
        "add missing test cases for power-operations and `Object's` funcs(`flt?`, `num?`)",
        "power-operations for `Float` moved into `ruby_class_mods.c`",
        "general improvements for performance-testing and general structuring",
        "`ruby_class_mods.c` to start using `non-ascii` based `#define` statements"
    ]
)
@v0_0_19.spawn_kclass_method(@f04, '∅?', 'File')
@v0_0_19.spawn_kclass_method(@f04, '∅?', 'Dir')
@v0_0_19.spawn_kclass_methods(@f10, 'ApplicationRecord', %w(♻️ ♻️!))
@v0_0_19.spawn_kclass_methods(@f10, 'Kernel', %w(🎲 π φ))
@v0_0_19.spawn_kclass_method(@f12, 'normalized_paths', 'Dir')
@v0_0_19.spawn_kclass_methods(@f16, 'Object', %w(⁻¹ ⁻² ⁻³ ⁻⁴ ⁻⁵ ⁻⁶ ⁻⁷ ⁻⁸ ⁻⁹))

@v0_0_20 = ::RuuubyRelease.spawn(0, 0, 20)
@v0_0_20.add_comments(
    [
        '(`f98`) add consts `RATIO_DEGREES_TO_RADIAN` and `RATIO_RADIANS_TO_DEGREE` into module `Math`',
        'power-operations for `Integer` and `Float` given support for raising from (-1)`⁻¹` to (-9)`⁻⁹`',
        'continued formatting/syntax clean-ups in `ruby_class_mods.c`'
    ]
)
@v0_0_20.path_added('lib/ruuuby/module/math.rb', 'Math', '', @f17)
@v0_0_20.path_added('help/math/automatic_differentiation.rb', '', '`Ruuuby\'s` current main focus to add functionality support to', @f19)
@v0_0_20.spawn_kclass_method(@f06, '🛑flt❓', 'Object')
@v0_0_20.spawn_kclass_method(@f17, '≈≈', 'Float')
@v0_0_20.spawn_kclass_methods(@f17, 'Kernel', %w(sin sin° cos cos° ∠ᶜ ∠°))

@v0_0_21 = ::RuuubyRelease.spawn(0, 0, 21)
@v0_0_21.path_added('bin/console_db', '', 'same as `/bin/console` but also pre-loads `db/seed.rb`', @f15)
@v0_0_21.path_added('lib/ruuuby/class/re.rb', 'Regexp', '', @f20)
#@v0_0_21.path_added('app/models/db_schema.rb', ::RuuubyDBSchema, '`temporary design`', @f15)
@v0_0_21.path_added('app/models/db_schema.rb', '', '`temporary design`', @f15)
#@v0_0_21.path_added('lib/ruuuby/module/attribute_extendable/static_attribute_syntax_cache', ::Ruuuby::StaticAttributeSyntaxCache)
@v0_0_21.add_comments(
    [
        'add const `NUCLEOTIDES` to `Ruuuby::VirtualTypes`',
        'add missing scenarios and tests for `spec/helpers/static_test_data.rb`',
        'rename m(`Module`)\'s func(`∃func?`) to(`∃⨍?`)',
        'rename m(`Module`)\'s func(`∃func_alias?`) to(`∃⨍_alias?`)',
        '(`f98`) add `global-constant`(`$PRM_MANY`), param-type checking functions expanded for multi-param check use-cases',
        'add modules `ORMAttributeUID` and `ORMAttributeCache` to `ApplicationRecord` as well as module(`Syntax`) which each `ORM Class` will also define; ⚠️: full `TDD` still omitted for `ORM` while certain design areas are more susceptible to needed refactors'
    ]
)
@v0_0_21.spawn_kclass_methods(@f06, 'Object', %w(class? module? nucleotide? 🛑ℤ❓))
@v0_0_21.spawn_kclass_methods(@f09, 'Module', %w(∋? ∌? ∈? ∉?))

@v0_0_22 = ::RuuubyRelease.spawn(0, 0, 22)
@v0_0_22.path_added('lib/ruuuby/class/sym.rb', 'Symbol', '', @f10)
@v0_0_22.path_added('lib/ruuuby/module/attribute/includable/attribute_cardinality.rb', 'Ruuuby::Attribute::Includable::Cardinality', '', @f04)
@v0_0_22.path_added('lib/ruuuby/module/attribute/includable/attribute_subscript_indexing.rb', 'Ruuuby::Attribute::Includable::SubscriptIndexing', '', @f10)
@v0_0_22.path_added('lib/ruuuby/module/attribute/includable/attribute_syntax_cache.rb', 'Ruuuby::Attribute::Includable::SyntaxCache', '', @f10)
@v0_0_22.path_added('lib/ruuuby/module/attribute/extendable/attribute_syntax_cache.rb', 'Ruuuby::Attribute::Extendable::SyntaxCache', '', @f10)
@v0_0_22.add_comments(
    [
        'continued (minor) improvements to catching bad parameters & throwing needed errors',
        '(`f98`) add func(`err_to_num`) to class(`String`) as a utility function for throwing errors',
        'start organizing groups of functions into modules labeled by their `Feature` or `Attribute` (`includable` or `extendable`)',
        'tech debt accumulation to be dealt with by `v0.1.0` to remove all `🍝 code` prior to adding support to `automatic differentiation`'
    ]
)
@v0_0_22.spawn_kclass_method(@f06, '🛑𝕌❓', 'Object')
@v0_0_22.spawn_kclass_method(@f08, 'η̂!', 'Array')
@v0_0_22.spawn_kclass_methods(@f10, 'Symbol', %w(⬇️ ⬇ 🔡 ⬆️ ⬆ 🔠))
@v0_0_22.spawn_kclass_methods(@f10, 'String', %w(⬇️ ⬇ 🔡 ⬆️ ⬆ 🔠 ⬇️ ⬇ 🔡 ⬆️ ⬆ 🔠))
@v0_0_22.spawn_kclass_method(@f10, '∀ₓᵢ', 'Enumerable')
@v0_0_22.spawn_kclass_method(@f10, 'define_singleton_⨍', 'Object')
@v0_0_22.spawn_kclass_method(@f10, '🌽_previous_⨍', 'Kernel')
@v0_0_22.spawn_kclass_methods(@f21, 'String', %w(digit? to_num to_num?))

@v0_0_23 = ::RuuubyRelease.spawn(0, 0, 23)
@v0_0_23.add_comments(
    [
        '(starting-point) add support for representing `Complex Infinity` through Symbol(`∞ℂ`)',
        'add Feature(`f03`) and Attribute(`SubscriptIndexing`) to Class(`Symbol`)',
        'add missing tests and fix bugs with c(`Object`)\'s funcs `🛑ℤ❓` and `🛑𝕌❓`',
        '`power-operations` given support for working with `infinitity values`, Class(`Rational`) given support for `superscript-power-operations`',
        'various consts defined into c(`Float`) but to soon be moved into (`f98`)'
    ]
)
@v0_0_23.spawn_kclass_methods(@f10, 'Kernel', %w(∞ℂ ∞ ¿))
@v0_0_23.spawn_kclass_methods(@f17, 'Integer', %w(¿? nan? ∞ℂ?))
@v0_0_23.spawn_kclass_methods(@f17, 'Float', %w(¿? ∞ℂ?))

@v0_0_24 = ::RuuubyRelease.spawn(0, 0, 24)
@v0_0_24.path_added('lib/ruuuby/configs.rb', '', '', @f23)
@v0_0_24.add_comments(
    [
        'ensure `Ruby` data created from `C-extensions` get safe-guarded against `garbage-collection`',
        'start utilizing configs for `Ruuuby`, especially for debugging information'
    ]
)

@v0_0_25 = ::RuuubyRelease.spawn(0, 0, 25)
@v0_0_25.path_added('lib/ruuuby/global_funcs.rb', '', '', @f15)
@v0_0_25.path_added('ext/ruby/class_mods/c0_constants.h', '', '', @f98)
@v0_0_25.path_added('ext/ruby/class_mods/c1_typed_checks.h', '', '', @f98)
@v0_0_25.path_added('ext/ruby/class_mods/c2_extension_memory.h', '', '', @f98)
@v0_0_25.path_added('ext/ruby/class_mods/c3_macro_utilities.h', '', '', @f98)
@v0_0_25.add_comments(
    [
        'start dividing (`f98`)/`C-code` across multiple header files, lots of small misc changes (ex: moved various constants definitions from `Ruby\'s` `Float`)',
        're-structure `Feature` <-> `Module` mapping, add `audit` tests to verify pattern is present/consistent',
        'move certain funcs out of `Kernel` and directly add them to `TOPLEVEL_BINDING` to avoid polluting other classes',
        '(`f00`) start formalization of existing funcs w/ name(`η̂`, `normalize`) and/or when `normalization` is applied to `args` (any context)',
        'symbolic-math support being added only for niche use-cases, `automatic-differentiation` features to take priority in case of any feature-conflicts',
    ]
)
@v0_0_25.spawn_kclass_method(@f08, '♻️until!', 'String')
@v0_0_25.spawn_kclass_method(@f10, '♻️∅!', 'Array')
@v0_0_25.spawn_kclass_method(@f10, '♻️∅!', 'Set')
@v0_0_25.spawn_kclass_methods(@f10, 'String', %w(↩️ ↩️! ↩ ↩!))
@v0_0_25.spawn_kclass_methods(@f10, 'Array', %w(↩ ↩! ↩∀))
@v0_0_25.spawn_kclass_methods(@f17, 'TOPLEVEL_BINDING', %w(tan tan°))
@v0_0_25.spawn_kclass_method(@f17, 'to_radian', 'String')

@v0_0_26 = ::RuuubyRelease.spawn(0, 0, 26)
@v0_0_26.path_added('lib/ruuuby/module/attribute/includable/notation_set_mathematics.rb', 'Ruuuby::Attribute::Includable::Notation::SetMathematics', '', @f09)
@v0_0_26.path_added('lib/ruuuby/ruuuby/ruuuby_metadata.rb', 'Ruuuby::MetaData', 'design pending')
@v0_0_26.path_removed('conditionals/ruuuby_configs.rb', 'configs not needed during runtime should be dynamically handled, not with conditionally loaded files (created explicitly for such need)')
@v0_0_26.add_comments(
    [
        'cleanup creation of function aliases (remove redundant declarations, move needed ones into `ide_helper`, and use new func{`⨍_add_aliases`} where possible)',
        'attribute-module(`Cardinality`) now auto-assigns the alias `𝔠`, this design helps with `DRY`',
        'reduce number of locations requiring manual edits when releasing version updates',
        'add normalizer_option(`:ℕ`) to func(🛑int❓)',
        'add `RSpec` section `db`, clean-up various locations where `db/seed` was loaded before'
    ]
)
@v0_0_26.spawn_kclass_method(@f10, '⨍_add_aliases', 'Module')
@v0_0_26.spawn_kclass_methods(@f10, 'Object', %w(❄ ❄?))
@v0_0_26.spawn_kclass_methods(@f12, 'File', %w(replace_expr_with replace_expr_with!))
@v0_0_26.spawn_kclass_methods(@f15, 'RuuubyRelease', %w(< > get_next_version_uid get_latest_version_uid))

@v0_0_27 = ::RuuubyRelease.spawn(0, 0, 27)
@v0_0_27.add_gem('schema_plus_foreign_keys', '0.1.8', 1, %W(DB), nil, nil)
@v0_0_27.path_added('db/seeds/git_commits.rb', '', '', @f15)
@v0_0_27.path_added('db/seeds/ruuuby_features.rb', '', '', @f15)
@v0_0_27.path_added('db/seeds/ruuuby_releases.rb', '', '', @f15)
@v0_0_27.path_added('app/models/git_commit.rb', 'GitCommit', '', @f15)
@v0_0_27.path_added('lib/ruuuby/ruuuby/ruuuby_api.rb', '', '', @f15)
@v0_0_27.path_added('lib/ruuuby/ruuuby/routine.rb', '', '', @f15)
@v0_0_27.add_comments(
    [
        'contents in `db/seed.rb` split across into files in newly created dir: `db/seeds/`; also add new `ORM: GitCommit`, one `RuuubyRelease` can map to many `GitCommits`',
        'updated version number for `README.md` and `lib/ruuuby/version.rb` is now automated',
        '(`f98`): m{`Module`}\'s func{`⨍_add_aliases`} converted to alias the func{`f_add_aliases`} created from `C-extensions`',
    ]
)
@v0_0_27.spawn_kclass_method(@f12, 'dirname⁴', 'File')

@v0_0_28 = ::RuuubyRelease.spawn(0, 0, 28)
@v0_0_28.path_added('lib/ruuuby/ruuuby/ruuuby_orm.rb', '::Ruuuby::MetaData::RuuubyORM', '', @f15)
@v0_0_28.path_added('lib/ruuuby/ruuuby/routine_cli.rb', '::Ruuuby::Routine::CommandCLI', '', @f15)
@v0_0_28.path_removed('app/models/db_schema.rb', 'seemed like a bad location')
@v0_0_28.path_removed('conditionals/ide_helper.rb', 'moved to `lib/ruuuby/ide_helper.rb`, gets excluded by `ruuuby.gemspec`')
@v0_0_28.add_comments(
    [
        '(`f15`): updating contents of `db/seeds/git_commits.rb` is now automated (starting point, LOTs of TODOs to guard against any edge case scenarios and future functionality requirements)',
        '(`f06`, `f98`): move funcs `class?`, `module?`, `nucleotide?` into `C-extensions` (also add `char?`)',
        'add `f24` as continued step in enabling textual parsing for more useful code-file automations',
        '(`f98`): add normalizers to funcs `int?` and `str?`, allows (mainly-visual) clean-up for `Ruuuby` funcs `🛑str❓` and `🛑int❓`',
        'add types to `Ruuuby::VirtualTypes`',
        'rename c(`String`)\'s func{♻️until!} to {remove_until}, add alias(`♻️⟶`); also add reverse direction w/ func{`♻️⟵`}'
    ]
)
@v0_0_28.spawn_kclass_method(@f06, 'char?', 'String')
@v0_0_28.spawn_kclass_methods(@f08, 'String', %w(upcase? ⬆️? ⬆? 🔠? downcase? ⬇️? ⬇? 🔡? ♻️⟵ ♻️⟶∞))
@v0_0_28.spawn_kclass_methods(@f24, 'String', %w(🐫? 🐍? 🐫⬇️? 🐫⬇? 🐫🔡? 🐍⬆️? 🐍⬆? 🐍🔠? to_🐫 to_🐍))

@v0_0_29 = ::RuuubyRelease.spawn(0, 0, 29)
@v0_0_29.path_added('lib/ruuuby/ruuuby/engine/ruuuby_engine.rb', '::Ruuuby::MetaData::RuuubyEngine', 'alias{`💎.engine`}', @f15)
@v0_0_29.path_added('lib/ruuuby/ruuuby/engine/ruuuby_logging.rb', '::Ruuuby::MetaData::RuuubyEngine.instance.logger', 'alias{`💎.engine.logger`}', @f15)
@v0_0_29.path_added('lib/ruuuby/ruuuby/metadata/ruuuby_metadata_constants.rb', 'Ruuuby::MetaData', '', @f15)
@v0_0_29.path_added('app/models/ruuuby_dir', 'RuuubyDir', 'directory operations specifically for `ORM` related context/use-cases', @f15)
@v0_0_29.path_added('app/models/ruuuby_file', 'RuuubyFile', 'file operations specifically for `ORM` related context/use-cases', @f15)
@v0_0_29.add_comments(
    [
        'misc cleanup for `ORM`, example: remove un-needed m(`::ApplicationRecord::ORMAttributeCache`)',
        'general cleanup for `QA`/`RSpecs`, especially w/ file loading order',
        'add initial start of `ORM` schemas `RuuubyFiles` and `RuuubyDirs`',
        'general functionality increases for `Ruuuby` `MetaData`, add global func `💎` for quicker reference',
        'add logger with output in directory{`tmp`}, file{`ruuuby.log`}'
    ]
)
@v0_0_28.spawn_kclass_method(@f04, '∅', 'Array')
@v0_0_28.spawn_kclass_method(@f06, '🛑sym❓', 'Object')
@v0_0_28.spawn_kclass_methods(@f10, 'TOPLEVEL_BINDING', %w(ℂ ℚ))
@v0_0_28.spawn_kclass_method(@f06, '💎', 'Kernel')
@v0_0_28.spawn_kclass_methods(@f10, 'Ruuuby::MetaData', %w(info debug orm paths engine))
@v0_0_28.spawn_kclass_method(@f12, 'insert_line_before_expr', 'File')

@v0_0_30 = ::RuuubyRelease.spawn(0, 0, 30)
@v0_0_30.path_added('app/model_attributes/extendable/uid.rb', '', '', @f15)
@v0_0_30.path_added('app/model_attributes/includable/uid.rb', '', '', @f15)
@v0_0_30.add_comments(
    [
        'add normalizers to `sym?`',
        'continued ORM cleanups started in `v0.0.29`',
        'add `f26` as continued step in enabling textual parsing for more useful code-file automations'
    ]
)
@v0_0_30.spawn_kclass_method(@f06, 'singleton?', 'Object')
@v0_0_30.spawn_kclass_methods(@f10, 'Object', %w(🅱? 🛑🅱❓ 🧬?))
@v0_0_30.spawn_kclass_method(@f10, 'cli', 'Ruuuby::Routine::CommandCLI')
@v0_0_30.spawn_kclass_methods(@f10, 'Module', %w(get_all_defined_modules get_all_defined_classes))
@v0_0_30.spawn_kclass_methods(@f26, 'String', %w(iso8601? to_iso8601 as_iso8601))

@v0_0_31 = ::RuuubyRelease.spawn(0, 0, 31)
@v0_0_31.path_added('lib/ruuuby/virtual/env', 'ENV', 'note: `class << ENV`', @f10)
@v0_0_31.path_added('db/seeds/ruuuby_releases/future_ruuuby_releases.rb', '', 'not currently used', @f15)
@v0_0_31.add_comments(
    [
        'remove constants needed previous for supporting exponential operations from m(`Numeric`), needed values are now dynamically generated by `C-extensions` instead of relying on pre-existing constants (created specially for just this purpose)',
        '(`f98`): lots of misc edits/clean-ups in `C-extensions`',
        'remove various un-used or now deprecated Modules such as `::Ruuuby::MetaData::Vocabulary` (was a temporary location for `normalizers`)',
        'engine/configs cleaned up and support started for dynamic multi-flag parsing for ENV_VARs',
        'automation for `db/seeds/git_commits.rb` updated to better handle scenario where release had multiple commits',
        'various modifications & additions to existing `ORM` Classes for general stability/reliability',
        'flipped functionality of String\'s funcs `to_iso8601` and `as_iso8601` to closer match function language of default `Ruby`',
    ]
)
@v0_0_31.spawn_kclass_method(@f08, 'as_utf8?', 'String')
@v0_0_31.spawn_kclass_methods(@f10, 'TOPLEVEL_BINDING', %w(¼ ½ ¾ 🌽))
@v0_0_31.spawn_kclass_method(@f12, 'insert_lines_before_expr', 'File')
@v0_0_31.spawn_kclass_methods(@f15, 'GitCommit', %w(get_latest query_get_newest_within_version))
@v0_0_31.spawn_kclass_method(@f15, 'on_before_save', 'RuuubyRelease')

#* remove the following methods/aliases:
#| (c)lass or (m)odule | methods/aliases removed |
#| ------------------- | --------------------- |
#| (c) `Symbol`   | `power?`, `pow_to_i` |

@v0_0_32 = ::RuuubyRelease.spawn(0, 0, 32)
@v0_0_32.path_added('lib/ruuuby/module/attribute/includable/singleton.rb', '::Ruuuby::Attribute::Includable::RuuubySingleton', '', @f10)
@v0_0_32.path_added('lib/ruuuby/module/attribute/extendable/singleton.rb', '::Ruuuby::Attribute::Includable::RuuubySingleton', '', @f10)
@v0_0_32.path_added('lib/ruuuby/class/proc.rb', 'Proc', '', @f10)
@v0_0_32.add_comments(
    [
        '(`f98`) add flags to the compilation and linker steps (`wip`); replace locations in `C-extensions` that were previously accessing pointers not intended to be used beyond its internal scope (internal to `Ruby`)',
        'global-func(`φ`) removed, reference replaced with(`𝚽`), a `Kernel` constant; also add the golden-angle constant(`Ⴔ`)',
        'start utilizing more generic math notation where possible, ex-func(`∀τ²∈λ𝑓₍ᵢ،ᵢ₊₁₎`), very useful as this automatically applies (for example) to both regular objects like `Array` and also `ORM` objects like `RuuubyRelease` while still applicable to both',
        '`v0.0.33` to utilize `golden-angle` as well as dramatically alter angle-trig related functions'
    ]
)
@v0_0_32.spawn_kclass_method(@f10, '∀τ²∈λ𝑓₍ᵢ،ᵢ₊₁₎', 'Enumerable')

@v0_0_33 = ::RuuubyRelease.spawn(0, 0, 33)
@v0_0_33.path_added('lib/ruuuby/class/nums/theta_angle.rb', 'ThetaAngle', '', @f27)
@v0_0_33.add_comments(
    [
        '(`f98`): create new Class(`ThetaAngle`) which is essentially a wrapper over a `C-struct`',
        'modify global-funcs `sin`, `cos`, `tan`, etc to utilize the `ThetaAngle` class',
        'added empty code file(`lib/ruuuby/class/method/math_function.rb`) for future versions',
    ]
)
@v0_0_33.spawn_kclass_methods(@f06, 'Object', %w(θ? 🛑θ❓ enumerable? 🛑enumerable❓))
@v0_0_33.spawn_kclass_methods(@f10, 'TOPLEVEL_BINDING', %w(℮ logₑ log₂ log₁₀))
@v0_0_33.spawn_kclass_method(@f17, 'pythagoras_τ³?', 'Math')
@v0_0_33.spawn_kclass_methods(@f17, 'TOPLEVEL_BINDING', %w(arcsin arccos arctan))
@v0_0_33.spawn_kclass_methods(@f27, 'TOPLEVEL_BINDING', %w(θ° θʳ θᵍ θ𝞽))

#
#* remove the following methods/aliases:
#| from       | methods/aliases removed |
#| ---------- | ----------------------- |
#| `Kernel`   | `∠ᶜ`, `∠°` |
#

@v0_0_34 = ::RuuubyRelease.spawn(0, 0, 34)
@v0_0_34.path_added('lib/ruuuby/math/set_theory/closure.rb', 'Math::SetTheory::Closure', '', @f11)
@v0_0_34.path_added('lib/ruuuby/math/set_theory/number_set.rb', 'Math::SetTheory::NumberSet', '', @f11)
@v0_0_34.path_added('lib/ruuuby/math/set_theory/discrete/algebraic_numbers.rb', 'Math::SetTheory::AlgebraicNumbers', '', @f11)
@v0_0_34.path_added('lib/ruuuby/math/set_theory/discrete/boolean_numbers.rb', 'Math::SetTheory::BooleanNumbers', '', @f11)
@v0_0_34.path_added('lib/ruuuby/math/set_theory/discrete/complex_numbers.rb', 'Math::SetTheory::ComplexNumbers', '', @f11)
@v0_0_34.path_added('lib/ruuuby/math/set_theory/discrete/empty_set.rb', 'Math::SetTheory::EmptySet', '', @f11)
@v0_0_34.path_added('lib/ruuuby/math/set_theory/discrete/imaginary_numbers.rb', 'Math::SetTheory::ImaginaryNumbers', '', @f11)
@v0_0_34.path_added('lib/ruuuby/math/set_theory/discrete/integer_numbers.rb', 'Math::SetTheory::IntegerNumbers', '', @f11)
@v0_0_34.path_added('lib/ruuuby/math/set_theory/discrete/irrational_numbers.rb', 'Math::SetTheory::IrrationalNumbers', '', @f11)
@v0_0_34.path_added('lib/ruuuby/math/set_theory/discrete/natural_numbers.rb', 'Math::SetTheory::NaturalNumbers', '', @f11)
@v0_0_34.path_added('lib/ruuuby/math/set_theory/discrete/null_set.rb', 'Math::SetTheory::NullSet', '', @f11)
@v0_0_34.path_added('lib/ruuuby/math/set_theory/discrete/rational_numbers.rb', 'Math::SetTheory::RationalNumbers', '', @f11)
@v0_0_34.path_added('lib/ruuuby/math/set_theory/discrete/real_algebraic_numbers.rb', 'Math::SetTheory::RealAlgebraicNumbers', '', @f11)
@v0_0_34.path_added('lib/ruuuby/math/set_theory/discrete/real_numbers.rb', 'Math::SetTheory::RealNumbers', '', @f11)
@v0_0_34.path_added('lib/ruuuby/math/set_theory/discrete/universal_set.rb', 'Math::SetTheory::UniversalSet', '', @f11)
@v0_0_34.path_added('lib/ruuuby/math/set_theory/discrete/whole_numbers.rb', 'Math::SetTheory::WholeNumbers', '', @f11)
@v0_0_34.path_added('app/models/ruuuby_feature_behavior.rb', '', '', @f15)
@v0_0_34.path_added('ext/ruby_class_mods/c4_theta_angle.h', '', 'for organization', @f27)
@v0_0_34.add_comments(
    [
        'increase precision of various funcs (ex: `sin²` and `cos²`), by performing calculations in `long double` instead of `double` ',
        'add `𝞽` as a \'global-const\' which is a ThetaAngle representing a single complete turn',
        'adjust parameter style of class-functions for `Math` to use named params',
        'remove global-alias-funcs{`ℂ`, `ℚ`}; these now correspond to a specific singleton instance of the newly created class(`::Math::SetTheory::NumberSet`)',
        '(`f28`): add `super golden ratio` as `Ψ`, `silver ratio` as `δ`, `plastic ratio` as `ρ`, `omega constant` as `Ω`',
        'remove various out-dated testing helper functions, meta-data generation/processing will eventually replace this',
        'remove `::Array::EMPTY_INSTANCE`, `∅` by itself now aliases a singleton of type{`NumberSet`}',
        '(`f15`): create `ORM`{`RuuubyFeatureBehavior`} which is many to one{`RuuubyFeature`}',
        'remove number-set membership check funcs from `Numerics` and create `singleton` instances of `NumberSet` which covers the previous functionality (just more scalable)',
        'remove as much deprecated code as possible, file structure adjustments started',
        '(`f98`): move `Float`\'s method{`≈≈`} into `C-extensions`',
        'remove funcs (and related ones): `🛑ℤ❓` and `🛑𝕌❓`, these checks are now covered by existing functions w/ new types of normalizers added for existing normalizer feature',
    ]
)
@v0_0_34.spawn_kclass_methods(@f06, 'Object', %w(set? 🛑set❓))
@v0_0_34.spawn_kclass_method(@f17, 'get_prime_factors', 'Integer')
@v0_0_34.spawn_kclass_methods(@f28, 'ThetaAngle', %w(windings normalize))

#* remove the following methods/aliases:
#| from       | methods/aliases removed |
#| ---------- | ----------------------- |
#| `TOPLEVEL_BINDING`   | `sin°`, `cos°`, `tan°`, etc... |
#

@v0_0_35 = ::RuuubyRelease.spawn(0, 0, 35)
@v0_0_35.add_gem('rugged', '1.0.0', 1, %W(GIT), '::Rugged', '::VERSION')
@v0_0_35.path_added('lib/math/expression/expression.rb', '', 'not currently in use', @f10)
@v0_0_35.path_added('lib/math/expression/formula.rb', '', 'not currently in use', @f10)
@v0_0_35.path_added('lib/math/space/tuple_space.rb', '', '', @f30)
@v0_0_35.path_added('lib/math/space/types_space.rb', '', '', @f30)
@v0_0_35.path_added('lib/math/space/discrete/boolean-like_space.rb', 'Math::Space::BooleanSpace', '', @f30)
@v0_0_35.path_added('lib/math/space/discrete/number-like_space.rb', 'Math::Space::NumberSpace', '', @f30)
@v0_0_35.path_added('lib/math/space/discrete/nucleotide-like_space.rb', 'Math::Space::NucleotideSpace', '', @f30)
@v0_0_35.add_comments(
    [
        'apply general clean-ups, next few versions to have similar target',
        '(`f98`): remove many function calls and variables that didn\'t need to be executed or exist; start adding extra checks via{`mkmf`} which will halt/fail even before the compilations step',
        'remove alias `🧬?`, `🧬` is now a \'global-alias\' for the singleton{`NucleotideLikeSpace`}',
        'remove alias `🅱️?`, `🛑🅱️❓`, etc; just `🅱` is now a \'global-alias\' for the single{`BooleanLikeSpace`}',
        'remove funcs{`stry?`, `countable?`} and{`🛑stry❓`, `🛑countable❓`}',
        'remove `::Ruuuby::VirtualTypes` and it\'s file',
        'remove funcs{`∃class?`, `∃module?`} from `Kernel`, functionality is now covered by singleton{`NucleotideLikeSpace`} which is aliased via{`🧬`}',
        'remove various redundant emoji aliases as the added feature{`f97`}, will enable selected character sets without the clutter of unwanted characters and aliases',
        'add more detail to various `ORM` features/funcs, documentation and TDD still intentionally not fully present for these',
        'add class `DescriptiveStandardError`',
    ]
)
@v0_0_35.spawn_kclass_methods(@f06, 'TrueClass', %w(to_i to_b))
@v0_0_35.spawn_kclass_methods(@f06, 'FalseClass', %w(to_i to_b))
@v0_0_35.spawn_kclass_method(@f10, 'μ?', 'Rational')
@v0_0_35.spawn_kclass_methods(@f24, 'String', %w(to_🐫⬇ to_🐍⬆))

@v0_0_36 = ::RuuubyRelease.spawn(0, 0, 36)
@v0_0_36.path_added('lib/math/expression/equation.rb', '', 'not currently in use', @f10)
@v0_0_36.path_added('lib/math/expression/sequence.rb', '', 'not currently in use', @f10)
@v0_0_36.path_added('lib/math/group_theory/circle_group.rb', '', 'not active yet, preparation for future versions', @f30)
@v0_0_36.path_added('lib/ruuuby/ruuuby/git_api.rb', '', '', @f31)
@v0_0_36.path_added('lib/math/number_theory/number_theory.rb', '', '', @f32)
@v0_0_36.add_comments(
    [
        'remove func{`get_prime_factors`} from `Integer`, newly created module{`Math::NumberTheory`} now offers that functionality',
        'local git-config settings are now enforced with newly created `💎.api_git`, version-automation refactorings started',
    ]
)
@v0_0_36.spawn_kclass_methods(@f32, 'Math::NumberTheory', %w(get_prime_factors get_divisors get_proper_divisors perfect_number? gcd coprime?))

@v0_0_37 = ::RuuubyRelease.spawn(0, 0, 37)
@v0_0_37.path_added('lib/virtual/f06.rb', '', '', @f06)
@v0_0_37.path_added('lib/virtual/f28.rb', '', '', @f28)
@v0_0_37.path_added('lib/math/complex_analysis/complex_analysis.rb', 'Math::ComplexAnalysis', 'not currently in use', @f30)
@v0_0_37.path_added('lib/math/trigonometry/trigonometry.rb', 'Math::Trigonometry', 'not currently in use', @f30)
@v0_0_37.path_added('lib/math/graph_theory/graph_theory.rb', 'Math::GraphTheory', 'not currently in use', @f30)
@v0_0_37.path_added('lib/math/geometry/geometry.rb', 'Math::Geometry', 'not currently in use', @f30)
@v0_0_37.path_added('lib/math/space/discrete/symbolic_numbers_space.rb', 'Math::Space::SymbolicNumbersSpace', '𝕊', @f30)
@v0_0_37.path_added('app/models/ruuuby_gem.rb', 'RuuubyGem', '', @f15)
@v0_0_37.add_comments(
    [
        'have `ORM`: `RuuubyRelease` and `GitCommit` include `Comparable`; replacing redundant funcs{`>`, `<`} to the single func{`<=>`}',
        'remove `♾️`, `¿` from all sources, textual parsing, code aliases, etc; (too redundant)',
        'remove func{∞?} from Class(`String`)',
        'add `ORM`{`RuuubyGem`}, some functionality was added; also removed runtime constants needed solely for unit-tests (these tests are now semi-generated w/ needed data)',
        'add `RSpec`/QA section for `locale` (local configs); not final design',
        '(`f22`) will now be designated for `GC` and the `GC::Profiler`, previous `f22` moved to {`f28_b12`}',
    ]
)
@v0_0_37.spawn_kclass_methods(@f06, 'Object', %w(ⓣ Ⓣ))

@v0_0_38 = RuuubyRelease.spawn(0, 0, 38)
@v0_0_38.path_added('lib/math/stats/statistical_learning.rb', 'Math::Stats::StatisticalLearning', 'not currently in use', @f30)
@v0_0_38.path_added('lib/math/stats/probability_theory.rb', 'Math::Stats::ProbabilityTheory', 'not currently in use', @f30)
@v0_0_38.path_added('lib/math/stats/descriptive_statistics.rb', 'Math::Stats::DescriptiveStatistics', 'not currently in use', @f30)
@v0_0_38.path_added('lib/math/combinatorics/combinatorics.rb', 'Math::Combinatorics', 'not currently in use', @f30)
@v0_0_38.add_comments(
    [
        '(`f98`) replace all usages of c-ext-func{`rb_eval_string`} and others that were significantly slowing down `startup/initial-load time`',
        '(`f18`) moved to {`f98_b02`}, `f18` will now cover the math module `Space`',
        'remove funcs{`class?`, `module?`, `singleton?`} from Class(`Object`); (functionality covered by `🧬`)',
        'remove func{`𝔠`} from `Kernel` (and thus remove `functional-style` support from (`f05`))',
        'track `git tags` w/ related `ORMs` & `APIs`; however, version automation tasks paused until `TDD` catches up for `DB` and/or some event/queue-based logic is added (ex: RabbitMQ)',
        'apply various misc cleanups w/ others `wip`'
    ]
)
@v0_0_38.spawn_kclass_method(@f30, '∋ˢ?', 'Math::Space::NucleotideSpace')
@v0_0_38.spawn_kclass_methods(@f31, 'Ruuuby::MetaData::GitAPI', %w(release_tags branch_names remote_release_current remote_release_previous))
@v0_0_38.spawn_kclass_methods(@f32, 'Math::NumberTheory', %w(aliquot_sum deficient? deficiency abundant? abundance abundancy_index composite?))

@v0_0_39 = RuuubyRelease.spawn(0, 0, 39)
@v0_0_39.path_added('lib/ruuuby/math/expr/seq/arithmetic', 'Math::Expr::ArithmeticSequence', '(`Ruby` version{`2.7.1`} just added `Enumerator::ArithmeticSequence`; the timing! Will be investigating before further expanding this Class)', @f10)
@v0_0_39.path_added('lib/ruuuby/math/expr/seq/geometric', 'Math::Expr::GeometricSequence', '', @f10)
@v0_0_39.path_added('lib/ruuuby/math/expr/seq/recursive', 'Math::Expr::RecursiveSequence', '', @f10)
@v0_0_39.add_gem('rubygems-update', '3.1.2', 1, %W(CI), '::Gem', '.rubygems_version.to_s')
@v0_0_39.update_gem(::RuuubyGem.find_by_name('rubygems-update'), '3.1.4')
@v0_0_39.update_gem(::RuuubyGem.find_by_name('activerecord'), '5.2.4.3')
@v0_0_39.add_comments(
    [
        'update to Ruby version{2.7.1} from{2.7.0}',
        'add `RSpec`/QA sections: `integration` & `tech_debt`',
        'add the following `Sequence` objs to `Math::NumberTheory::𝕎¹`: `seq_pronic`, `seq_square`, `seq_fibonacci`, `seq_lucas`, `seq_triangle`, `seq_hexagonal`',
        'remove some non-ASCII characters in `.h` and `.c` files to ease testing/investigation between compilers `clang` & `gcc`',
        '(`f01`, `f02`) both removed, (`f10`) now covers these scenarios w/ feature-behaviors',
        'fix typo for const{ANGLE_TAU}, it is now correctly referenced by{`𝞽`} and not{`τ`}',
        'various edge-case bugs w/ `ThetaAngle` identified, some are fixed for this version',
    ]
)
@v0_0_39.spawn_kclass_methods(@f32, 'Math::NumberTheory', %w(digit_sum digital_root additive_persistence almost_perfect? nᵗʰ_euler_totient nᵗʰ_cototient friendly?))
@v0_0_39.spawn_kclass_method(@f33, 'n_choose_k', 'Math::Combinatorics')
