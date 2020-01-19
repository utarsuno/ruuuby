# Ruuuby

```flavored modifications & extensions for increased quality of Ruby coding life```

| for       | use |
| --------- | ----------------------------------------------------------- |
| `Gemfile`  | `gem 'ruuuby', '~> 0.0.7'`                                  |
| library   | `require 'ruuuby'`                                          |
| gem url   | https://rubygems.org/gems/ruuuby                            |
| changelog | https://github.com/utarsuno/ruuuby/blob/master/CHANGELOG.md |

---
## Language Changes:

#### Methods Added:
| class           | func(s)                                 | as extension? | notes |
| --------------- | --------------------------------------- | ------------- | ----- |
| `Object`        | `ary?`, `bool?`, `int?`, `str?`, `sym?` | ✅            |       |
| `Array`         | `remove_empty!`                         | ❌            |       |
| `String`        | `ensure_start!`, `ensure_ending!`       | ❌            | ⚠️ see docs on `use_partial_fill_in` before use    |
| `NilClass`      | `empty?`                                | ✅            | added for sake of `Array`'s func: `remove_empty!` |

#### Ordinary Methods Added:
| class           | func(s)                                 | as extension? | notes |
| --------------- | --------------------------------------- | ------------- | ----- |
| `String`        | `>>`                                    |  ❌           | prepend provided arg, reverse operation of `<<` |

---

### Code Base Statistics:
| category | attribute     | value    | desc.                                                           |
| -------- | ------------- | -------- | --------------------------------------------------------------- |
| QA       | unit          | 73       | # of tests                                                      |
| QA       | performance   | 12       | # of tests                                                      |
| coverage | LOCs          | 474      | relevant lines of Ruby code covered (⚠️ C stats wip)            |
| coverage | runtime       | 100      | % of (Ruby) LOCs executed during full QA suite (⚠️ C stats wip) |
| coverage | documentation | 100      | % of (Ruby) LOCs with enough documentation (⚠️ C stats wip)     |

---

### Gems:
| gem             | version | :development | :test | :production |
| --------------- | ------- | ------------ | ----- | ----------- |
| rake-compiler   | 1.1.0   | ✅           | ❌   | ❌          |
| rdoc            | 6.2.1   | ✅           | ❌   | ❌          |
| simplecov       | 0.17.1  | ✅           | ❌   | ❌          |
| rake            | 13.0.1  | ✅           | ✅   | ❌          |
| rspec           | 3.9.0   | ✅           | ✅   | ❌          |
| rspec-benchmark | 0.5.1   | ✅           | ✅   | ❌          |

---

### Rake Tasks:
|  preface           | cmd                 | description                                       |
| ------------------ | ------------------- | ------------------------------------------------- |
| `bundle exec rake` | `rdoc`              | generate documentation coverage report            |
| `bundle exec rake` | `rspec`             | run only non-performance based unit-tests         |
| `bundle exec rake` | `rspec_performance` | run only performance based unit-tests             |
| `bundle exec rake` | `rspec_all`         | run all unit-tests                                |
| `bundle exec rake` | `install`           | install gem onto local machine                    |
| `bundle exec rake` | `compile`           | compile any native C-extensions with code changes |
| `bin/`             | `setup`             | install dependencies                              |
| `bin/`             | `console`           | interactive console for easier experimenting      |

---

### Project Layout:
|  directory | description of contents                        |
| ---------- | ---------------------------------------------- |
| `bin`      | executable files                                |
| `ext`      | C portion of this Gem's code (ruby extensions) |
| `lib`      | ruby portion of this Gem's code                |
| `spec`     | RSpecs (unit tests)                            |

---

>#### Contributing
>######Bug reports and pull requests are welcome on GitHub at https://github.com/utarsuno/ruuuby. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/utarsuno/ruuuby/blob/master/CODE_OF_CONDUCT.md).
>
>#### License
>######The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
>
>#### Code of Conduct
>######Everyone interacting in the Ruuuby project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/utarsuno/ruuuby/blob/master/CODE_OF_CONDUCT.md).
