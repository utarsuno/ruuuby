---
#### (upcoming patches) 

#### v?.?.0
 * `automatic differentiation`
 
#### v?.?.0
 * `dual-numbers` (for before `automatic differentiation`)

#### v0.3.0
 * `Quaternions`

#### v0.2.0
 * clear `tech debt` and all `feature abstracts`
   * adding `automatic differentiation` should involve near `0% (of time allocation)` towards `version-relating documentation & audits`
 * clear targeted missing coverage
 * enormous section of missing `ORM` tests

#### v0.1.0
 * resolve needed feature coverage w/ `trigonometry`, `geometry`, and `ThetaAngle`

#### v0.0.33-50
 * formalize angles, both notation and implementation
   * (`steradians`, `degree`, `radian`, `gon`, `turns`)
   * `rectangular-form`/`polar-form`
   * `complex-number-plane`/`complex-angles`
   * angular rotation vs angular velocity
   * dimensions vs units
   * add textual parsing for ThetaAngles (ex: `3°7'30''` == `3 + 7/60 + 30/3600` == `3.125°`) {`arcminute`, `arcsecond`}

---

### ⚠️: atm documentation & tests synchronization % is too low

---

# v0.0.37
 * have `ORM`: `RuuubyRelease` and `GitCommit` include `Comparable`; replacing redundant funcs{`>`, `<`} to the single func{`<=>`}
 * remove `♾️`, `¿` from all sources, textual parsing, code aliases, etc; (too redundant)
 * remove func{∞?} from Class(`String`)
 * add `ORM`{`RuuubyGem`}, some functionality was added; also removed Runtime constants needed solely for unit-tests (these tests are now semi-generated w/ `ORM` data))
 * add `RSpec` section for `locale` (local configs); `(not final design)`
 * (`f22`) will now be designated for `GC` and the `GC::Profiler`, previous `f22` moved to {`f28_b12`}

| path added | reference | notes | feature(s) |
| ---: | --- | --- | --- |
| `lib/virtual/f06.rb` |  |  | `f06` |
| `app/models/ruuuby_gem.rb` | `RuuubyGem` |  | `f15` |
| `lib/virtual/f28.rb` |  |  | `f28` |
| `lib/math/complex_analysis/complex_analysis.rb` | `::Math::ComplexAnalysis` | not currently in use | `f30` |
| `lib/math/trigonometry/trigonometry.rb` | `::Math::Trigonometry` | not currently in use | `f30` |
| `lib/math/graph_theory/graph_theory.rb` | `::Math::GraphTheory` | not currently in use | `f30` |
| `lib/math/geometry/geometry.rb` | `::Math::Geometry` | not currently in use | `f30` |
| `lib/math/space/discrete/symbolic_numbers_space.rb` | `Math::Space::SymbolicNumbersSpace` | 𝕊 | `f30` |

| class | method(s) added | feature(s) |
| --- | --- | --- |
| `Object` | `ⓣ`, `Ⓣ` | `f06` |

---

# v0.0.36
 * remove func{`get_prime_factors`} from `Integer`, newly created module{`Math::NumberTheory`} now offers that functionality
 * local git-config settings are now enforced with newly created `💎.api_git`, version-automation refactorings started

| path added | reference | notes | feature(s) |
| ---: | --- | --- | --- |
| `lib/math/expression/equation.rb` | Math::Expression::Equation | not currently in use | `f10` |
| `lib/math/expression/sequence.rb` | Math::Expression::Sequence | not currently in use | `f10` |
| `lib/math/group_theory/circle_group.rb` | Math::GroupTheory::CircleGroup | not currently in use, aliased via(`𝕋`) | `f30` |
| `lib/ruuuby/ruuuby/git_api.rb` | Ruuuby::MetaData::GitAPI | `💎.api_git` (to fully replace existing `git` functionality found in `💎.api` and elsewhere) | `f31` |
| `lib/math/number_theory/number_theory.rb` | Math::Ruuuby::NumberTheory |  | `f32` |

| module | class-method(s) added | feature(s) |
| --- | --- | --- |
| `Math::NumberTheory::ℕ¹` | `get_prime_factors`, `get_divisors`, `get_proper_divisors`, `perfect_number?` | `f32` |
| `Math::NumberTheory::ℕ²` | `gcd`, `coprime?` | `f32` |

---

# v0.0.35
 * add `gem 'rugged', '~> 1.0.0'`
 * apply general clean-ups, next few versions to have similar target
 * (`f98`): remove many function calls and variables that didn't need to be executed or exist; start adding extra checks via{`mkmf`} which will halt/fail even before the compilations step
 * remove alias `🧬?`, `🧬` is now a 'global-alias' for the singleton{`NucleotideLikeSpace`}
 * remove alias `🅱️?`, `🛑🅱️❓`, etc; just `🅱` is now a 'global-alias' for the single{`BooleanLikeSpace`}
 * remove funcs{`stry?`, `countable?`} and{`🛑stry❓`, `🛑countable❓`}
 * remove `::Ruuuby::VirtualTypes` and it's file
 * remove funcs{`∃class?`, `∃module?`} from `Kernel`, functionality is now covered by singleton{`NucleotideLikeSpace`} which is aliased via{`🧬`}
 * remove various redundant emoji aliases as the added feature{`f97`}, will enable selected character sets without the clutter of unwanted characters and aliases
 * add more detail to various `ORM` features/funcs, documentation and TDD still intentionally not fully present for these
 * add class `DescriptiveStandardError`

| path added | reference | notes | feature(s) |
| ---: | --- | --- | --- |
| `lib/math/expression/expression.rb` |  | not currently in use | `f10` |
| `lib/math/expression/formula.rb` |  | not currently in use | `f10` |
| `lib/math/space/tuple_space.rb` |  |  | `f30` |
| `lib/math/space/types_space.rb` |  |  | `f30` |
| `lib/math/space/discrete/boolean-like_space.rb` | ``Math::Space::BooleanLikeSpace`` |  | `f30` |
| `lib/math/space/discrete/number-like_space.rb` | ``Math::Space::NumberLikeSpace`` |  | `f30` |
| `lib/math/space/discrete/nucleotide-like_space.rb` | ``Math::Space::NucleotideLikeSpace`` |  | `f30` |

