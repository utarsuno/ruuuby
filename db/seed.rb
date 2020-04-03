
require_relative 'db'

f00 = RuuubyFeature.spawn(0, "`η̂` to alias concept of `normalization` (any be offered in any applicable context)")
f01 = RuuubyFeature.spawn(1, "`🙈` to alias `private`")
f02 = RuuubyFeature.spawn(2, "`🛡️` to alias `protected`")
f03 = RuuubyFeature.spawn(3, "`𝔠` to alias concept of `cardinality` (offered in both styles of `OOP` & `'functional'`)")
f04 = RuuubyFeature.spawn(4, '`∅` to alias concept of `empty`')
f06 = RuuubyFeature.spawn(6, 'enable quick type checks against any object (ex: `variable.int?`)')
f07 = RuuubyFeature.spawn(7, 'enable quick clean up functions for `enumerables`')
f08 = RuuubyFeature.spawn(8, 'enable quick editing functions for `enumerables` (& `String`)')
f09 = RuuubyFeature.spawn(9, 'add math `set operations` (especially for `enumerables` & `String`)')
f10 = RuuubyFeature.spawn(10, 'offer special character aliases for natural ease of readability')
f11 = RuuubyFeature.spawn(11, 'add math `number sets` (ex: `ℕ?`, `ℤ?`, `ℚ?`, `ℂ?`, `ℝ?`, `∞?`, `♾️?`)')
f12 = RuuubyFeature.spawn(12, 'enable quick `file/directory io` and alias as file(`📂`) and dir(`🗄️`)')
f14 = RuuubyFeature.spawn(14, 'enable easier catching and throwing of parameter type errors')
f15 = RuuubyFeature.spawn(15, 'enable quicker tracking and auditing of features across versions')
f16 = RuuubyFeature.spawn(16, "add operation: raising to exponents (`superscript`) via operator(`^`) on `Numeric`'s")
f17 = RuuubyFeature.spawn(17, 'enable easier math operations')
f18 = RuuubyFeature.spawn(18, 'simplify import/require statements')
f19 = RuuubyFeature.spawn(19, 'add support for automatic-differentiation')
f20 = RuuubyFeature.spawn(20, 'enable easier (general) syntax & pattern parsing')
f21 = RuuubyFeature.spawn(21, 'enable easier textual/numerical/syntax parsing')
f22 = RuuubyFeature.spawn(22, 'create or extend a `numeric` in order to properly support `Complex Infinity`')
f23 = RuuubyFeature.spawn(23, 'gather statistics (and/or more debugging information) on `Ruuuby`')
f98 = RuuubyFeature.spawn(98, '`C-extensions`')

v0_0_0 = RuuubyRelease.spawn(0, 0, 0)
v0_0_0.add_comments('initial project creation')

v0_0_1 = RuuubyRelease.spawn(0, 0, 1)
v0_0_1.add_file('CHANGELOG.md')
v0_0_1.add_file('lib/ruuuby/class/nil.rb', ::NilClass, '', f04)
v0_0_1.add_file('lib/ruuuby/enum/emoji.rb', '', 'Ruuuby::Enum::Emoji')
v0_0_1.add_file('bin/audit', '', 'for running rdoc, rspecs, and coverage reports')
v0_0_1.changelog.added_method_to_class(f04, :empty?, ::NilClass)

v0_0_2 = RuuubyRelease.spawn(0, 0, 2)
v0_0_2.changelog.added_method_to_class(f06, :bool?, ::Object)

v0_0_3 = RuuubyRelease.spawn(0, 0, 3)
v0_0_3.add_comments(
    [
        'modify `Ruuuby::Enum::Emoji` from `Strings` to `Symbols`',
        'fix gemspec to reflect correct git URLs'
    ]
)
v0_0_3.add_file('lib/class/ary.rb', ::Array, '', [f07, f06])
v0_0_3.add_file('lib/class/int.rb', ::Integer, '', f06)
v0_0_3.changelog.added_method_to_class(f06, :int?, ::Object)
v0_0_3.changelog.added_method_to_class(f06, :ary?, ::Object)
v0_0_3.changelog.added_method_to_class(f07, :remove_empty!, ::Array)

