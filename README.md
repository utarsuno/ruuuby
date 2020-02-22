# Ruuuby

```flavored modifications & extensions for increased quality of Ruby coding life```

## Usage

| for       | use |
| --------- | ----------------------------------------------------------- |
| `Gemfile`  | `gem 'ruuuby', '~> 0.0.11'`                                 |
| library   | `require 'ruuuby'`                                          |
| gem url   | https://rubygems.org/gems/ruuuby                            |
| changelog | https://github.com/utarsuno/ruuuby/blob/master/CHANGELOG.md |


#### Example

```ruby
# true
'b'.∈? 'abc'
# true
'abc'.∌? 'd'
# false
'd'.∈? 'abc'
 
data = {hello: 'world', ye: 'ee'}
# [true, false]
[data.🔑?(:hello), data.🔑?(:non_existing_key)]

# true
[1, '1', 2, nil, [], 2].≈ [nil, 2, 2, '1', 1, []]

# [false, true, false, true]
[-5.ℕ?, 7.0.ℤ?, Complex(Float::NAN).ℝ?, Rational(2, 3).ℚ?]

# [1, 2, 4]
[1, 2, 3].⊕ [3, 4]

# [4]
[2, 3, 4].∖ [1, 2, 3]

# stdout -> 'abc'
[1337, 'abc'.❄️].∀{|x| puts x if x.str? && x.❄️?}
```

---

## Language Changes:

#### Methods Added:
| class(es)         | func(s)                                         | as c-extension? (java-wip) | notes |
| ----------------- | ----------------------------------------------- | -------------- | ----- |
| `Object`          | `ary?`, `bool?`, `hsh?`, `int?`, `str?`, `sym?` | ✅            |       |
| `Array`           | `remove_empty!`                                 | ✅            |       |
| `Array`           | `📊`                                            | ❌            |       |
| `Array`           | `≈`                                             | ❌            | are contents equal, regardless of order (and presence of multiple types)      |
| `Array`           | `⊕`                                             | ✅ (partial)  | `⊕` is set notation for: *symmetric difference*   |
| `Array`           | `∖`                                             | ❌            | `∖` is set notation for: *relative complement*    |
| `Array`, `String` | `∌?`                                            | ❌            | `∌` is set notation for: *does not belong to*     |
| `Array`, `String` | `>>`                                            | ✅            | prepend provided arg, reverse operation of `<<`   |
| `String`          | `∈?`, `∉?`                                      | ❌            |                                                   |
| `String`          | `ensure_start!`, `ensure_ending!`               | ❌            | ⚠️ see docs on `use_partial_fill_in` before use    |
| `NilClass`        | `empty?`                                        | ✅            | added for sake of `Array`'s func: `remove_empty!` |
| `Integer`         | `ℕ?`, `ℤ?`, `ℚ?`, `ℂ?`, `ℝ?`                    | ❌            |       |
| `Float`           | `ℕ?`, `ℤ?`, `ℚ?`, `ℂ?`, `ℝ?`                    | ❌            |       |
| `BigDecimal`      | `ℕ?`, `ℤ?`, `ℚ?`, `ℂ?`, `ℝ?`                    | ❌            |       |
| `Complex`         | `ℕ?`, `ℤ?`, `ℚ?`, `ℂ?`, `ℝ?`                    | ❌            |       |
| `Rational`        | `ℕ?`, `ℤ?`, `ℚ?`, `ℂ?`, `ℝ?`                    | ❌            |       |

#### Created Aliases:
| class           | base reference                          | alias         | notes |
| --------------- | --------------------------------------- | ------------- | ----- |
| `Object`        | field: `object_id`                       | `🆔`          |       |
| `Object`        | method: `freeze`                        | `❄️`          |       |
| `Object`        | method: `frozen?`                       | `❄️?`         |       |
| `Array`         | method: `each`                          | `∑`, `∀`      |       |
| `Array`         | method: `map`                           | `⨍`           |       |
| `Hash`          | method: `key?`                          | `🔑?`, `∃🔑?` |       |
| `Array`         | method: `include?`                      | `∋?`          | `∋` is set notation for: *belongs to* |
| `String`        | method: `include?`                      | `∋?`          | `∋` is set notation for: *belongs to* |

---

### Code Base Statistics:
| category | attribute     | value    | desc.                                                           |
| -------- | ------------- | -------- | --------------------------------------------------------------- |
| QA       | unit          | 155      | # of tests                                                      |
| QA       | performance   | 78       | # of tests                                                      |
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
| `bundle exec rake` | `spec`              | run only non-performance based unit-tests         |
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
| `ext`      | C portion of this Gem's code (and future location for JRuby extensions) |
| `lib`      | ruby portion of this Gem's code                |
| `spec`     | RSpecs (unit tests)                            |
| `help`     | any helpful trouble-shooting and tips          |

---

>#### Contributing
>###### Bug reports and pull requests are welcome on GitHub at https://github.com/utarsuno/ruuuby. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/utarsuno/ruuuby/blob/master/CODE_OF_CONDUCT.md).
>
>#### License
>###### The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
>
>#### Code of Conduct
>###### Everyone interacting in the Ruuuby project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/utarsuno/ruuuby/blob/master/CODE_OF_CONDUCT.md).