| class | method(s) added | feature(s) |
| --- | --- | --- |
| `TrueClass`, `FalseClass` | `to_i`, `to_b` | `f06` |
| `Rational` | `μ?` | `f10` |
| `String` | `to_🐫⬇`, `to_🐍⬆` | `f24` |

# v0.0.34
 * increase precision of various funcs (ex: `sin²` and `cos²`), by performing calculations in `long double` instead of `double`
 * add `τ` as a 'global-const' which is a ThetaAngle representing a single complete turn
 * adjust parameter style of class-functions for `Math` to use named params
 * remove global-alias-funcs{`ℂ`, `ℚ`}; these now correspond to a specific singleton instance of the newly created class(`::Math::SetTheory::NumberSet`)
 * (`f28`): add `super golden ratio` as `Ψ`, `silver ratio` as `δ`, `plastic ratio` as `ρ`, `omega constant` as `Ω`
 * remove various out-dated testing helper functions, meta-data generation/processing will eventually replace this
 * remove `::Array::EMPTY_INSTANCE`, `∅` by itself now aliases a singleton of type{`NumberSet`}
 * (`f15`): create `ORM`{`RuuubyFeatureBehavior`} which is many to one{`RuuubyFeature`}
 * remove number-set membership check funcs from `Numerics` and create `singleton` instances of `NumberSet` which covers the previous functionality (just more scalable)
 * remove as much deprecated code as possible, file structure adjustments started
 * (`f98`): move `Float`'s method{`≈≈`} into `C-extensions`
 * remove funcs (and related ones): `🛑ℤ❓` and `🛑𝕌❓`, these checks are now covered by existing functions w/ new types of normalizers added for existing normalizer feature

| path added | reference | notes | feature(s) |
| ---: | --- | --- | --- |
| `lib/ruuuby/math/set_theory/closure.rb` | ``Math::SetTheory::Closure`` |  | `f11` |
| `lib/ruuuby/math/set_theory/number_set.rb` | ``Math::SetTheory::NumberSet`` |  | `f11` |
| `lib/ruuuby/math/set_theory/discrete/algebraic_numbers.rb` | ``Math::SetTheory::AlgebraicNumbers`` |  | `f11` |
| `lib/ruuuby/math/set_theory/discrete/boolean_numbers.rb` | ``Math::SetTheory::BooleanNumbers`` |  | `f11` |
| `lib/ruuuby/math/set_theory/discrete/complex_numbers.rb` | ``Math::SetTheory::ComplexNumbers`` |  | `f11` |
| `lib/ruuuby/math/set_theory/discrete/empty_set.rb` | ``Math::SetTheory::EmptySet`` |  | `f11` |
| `lib/ruuuby/math/set_theory/discrete/imaginary_numbers.rb` | ``Math::SetTheory::ImaginaryNumbers`` |  | `f11` |
| `lib/ruuuby/math/set_theory/discrete/integer_numbers.rb` | ``Math::SetTheory::IntegerNumbers`` |  | `f11` |
| `lib/ruuuby/math/set_theory/discrete/irrational_numbers.rb` | ``Math::SetTheory::IrrationalNumbers`` |  | `f11` |
| `lib/ruuuby/math/set_theory/discrete/natural_numbers.rb` | ``Math::SetTheory::NaturalNumbers`` |  | `f11` |
| `lib/ruuuby/math/set_theory/discrete/null_set.rb` | ``Math::SetTheory::NullSet`` |  | `f11` |
| `lib/ruuuby/math/set_theory/discrete/rational_numbers.rb` | ``Math::SetTheory::RationalNumbers`` |  | `f11` |
| `lib/ruuuby/math/set_theory/discrete/real_algebraic_numbers.rb` | ``Math::SetTheory::RealAlgebraicNumbers`` |  | `f11` |
| `lib/ruuuby/math/set_theory/discrete/real_numbers.rb` | ``Math::SetTheory::RealNumbers`` |  | `f11` |
| `lib/ruuuby/math/set_theory/discrete/universal_set.rb` | ``Math::SetTheory::UniversalSet`` |  | `f11` |
| `lib/ruuuby/math/set_theory/discrete/whole_numbers.rb` | ``Math::SetTheory::WholeNumbers`` |  | `f11` |
| `app/models/ruuuby_feature_behavior.rb` |  |  | `f15` |
| `ext/ruby_class_mods/c4_theta_angle.h` |  | for organization | `f27` |

| class | method(s) added | feature(s) |
| --- | --- | --- |
| `Object` | `set?`, `🛑set❓` | `f06` |
| `Integer` | `get_prime_factors` | `f17` |
| `ThetaAngle` | `normalize`, `windings` | `f28` |

---

# v0.0.33
 * (`f98`): create new Class(`ThetaAngle`) which is essentially a wrapper over a `C-struct`
 * modify global-funcs `sin`, `cos`, `tan`, etc to utilize the `ThetaAngle` class
 * add empty code file(`lib/ruuuby/class/method/math_function.rb`) for future versions
 * apply lots of misc clean-ups and/or adjustments
 * `v0.0.34` to resolve missing parts from `ThetaAngle` and clean-up relating funcs from `String`

| path added | reference | notes | feature(s) |
| ---: | --- | --- | --- |
| `lib/ruuuby/class/nums/theta_angle.rb` | ``ThetaAngle`` |  | `f27` |

| class / module | method(s) added | feature(s) |
| --- | --- | --- |
| `Object` | `θ?`, `🛑θ❓`, `enumerable?`, `🛑enumerable❓` | `f06` |
| `Math` | `pythagoras_τ³?`, `cot`, `csc`, `sec`, `sin²`, `cos²` | `f17` |
| `TOPLEVEL_BINDING` | `℮`, `logₑ`, `log₂`, `log₁₀`, `arcsin`, `arccos`, `arctan`, `cot`, `csc`, `sec`, `sin²`, `cos²` | `f17` |
| `TOPLEVEL_BINDING` | `⅓`, `⅕`, `⅕`,`⅖`,`⅗`,`⅘`,`⅙`,`⅐`, `⅛`, `⅜`, `⅝`, `⅞`, `⅑`, `⅒` | `f17` |
| `TOPLEVEL_BINDING` | `θ°`, `θʳ`, `θᵍ`, `θ𝞽` | `f27` |
| `ThetaAngle` | `real`, `repr`, `as_radian`, `as_degree`, `as_gon`, `as_turn`, `radians?`, `degrees?`, `gons?`, `turns?`, `-@`, `+@`, `coerce`, `~`, `!`, `+`, `-`, `*`, `%`,`==`, `/`, `<=>`, `angle?`, `normal?`, `normalize!`, `golden_with?`, `explementary_with?`, `supplementary_with?`, `complementary_with?`, | `f27` |

