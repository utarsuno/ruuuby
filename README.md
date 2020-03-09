# Ruuuby [![Gem Version](https://badge.fury.io/rb/ruuuby.svg)](https://badge.fury.io/rb/ruuuby)

```flavored modifications & extensions for increased quality of Ruby coding life```

## Usage

| for                             | use                                                         |
| ------------------------------- | ----------------------------------------------------------- |
| `Gemfile`                        | `gem 'ruuuby', '~> 0.0.16'`                                 |
| ruby scripts                    | `require 'ruuuby'`                                          |
| `ruuuby` version during runtime | `require 'ruuuby/version'`                                  |
| gem url                         | https://rubygems.org/gems/ruuuby                            |
| changelog                       | https://github.com/utarsuno/ruuuby/blob/master/CHANGELOG.md |

#### Example

```ruby
# true
√(25) == 5

# true, true, false
'b'.∈? 'abc'
'abc'.∌? 'd'
'd'.∈? 'abc'
 
# [true, false]
data = {hello: 'world', ye: 'ee'}
[data.🔑?(:hello), data.🔑?(:non_existing_key)]

# true, false
elements_a = [1, 'a', 2, nil, [], 2]
elements_b = [nil, 2, 2, 'a', 1, []]
[elements_a.≈≈ elements_b, elements_a.== elements_b]

# [false, true, false, true]
[-5.ℕ?, 7.0.ℤ?, Complex(Float::NAN).ℝ?, Rational(2, 3).ℚ?]

# [1, 4, 2]
[1, 2, 3].⊕ [3, 4]

# [4]
[2, 3, 4].∖ [1, 2, 3]

# stdout ->
#          'world'
#          'hello'
['world', 1337, 'hello', 'abc'.❄️].∀{|x| puts x if x.str? && !x.❄️?}

# stdout ->
#          'hello'
#          'world'
['world', 1337, 'hello', 'abc'.❄️].↩️∀{|x| puts x if x.str? && !x.❄️?}
```

---

## Language Changes:

#### Module Changes:
| module(s) | func(s) added  | as c-extension? (java-wip) | notes |
| --------- | -------------- | -------------------------- | ----- |
| `Kernel`  | `√`            | ❌                         | syntax sugar for Math.sqrt |
| `Kernel`  | `∃module?`     | ❌                         | a 'global func' |
| `Kernel`  | `∃class?`      | ❌                         | a 'global func' |
| `Module`  | `∃func_alias?` | ❌                         |       |
| `Module`  | `∃func?`       | ❌                         |       |

#### Class Changes:
| class(es)              | func(s) added                      | as c-extension? (java-wip) | notes |
| ---------------------- | ---------------------------------- | -------------- | ----- |
| `Object`               | `ary?`, [`bool?`, `🅱️?`], `hsh?`, `int?`, `str?`, `stry?`, `sym?` | ✅ | |
| `Array`                | `remove_empty!`                    | ✅ |       | |
| `Set`                  | `remove_empty!`                    | ❌ |       | |
| `Array`                | [`frequency_counts`, `📊`]         | ✅ | get a `Hash` with keys being elements in array and values being their frequency count |
| `Array`                | [`equal_contents?`, `≈≈`]          | ✅ | are contents equal, regardless of order (and presence of multiple types)      |
| `Array`                | [`disjunctive_union`, `⊕`]         | ✅ | `⊕` is set notation for: *symmetric difference* |
| `Array`                | `∖`                                | ❌ | `∖` is set notation for: *relative complement*, also aliased as: `uniq_to_me` |
| `Enumerable`, `String` | `∌?`                               | ❌ | `∌` is set notation for: *does not belong to* |
| `Array`, `String`      | `>>`                               | ✅ | prepend provided arg, reverse operation of `<<` |
| `String`               | `∈?`, `∉?`                         | ❌ |       |
| `Array`                | `end_with?`, `start_with?`         | ❌ |       |
| `String`, `Array`      | `ensure_start!`, `ensure_ending!`  | ❌ |       |
| `NilClass`             | `empty?`                           | ✅ | ⚠️: philosophically debatable |
| `Integer`              | `finite?`, `infinite?`               | ✅ |       |
| `Numeric`              | `∞?`, `𝔹?`, `𝕌?`                   | ❌ |       |
| `Integer`              | `ℕ?`, `ℤ?`, `ℚ?`, `ℂ?`, `ℝ?`, `𝕌?` | ❌ |       |
| `Float`                | `ℕ?`, `ℤ?`, `ℚ?`, `ℂ?`, `ℝ?`, `𝕌?` | ❌ |       |
| `BigDecimal`           | `ℕ?`, `ℤ?`, `ℚ?`, `ℂ?`, `ℝ?`, `𝕌?` | ❌ |       |
| `Complex`              | `ℕ?`, `ℤ?`, `ℚ?`, `ℂ?`, `ℝ?`, `𝕌?` | ❌ |       |
| `Rational`             | `ℕ?`, `ℤ?`, `ℚ?`, `ℂ?`, `ℝ?`       | ❌ |       |
| `Object`               | [`🛑bool❓`, `🛑🅱️❓`], `🛑int❓`, `🛑ary❓`, `🛑str❓`, `🛑stry❓`, `🛑str_or_ary❓` | ❌ | |

