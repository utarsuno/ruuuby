---
### (upcoming patches) v0.0.19-v0.0.22
 * resolve missing coverage from `v0.0.17`
 * resolve missing coverage from `v0.0.18`

#### Abstract
 * start automation/abstraction of state & configs for CLI based APIs, tools, and scripts (gem `tty-command` providing core functionality)
 * start automation/abstraction of code-file (content) management
 * continuation of (`f15`) in relation to above 2 points
---

# v0.0.18
 * ⚠️ intermediate patch (full testing coverage of this patch to be concluded in `0.0.19`)
 * renaming existing func(`🛑str_or_ary❓`) to(`🛑countable❓`); it now checks for `Set` as well
 * move all duplicated aliases (for playing nice with IDEs, happens from funcs created in `C-extension`) into `conditionals/ide_helper.rb`
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
| `conditionals/ide_helper.rb` |  |  |  |
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
| `Object`        | method: `freeze`                        | `❄️`          | `f00`   |
| `Object`        | method: `frozen?`                       | `❄️ ?`        | `f00`   |
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