* remove the following methods/aliases:

| from       | methods/aliases removed |
| ---------- | ----------------------- |
| `Kernel`   | `∠ᶜ`, `∠°` |

---

# v0.0.32
 * (`f98`) add flags to the compilation and linker steps (`wip`); replace locations in `C-extensions` that were previously accessing pointers not intended to be used beyond its internal scope (internal to `Ruby`)
 * global-func(`φ`) removed, reference replaced with(`𝚽`), a `Kernel` constant; also add the golden-angle constant(`Ⴔ`)
 * start utilizing more generic math notation where possible, ex-func(`∀τ²∈λ𝑓₍ᵢ،ᵢ₊₁₎`), very useful as this automatically applies (for example) to both regular objects like `Array` and also `ORM` objects like `RuuubyRelease` while still applicable to both
 * `v0.0.33` to utilize `golden-angle` as well as dramatically alter angle-trig related functions

| path added | reference | notes | feature(s) |
| ---: | --- | --- | --- |
| `lib/ruuuby/module/attribute/includable/singleton.rb` | ``Ruuuby::Attribute::Includable::RuuubySingleton`` |  | `f10` |
| `lib/ruuuby/module/attribute/extendable/singleton.rb` | ``Ruuuby::Attribute::Extendable::RuuubySingleton`` |  | `f10` |
| `lib/ruuuby/class/proc.rb` | ``Proc`` |  | `f10` |

| class | method(s) added | feature(s) |
| --- | --- | --- |
| `Enumerable` | `∀τ²∈λ𝑓₍ᵢ،ᵢ₊₁₎` | `f11` |

---

# v0.0.31
 * remove constants needed previous for supporting exponential operations from m(`Numeric`), needed values are now dynamically generated by `C-extensions` instead of relying on pre-existing constants (created specifically for just this purpose)
 * (`f98`): lots of misc edits/clean-ups in `C-extensions`
 * remove various un-used or now deprecated Modules such as `::Ruuuby::MetaData::Vocabulary` (was a temporary location for `normalizers`)
 * engine/configs cleaned up and support started for multi-flag ENV_VARs
 * automation for `db/seeds/git_commits.rb` updated to better handle scenario where release had multiple commits, still lots of TODOs and missing `TDD` to be added
 * various modifications & additions to existing `ORM` Classes for general stability/reliability
 * flipped functionality of String's funcs `to_iso8601` and `as_iso8601` to closer match `Ruby style`

| path added | reference | notes | feature(s) |
| ---: | --- | --- | --- |
| `lib/ruuuby/virtual/env` | ``ENV`` | note: `class << ENV` | `f10` |
| `db/seeds/ruuuby_releases/future_ruuuby_releases.rb` |  | not currently used | `f15` |

| class | method(s) added | feature(s) |
| --- | --- | --- |
| `String` | `as_utf8` | `f08` |
| TOPLEVEL_BINDING | `¼`, `½`, `¾`, `🌽` | `f10` |
| `File` | `insert_lines_before_expr` | `f12` |
| `GitCommit` | `get_latest`, `query_get_newest_within_version` | `f15` |
| `RuuubyRelease` | `on_before_save` | `f15` |

| (c)lass or (m)odule | methods/aliases *removed* |
| ------------------- | --------------------- |
| (c) `Symbol`   | `power?`, `pow_to_i` |

---

# v0.0.30
 * add normalizers to `sym?`
 * continued ORM cleanups started in `v0.0.29`
 * add `f26` as continued step in enabling textual parsing for more useful code-file automations

| path added | reference | notes | feature(s) |
| ---: | --- | --- | --- |
| `app/model_attributes/extendable/uid.rb` | | | `f15` |
| `app/model_attributes/includable/uid.rb` | | | `f15` |

| (c)lass or (m)odule | method(s) added | feature(s) | notes |
| --- | --- | --- | --- |
| (c) `Object` | `singleton?` | `f06` | |
| (c) `Object` | `🅱?`, `🛑🅱❓`, `🧬?` | `f10` | |
| (m) `Module` | `get_all_defined_modules`, `get_all_defined_classes` | `f10` | |
| (c) `String` | `iso8601?`, `to_iso8601`, `as_iso8601` | `f26` | |

---

# v0.0.29
 * misc cleanup for `ORM`, example: remove un-needed m(`::ApplicationRecord::ORMAttributeCache`)
 * general cleanup for `QA`/`RSpecs`, especially w/ file loading order
 * add initial start of `ORM` schemas `RuuubyFiles` and `RuuubyDirs`
 * general functionality increases for `Ruuuby` `MetaData`, add global func `💎` for quicker reference
 * add logger with output in directory{`tmp`}, file{`ruuuby.log`}

| path added | reference | notes | feature(s) |
| ---: | --- | --- | --- |
| `lib/ruuuby/ruuuby/engine/ruuuby_engine.rb` | ``Ruuuby::MetaData::RuuubyEngine`` | alias{`💎.engine`} | `f15` |
| `lib/ruuuby/ruuuby/engine/ruuuby_logging.rb` | `Ruuuby::MetaData::RuuubyEngine.instance.logger` | alias{`💎.engine.logger`} | `f15` |
| `lib/ruuuby/ruuuby/metadata/ruuuby_metadata_constants.rb` | ``Ruuuby::MetaData`` |  | `f15` |
| `app/models/ruuuby_dir` | ``RuuubyDir`` | directory operations specifically for `ORM` related context/use-cases | `f15` |
| `app/models/ruuuby_file` | ``RuuubyFile`` | file operations specifically for `ORM` related context/use-cases | `f15` |