#v0_0_4 = RuuubyRelease.spawn(0, 0, 4)
#v0_0_4.add_gem('rspec-benchmark', '0.5.1')
#v0_0_4.add_comments('update `ruuuby.gemspec` to require ruby `2.7.0`')

v0_0_18 = RuuubyRelease.spawn(0, 0, 18)
v0_0_18.add_comments(
    [
        'renaming existing func(`🛑str_or_ary❓`) to(`🛑countable❓`); it now checks for `Set` as well',
        'move all duplicated aliases (for playing nice with IDEs, happens from funcs created in `C-extension`) into `conditionals/ide_helper.rb`'
    ]
)
v0_0_18.add_file('lib/ruuuby/class/io/file.rb', ::File, '', f12)
v0_0_18.add_file('lib/ruuuby/class/io/dir.rb', ::Dir, '', f12)
v0_0_18.add_file('lib/ruuuby/types.rb', ::Ruuuby::VirtualTypes, 'adds (module-scoped) constants `🅱️`, `STRY`, `NUMS`, `COUNTABLES` ', f06)
v0_0_18.add_file('app/models/application_record.rb', ::ApplicationRecord, '', f15)
v0_0_18.add_file('app/models/ruuuby_changelog.rb', ::RuuubyChangelog, '', f15)
v0_0_18.add_file('app/models/ruuuby_feature.rb', ::RuuubyFeature, '', f15)
v0_0_18.add_file('app/models/ruuuby_release.rb', ::RuuubyRelease, '', f15)
v0_0_18.add_file('lib/ruuuby/class/method.rb', ::Method, '', '')
v0_0_18.add_file('conditionals/ide_helper.rb', '', '', '')
v0_0_18.add_file('db/db.rb', '', '', f15)
v0_0_18.add_file('db/seed.rb', '', '', f15)

v0_0_18.add_gem('sqlite3', '1.4.2')
v0_0_18.add_gem('activerecord', '5.2.4.1')
v0_0_18.changelog.added_methods_to_class(f12,
                                         [
                                             [:∃?, ::File],
                                             [:∃?, ::Dir],
                                             [:dirname², :dirname³, ::File],
                                             [:📁, ::Kernel],
                                             [:📂, ::Kernel],
                                             [:🗄️, ::Kernel],
                                         ]
)
v0_0_18.changelog.added_methods_to_class(f06, [[:flt?, ::Object], [:num?, ::Object]])
v0_0_18.changelog.added_methods_to_class(f11, [[:♾️?, ::Integer], [:♾️?, ::Numeric]])
v0_0_18.changelog.added_method_to_class(f10, :🏠, ::Method)


v0_0_19 = RuuubyRelease.spawn(0, 0, 19)
v0_0_19.add_comments(
    [
        "add data-validation and more narrowly define data types for `ORM`, still lots of TODOs here",
        "purge `ruuuby/version.rb` of all content except `constant String`: `VERSION` (as `ORM` functionality will cover prior needed use-cases)",
        "add missing test cases for power-operations and `Object's` funcs(`flt?`, `num?`)",
        "power-operations for `Float` moved into `ruby_class_mods.c`",
        "general improvements for performance-testing and general structuring",
        "`ruby_class_mods.c` to start using `non-ascii` based `#define` statements"
    ]
)
v0_0_19.changelog.added_method_to_class(f04, :∅?, ::File)
v0_0_19.changelog.added_method_to_class(f04, :∅?, ::Dir)
v0_0_19.changelog.added_method_to_class(f10, :♻️, ::ApplicationRecord)
v0_0_19.changelog.added_method_to_class(f10, :♻️!, ::ApplicationRecord)
v0_0_19.changelog.added_method_to_class(f10, :🎲, ::Kernel)
v0_0_19.changelog.added_method_to_class(f10, :π, ::Kernel)
v0_0_19.changelog.added_method_to_class(f10, :φ, ::Kernel)
v0_0_19.changelog.added_method_to_class(f12, :normalized_paths, ::Dir)

