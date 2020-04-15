
@v0_0_0 = RuuubyRelease.spawn(0, 0, 0)
@v0_0_0.add_comments('initial project creation')

@v0_0_1 = RuuubyRelease.spawn(0, 0, 1)
@v0_0_1.add_file('CHANGELOG.md')
@v0_0_1.add_file('lib/ruuuby/class/nil.rb', ::NilClass, '', @f04)
@v0_0_1.add_file('lib/ruuuby/enum/emoji.rb', '', 'Ruuuby::Enum::Emoji')
@v0_0_1.add_file('bin/audit', '', 'for running rdoc, rspecs, and coverage reports')
@v0_0_1.changelog.added_method_to_class(@f04, :empty?, ::NilClass)

@v0_0_2 = RuuubyRelease.spawn(0, 0, 2)
@v0_0_2.changelog.added_method_to_class(@f06, :bool?, ::Object)

@v0_0_3 = RuuubyRelease.spawn(0, 0, 3)
@v0_0_3.add_comments(
    [
        'modify `Ruuuby::Enum::Emoji` from `Strings` to `Symbols`',
        'fix gemspec to reflect correct git URLs'
    ]
)
@v0_0_3.add_file('lib/class/ary.rb', ::Array, '', [@f07, @f06])
@v0_0_3.add_file('lib/class/int.rb', ::Integer, '', @f06)
@v0_0_3.changelog.added_method_to_class(@f06, :int?, ::Object)
@v0_0_3.changelog.added_method_to_class(@f06, :ary?, ::Object)
@v0_0_3.changelog.added_method_to_class(@f07, :remove_empty!, ::Array)

#v0_0_4 = RuuubyRelease.spawn(0, 0, 4)
#v0_0_4.add_gem('rspec-benchmark', '0.5.1')
#v0_0_4.add_comments('update `ruuuby.gemspec` to require ruby `2.7.0`')

@v0_0_18 = RuuubyRelease.spawn(0, 0, 18)
@v0_0_18.add_comments(
    [
        'renaming existing func(`🛑str_or_ary❓`) to(`🛑countable❓`); it now checks for `Set` as well',
        'move all duplicated aliases (for playing nice with IDEs, happens from funcs created in `C-extension`) into `conditionals/ide_helper.rb`'
    ]
)
@v0_0_18.add_file('lib/ruuuby/class/io/file.rb', ::File, '', @f12)
@v0_0_18.add_file('lib/ruuuby/class/io/dir.rb', ::Dir, '', @f12)
@v0_0_18.add_file('lib/ruuuby/types.rb', ::Ruuuby::VirtualTypes, 'adds (module-scoped) constants `🅱️`, `STRY`, `NUMS`, `COUNTABLES` ', @f06)
@v0_0_18.add_file('app/models/application_record.rb', ::ApplicationRecord, '', @f15)
@v0_0_18.add_file('app/models/ruuuby_changelog.rb', ::RuuubyChangelog, '', @f15)
@v0_0_18.add_file('app/models/ruuuby_feature.rb', ::RuuubyFeature, '', @f15)
@v0_0_18.add_file('app/models/ruuuby_release.rb', ::RuuubyRelease, '', @f15)
@v0_0_18.add_file('lib/ruuuby/class/method.rb', ::Method, '', '')
@v0_0_18.add_file('conditionals/ide_helper.rb', '', '', '')
@v0_0_18.add_file('db/db.rb', '', '', @f15)
@v0_0_18.add_file('db/seed.rb', '', '', @f15)

@v0_0_18.add_gem('sqlite3', '1.4.2')
@v0_0_18.add_gem('activerecord', '5.2.4.1')
@v0_0_18.changelog.added_methods_to_class(@f12,
                                         [
                                             [:∃?, ::File],
                                             [:∃?, ::Dir],
                                             [:dirname², :dirname³, ::File],
                                             [:📁, ::Kernel],
                                             [:📂, ::Kernel],
                                             [:🗄️, ::Kernel],
                                         ]
)
@v0_0_18.changelog.added_methods_to_class(@f06, [[:flt?, ::Object], [:num?, ::Object]])
@v0_0_18.changelog.added_methods_to_class(@f11, [[:♾️?, ::Integer], [:♾️?, ::Numeric]])
@v0_0_18.changelog.added_method_to_class(@f10, :🏠, ::Method)