| (c)lass or (m)odule | method(s) added | feature(s) | notes |
| --- | --- | --- | --- |
| (c) `Array` | `∅` | `f05` | starting point of adding similar immutable references like `nil` but for (assumable to be immutable) objects that are `∅` |
| (c) `Object` | `🛑sym❓` | `f07` | |
| (m) `Ruuuby::MetaData` | `orm`, `orm_meta`, `paths`, `engine` | `f10` | shortcuts to either modules or singleton-instanced objects |
| (m) `Ruuuby::MetaData` | `info`, `debug` | `f10` | shortcuts for logging statements |
| TOPLEVEL_BINDING | `ℂ`, `ℚ` | `f11` | alias to `Complex`<br/>alias to `Rational` |
| (m) `Kernel` | `💎` | `f11` | alias to `::Ruuuby::MetaData` | |
| (c) `File` | `insert_line_before_expr` | `f13` | |

---

# v0.0.28
 * (`f15`): updating contents of `db/seeds/git_commits.rb` is now automated (starting point, LOTs of TODOs to guard against any edge case scenarios and future functionality requirements)
 * (`f06`, `f98`): move funcs `class?`, `module?`, `nucleotide?` into `C-extensions` (also add `char?`)
 * add `f24` as continued step in enabling textual parsing for more useful code-file automations
 * (`f98`): add normalizers to funcs `int?` and `str?`, allows (mainly-visual) clean-up for `Ruuuby` funcs `🛑str❓` and `🛑int❓`
 * add types to `Ruuuby::VirtualTypes`
 * rename c(`String`)'s func{♻️until!} to {remove_until}, add alias(`♻️⟶`); also add reverse direction w/ func{`♻️⟵`}

| path added | reference | notes | feature(s) |
| ---: | --- | --- | --- |
| `lib/ruuuby/ruuuby/ruuuby_orm.rb` | ``Ruuuby::MetaData::RuuubyORM`` |  | `f15` |
| `lib/ruuuby/ruuuby/routine_cli.rb` | ``Ruuuby::Routine::CommandCLI`` |  | `f15` |

| path removed | notes |
| ---: | --- |
| `app/models/db_schema.rb` | seemed like a bad location |
| `conditionals/ide_helper.rb` | moved to `lib/ruuuby/ide_helper.rb`, gets excluded by `ruuuby.gemspec` |

| class | method(s) added | feature(s) |
| --- | --- | --- |
| `String` | `char?`,  | `f06` |
| `String` | `♻️⟵`, `♻️⟶∞` <br/> [`upcase?`, `⬆️?`, `⬆?`, `🔠?`] <br/> [`downcase?`, `⬇️?`, `⬇?`, `🔡?`] | `f08` |
| `String` | `🐫?`, [`🐫⬇️?`, `🐫⬇?`, `🐫🔡?`], `to_🐫` <br/> `🐍?`, [`🐍⬆️?`, `🐍⬆?`, `🐍🔠?`], `to_🐍` | `f23` |

---

# v0.0.27
 * contents in `db/seed.rb` split across files in newly created dir: `db/seeds/`; also add new `ORM: GitCommit`, (one `RuuubyRelease` to many `GitCommits`)
 * performing update of version number for `README.md` and `lib/ruuuby/version.rb` is now automated
 * (`f98`): m{`Module`}'s func{`⨍_add_aliases`} converted to alias the func{`f_add_aliases`} created from `C-extensions`

| gem added | version |
| ---: | :---- |
| `schema_plus_foreign_keys` | `0.1.8` |


| path added | reference | notes | feature(s) |
| ---: | --- | --- | --- |
| `db/seeds/git_commits.rb` |  |  | `f15` |
| `db/seeds/ruuuby_features.rb` |  |  | `f15` |
| `db/seeds/ruuuby_releases.rb` |  |  | `f15` |
| `app/models/git_commit.rb` | `::GitCommit` |  | `f15` |
| `lib/ruuuby/ruuuby/ruuuby_api.rb` | `::Ruuuby::RuuubyAPI` |  | `f15` |
| `lib/ruuuby/ruuuby/routine.rb` |  | `example usage: Routine::CMD.new` | `f15` |

| class | method(s) added | feature(s) |
| --- | --- | --- |
| `File` | `dirname⁴` | `f12` |

---

# v0.0.26
 * cleanup creation of function aliases (remove redundant declarations, move needed ones into `ide_helper`, and use new func{`⨍_add_aliases`} where possible)
 * `DRY`: attribute-module(`Cardinality`) now auto-assigns the alias `𝔠`
 * reduce number of locations requiring manual edits/checks when releasing version updates
 * add normalizer_option(`:ℕ`) to func(🛑int❓)
 * add `RSpec` section `db`, clean-up various locations where `db/seed` was loaded before

| added path | reference | notes | feature(s) |
| ---: | --- | --- | --- |
| `lib/ruuuby/module/attribute/includable/notation_set_mathematics.rb` | ``Ruuuby::Attribute::Includable::Notation::SetMathematics`` |  | `f09` |
| `lib/ruuuby/ruuuby/ruuuby_metadata.rb` | ``Ruuuby::MetaData`` | design pending | |

| class | method(s) added | feature(s) |
| --- | --- | --- |
| `Module` | `⨍_add_aliases` | `f10` |
| `File` | `replace_expr_with`, `replace_expr_with!` | `f12` |
| `RuuubyRelease` | `<`, `>`, `get_next_version_uid`, `get_latest_version_uid` | `f15` |

| class | alias(es) added | feature(s) |
| --- | --- | --- |
| `Object` | (freeze) `❄`, `❄?` | `f10` |

| path removed | notes |
| ---: | --- |
| `conditionals/ruuuby_configs.rb` | configs not needed during runtime should be dynamically handled, not with conditionally loaded files (created explicitly for such need) |

---

# v0.0.25
 * start dividing (`f98`)/`C-code` across multiple header files, lots of small misc changes (ex: moved various constants definitions from `Ruuuby's` `Float`)
 * re-structure `Feature` <---> `Module` mapping, add `audit` tests to verify pattern is present/consistent
 * move certain funcs out of `Kernel` and directly add them to `TOPLEVEL_BINDING` to avoid polluting other classes
 * (`f00`) start formalization of existing funcs w/ name(`η̂`, `normalize`) and/or when `normalization` is applied to `args` (any context)
 * symbolic-math support being added only for niche use-cases, `automatic-differentiation` features to take priority in case of any feature-conflicts

| added path | reference | notes | feature(s) |
| ---: | --- | --- | --- |
| `lib/ruuuby/global_funcs.rb` |  |  | `f15` |
| `ext/ruby/class_mods/c0_constants.h` |  |  | `f98` |
| `ext/ruby/class_mods/c1_typed_checks.h` |  |  | `f98` |
| `ext/ruby/class_mods/c2_extension_memory.h` |  |  | `f98` |
| `ext/ruby/class_mods/c3_macro_utilities.h` |  |  | `f98` |