v0_0_19.changelog.added_method_to_class(f16, :⁻¹, ::Object)
v0_0_19.changelog.added_method_to_class(f16, :⁻², ::Object)
v0_0_19.changelog.added_method_to_class(f16, :⁻², ::Object)
v0_0_19.changelog.added_method_to_class(f16, :⁻³, ::Object)
v0_0_19.changelog.added_method_to_class(f16, :⁻⁴, ::Object)
v0_0_19.changelog.added_method_to_class(f16, :⁻⁵, ::Object)
v0_0_19.changelog.added_method_to_class(f16, :⁻⁶, ::Object)
v0_0_19.changelog.added_method_to_class(f16, :⁻⁷, ::Object)
v0_0_19.changelog.added_method_to_class(f16, :⁻⁸, ::Object)
v0_0_19.changelog.added_method_to_class(f16, :⁻⁹, ::Object)

v0_0_20 = RuuubyRelease.spawn(0, 0, 20)
v0_0_20.add_comments(
    [
        '(`f98`) add consts `RATIO_DEGREES_TO_RADIAN` and `RATIO_RADIANS_TO_DEGREE` into module `Math`',
        'power-operations for `Integer` and `Float` given support for raising from (-1)`⁻¹` to (-9)`⁻⁹`',
        'continued formatting/syntax clean-ups in `ruby_class_mods.c`'
    ]
)
v0_0_20.add_file('lib/ruuuby/module/math.rb', ::Math, '', f17)
v0_0_20.add_file('help/math/automatic_differentiation.rb', '', '`Ruuuby\'s` current main focus to add functionality support to', f19)
v0_0_20.changelog.added_method_to_class(f06, :🛑flt❓, ::Object)
v0_0_20.changelog.added_method_to_class(f17, :≈≈, ::Float)
v0_0_20.changelog.added_method_to_class(f17, :sin, ::Kernel)
v0_0_20.changelog.added_method_to_class(f17, :sin°, ::Kernel)
v0_0_20.changelog.added_method_to_class(f17, :cos, ::Kernel)
v0_0_20.changelog.added_method_to_class(f17, :cos°, ::Kernel)
v0_0_20.changelog.added_method_to_class(f17, :∠ᶜ, ::Kernel)
v0_0_20.changelog.added_method_to_class(f17, :∠°, ::Kernel)

v0_0_21 = RuuubyRelease.spawn(0, 0, 21)
v0_0_21.add_file('bin/console_db', '', 'same as `/bin/console` but also pre-loads `db/seed.rb`')
v0_0_21.add_file('lib/ruuuby/class/re.rb', ::Regexp, '', f20)
v0_0_21.add_file('app/models/db_schema.rb', ::RuuubyDBSchema, '`temporary design`', f15)
#v0_0_21.add_file('lib/ruuuby/module/attribute_extendable/static_attribute_syntax_cache', ::Ruuuby::StaticAttributeSyntaxCache)
v0_0_21.add_comments(
    [
        'add const `NUCLEOTIDES` to `Ruuuby::VirtualTypes`',
        'add missing scenarios and tests for `spec/helpers/static_test_data.rb`',
        'rename m(`Module`)\'s func(`∃func?`) to(`∃⨍?`)',
        'rename m(`Module`)\'s func(`∃func_alias?`) to(`∃⨍_alias?`)',
        '(`f98`) add `global-constant`(`$PRM_MANY`), param-type checking functions expanded for multi-param check use-cases',
        'add modules `ORMAttributeUID` and `ORMAttributeCache` to `ApplicationRecord` as well as module(`Syntax`) which each `ORM Class` will also define; ⚠️: full `TDD` still omitted for `ORM` while certain design areas are more susceptible to needed refactors'
    ]
)
v0_0_21.changelog.added_method_to_class(f06, :class?, ::Object)
v0_0_21.changelog.added_method_to_class(f06, :module?, ::Object)
v0_0_21.changelog.added_method_to_class(f06, :nucleotide?, ::Object)
v0_0_21.changelog.added_method_to_class(f09, :∋?, ::Module)
v0_0_21.changelog.added_method_to_class(f09, :∌?, ::Module)
v0_0_21.changelog.added_method_to_class(f09, :∈?, ::Module)
v0_0_21.changelog.added_method_to_class(f09, :∉?, ::Module)
v0_0_21.changelog.added_method_to_class(f14, :🛑ℤ❓, ::Object)

