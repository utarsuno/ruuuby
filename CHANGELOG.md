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

# 0.0.9
 * add example usage in `README.md`
 * add various aliases and functions for additional set math operations
 
 | class    | method(s)/alias(es) added |
 | -------  | ------------------------- |
 | `Array`  | `∌?`, `∋?`                |
 | `String` | `∌?`, `∋?`, `∈?`, `∉?`    |
 

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

# 0.0.7
 * add gem `'rake-compiler', '~> 1.1.0'` to group `development`
 * adjust `bin/audit`, `ruuuby.gemspec`, `Rakefile`, etc to support native C-extensions
 * added section `project layout` and update formatting to `README.md`
 * replace various Ruby functions with native C-extensions (`ruuuby/ext/ruby_class_mods/ruby_class_mods.c`):
 
 | modified class   | funcs replaced  |
 | --------------- | --------------- |
 | `Object`        | `ary?`, `bool?`, `int?`, `str?`, `sym?` |
 | `NilClass`      | `empty?` |

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

# 0.0.5
 * for time being, remove ruby `v2.7` requirement
 * `freeze` various constants and modules
 * slightly clean-up (with helper functions) and expand RSpec scenario coverage
 * add the following method:
 
 | class  | method added    |
 | -----  | ------------- |
 | `Object` | `str?`      |

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

# 0.0.2
 * add the following method:

| class  | method added    |
| -----  | ------------- |
| `Object` | `bool?`         |

# 0.0.1
 * add `CHANGELOG.md`
 * add {`Ruuuby::Enum::Emoji`}
 * add bin/audit (for running rdoc, rspecs, and coverage reports)
 * add the following method:

| class    | method added    |
| -----    | ------------- |
| `NilClass` | `empty?`        |

# 0.0.0
 * initial project creation