| class | method(s) added | feature(s) |
| --- | --- | --- |
| `String` | `♻️until!` | `f08` |
| `TOPLEVEL_BINDING` | `tan`, `tan°` | `f17` |
| `String` | `to_radian` | `f17` |

| class | alias(es) added | feature(s) |
| --- | --- | --- |
| `Array` | (remove_empty!): `♻️∅!` | `f10` |
| `Set` | (remove_empty!): `♻️∅!` | `f10` |
| `String` | (reverse): `↩️`, `↩️!`, `↩`, `↩!` | `f10` |
| `Array` | (reverse): `↩`, `↩!`, `↩∀` | `f10` |

---

# v0.0.24
 * ensure `Ruby` data created from `C-extensions` gets guarded against `garbage-collection`
 * start utilizing configs for `Ruuuby`, especially for debugging information

| added path | reference | notes | feature(s) |
| ---: | --- | --- | --- |
| `lib/ruuuby/configs.rb` |  |  | `f23` |

---

# v0.0.23
 * (starting-point) add support for representing `Complex Infinity`; (for now) via Symbol(`∞ℂ`)
 * add Feature(`f03`) and Attribute(`SubscriptIndexing`) to Class(`Symbol`)
 * add missing tests and fix bugs (missing scenario coverage) for c(`Object`)'s funcs `🛑ℤ❓` and `🛑𝕌❓`
 * `power-operations` given support for working with 'custom' `infinitity values`, Class(`Rational`) given support for `superscript-power-operations`
 * various consts defined into c(`Float`) but to soon be moved into (`f98`)
 
| class | method(s) added | feature(s) |
| --- | --- | --- |
| `Kernel` | `¿`, `∞`, `∞ℂ` | `f10`, `f17` |
| `Integer` | `¿?`, `nan?`, `∞ℂ?` | `f17` |
| `Float` | `¿?`, `∞ℂ?` | `f17` |
| `Symbol` | `power?`, `pow_to_i` | `TODO_LABEL` |
| `Rational` | `^` | `f16` |

---

# v0.0.22
 * continued (minor) improvements to catching bad parameters & throwing needed errors
 * (`f98`) add func(`err_to_num`) to class(`String`) as a utility function for throwing errors
 * start organizing groups of functions into modules labeled by their `Feature` or `Attribute` (`includable` or `extendable`)
 * tech debt accumulation to be dealt with by `v0.1.0` to remove all `🍝 code` prior to adding support to `automatic differentiation`

| added path | reference | notes | feature(s) |
| ---: | --- | --- | --- |
| `lib/ruuuby/class/sym.rb` | ``Symbol`` |  | `f10` |
| `lib/ruuuby/module/attribute/includable/cardinality.rb` | ``Ruuuby::Attribute::Includable::Cardinality`` |  | `f04` |
| `lib/ruuuby/module/attribute/includable/subscript_indexing.rb` | ``Ruuuby::Attribute::Includable::SubscriptIndexing`` |  | `f10` |
| `lib/ruuuby/module/attribute/includable/syntax_cache.rb` | ``Ruuuby::Attribute::Includable::SyntaxCache`` |  | `f10` |
| `lib/ruuuby/module/attribute/extendable/syntax_cache.rb` | ``Ruuuby::Attribute::Extendable::SyntaxCache`` |  | `f10` |

| class | method(s) added | feature(s) |
| --- | --- | --- |
| `Object` | `🛑𝕌❓` | `f06` |
| `Array` | `η̂!` | `f08` |
| `Symbol` | (downcase, upcase) `⬇️`, `⬇`, `🔡`, `⬆️`, `⬆`, `🔠` | `f10` |
| `String` | (downcase, upcase) `⬇️`, `⬇`, `🔡`, `⬆️`, `⬆`, `🔠`, `⬇️!`, `⬇!`, `🔡!`, `⬆️!`, `⬆!`, `🔠!` | `f10` |
| `Enumerable` | `∀ₓᵢ` (each_with_index) | `f10` |
| `Object` | `define_singleton_⨍` (define_singleton_function) | `f10` |
| `Kernel` | `🌽_previous_⨍` | `f10` |
| `String` | `digit?`, `to_num`, `to_num?` | `f21` |

---

# v0.0.21
 * add const `NUCLEOTIDES` to `Ruuuby::VirtualTypes`
 * add missing scenarios & tests for `spec/helpers/static_test_data.rb`
 * rename m(`Module`)'s func(`∃func?`) to(`∃⨍?`)
 * rename m(`Module`)'s func(`∃func_alias?`) to(`∃⨍_alias?`)
 * (`f98`) add `global-constant`(`$PRM_MANY`), param-type checking functions expanded for multi-param check use-cases
 * add modules `ORMAttributeUID` and `ORMAttributeCache` to `ApplicationRecord` as well as module(`Syntax`), which each `ORM Class` will also define

| added path | reference | notes | feature(s) |
| ---: | --- | --- | --- |
| `bin/console_db` |  | same as `/bin/console` but also pre-loads `db/seed.rb` |  |
| `lib/ruuuby/class/re.rb` | ``Regexp`` |  | `f20` |
| `app/models/db_schema.rb` | ``RuuubyDBSchema`` | `temporary design` | `f15` |
| `lib/ruuuby/module/attribute_extendable/static_attribute_syntax_cache` | `::Ruuuby::StaticAttributeSyntaxCache` | | |

| class | method(s) added | feature(s) |
| --- | --- | --- |
| `Object` | `class?`, `module?`, `nucleotide?` | `f06` |
| `Module` | `∋?`, `∌?`, `∈?`, `∉?` | `f09` |
| `Object` | `🛑ℤ❓` | `f14` |

 * ⚠️ :
   * full `TDD` still omitted for `ORM` while certain design areas are more susceptible to needed refactors

---

# v0.0.20
 * (`f98`) add consts `RATIO_DEGREES_TO_RADIAN` and `RATIO_RADIANS_TO_DEGREE` into module `Math`
 * power-operations for `Integer` and `Float` given support for raising from `-1` to `-9` via superscripts(`⁻¹` to `⁻⁹`)