@v0_0_19 = RuuubyRelease.spawn(0, 0, 19)
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
@v0_0_19.changelog.added_method_to_class(@f04, :∅?, ::File)
@v0_0_19.changelog.added_method_to_class(@f04, :∅?, ::Dir)
@v0_0_19.changelog.added_method_to_class(@f10, :♻️, ::ApplicationRecord)
@v0_0_19.changelog.added_method_to_class(@f10, :♻️!, ::ApplicationRecord)
@v0_0_19.changelog.added_method_to_class(@f10, :🎲, ::Kernel)
@v0_0_19.changelog.added_method_to_class(@f10, :π, ::Kernel)
@v0_0_19.changelog.added_method_to_class(@f10, :φ, ::Kernel)
@v0_0_19.changelog.added_method_to_class(@f12, :normalized_paths, ::Dir)

@v0_0_19.changelog.added_method_to_class(@f16, :⁻¹, ::Object)
@v0_0_19.changelog.added_method_to_class(@f16, :⁻², ::Object)
@v0_0_19.changelog.added_method_to_class(@f16, :⁻², ::Object)
@v0_0_19.changelog.added_method_to_class(@f16, :⁻³, ::Object)
@v0_0_19.changelog.added_method_to_class(@f16, :⁻⁴, ::Object)
@v0_0_19.changelog.added_method_to_class(@f16, :⁻⁵, ::Object)
@v0_0_19.changelog.added_method_to_class(@f16, :⁻⁶, ::Object)
@v0_0_19.changelog.added_method_to_class(@f16, :⁻⁷, ::Object)
@v0_0_19.changelog.added_method_to_class(@f16, :⁻⁸, ::Object)
@v0_0_19.changelog.added_method_to_class(@f16, :⁻⁹, ::Object)

@v0_0_20 = RuuubyRelease.spawn(0, 0, 20)
@v0_0_20.add_comments(
    [
        '(`f98`) add consts `RATIO_DEGREES_TO_RADIAN` and `RATIO_RADIANS_TO_DEGREE` into module `Math`',
        'power-operations for `Integer` and `Float` given support for raising from (-1)`⁻¹` to (-9)`⁻⁹`',
        'continued formatting/syntax clean-ups in `ruby_class_mods.c`'
    ]
)
@v0_0_20.add_file('lib/ruuuby/module/math.rb', ::Math, '', @f17)
@v0_0_20.add_file('help/math/automatic_differentiation.rb', '', '`Ruuuby\'s` current main focus to add functionality support to', @f19)
@v0_0_20.changelog.added_method_to_class(@f06, :🛑flt❓, ::Object)
@v0_0_20.changelog.added_method_to_class(@f17, :≈≈, ::Float)
@v0_0_20.changelog.added_method_to_class(@f17, :sin, ::Kernel)
@v0_0_20.changelog.added_method_to_class(@f17, :sin°, ::Kernel)
@v0_0_20.changelog.added_method_to_class(@f17, :cos, ::Kernel)
@v0_0_20.changelog.added_method_to_class(@f17, :cos°, ::Kernel)
@v0_0_20.changelog.added_method_to_class(@f17, :∠ᶜ, ::Kernel)
@v0_0_20.changelog.added_method_to_class(@f17, :∠°, ::Kernel)

@v0_0_21 = RuuubyRelease.spawn(0, 0, 21)
@v0_0_21.add_file('bin/console_db', '', 'same as `/bin/console` but also pre-loads `db/seed.rb`')
@v0_0_21.add_file('lib/ruuuby/class/re.rb', ::Regexp, '', @f20)
#@v0_0_21.add_file('app/models/db_schema.rb', ::RuuubyDBSchema, '`temporary design`', @f15)
@v0_0_21.add_file('app/models/db_schema.rb', '', '`temporary design`', @f15)
#@v0_0_21.add_file('lib/ruuuby/module/attribute_extendable/static_attribute_syntax_cache', ::Ruuuby::StaticAttributeSyntaxCache)
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
@v0_0_21.changelog.added_method_to_class(@f06, :class?, ::Object)
@v0_0_21.changelog.added_method_to_class(@f06, :module?, ::Object)
@v0_0_21.changelog.added_method_to_class(@f06, :nucleotide?, ::Object)
@v0_0_21.changelog.added_method_to_class(@f09, :∋?, ::Module)
@v0_0_21.changelog.added_method_to_class(@f09, :∌?, ::Module)
@v0_0_21.changelog.added_method_to_class(@f09, :∈?, ::Module)
@v0_0_21.changelog.added_method_to_class(@f09, :∉?, ::Module)
@v0_0_21.changelog.added_method_to_class(@f14, :🛑ℤ❓, ::Object)