#### Created Aliases:
| for                    | base method(s) reference(s)           | alias(es)        | notes |
| ---------------------- | ------------------------------------- | ---------------- | ----- |
| `Kernel`               | `raise`                               | `🛑`             |       |
| `Object`               | `object_id`                           | `🆔`             |       |
| `Object`               | `freeze`, `frozen?`                   | `❄️`, `❄️?`      |       |
| `Array`                | `frequency_counts`, `disjunctive_union`, `equal_contents?` | `📊`, `⊕`, `≈≈` | |
| `Module`               | `const_defined?`                       | `∃const?`        |       |
| `Module`               | `private_method_defined?`              | `∃🙈func?`       |       |
| `Module`               | `private`                             | `🙈`             |       |
| `Module`               | `private_constant`                    | `🙈constants⟶` |       |
| `Array`, `Hash`, `Set` | `each`                                | `∀`              |       |
| `Array`                | `reverse`, `reverse!`, `reverse_each` | `↩️`, `↩️!`, `↩️∀` |     |
| `Enumerable`           | `map`                                 | `⨍`              | automatically applies to: `Array`, `Hash`, `Set` |
| `Enumerable`           | `include?`                            | `∋?`             | `∋` is set notation for: *belongs to* |
| `Hash`                 | `key?`                                | [`🔑?`, `🗝?`], [`∃🔑?`, `∃🗝?`] | |
| `NilClass`, `Hash`, `Array`, `String`, `Set` | method: `empty?`  | `∅?` |  |

---

### Code Base Statistics:
| category | attribute     | value    | desc.                                                           |
| -------- | ------------- | -------- | --------------------------------------------------------------- |
| QA       | unit          | 238      | # of tests (non-performance & non-audit based)                  |
| QA       | performance   | 124      | # of tests                                                      |
| CI       | audits        | 12       | # of tests                                                      |
| coverage | LOCs          | ???      | wip |
| coverage | runtime       | ???      | wip |
| coverage | documentation | ???      | wip |

---

### Gems:
| gem             | version | :development  | :runtime    |
| --------------- | ------- | ------------- | ----------- |
| tty-command     | 0.9.0   | ✅            | ✅          |
| bundler         | 2.1.4   | ✅            | ❌          |
| rake-compiler   | 1.1.0   | ✅            | ❌          |
| rdoc            | 6.2.1   | ✅            | ❌          |
| rake            | 13.0.1  | ✅            | ❌          |
| rspec           | 3.9.0   | ✅            | ❌          |
| rspec-benchmark | 0.5.1   | ✅            | ❌          |

---

## Commands

#### General Tasks:
|  preface           | cmd                 | description                                          |
| ------------------ | ------------------- | ---------------------------------------------------- |
| `bundle exec rake` | `rdoc`              | generate documentation coverage report               |
| `bundle exec rake` | `install`           | install gem onto local machine                       |
| `bundle exec rake` | `compile`           | compile any native C-extensions with code changes    |
| `bundle exec rake` | `release`           | push git version tags and publish gem to Rubygems    |
| `bin/`             | `audit`             | general all-around build & health check              |
| `bin/`             | `audit_quick`       | similar to above but only run regular unit-tests     |
| `bin/`             | `setup`             | install dependencies                                 |
| `bin/`             | `console`           | interactive console for easier experimenting         |
| `gem`              | `server`            | host interactive web-page at `http://0.0.0.0:8808` to see documentation for currently installed gems |

#### Testing Tasks:
| preface            | cmd                 | warnings displayed? | description |
| ------------------ | ------------------- | ------------------- | ----------- |
| `bundle exec rake` | `rspec_unit`        | ❌                  | run all unit-tests except tags: {audit, performance} |
| `bundle exec rake` | `rspec_audit`       | ❌                  | run only audit based unit-tests  |
| `bundle exec rake` | `rspec_performance` | ❌                  | run only performance based unit-tests   |
| `bundle exec rake` | `rspec_all`         | ✅                  | run all unit-tests |

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
