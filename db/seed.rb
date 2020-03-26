
require_relative 'db'

f04 = RuuubyFeature.spawn(4, '`∅` to alias concept of `empty`')
f06 = RuuubyFeature.spawn(6, 'enable quick type checks against any object (ex: `variable.int?`)')
f07 = RuuubyFeature.spawn(7, 'enable quick clean up functions for `enumerables`')
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

# TODO: FOR v0.0.22 (), ADD OBJECT/FUNC TO GATHER ALL RELEASES AND THEN PRINT OUT CHANGELOG
# (to remove code below)

=begin
puts "PRINTING DOCS"
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
