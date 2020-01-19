# 0.0.6
 * add {`Ruuuby::Enum::Text`}
 * minor changes/functions-added to DRY some code
 * add `Gemfile.lock` to `.gitignore`
 * add the following methods:
 
 | class    | method added       |
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
 * add gem `rspec-benchmark`
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