@v0_0_22 = RuuubyRelease.spawn(0, 0, 22)
@v0_0_22.add_file('lib/ruuuby/class/sym.rb', ::Symbol, '', @f10)
@v0_0_22.add_file('lib/ruuuby/module/attribute/includable/attribute_cardinality.rb', ::Ruuuby::Attribute::Includable::Cardinality, '', @f04)
@v0_0_22.add_file('lib/ruuuby/module/attribute/includable/attribute_subscript_indexing.rb', ::Ruuuby::Attribute::Includable::SubscriptIndexing, '', @f10)
@v0_0_22.add_file('lib/ruuuby/module/attribute/includable/attribute_syntax_cache.rb', ::Ruuuby::Attribute::Includable::SyntaxCache, '', @f10)
@v0_0_22.add_file('lib/ruuuby/module/attribute/extendable/attribute_syntax_cache.rb', ::Ruuuby::Attribute::Extendable::SyntaxCache, '', @f10)
@v0_0_22.add_comments(
    [
        'continued (minor) improvements to catching bad parameters & throwing needed errors',
        '(`f98`) add func(`err_to_num`) to class(`String`) as a utility function for throwing errors',
        'start organizing groups of functions into modules labeled by their `Feature` or `Attribute` (`includable` or `extendable`)',
        'tech debt accumulation to be dealt with by `v0.1.0` to remove all `🍝 code` prior to adding support to `automatic differentiation`'
    ]
)
@v0_0_22.changelog.added_method_to_class(@f08, :η̂!, ::Array)

@v0_0_22.changelog.added_method_to_class(@f10, :⬇️, ::Symbol)
@v0_0_22.changelog.added_method_to_class(@f10, :⬇, ::Symbol)
@v0_0_22.changelog.added_method_to_class(@f10, :🔡, ::Symbol)
@v0_0_22.changelog.added_method_to_class(@f10, :⬆️, ::Symbol)
@v0_0_22.changelog.added_method_to_class(@f10, :⬆, ::Symbol)
@v0_0_22.changelog.added_method_to_class(@f10, :🔠, ::Symbol)

@v0_0_22.changelog.added_method_to_class(@f10, :⬇️, ::String)
@v0_0_22.changelog.added_method_to_class(@f10, :⬇, ::String)
@v0_0_22.changelog.added_method_to_class(@f10, :🔡, ::String)
@v0_0_22.changelog.added_method_to_class(@f10, :⬆️, ::String)
@v0_0_22.changelog.added_method_to_class(@f10, :⬆, ::String)
@v0_0_22.changelog.added_method_to_class(@f10, :🔠, ::String)
@v0_0_22.changelog.added_method_to_class(@f10, :⬇️!, ::String)
@v0_0_22.changelog.added_method_to_class(@f10, :⬇!, ::String)
@v0_0_22.changelog.added_method_to_class(@f10, :🔡!, ::String)
@v0_0_22.changelog.added_method_to_class(@f10, :⬆️!, ::String)
@v0_0_22.changelog.added_method_to_class(@f10, :⬆!, ::String)
@v0_0_22.changelog.added_method_to_class(@f10, :🔠!, ::String)

@v0_0_22.changelog.added_method_to_class(@f10, :∀ₓᵢ, ::Enumerable)
@v0_0_22.changelog.added_method_to_class(@f10, :define_singleton_⨍, ::Object)
@v0_0_22.changelog.added_method_to_class(@f10, :🌽_previous_⨍, ::Kernel)

@v0_0_22.changelog.added_method_to_class(@f06, :🛑𝕌❓, ::Object)

@v0_0_22.changelog.added_method_to_class(@f21, :digit?, ::String)
@v0_0_22.changelog.added_method_to_class(@f21, :to_num, ::String)
@v0_0_22.changelog.added_method_to_class(@f21, :to_num?, ::String)

