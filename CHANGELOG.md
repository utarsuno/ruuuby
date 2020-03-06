# 0.0.15
 * add directory `ruuuby/class/enumerable`, move `ary.rb`, `hsh.rb` and newly created `set.rb` into it
 * add files: `ruuuby/module/enumerable.rb` and `ruuuby/class/nums/numeric.rb`
 * move various existing functions/aliases from sub-classes into comment parent modules and/or classes when possible, ex: `∌?` out of `Array` and into `enumerable` to share common features w/ others like `Set`
 * move certain module/class initial definition/creation into `ruby_class_mods.c`
 * for number classes (ex: `Integer`), fix various logical/performance/test-coverage flaws for funcs like `ℕ?`
 * add/move the following methods/aliases:

 | (c)lass or (m)odule | methods/aliases added/moved                      |
 | ------------------- | ------------------------------------------------ |
 | (c) `Array`         | `start_with?`, `ensure_start!`                   |
 | (c) `Set`           | `remove_empty!`, `∅?` (empty?), `∀` (each), `∋?` |
 | (m) `Enumerable`    | `∌?`, `⨍` (map)                                  |
 | (c) `Numeric`       | `∞?` (infinite?)                                  |
 | (c) `Integer`       | `finite?`, `infinite?`                             |

---

# 0.0.14
 * add gem `'tty-command', '~> 0.9.0'` to group `runtime`
 * adjust naming on param check functions (in `Ruuuby::ParamErr`), ex: `🛑❓bool` change to `🛑bool❓`
 * add c headers in preparation for future functionality
 * for use by `audit RSpecs`: start various means of tracking internal versions, configs, etc; will help form dynamically generated audits and reports
 * misc minor clean-ups
 * temporarily remove `.travis.yml` (auto-generated at project creation but would be useful to utilize)

---

# 0.0.13
 * move utility functionality from `spec_helper.rb` and others into newly created Directory: `spec/helpers/`
 * remove param:`use_partial_fill_in` from `String`'s funcs `ensure_start!` and `ensure_ending!`
 * heavily adjust usage/style for throwing param errors via `Ruuuby::Err` now(`Ruuuby::ParamErr`)
 * add new type of RSpec: `audit`
 * add the following methods/aliases:
 
 | (c)lass or (m)odule      | methods/aliases added |
 | ------------------------ | --------------------- |
 | (c) `Hash`               | `∀` (each), `∅?` (empty) |
 | (m) `Kernel`             | `🛑` (raise), `√` (Math.sqrt) |
 | (m) `Module`             | `∃func?` (func created and alias removed), `∃🙈func?` (private_method_defined?) |
 | (c) `NilClass`, `String` | `∅?` (empty) |
 | (c) `Array`              | `ensure_ending!`, `end_with?`, `∅?` (empty), `uniq_to_me` (∖) |
 | (c) `Object`             | `🛑❓bool`, `🛑❓int`, `🛑❓ary`, `🛑❓str`, `🛑❓stry`, `🛑❓str_or_ary` |

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
 * add the following methods/aliases:
 
 | (c)lass or (m)odule | methods/aliases added |
 | ------------------- | --------------------- |
 | (m) `Module`        | `🙈`, `🙈constants⟶`, `∃const?`, `∃func?`, `∃func_alias?` |
 | (m) `Kernel`        | `∃module?`, `∃class?` |
 | (m) `Ruuuby::Err`   | `param¬bool`, `param¬str`, `param¬stry`, `param¬ary`, `param¬module`, `param¬class` |
 | (c) `Ruuuby::Err::WrongParamType` | `generate_error_text`, `throw` |
 | (c) `Object`        | `stry?`              |

---

# 0.0.11
 * add more organization to `extconf.rb`
 * add `bin/audit_quick` for faster iterative development
 * add missing section in performance testing tiers and general cleanup to some RSpec structure
 * move/add the following to `ruby_class_mods.c`
   * move `Array`'s added method `>>`
   * move `String`'s added method `>>`
   * add private method `disjunctive_union` to `Array` for use in method`⊕`
 * add the following methods/aliases:
 
 | (c)lass or (m)odule | methods/aliases added |
 | ------------------- | --------------------- |
 | (c) `Hash`          | `🔑?`, `∃🔑?`         |
 | (c) `Array`         | `∀`, `📊`, `≈`        |
 | (m) `Ruuuby`        | `∃module?`, `∃class?` |

---

# 0.0.10
 * move various `require` statements from `ruuuby.rb` to `ruby_class_mods.c`
 * remove all `Ruuuby::Enum`'s and relating references
 * add/update minor details to `README.md`
 * add `help/jruby.md` to document jruby extensions gotchas along the way
 * add initial `Dockerfile` and `docker-compose.yml`
 * add the following methods:
 
 | class        | methods added                |
 | -----------  | ---------------------------- |
 | `Integer`    | `ℕ?`, `ℤ?`, `ℚ?`, `ℂ?`, `ℝ?` |
 | `Float`      | `ℕ?`, `ℤ?`, `ℚ?`, `ℂ?`, `ℝ?` |
 | `BigDecimal` | `ℕ?`, `ℤ?`, `ℚ?`, `ℂ?`, `ℝ?` | 
 | `Complex`    | `ℕ?`, `ℤ?`, `ℚ?`, `ℂ?`, `ℝ?` |
 | `Rational`   | `ℕ?`, `ℤ?`, `ℚ?`, `ℂ?`, `ℝ?` |