| added path | reference | notes | feature(s) |
| ---: | --- | --- | --- |
| `lib/ruuuby/module/math.rb` | ``Math`` |  | `f17` |
| `help/math/automatic_differentiation.rb` |  | `Ruuuby's` current main focus to add functionality support to | `f19` |

| class | method(s) added | feature(s) |
| --- | --- | --- |
| `Object` | `🛑flt❓` | `f06` |
| `Float` | `≈≈` | `f17` |
| `Kernel` | `sin` | `f17` |
| `Kernel` | `sin°` | `f17` |
| `Kernel` | `cos` | `f17` |
| `Kernel` | `cos°` | `f17` |
| `Kernel` | `∠ᶜ` | `f17` |
| `Kernel` | `∠°` | `f17` |


---

# v0.0.19
 * add some data-type/db-validation for `ORM`, still lots of TODOs here
 * purge `ruuuby/version.rb` of all content except `constant String`: `VERSION` (as `ORM` functionality will cover prior needed use-cases)
 * add missing test cases for power-operations and `Object's` funcs(`flt?`, `num?`)
 * power-operations for `Float` moved into `ruby_class_mods.c`
 * general improvements for performance-testing and `RSpec` structuring
 * `ruby_class_mods.c` to start using `non-ascii` based `#define` statements
 * start adding code for negative-exponents
 
| class | method(s) added | feature(s) |
| --- | --- | --- |
| `File`, `Dir` | `∅?` | `f04` |
| `ApplicationRecord` | `♻️`, `♻️!` | `f10` |
| `Kernel` | `🎲`, `∛`, `π`, `φ`, `γ` | `f10` |
| `Object` | `⁻¹`, `⁻²`, `⁻³`, `⁻⁴`, `⁻⁵`, `⁻⁶`, `⁻⁷`, `⁻⁸`, `⁻⁹` | `f16` |
| `Dir` | `normalized_paths` | `f12` |


---

# v0.0.18
 * ⚠️ intermediate patch (full testing coverage of this patch to be concluded within `0.0.19`-`0.0.30`)
 * renaming existing func(`🛑str_or_ary❓`) to(`🛑countable❓`); it now checks for `Set` as well
 * add `gem 'sqlite3', '~> 1.4.2'`
 * add `gem 'activerecord', '~> 5.2.4.1'`
 * start process of tracking language changes across versions into `ORM`/`db`
   * start process of auto-generating documentation from these objects

| added path | reference | notes | feature(s) |
| ---: | --- | --- | --- |
| `lib/ruuuby/class/io/file.rb` | ``File`` |  | `f12` |
| `lib/ruuuby/class/io/dir.rb` | ``Dir`` |  | `f12` |
| `lib/ruuuby/types.rb` | ``Ruuuby::VirtualTypes`` | adds (module-scoped) constants `🅱️`, `STRY`, `NUMS`, `COUNTABLES`  | `f06` |
| `app/models/application_record.rb` | ``ApplicationRecord`` |  | `f15` |
| `app/models/ruuuby_changelog.rb` | ``RuuubyChangelog`` |  | `f15` |
| `app/models/ruuuby_feature.rb` | ``RuuubyFeature`` |  | `f15` |
| `app/models/ruuuby_release.rb` | ``RuuubyRelease`` |  | `f15` |
| `lib/ruuuby/class/method.rb` | ``Method`` |  |  |
| `conditionals/ide_helper.rb` |  | received all duplicated aliases (for playing nice with IDEs, happens from funcs created in `C-extension`)  |  |
| `db/db.rb` |  |  | `f15` |
| `db/seed.rb` |  |  | `f15` |

| class(es) | method(s) added | feature(s) |
| --- | --- | --- |
| `File`, `Dir` | `∃?` | `f12` |
| `File` | `dirname²`, `dirname³` | `f12` |
| `Kernel` | `📁` (`::File`), `📂` (`::File`), `🗄️` (`::Dir`) | `f12` |
| `Object` | `flt?`, `num?` | `f06` |
| `Integer`, `Numeric` | `♾️?` (infinite?) | `f11` |
| `Method` | `🏠` (`source_location`) | `f10` |

---

# 0.0.17

#### Abstract
 * (`f15`): start general, wide-scale, re-structuring to manage changes into categorized `features`

#### Discrete
 * ⚠️ (full coverage of this patch to be concluded in future patch)
 * continued audit on number classes (see notes from v`0.0.15-16`)
 * (⚠️ missing coverage) add support for raising to powers `0-9` for `Integer` and `Float`
 * for math related `RSpecs`, move common/shared `let` definitions into `spec_helper.rb`, add additional ones to form a general schema for testing data
 
#### Methods & Aliases:
 | (c)lass or (m)odule                  | methods/aliases added | feature |
 | ------------------------------------ | --------------------- | ------- |
 | (m) `Kernel`                         | `𝔠`                   | `f03` |
 | (c) `String`, `Set`, `Array`, `Hash` | `𝔠` (length)          | `f03` |
 | (c) `Class`                          | `🆕` (new)            | `TODO: feature label` |
 | (c) `Object`                         | `⁰`, `¹`, `²`, `³`, `⁴`, `⁵`, `⁶`, `⁷`, `⁸`, `⁹` | `TODO: feature label` |
 | (c) `Object` | `🛡️funcs` (protected_methods), `🙈funcs` (private_methods) | [`f01`, `f02`] |
 | (m) `Module` | `🛡️` (protected), `∃🛡️func?` (protected_method_defined?), `🛡️instance_funcs` (protected_instance_methods), `🙈instance_funcs` (private_instance_methods), `🙈class_func` (private_class_method) | [`f01`, `f02`] |
 | (c) `Integer`                        | `^`, `preserved_reference_to_bitwise_or` | `TODO: feature label` |
 | (c) `Float`                          | `^` | `TODO: feature label` |

#### Files Added:
 * `ruuuby/class/class.rb`

---