@v0_0_23 = RuuubyRelease.spawn(0, 0, 23)
@v0_0_23.add_comments(
    [
        '(starting-point) add support for representing `Complex Infinity` through Symbol(`∞ℂ`)',
        'add Feature(`f03`) and Attribute(`SubscriptIndexing`) to Class(`Symbol`)',
        'add missing tests and fix bugs with c(`Object`)\'s funcs `🛑ℤ❓` and `🛑𝕌❓`',
        '`power-operations` given support for working with `infinitity values`, Class(`Rational`) given support for `superscript-power-operations`',
        'various consts defined into c(`Float`) but to soon be moved into (`f98`)'
    ]
)
@v0_0_23.changelog.added_method_to_class(@f10, :∞ℂ, ::Kernel)
@v0_0_23.changelog.added_method_to_class(@f10, :∞, ::Kernel)
@v0_0_23.changelog.added_method_to_class(@f10, :¿, ::Kernel)
@v0_0_23.changelog.added_method_to_class(@f17, :¿?, ::Integer)
@v0_0_23.changelog.added_method_to_class(@f17, :nan?, ::Integer)
@v0_0_23.changelog.added_method_to_class(@f17, :∞ℂ?, ::Integer)
@v0_0_23.changelog.added_method_to_class(@f17, :¿?, ::Float)
@v0_0_23.changelog.added_method_to_class(@f17, :∞ℂ?, ::Float)

@v0_0_24 = RuuubyRelease.spawn(0, 0, 24)
@v0_0_24.add_file('lib/ruuuby/configs.rb', '', '', @f23)
@v0_0_24.add_comments(
    [
        'ensure `Ruby` data created from `C-extensions` get safe-guarded against `garbage-collection`',
        'start utilizing configs for `Ruuuby`, especially for debugging information'
    ]
)

@v0_0_25 = RuuubyRelease.spawn(0, 0, 25)
@v0_0_25.add_file('lib/ruuuby/global_funcs.rb', '', '', @f15)
@v0_0_25.add_file('ext/ruby/class_mods/c0_constants.h', '', '', @f98)
@v0_0_25.add_file('ext/ruby/class_mods/c1_typed_checks.h', '', '', @f98)
@v0_0_25.add_file('ext/ruby/class_mods/c2_extension_memory.h', '', '', @f98)
@v0_0_25.add_file('ext/ruby/class_mods/c3_macro_utilities.h', '', '', @f98)
@v0_0_25.add_comments(
    [
        'start dividing (`f98`)/`C-code` across multiple header files, lots of small misc changes (ex: moved various constants definitions from `Ruby\'s` `Float`)',
        're-structure `Feature` <-> `Module` mapping, add `audit` tests to verify pattern is present/consistent',
        'move certain funcs out of `Kernel` and directly add them to `TOPLEVEL_BINDING` to avoid polluting other classes',
        '(`f00`) start formalization of existing funcs w/ name(`η̂`, `normalize`) and/or when `normalization` is applied to `args` (any context)',
        'symbolic-math support being added only for niche use-cases, `automatic-differentiation` features to take priority in case of any feature-conflicts',
    ]
)
@v0_0_25.changelog.added_method_to_class(@f08, :♻️until!, ::String)
@v0_0_25.changelog.added_method_to_class(@f10, :♻️∅!, ::Array)
@v0_0_25.changelog.added_method_to_class(@f10, :♻️∅!, ::Set)
@v0_0_25.changelog.added_method_to_class(@f10, :↩️, ::String)
@v0_0_25.changelog.added_method_to_class(@f10, :↩️!, ::String)
@v0_0_25.changelog.added_method_to_class(@f10, :↩, ::String)
@v0_0_25.changelog.added_method_to_class(@f10, :↩!, ::String)
@v0_0_25.changelog.added_method_to_class(@f10, :↩, ::Array)
@v0_0_25.changelog.added_method_to_class(@f10, :↩!, ::Array)
@v0_0_25.changelog.added_method_to_class(@f10, :↩∀, ::Array)
@v0_0_25.changelog.added_method_to_class(@f17, :tan, TOPLEVEL_BINDING)
@v0_0_25.changelog.added_method_to_class(@f17, :tan°, TOPLEVEL_BINDING)
@v0_0_25.changelog.added_method_to_class(@f17, :to_radian, ::String)

