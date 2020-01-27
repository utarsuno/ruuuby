# Ruuuby

```flavored modifications & extensions for increased quality of Ruby coding life```

### Example
```ruby
'b'.∈? 'abc' # true
'abc'.∌? 'd' # true
'd'.∈? 'abc' # false

[1337, 'abc'.❄️].⨍ {|x| puts x if x.str? && x.❄️?}

[1, 2, 3].⊕ [3, 4] # [1, 2, 4]

[2, 3, 4].∖ [1, 2, 3] # [4]
```

## Usage

| for       | use |
| --------- | ----------------------------------------------------------- |
| `Gemfile`  | `gem 'ruuuby', '~> 0.0.9'`                                  |
| library   | `require 'ruuuby'`                                          |
| gem url   | https://rubygems.org/gems/ruuuby                            |
| changelog | https://github.com/utarsuno/ruuuby/blob/master/CHANGELOG.md |

---

## Language Changes:

#### Methods Added:
| class           | func(s)                                         | as extension? | notes |
| --------------- | ----------------------------------------------- | ------------- | ----- |
| `Object`        | `ary?`, `bool?`, `hsh?`, `int?`, `str?`, `sym?` | ✅            |       |
| `Array`         | `remove_empty!`                                 | ✅            |       |
| `Array`         | `⊕`                                             | ❌            | `⊕` is set notation for: *symmetric difference*   |
| `Array`         | `∖`                                             | ❌            | `∖` is set notation for: *relative complement*    |
| `Array`         | `∌?`                                            | ❌            | `∌` is set notation for: *does not belong to*     |
| `Array`         | `>>`                                            | ❌            | prepend provided arg, reverse operation of `<<`   |
| `String`        | `∌?`                                            | ❌            | `∌` is set notation for: *does not belong to*     |
| `String`        | `∈?`, `∉?`                                      | ❌            |                                                   |
| `String`        | `>>`                                            | ❌            | prepend provided arg, reverse operation of `<<`   |
| `String`        | `ensure_start!`, `ensure_ending!`               | ❌            | ⚠️ see docs on `use_partial_fill_in` before use    |
| `NilClass`      | `empty?`                                        | ✅            | added for sake of `Array`'s func: `remove_empty!` |

#### Created Aliases:
| class           | base reference                          | alias         | notes |
| --------------- | --------------------------------------- | ------------- | ----- |
| `Object`        | field: `object_id`                       | `🆔`          |       |
| `Object`        | method: `freeze`                        | `❄️`          |       |
| `Object`        | method: `frozen?`                       | `❄️?`        |       |
| `Array`         | method: `each`                          | `∑`           |       |
| `Array`         | method: `map`                           | `⨍`           |       |
| `Array`         | method: `include?`                      | `∋?`          | `∋` is set notation for: *belongs to* |
| `String`        | method: `include?`                      | `∋?`          | `∋` is set notation for: *belongs to* |

---

### Code Base Statistics:
| category | attribute     | value    | desc.                                                           |
| -------- | ------------- | -------- | --------------------------------------------------------------- |
| QA       | unit          | 109      | # of tests                                                      |
| QA       | performance   | 22       | # of tests                                                      |
| coverage | LOCs          | ???      | wip |
| coverage | runtime       | ???      | wip |
| coverage | documentation | ???      | wip |

---

### Gems:
| gem             | version | :development | :test | :production |
| --------------- | ------- | ------------ | ----- | ----------- |
| rake-compiler   | 1.1.0   | ✅           | ❌   | ❌          |
| rdoc            | 6.2.1   | ✅           | ❌   | ❌          |
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
| `bundle exec rake` | `release`           | push git version tags and publish gem to Rubygems |
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
>###### Bug reports and pull requests are welcome on GitHub at https://github.com/utarsuno/ruuuby. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/utarsuno/ruuuby/blob/master/CODE_OF_CONDUCT.md).
>
>#### License
>###### The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
>
>#### Code of Conduct
>###### Everyone interacting in the Ruuuby project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/utarsuno/ruuuby/blob/master/CODE_OF_CONDUCT.md).