# 0.0.16
 * modify various functions to not allocate un-necessary memory (ex: call `.reverse_each` instead of `reverse.each`)
 * continued audit on number classes (see notes from v`0.0.15`), add domain checks for `𝕌?`, `𝔹?`
 * add first multi-step audit test against project file structure (will require better solution, just a starting point)
 * add/move the following methods/aliases:

 | (c)lass or (m)odule                  | methods/aliases added/moved                               | feature |
 | ------------------------------------ | --------------------------------------------------------- | ------- |
 | (c) `Array`                          | `equal_contents?` (`≈≈` now aliases it)                   |
 | (c) `Array`                          | `frequency_counts` (`📊` now aliases it)                  |
 | (c) `Array`                          | `disjunctive_union` (`⊕` now aliases it)                  |
 | (c) `Array`                          | `↩️` (reverse), `↩️!` (reverse!), `↩️∀` (reverse_each)   |
 | (c) `Object`                         | `🅱️?` (alias to `bool?`), `🛑🅱️❓`                       |
 | (c) `Integer`                        | `∞?`, `𝕌?`                                                |
 | (c) `Float`, `Complex`, `BigDecimal` | `𝕌?`                                                      |
 | (c) `Numeric`                        | `𝕌?`, `𝔹?`                                                |
 | (c) `Hash`                           | `🗝?`, `∃🗝?` (both alias `key?`, same as `🔑?`, `∃🔑?`) |

---

# 0.0.15
 * add directory `ruuuby/class/enumerable`, move `ary.rb`, `hsh.rb` and newly created `set.rb` into it
 * add files: `ruuuby/module/enumerable.rb` and `ruuuby/class/nums/numeric.rb`
 * move various existing functions/aliases from sub-classes into common parent modules and/or classes where possible, ex: `∌?` out of `Array` and into `enumerable` to share common features w/ others like `Set`
 * move certain module/class initial definition/creation into `ruby_class_mods.c`
 * for number classes (ex: `Integer`), fix various logical/performance/test-coverage flaws for funcs like `ℕ?`

 | (c)lass or (m)odule | methods/aliases added/moved                      | feature |
 | ------------------- | ------------------------------------------------ | ------- |
 | (c) `Array`         | `start_with?`, `ensure_start!`                   | `f08`   |
 | (c) `Set`           | `remove_empty!`, `∅?` (empty?), `∀` (each), `∋?` | `f09`   |
 | (m) `Enumerable`    | `∌?`, `⨍` (map)                                  | `f09`   |
 | (c) `Numeric`       | `∞?` (infinite?)                                  | `f10`   |
 | (c) `Integer`       | `finite?`, `infinite?`                             | `f11`   |

---

# 0.0.14
 * add gem `'tty-command', '~> 0.9.0'` to group `runtime`
 * for use by `audit RSpecs`: start various means of tracking internal versions, configs, etc; will help form dynamically generated audits and reports
 * temporarily remove `.travis.yml` (auto-generated at project creation but would be useful to utilize)

| feature | change |
| ------- | ------ |
| `f14`   | adjust naming on param check functions (in `Ruuuby::ParamErr`), ex: `🛑❓bool` change to `🛑bool❓` |

---

# 0.0.13
 * move utility functionality from `spec_helper.rb` and others into newly created Directory: `spec/helpers/`
 * remove param:`use_partial_fill_in` from `String`'s funcs `ensure_start!` and `ensure_ending!`
 * heavily adjust usage/style for throwing param errors via `Ruuuby::Err` now(`Ruuuby::ParamErr`)
 * add new type of RSpec: `audit`
 
 | (c)lass or (m)odule      | methods/aliases added | feature |
 | ------------------------ | --------------------- | ------- |
 | (c) `Hash`               | `∀` (each), `∅?` (empty) | `f09`, `f04` |
 | (m) `Kernel`             | `🛑` (raise), `√` (Math.sqrt) | `f14`, `f10` |
 | (m) `Module`             | `∃func?` (func created and alias removed), `∃🙈func?` (private_method_defined?) | `f13` |
 | (c) `NilClass`, `String` | `∅?` (empty) | `f04` |
 | (c) `Array`              | `ensure_ending!`, `end_with?`, `∅?` (empty), `uniq_to_me` (∖) | `f09`, `f04` |
 | (c) `Object`             | `🛑❓bool`, `🛑❓int`, `🛑❓ary`, `🛑❓str`, `🛑❓stry`, `🛑❓str_or_ary` | `f14` |

* remove the following methods/aliases:

| (c)lass or (m)odule | methods/aliases removed |
| ------------------- | --------------------- |
| (m) `Ruuuby::Err`   | `param¬bool`, `param¬str`, `param¬stry`, `param¬ary`, `param¬module`, `param¬class` |

---

# 0.0.12
 * organize `ruuuby/version.rb` into major, minor, & tiny versions
 * add string generating macros for `rb_require` in `ruby_class_mods.c`
 * remove certain helper funcs from `spec_helper.rb` as core language adds similar wrappers
 * add organization and new information to `help/ruuuby.md`
 * add files: `ruuuby/module/kernel.rb`, `ruuuby/module/module.rb`, and `ruuuby/arg_err.rb`
 
 | (c)lass or (m)odule | methods/aliases added | feature |
 | ------------------- | --------------------- | ------- |
 | (m) `Module`        | `🙈`, `🙈constants⟶`, `∃const?`, `∃func?`, `∃func_alias?` | `f13` |
 | (m) `Kernel`        | `∃module?`, `∃class?` | `f13`   |
 | (m) `Ruuuby::Err`   | `param¬bool`, `param¬str`, `param¬stry`, `param¬ary`, `param¬module`, `param¬class` | `f14` |
 | (c) `Ruuuby::Err::WrongParamType` | `generate_error_text`, `throw` | `f14` |
 | (c) `Object`        | `stry?`               | `f06`   |

---

# 0.0.11
 * add more organization to `extconf.rb`
 * add `bin/audit_quick` for faster iterative development
 * add missing section in performance testing tiers and general cleanup to some RSpec structure
 * move/add the following to `ruby_class_mods.c`
   * move `Array`'s added method `>>`
   * move `String`'s added method `>>`
   * add private method `disjunctive_union` to `Array` for use in method`⊕`
 
 | (c)lass or (m)odule | methods/aliases added | feature |
 | ------------------- | --------------------- | ------- |
 | (c) `Hash`          | `🔑?`, `∃🔑?`         | `f10`   |
 | (c) `Array`         | `∀`, `📊`, `≈`        | `f09`   |
 | (m) `Ruuuby`        | `∃module?`, `∃class?` | `f13`   |

---