@v0_0_26 = RuuubyRelease.spawn(0, 0, 26)
@v0_0_26.add_file('lib/ruuuby/module/attribute/includable/notation_set_mathematics.rb', ::Ruuuby::Attribute::Includable::Notation::SetMathematics, '', @f09)
@v0_0_26.add_file('lib/ruuuby/ruuuby/ruuuby_metadata.rb', ::Ruuuby::MetaData, 'design pending')
@v0_0_26.remove_file('conditionals/ruuuby_configs.rb', 'configs not needed during runtime should be dynamically handled, not with conditionally loaded files (created explicitly for such need)')
@v0_0_26.add_comments(
    [
        'cleanup creation of function aliases (remove redundant declarations, move needed ones into `ide_helper`, and use new func{`⨍_add_aliases`} where possible)',
        'attribute-module(`Cardinality`) now auto-assigns the alias `𝔠`, this design helps with `DRY`',
        'reduce number of locations requiring manual edits when releasing version updates',
        'add normalizer_option(`:ℕ`) to func(🛑int❓)',
        'add `RSpec` section `db`, clean-up various locations where `db/seed` was loaded before'
    ]
)
@v0_0_26.changelog.added_method_to_class(@f10, :⨍_add_aliases, ::Module)
@v0_0_26.changelog.added_method_to_class(@f10, :❄, ::Object)
@v0_0_26.changelog.added_method_to_class(@f10, :❄?, ::Object)
@v0_0_26.changelog.added_method_to_class(@f12, :replace_expr_with, ::File)
@v0_0_26.changelog.added_method_to_class(@f12, :replace_expr_with!, ::File)
@v0_0_26.changelog.added_method_to_class(@f15, :<, ::RuuubyRelease)
@v0_0_26.changelog.added_method_to_class(@f15, :>, ::RuuubyRelease)
@v0_0_26.changelog.added_method_to_class(@f15, :get_next_version_uid, ::RuuubyRelease)
@v0_0_26.changelog.added_method_to_class(@f15, :get_latest_version_uid, ::RuuubyRelease)

@v0_0_27 = RuuubyRelease.spawn(0, 0, 27)
@v0_0_27.add_gem('schema_plus_foreign_keys', '0.1.8')
@v0_0_27.add_file('db/seeds/git_commits.rb', '', '', @f15)
@v0_0_27.add_file('db/seeds/ruuuby_features.rb', '', '', @f15)
@v0_0_27.add_file('db/seeds/ruuuby_releases.rb', '', '', @f15)
@v0_0_27.add_file('app/models/git_commit.rb', ::GitCommit, '', @f15)
@v0_0_27.add_file('lib/ruuuby/ruuuby/ruuuby_api.rb', '', '', @f15)
@v0_0_27.add_file('lib/ruuuby/ruuuby/routine.rb', '', '', @f15)
@v0_0_27.add_comments(
    [
        'contents in `db/seed.rb` split across into files in newly created dir: `db/seeds/`; also add new `ORM: GitCommit`, one `RuuubyRelease` can map to many `GitCommits`',
        'updated version number for `README.md` and `lib/ruuuby/version.rb` is now automated',
        '(`f98`): m{`Module`}\'s func{`⨍_add_aliases`} converted to alias the func{`f_add_aliases`} created from `C-extensions`',
    ]
)
@v0_0_27.changelog.added_method_to_class(@f12, :dirname⁴, ::File)