v0_0_22 = RuuubyRelease.spawn(0, 0, 22)
v0_0_22.add_file('lib/ruuuby/class/sym.rb', ::Symbol, '', f10)
v0_0_22.add_file('lib/ruuuby/module/attribute/includable/attribute_cardinality.rb', ::Ruuuby::Attribute::Includable::Cardinality, '', f04)
v0_0_22.add_file('lib/ruuuby/module/attribute/includable/attribute_subscript_indexing.rb', ::Ruuuby::Attribute::Includable::SubscriptIndexing, '', f10)
v0_0_22.add_file('lib/ruuuby/module/attribute/includable/attribute_syntax_cache.rb', ::Ruuuby::Attribute::Includable::SyntaxCache, '', f10)
v0_0_22.add_file('lib/ruuuby/module/attribute/extendable/attribute_syntax_cache.rb', ::Ruuuby::Attribute::Extendable::SyntaxCache, '', f10)

v0_0_22.add_comments(
    [
        'continued (minor) improvements to catching bad parameters & throwing needed errors',
        '(`f98`) add func(`err_to_num`) to class(`String`) as a utility function for throwing errors',
        'start organizing groups of functions into modules labeled by their `Feature` or `Attribute` (`includable` or `extendable`)',
        'tech debt accumulation to be dealt with by `v0.1.0` to remove all `🍝 code` prior to adding support to `automatic differentiation`'
    ]
)
v0_0_22.changelog.added_method_to_class(f08, :η̂!, ::Array)

v0_0_22.changelog.added_method_to_class(f10, :⬇️, ::Symbol)
v0_0_22.changelog.added_method_to_class(f10, :⬇, ::Symbol)
v0_0_22.changelog.added_method_to_class(f10, :🔡, ::Symbol)
v0_0_22.changelog.added_method_to_class(f10, :⬆️, ::Symbol)
v0_0_22.changelog.added_method_to_class(f10, :⬆, ::Symbol)
v0_0_22.changelog.added_method_to_class(f10, :🔠, ::Symbol)

v0_0_22.changelog.added_method_to_class(f10, :⬇️, ::String)
v0_0_22.changelog.added_method_to_class(f10, :⬇, ::String)
v0_0_22.changelog.added_method_to_class(f10, :🔡, ::String)
v0_0_22.changelog.added_method_to_class(f10, :⬆️, ::String)
v0_0_22.changelog.added_method_to_class(f10, :⬆, ::String)
v0_0_22.changelog.added_method_to_class(f10, :🔠, ::String)
v0_0_22.changelog.added_method_to_class(f10, :⬇️!, ::String)
v0_0_22.changelog.added_method_to_class(f10, :⬇!, ::String)
v0_0_22.changelog.added_method_to_class(f10, :🔡!, ::String)
v0_0_22.changelog.added_method_to_class(f10, :⬆️!, ::String)
v0_0_22.changelog.added_method_to_class(f10, :⬆!, ::String)
v0_0_22.changelog.added_method_to_class(f10, :🔠!, ::String)

