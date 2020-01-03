# 0.0.4
 * add gem rspec-benchmark
 * remove file `.rpsec`, add rspec configurations through code
 * split testing into the following groups:
    * all tests but performance: `bundle exec rake rspec`
    * only performance tests: `bundle exec rake rspec_performance`
    * all tests: `bundle exec rake rspec_all `
 * add performance tests along with a few missed ones
 * heavily update README.md
 * update `ruuuby.gemspec` to require ruby `2.7.0`

# 0.0.3
 * modify {Ruuuby::Enum::Emoji} from strings to symbols
 * fix gemspec to reflect correct git URLs
 * add first update to README.md
 * add the following functions:

| class  | func added    |
| -----  | ------------- |
| Object | int?          |
| Object | ary?          |
| Array  | remove_empty! |

# 0.0.2
 * add the following functions:

| class  | func added    |
| -----  | ------------- |
| Object | bool?         |

# 0.0.1
 * add CHANGELOG.md
 * add emoji enum {Ruuuby::Enum::Emoji}
 * add bin/audit (for running rdoc, rspecs, and coverage reports)
 * add the following functions:

| class    | func added    |
| -----    | ------------- |
| NilClass | empty?        |

# 0.0.0
 * initial project creation