@v0_0_28 = RuuubyRelease.spawn(0, 0, 28)
@v0_0_28.add_file('lib/ruuuby/ruuuby/ruuuby_orm.rb', ::Ruuuby::MetaData::RuuubyORM, '', @f15)
@v0_0_28.add_file('lib/ruuuby/ruuuby/routine_cli.rb', ::Ruuuby::Routine::CommandCLI, '', @f15)
@v0_0_28.remove_file('app/models/db_schema.rb', 'seemed like a bad location')
@v0_0_28.remove_file('conditionals/ide_helper.rb', 'moved to `lib/ruuuby/ide_helper.rb`, gets excluded by `ruuuby.gemspec`')
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
@v0_0_28.changelog.added_method_to_class(@f06, :char?, ::String)
@v0_0_28.changelog.added_method_to_class(@f08, :upcase?, ::String)
@v0_0_28.changelog.added_method_to_class(@f08, :⬆️?, ::String)
@v0_0_28.changelog.added_method_to_class(@f08, :⬆?, ::String)
@v0_0_28.changelog.added_method_to_class(@f08, :🔠?, ::String)
@v0_0_28.changelog.added_method_to_class(@f08, :downcase?, ::String)
@v0_0_28.changelog.added_method_to_class(@f08, :⬇️?, ::String)
@v0_0_28.changelog.added_method_to_class(@f08, :⬇?, ::String)
@v0_0_28.changelog.added_method_to_class(@f08, :🔡?, ::String)
@v0_0_28.changelog.added_method_to_class(@f08, :♻️⟵, ::String)
@v0_0_28.changelog.added_method_to_class(@f08, :♻️⟶∞, ::String)
@v0_0_28.changelog.added_method_to_class(@f24, :🐫?, ::String)
@v0_0_28.changelog.added_method_to_class(@f24, :🐍?, ::String)
@v0_0_28.changelog.added_method_to_class(@f24, :🐫⬇️?, ::String)
@v0_0_28.changelog.added_method_to_class(@f24, :🐫⬇?, ::String)
@v0_0_28.changelog.added_method_to_class(@f24, :🐫🔡?, ::String)
@v0_0_28.changelog.added_method_to_class(@f24, :🐍⬆️?, ::String)
@v0_0_28.changelog.added_method_to_class(@f24, :🐍⬆?, ::String)
@v0_0_28.changelog.added_method_to_class(@f24, :🐍🔠?, ::String)
@v0_0_28.changelog.added_method_to_class(@f24, :to_🐫, ::String)
@v0_0_28.changelog.added_method_to_class(@f24, :to_🐍, ::String)

@v0_0_29 = RuuubyRelease.spawn(0, 0, 29)
@v0_0_29.add_file('lib/ruuuby/ruuuby/engine/ruuuby_engine.rb', ::Ruuuby::MetaData::RuuubyEngine, 'alias{`💎.engine`}', @f15)
@v0_0_29.add_file('lib/ruuuby/ruuuby/engine/ruuuby_logging.rb', ::Ruuuby::MetaData::RuuubyEngine.instance.logger, 'alias{`💎.engine.logger`}', @f15)
@v0_0_29.add_file('lib/ruuuby/ruuuby/metadata/ruuuby_metadata_constants.rb', ::Ruuuby::MetaData, '', @f15)
@v0_0_29.add_file('app/models/ruuuby_dir', ::RuuubyDir, 'directory operations specifically for `ORM` related context/use-cases', @f15)
@v0_0_29.add_file('app/models/ruuuby_file', ::RuuubyFile, 'file operations specifically for `ORM` related context/use-cases', @f15)
@v0_0_29.add_comments(
    [
        'misc cleanup for `ORM`, example: remove un-needed m(`::ApplicationRecord::ORMAttributeCache`)',
        'general cleanup for `QA`/`RSpecs`, especially w/ file loading order',
        'add initial start of `ORM` schemas `RuuubyFiles` and `RuuubyDirs`',
        'general functionality increases for `Ruuuby` `MetaData`, add global func `💎` for quicker reference',
        'add logger with output in directory{`tmp`}, file{`ruuuby.log`}'
    ]
)
@v0_0_29.changelog.added_method_to_class(@f04, :∅, ::Array)
@v0_0_29.changelog.added_method_to_class(@f06, :🛑sym❓, ::Object)
@v0_0_29.changelog.added_method_to_class(@f10, :ℂ, TOPLEVEL_BINDING)
@v0_0_29.changelog.added_method_to_class(@f10, :ℚ, TOPLEVEL_BINDING)
@v0_0_29.changelog.added_method_to_class(@f10, :💎, ::Kernel)
@v0_0_29.changelog.added_method_to_class(@f10, :info, ::Ruuuby::MetaData)
@v0_0_29.changelog.added_method_to_class(@f10, :debug, ::Ruuuby::MetaData)
@v0_0_29.changelog.added_method_to_class(@f10, :orm, ::Ruuuby::MetaData)
@v0_0_29.changelog.added_method_to_class(@f10, :paths, ::Ruuuby::MetaData)
@v0_0_29.changelog.added_method_to_class(@f10, :engine, ::Ruuuby::MetaData)
@v0_0_29.changelog.added_method_to_class(@f12, :insert_line_before_expr, ::File)