v0_0_22.changelog.added_method_to_class(f10, :∀ₓᵢ, ::Enumerable)
v0_0_22.changelog.added_method_to_class(f10, :define_singleton_⨍, ::Object)
v0_0_22.changelog.added_method_to_class(f10, :🌽_previous_⨍, ::Kernel)

v0_0_22.changelog.added_method_to_class(f06, :🛑𝕌❓, ::Object)

v0_0_22.changelog.added_method_to_class(f21, :digit?, ::String)
v0_0_22.changelog.added_method_to_class(f21, :to_num, ::String)
v0_0_22.changelog.added_method_to_class(f21, :to_num?, ::String)

v0_0_23 = RuuubyRelease.spawn(0, 0, 23)
v0_0_23.add_comments(
    [
        '(starting-point) add support for representing `Complex Infinity` through Symbol(`∞ℂ`)',
        'add Feature(`f03`) and Attribute(`SubscriptIndexing`) to Class(`Symbol`)',
        'add missing tests and fix bugs with c(`Object`)\'s funcs `🛑ℤ❓` and `🛑𝕌❓`',
        '`power-operations` given support for working with `infinitity values`, Class(`Rational`) given support for `superscript-power-operations`',
        'various consts defined into c(`Float`) but to soon be moved into (`f98`)'
    ]
)
v0_0_23.changelog.added_method_to_class(f10, :∞ℂ, ::Kernel)
v0_0_23.changelog.added_method_to_class(f10, :∞, ::Kernel)
v0_0_23.changelog.added_method_to_class(f10, :¿, ::Kernel)
v0_0_23.changelog.added_method_to_class(f17, :¿?, ::Integer)
v0_0_23.changelog.added_method_to_class(f17, :nan?, ::Integer)
v0_0_23.changelog.added_method_to_class(f17, :∞ℂ?, ::Integer)
v0_0_23.changelog.added_method_to_class(f17, :¿?, ::Float)
v0_0_23.changelog.added_method_to_class(f17, :∞ℂ?, ::Float)

v0_0_24 = RuuubyRelease.spawn(0, 0, 24)
v0_0_24.add_file('lib/ruuuby/configs.rb', '', '', f23)
v0_0_24.add_comments(
    [
        'ensure `Ruby` data created from `C-extensions` get safe-guarded against `garbage-collection`',
        'start utilizing configs for `Ruuuby`, especially for debugging information'
    ]
)

v0_0_25 = RuuubyRelease.spawn(0, 0, 25)
v0_0_25.add_file('lib/ruuuby/global_funcs.rb', '', '', f15)
v0_0_25.add_file('ext/ruby/class_mods/c0_constants.h', '', '', f98)
v0_0_25.add_file('ext/ruby/class_mods/c1_typed_checks.h', '', '', f98)
v0_0_25.add_file('ext/ruby/class_mods/c2_extension_memory.h', '', '', f98)
v0_0_25.add_file('ext/ruby/class_mods/c3_macro_utilities.h', '', '', f98)
v0_0_25.add_comments(
    [
        'start dividing (`f98`)/`C-code` across multiple header files, lots of small misc changes (ex: moved various constants definitions from `Ruby\'s` `Float`)',
        're-structure `Feature` <-> `Module` mapping, add `audit` tests to verify pattern is present/consistent',
        'move certain funcs out of `Kernel` and directly add them to `TOPLEVEL_BINDING` to avoid polluting other classes',
        '(`f00`) start formalization of existing funcs w/ name(`η̂`, `normalize`) and/or when `normalization` is applied to `args` (any context)',
        'symbolic-math support being added only for niche use-cases, `automatic-differentiation` features to take priority in case of any feature-conflicts',
    ]
)
v0_0_25.changelog.added_method_to_class(f08, :♻️until!, ::String)
v0_0_25.changelog.added_method_to_class(f10, :♻️∅!, ::Array)
v0_0_25.changelog.added_method_to_class(f10, :♻️∅!, ::Set)
v0_0_25.changelog.added_method_to_class(f10, :↩️, ::String)
v0_0_25.changelog.added_method_to_class(f10, :↩️!, ::String)
v0_0_25.changelog.added_method_to_class(f10, :↩, ::String)
v0_0_25.changelog.added_method_to_class(f10, :↩!, ::String)
v0_0_25.changelog.added_method_to_class(f10, :↩, ::Array)
v0_0_25.changelog.added_method_to_class(f10, :↩!, ::Array)
v0_0_25.changelog.added_method_to_class(f10, :↩∀, ::Array)
v0_0_25.changelog.added_method_to_class(f17, :tan, TOPLEVEL_BINDING)
v0_0_25.changelog.added_method_to_class(f17, :tan°, TOPLEVEL_BINDING)
v0_0_25.changelog.added_method_to_class(f17, :to_radian, ::String)