---

# 0.0.9
 * add example usage in `README.md`
 * add various aliases and functions for additional set math operations
 
 | class    | method(s)/alias(es) added |
 | -------  | ------------------------- |
 | `Array`  | `∌?`, `∋?`                |
 | `String` | `∌?`, `∋?`, `∈?`, `∉?`    |
 
---

# 0.0.8
 * mark various files with `UTF-8` encoding: `# -*- encoding : utf-8 -*-`
 * add `help` directory to contain troubleshooting documentation
 * for now, remove `gem`: `simplecov` and temporarily stop tracking LOCs coverage until JRuby extensions are added in
 * extend usage of pre-processing for C files
 * increase scope of performance RSpecs, light adjustments to remaining RSpecs for clarity & future scope
 * add various aliases to existing Ruby functions/fields/constants/etc
 
| class           | base reference                          | alias         | notes |
| --------------- | --------------------------------------- | ------------- | ----- |
| `Object`        | field: `object_id`                       | `🆔`          |       |
| `Object`        | method: `freeze`                        | `❄️`          |       |
| `Object`        | method: `frozen?`                       | `❄️ ?`        |       |
| `Array`         | method: `∑`                             | `each`        |       |
| `Array`         | method: `⨍`                             | `map`         |       |

 * added the following methods:
 
 | class    | method added     |
 | -------  | ---------------- |
 | `Array`  | `>>`             |
 | `Array`  | `⊕`              |
 | `Array`  | `∖`              |

 * add/replace various Ruby functions with native C-extensions (`ruuuby/ext/ruby_class_mods/ruby_class_mods.c`):
 
 | modified class   | funcs added/replaced  |
 | --------------- | --------------------- |
 | `Object`        | `hsh?`                |
 | `Array`         | `remove_empty!`       |

---

# 0.0.7
 * add gem `'rake-compiler', '~> 1.1.0'` to group `development`
 * adjust `bin/audit`, `ruuuby.gemspec`, `Rakefile`, etc to support native C-extensions
 * added section `project layout` and update formatting to `README.md`
 * replace various Ruby functions with native C-extensions (`ruuuby/ext/ruby_class_mods/ruby_class_mods.c`):
 
 | modified class   | funcs replaced  |
 | --------------- | --------------- |
 | `Object`        | `ary?`, `bool?`, `int?`, `str?`, `sym?` |
 | `NilClass`      | `empty?` |

---

# 0.0.6
 * add {`Ruuuby::Enum::Text`}
 * minor changes/functions-added to DRY some code
 * add `Gemfile.lock` to `.gitignore`
 * add the following methods:
 
 | class    | method added     |
 | -------  | ---------------- |
 | `Object` | `sym?`           |
 | `String` | `>>`             |
 | `String` | `ensure_start!`  | 
 | `String` | `ensure_ending!` |

---

# 0.0.5
 * for time being, remove ruby `v2.7` requirement
 * `freeze` various constants and modules
 * slightly clean-up (with helper functions) and expand RSpec scenario coverage
 * add the following method:
 
 | class  | method added    |
 | -----  | ------------- |
 | `Object` | `str?`      |

---

# 0.0.4
 * add gem `'rspec-benchmark', '~> 0.5.1'`
 * remove file `.rpsec`, add rspec configurations through code
 * add performance tests along with a few missed ones
 * heavily update `README.md`
 * update `ruuuby.gemspec` to require ruby `2.7.0`
 * split testing into the following groups:
 
| category | command |
| -------- | ------- |
| all but performance | `bundle exec rake rspec` |
| only performance | `bundle exec rake rspec_performance` |
| all tests | `bundle exec rake rspec_all` |

---

# 0.0.3
 * modify {`Ruuuby::Enum::Emoji`} from strings to symbols
 * fix gemspec to reflect correct git URLs
 * add first update to `README.md`
 * add the following methods:

| class  | method added    |
| -----  | ------------- |
| `Object` | `int?`          |
| `Object` | `ary?`          |
| `Array`  | `remove_empty!` |

---

# 0.0.2
 * add the following method:

| class  | method added    |
| -----  | ------------- |
| `Object` | `bool?`         |

---

# 0.0.1
 * add `CHANGELOG.md`
 * add {`Ruuuby::Enum::Emoji`}
 * add bin/audit (for running rdoc, rspecs, and coverage reports)
 * add the following method:

| class    | method added    |
| -----    | ------------- |
| `NilClass` | `empty?`        |

---

# 0.0.0
 * initial project creation