# 0.0.10
 * move various `require` statements from `ruuuby.rb` to `ruby_class_mods.c`
 * remove all `Ruuuby::Enum`'s and relating references
 * add/update minor details to `README.md`
 * add `help/jruby.md` to document jruby extensions gotchas along the way
 * add initial `Dockerfile` and `docker-compose.yml`
 
 | class        | methods added                | feature |
 | -----------  | ---------------------------- | ------- |
 | `Integer`    | `ℕ?`, `ℤ?`, `ℚ?`, `ℂ?`, `ℝ?` | `f11`   |
 | `Float`      | `ℕ?`, `ℤ?`, `ℚ?`, `ℂ?`, `ℝ?` | `f11`   |
 | `BigDecimal` | `ℕ?`, `ℤ?`, `ℚ?`, `ℂ?`, `ℝ?` | `f11`   |
 | `Complex`    | `ℕ?`, `ℤ?`, `ℚ?`, `ℂ?`, `ℝ?` | `f11`   |
 | `Rational`   | `ℕ?`, `ℤ?`, `ℚ?`, `ℂ?`, `ℝ?` | `f11`   |

---

# 0.0.9
 * add example usage in `README.md`
 * add various aliases and functions for additional set math operations
 
 | class    | method(s)/alias(es) added | feature |
 | -------  | ------------------------- | ------- |
 | `Array`  | `∌?`, `∋?`                | `f09`   |
 | `String` | `∌?`, `∋?`, `∈?`, `∉?`    | `f09`   |
 
---

# 0.0.8
 * mark various files with `UTF-8` encoding: `# -*- encoding : utf-8 -*-`
 * add `help` directory to contain troubleshooting documentation
 * for now, remove `gem`: `simplecov` and temporarily stop tracking LOCs coverage until JRuby extensions are added in
 * extend usage of pre-processing for C files
 * increase scope of performance RSpecs, light adjustments to remaining RSpecs for clarity & future scope
 * add various aliases to existing Ruby functions/fields/constants/etc
 
| class           | base reference                          | alias         | feature |
| --------------- | --------------------------------------- | ------------- | ------- |
| `Object`        | method: `object_id`                     | `🆔`          | `f10`   |
| `Object`        | method: `freeze`                        | `❄️`          | `f10`   |
| `Object`        | method: `frozen?`                       | `❄️?`         | `f10`   |
| `Array`         | method: `∑`                             | `each`        | `f10`   |
| `Array`         | method: `⨍`                             | `map`         | `f10`   |

 * added the following methods:
 
 | class    | method added     | feature |
 | -------  | ---------------- | ------- |
 | `Array`  | `>>`             | `f05`   |
 | `Array`  | `⊕`              | `f09`   |
 | `Array`  | `∖`              | `f09`   |

 * add/replace various Ruby functions with native C-extensions (`ruuuby/ext/ruby_class_mods/ruby_class_mods.c`):
 
 | modified class   | funcs added/replaced  | feature |
 | --------------- | --------------------- | ------- |
 | `Object`        | `hsh?`                | `f06`   |
 | `Array`         | `remove_empty!`       | `f07`   |

---

# 0.0.7
 * add gem `'rake-compiler', '~> 1.1.0'` to group `development`
 * adjust `bin/audit`, `ruuuby.gemspec`, `Rakefile`, etc to support native C-extensions
 * added section `project layout` and update formatting to `README.md`
 * replace various Ruby functions with native C-extensions (`ruuuby/ext/ruby_class_mods/ruby_class_mods.c`):
 
 | modified class   | funcs replaced                          | feature |
 | --------------- | --------------------------------------- | ------- |
 | `Object`        | `ary?`, `bool?`, `int?`, `str?`, `sym?` | `f06`   |
 | `NilClass`      | `empty?`                                | `f04`   |

---

# 0.0.6
 * add {`Ruuuby::Enum::Text`}
 * minor changes/functions-added to DRY some code
 * add `Gemfile.lock` to `.gitignore`
 
 | class    | method added     | feature |
 | -------  | ---------------- | ------- |
 | `Object` | `sym?`           | `f06`   |
 | `String` | `>>`             | `f05`   |
 | `String` | `ensure_start!`  | `f08`   |
 | `String` | `ensure_ending!` | `f08`   |

---

# 0.0.5
 * for time being, remove ruby `v2.7` requirement
 * `freeze` various constants and modules
 * slightly clean-up (with helper functions) and expand RSpec scenario coverage
 
 | class    | method added | feature |
 | -------- | ------------ | ------- |
 | `Object` | `str?`       | `f06`   |

---

# 0.0.4
 * add gem `'rspec-benchmark', '~> 0.5.1'`
 * remove file `.rpsec`, add rspec configurations through code
 * add performance tests along with a few missed ones
 * update `ruuuby.gemspec` to require ruby `2.7.0`
 * split testing into the following groups:
 
| category            | command                              |
| ------------------- | ------------------------------------ |
| all but performance | `bundle exec rake rspec`             |
| only performance    | `bundle exec rake rspec_performance` |
| all tests           | `bundle exec rake rspec_all`         |

---

# v0.0.3
 * modify `Ruuuby::Enum::Emoji` from `Strings` to `Symbols`
 * fix gemspec to reflect correct git URLs

| added path | reference | notes | feature(s) |
| ---: | --- | --- | --- |
| `lib/class/ary.rb` | ``Array`` |  | `f07`, `f06` |
| `lib/class/int.rb` | ``Integer`` |  | `f06` |

| class | method(s) added | feature(s) |
| --- | --- | --- |
| `Object` | `int?` | `f06` |
| `Object` | `ary?` | `f06` |
| `Array` | `remove_empty!` | `f07` |


---

# v0.0.2
| class | method(s) added | feature(s) |
| --- | --- | --- |
| `Object` | `bool?` | `f06` |

---

# v0.0.1

| added path | reference | notes | feature(s) |
| ---: | --- | --- | --- |
| `CHANGELOG.md` |  |  |  |
| `lib/ruuuby/class/nil.rb` | ``NilClass`` |  | `f04` |
| `lib/ruuuby/enum/emoji.rb` |  | Ruuuby::Enum::Emoji |  |
| `bin/audit` |  | for running rdoc, rspecs, and coverage reports |  |

| class | method(s) added | feature(s) |
| --- | --- | --- |
| `NilClass` | `empty?` | `f04` |

---

# v0.0.0
 * initial project creation

---