v0_0_26 = RuuubyRelease.spawn(0, 0, 26)
v0_0_26.add_file('lib/ruuuby/module/attribute/includable/notation_set_mathematics.rb', ::Ruuuby::Attribute::Includable::Notation::SetMathematics, '', f09)
v0_0_26.add_file('lib/ruuuby/ruuuby/ruuuby_metadata.rb', ::Ruuuby::MetaData, 'design pending')
v0_0_26.remove_file('conditionals/ruuuby_configs.rb', 'configs not needed during runtime should be dynamically handled, not with conditionally loaded files (created explicitly for such need)')
v0_0_26.add_comments(
    [
        'cleanup creation of function aliases (remove redundant declarations, move needed ones into `ide_helper`, and use new func{`⨍_add_aliases`} where possible)',
        'attribute-module(`Cardinality`) now auto-assigns the alias `𝔠`, this design helps with `DRY`',
        'reduce number of locations requiring manual edits when releasing version updates',
        'add normalizer_option(`:ℕ`) to func(🛑int❓)',
        'add `RSpec` section `db`, clean-up various locations where `db/seed` was loaded before'
    ]
)
v0_0_26.changelog.added_method_to_class(f10, :⨍_add_aliases, ::Module)
v0_0_26.changelog.added_method_to_class(f10, :❄, ::Object)
v0_0_26.changelog.added_method_to_class(f10, :❄?, ::Object)
v0_0_26.changelog.added_method_to_class(f12, :replace_expr_with, ::File)
v0_0_26.changelog.added_method_to_class(f12, :replace_expr_with!, ::File)
v0_0_26.changelog.added_method_to_class(f15, :<, ::RuuubyRelease)
v0_0_26.changelog.added_method_to_class(f15, :>, ::RuuubyRelease)
v0_0_26.changelog.added_method_to_class(f15, :get_next_version_uid, ::RuuubyRelease)
v0_0_26.changelog.added_method_to_class(f15, :get_latest_version_uid, ::RuuubyRelease)

v0_0_25.released = true
v0_0_25.save!
v0_0_26.released = false
v0_0_26.save!

# TODO: FOR v0.0.26? (), ADD OBJECT/FUNC TO GATHER ALL RELEASES AND THEN PRINT OUT CHANGELOG
# (to remove code below)

=begin
puts "PRINTING DOCS"
v0_0_26.docs_changelog.each do |line|
  puts line
end
v0_0_25.docs_changelog.each do |line|
  puts line
end
v0_0_24.docs_changelog.each do |line|
    puts line
end
v0_0_23.docs_changelog.each do |line|
    puts line
end
v0_0_22.docs_changelog.each do |line|
    puts line
end
v0_0_21.docs_changelog.each do |line|
    puts line
end
v0_0_3.docs_changelog.each do |line|
  puts line
end
v0_0_2.docs_changelog.each do |line|
  puts line
end
v0_0_1.docs_changelog.each do |line|
  puts line
end
v0_0_0.docs_changelog.each do |line|
  puts line
end
=end