@v0_0_30 = RuuubyRelease.spawn(0, 0, 30)
@v0_0_30.add_file('app/model_attributes/extendable/uid.rb', '', '', @f15)
@v0_0_30.add_file('app/model_attributes/includable/uid.rb', '', '', @f15)
@v0_0_30.add_comments(
    [
        'add normalizers to `sym?`',
        'continued ORM cleanups started in `v0.0.29`',
        'add `f26` as continued step in enabling textual parsing for more useful code-file automations'
    ]
)
@v0_0_30.changelog.added_method_to_class(@f06, :singleton?, ::Object)
@v0_0_30.changelog.added_method_to_class(@f10, :🅱?, ::Object)
@v0_0_30.changelog.added_method_to_class(@f10, :🛑🅱❓, ::Object)
@v0_0_30.changelog.added_method_to_class(@f10, :🧬?, ::Object)
@v0_0_30.changelog.added_method_to_class(@f10, :cli, ::Ruuuby::Routine::CommandCLI)
@v0_0_30.changelog.added_method_to_class(@f10, :get_all_defined_modules, ::Module)
@v0_0_30.changelog.added_method_to_class(@f10, :get_all_defined_classes, ::Module)
@v0_0_30.changelog.added_method_to_class(@f26, :iso8601?, ::String)
@v0_0_30.changelog.added_method_to_class(@f26, :to_iso8601, ::String)
@v0_0_30.changelog.added_method_to_class(@f26, :as_iso8601, ::String)

@v0_0_31 = RuuubyRelease.spawn(0, 0, 31)
@v0_0_31.add_file('lib/ruuuby/virtual/env', ::ENV, 'note: `class << ENV`', @f10)
@v0_0_31.add_file('db/seeds/ruuuby_releases/future_ruuuby_releases.rb', '', 'not currently used', @f15)
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
@v0_0_31.changelog.added_method_to_class(@f08, :as_utf8, ::String)
@v0_0_31.changelog.added_method_to_class(@f10, :¼, TOPLEVEL_BINDING)
@v0_0_31.changelog.added_method_to_class(@f10, :½, TOPLEVEL_BINDING)
@v0_0_31.changelog.added_method_to_class(@f10, :¾, TOPLEVEL_BINDING)
@v0_0_31.changelog.added_method_to_class(@f10, :🌽, TOPLEVEL_BINDING)
@v0_0_31.changelog.added_method_to_class(@f12, :insert_lines_before_expr, ::File)
@v0_0_31.changelog.added_method_to_class(@f15, :get_latest, ::GitCommit)
@v0_0_31.changelog.added_method_to_class(@f15, :query_get_newest_within_version, ::GitCommit)
@v0_0_31.changelog.added_method_to_class(@f15, :on_before_save, ::RuuubyRelease)

#* remove the following methods/aliases:
#| (c)lass or (m)odule | methods/aliases removed |
#| ------------------- | --------------------- |
#| (c) `Symbol`   | `power?`, `pow_to_i` |

@v0_0_32 = RuuubyRelease.spawn(0, 0, 32)
@v0_0_32.add_file('lib/ruuuby/module/attribute/includable/singleton.rb', ::Ruuuby::Attribute::Includable::RuuubySingleton, '', @f10)
@v0_0_32.add_file('lib/ruuuby/module/attribute/extendable/singleton.rb', ::Ruuuby::Attribute::Includable::RuuubySingleton, '', @f10)
@v0_0_32.add_file('lib/ruuuby/class/proc.rb', ::Proc, '', @f10)
@v0_0_32.add_comments(
    [
        '(`f98`) add flags to the compilation and linker steps (`wip`); replace locations in `C-extensions` that were previously accessing pointers not intended to be used beyond its internal scope (internal to `Ruby`)',
        'global-func(`φ`) removed, reference replaced with(`𝚽`), a `Kernel` constant; also add the golden-angle constant(`Ⴔ`)',
        'start utilizing more generic math notation where possible, ex-func(`∀τ²∈λ𝑓₍ᵢ،ᵢ₊₁₎`), very useful as this automatically applies (for example) to both regular objects like `Array` and also `ORM` objects like `RuuubyRelease` while still applicable to both',
        '`v0.0.33` to utilize `golden-angle` as well as dramatically alter angle-trig related functions'
    ]
)
@v0_0_31.changelog.added_method_to_class(@f10, :∀τ²∈λ𝑓₍ᵢ،ᵢ₊₁₎, ::Enumerable)
