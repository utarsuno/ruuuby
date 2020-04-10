# Ruuuby [![Gem Version](https://badge.fury.io/rb/ruuuby.svg)](https://badge.fury.io/rb/ruuuby)

```flavored modifications & extensions for increased quality of Ruby coding life```

## Usage

| for           | use                                                         |
| ------------: | :---------------------------------------------------------- |
| `Gemfile`      | `gem 'ruuuby', '~> 0.0.29'`                                 |
| ruby scripts  | `require 'ruuuby'`                                          |
| gem url       | https://rubygems.org/gems/ruuuby                            |
| changelog     | https://github.com/utarsuno/ruuuby/blob/master/CHANGELOG.md |

#### Example

```ruby
# true, true
√(1787569)      == 1337
√(√(-1337.0^⁴)) == 1337

# true, true
φ == 1 + (φ^⁻¹)
φ.≈≈ 2 * sin°(54)

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
[elements_a.≈≈(elements_b), elements_a == elements_b]

# [false, true, false, true]
[-5.ℕ?, 7.0.ℤ?, Complex(Float::NAN).ℝ?, ℚ(2, 3).ℚ?]

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

#### Glossary (for table content & tags)

> {`static`} implies following context: `Class` instance, not the actual `object`
> <br/>`performance penalties` implies: values across designated scenario benchmarks
> <br/>(`fNN`) is feature tag syntax, let (`N ∈ ℕ`); (`full use-case wip`)
> <br/>symbol(`∃`) means `there exists some ...`
> <br/>symbol(`∴`) means `... therefore ...`
> <br/>symbol(`⊕`) is set notation for: *symmetric difference*
> <br/>symbol(`∋`) is set notation for: *belongs to*, ex: (`a` belongs to set `b`: `b ∋ a`); bool-reversed: symbol(`∌`)
> <br/>symbol(`∖`) is set notation for: *relative complement*

#### Operations Supported (patched in)

> (⚠️ full-coverage wip): raising to powers(via-superscripts: `⁻⁹...⁻¹, ⁰, ¹...⁹`) with operator(`^`)

| class(es)  | example | utilizing C-extension? <br/> (java-wip) | notes |
| ----------:| ------- | :---: |----- |
| `Integer`  | `1337^²` | ✅ | - coexists with `Integer`'s default existing `bitwise XOR` functionality <br/> - `performance penalties`: up to `95%` `slower` than using operator(`**`) |
| `Float`    | `1337.1337^²` | ✅ | `performance penalties`: up to `90%` `slower` than using operator(`**`) |
| `Rational` | `3/4r^²` | ❌ | `performance penalties`: up to `700% slower` than using operator(`**`) |
| `Complex`, `BigDecimal` | `inc` | `inc` | `inc` |

### Changes for TOPLEVEL_BINDING:

| (`global`) func(s) added | notes | as C-extension? <br/> (java-wip) |
| ---: | :--- | :----: |
| `√`, `∛`, `π`<br/> `∞`, `∞ℂ`, `¿`, `φ`, `γ`<br/>`∠ᶜ`, `∠°`, `sin`, `sin°`, `cos`, `cos°`, `tan`, `tan°`| (`f17`) | ❌ |
| `📁`, `📂`, `🗄️` | - aliases for `::File`, `::Dir` <br/> - (`f12`) | ❌ |

### Changes to Modules:

`instance methods for Kernel will act as 'globally-scoped functions'; meaning they can essentially can be called from anywhere with caller of the method ignored for all contextes`

| module(s) | func(s) added     | as C-extension? <br/> (java-wip) | notes |
| --------: | :---------------: | :------------------------: | ----- |
| `Kernel`  | `𝔠`               | ❌                         | - gets the `cardinality` (length/size) of arg <br/> - (`f03`) |
| `Kernel`  | `🌽_previous_⨍`   | ❌                        | (`f10`) |
| `Kernel`  | `∃module?`        | ❌                         | true-example: `∃module?(:Ruuuby)` |
| `Kernel`  | `∃class?`         | ❌                         | true-example: `∃class?(:Array)` |
| `Module`  | {`static`} `∃⨍_alias?`    | ❌                 | true-example: `::Array.∃⨍_alias?(:equal_contents?, :≈≈)` |
| `Module`  | {`static`} `∃⨍?`          | ❌                 | true-example: `::Array.∃⨍?(:≈≈)` |
| `Module`  | {`static`} `⨍_add_aliases`| ✅                 | example: (inside Class scope)<br/>`⨍_add_aliases(:infinite?, [:∞?, :♾️?])` |
| `Math`    | {`static`} `relative_Δ`   | ❌                 | (`f17`) |

### Changes to Classes:

| class(es)              | func(s) added                       | as C-extension? <br/> (java-wip) | notes   |
| ---------------------: | ----------------------------------- | :------------------------: | ------- |
| `File`, `Dir`          | {`static`} `∃?`                     | ❌ | (`f12`) |
| `File`                 | {`static`} `dirname²`, `dirname³`, `dirname⁴` | ❌ | (`f12`) |
| `File`                 | `replace_expr_with`, `replace_expr_with!` | ❌ | (`f12`) |
| `Dir`                  | `normalized_paths`                  | ❌ | (`f12`) |
| `File`, `Dir`          | `∅?`                                | ❌ | (`f04`) |
| `Object`               | `ary?`, [`bool?`, `🅱️?`], `hsh?`, `int?`, `flt?`, `num?`, `str?`, `char?`, `stry?`, `sym?`<br/>`class?`, `module?`, `nucleotide?` | ✅ | (`f06`) |
| `Array`                | `remove_empty!`                     | ✅ | (`f07`) |
| `Set`                  | `remove_empty!`                     | ❌ | (`f07`) |
| `String`               | `♻️⟵`, `♻️⟶`, `♻️⟶∞` | ❌ | (`f08`) |
| `String`               | `downcase?` ([`⬇️?`, `⬇?`, `🔡?`]) | ❌ | (`f08`) |
| `String`               | `upcase?` ([`⬆️?`, `⬆?`, `🔠?`])   | ❌ | (`f08`) |
| `String`               | `🐫?`, `🐫⬇?`, `🐍⬆?`, `🐍?`, `to_🐫`, `to_🐍` | ❌ | (`f24`) |
| `Array`                | `η̂!`                               | ❌ | (`f08`) |
| `Array`                | [`frequency_counts`, `📊`]         | ✅ | (`f09`) |
| `Array`                | [`equal_contents?`, `≈≈`]          | ✅ | - regardless of order and presence of multiple types <br/> - (`f09`) |
| `Array`                | [`disjunctive_union`, `⊕`]         | ✅ | (`f09`) |
| `Array`                | `∖`                                | ❌ | - aliased-by(`uniq_to_me`) <br/> - (`f09`) |
| `Module`, `String`     | `∋?`, `∌?`, `∈?`, `∉?`             | ❌ | (`f09`) |
| `Enumerable`           | `∌?`                               | ❌ | (`f09`) |
| `Array`, `String`      | `>>`                               | ✅ | - prepend provided arg, reverse operation of `<<` <br/> - (`f05`) |
| `String`               | `digit?`, `to_num`, `to_num?`      | ❌ | (`f21`) |
| `Array`                | `end_with?`, `start_with?`         | ❌ | (`f08`) |
| `String`, `Array`      | `ensure_start!`, `ensure_ending!`  | ❌ | (`f08`) |
| `NilClass`             | `empty?`                           | ✅ | - ⚠️: philosophically debatable <br/> - (`f04`) |
| `Integer`              | `finite?`, `infinite?`               | ✅ | (`f11`) |
| `Numeric`              | `∞?`, `𝔹?`, `𝕌?`                   | ❌ | (`f11`) |
| `Integer`              | `ℕ?`, `ℤ?`, `ℚ?`, `ℂ?`, `ℝ?`, `𝕌?` | ❌ | (`f11`) |
| `Float`                | `ℕ?`, `ℤ?`, `ℚ?`, `ℂ?`, `ℝ?`, `𝕌?` | ❌ | (`f11`) |
| `BigDecimal`, `Complex`| `ℕ?`, `ℤ?`, `ℚ?`, `ℂ?`, `ℝ?`, `𝕌?` | ❌ | (`f11`) |
| `Rational`             | `ℕ?`, `ℤ?`, `ℚ?`, `ℂ?`, `ℝ?`       | ❌ | (`f11`) |
| `Float`                | `≈≈`, `∞ℂ?`                        | ❌ | (`f17`) |
| `String`               | `to_radian`                        | ❌ | (`f17`) |
| `Object`               | [`🛑bool❓`, `🛑🅱️❓`], `🛑int❓`, `🛑ℤ❓`, `🛑𝕌❓`, `🛑ary❓`, `🛑str❓`, `🛑stry❓`, `🛑countable❓` | ❌ | (`f04`) |

#### Created Aliases (for Ruby Classes):
| for                    | base method(s) reference(s)               | alias(es)                  | notes     |
| ---------------------: | ----------------------------------------- | -------------------------- | --------- |
| `Kernel`               | `raise`, `rand`                           | `🛑`, `🎲`                 | (`f10`)   |
| `Object`               | `object_id`, `define_singleton_function`   | `🆔`, `define_singleton_⨍`  | (`f10`)   |
| `Class`                | `new`                                     | `🆕`                       | (`f10`)   |
| `Array`, `Set`         | `remove_empty!`                           | `♻️∅!`                     | (`f10`)   |      
| `Object`               | `freeze`, `frozen?`                       | [`❄️`, `❄`], [`❄️?`, `❄?`] | (`f10`)   |
| `String`, `Symbol`     | `upcase`                                  | `⬆️`, `⬆`, `🔠`           | (`f10`)   |
| `String`, `Symbol`     | `downcase`                                | `⬇️`, `⬇`, `🔡`           | (`f10`)   |
| `String`               | `upcase!`, `downcase!`                    | [`⬆️!`, `⬆!`, `🔠!`], [`⬇️!`, `⬇!`, `🔡!`] | (`f10`) |
| `Object`               | `protected_instance_methods`, `private_methods` | `🛡️funcs`, `🙈funcs` | (`f01`,`f02`) |
| `Array`                | `frequency_counts`, `disjunctive_union`, `equal_contents?` | `📊`, `⊕`, `≈≈` |  |
| `Module`               | `const_defined?`, `private_method_defined?` | `∃const?`, `∃🙈func?`      |           |
| `Module`               | `private`, `private_constant`             | `🙈`, `🙈constants⟶`     | (`f01`)   |
| `Module`               | `protected`, `protected_method_defined?`   | `🛡️`, `∃🛡️func?`           | (`f02`)   |
| `Array`, `Hash`, `Set` | `each`                                    | `∀`                        | (`f10`) |
| `Array`, `String`      | `reverse`, `reverse!`                     | [`↩️`, `↩`], [`↩️!`, `↩!`] | (`f10`) |
| `Array`                | `reverse_each`                            | `↩️∀`, `∀↩`                | (`f10`) |
| `Enumerable`           | `map`                                     | `⨍`                        | - automatically applies to: `Array`, `Hash`, `Set` <br/> - (`f10`) |
| `Enumerable`           | `include?`                                | `∋?`                       | (`f10`) |
| `Enumerable`           | `each_with_index`                         | `∀ₓᵢ`                      | (`f10`) |
| `Hash`                 | `key?`                                    | [`🔑?`, `🗝?`], [`∃🔑?`, `∃🗝?`] |  |
| `NilClass`, `Hash`, `Array`, `String`, `Set` | `empty?`            | `∅?`                       | (`f04`) |
| `String`, `Array`, `Set`, `Hash`             | `length`            | `𝔠`                        | (`f03`) |
| `Float`                | `nan?`                                    | `¿?`                       | (`f17`) |
| `Integer`              | `finite?`                                  | `∞ℂ?`, `¿?`, `∞ℂ?`         | (`f17`) |

---

### Code Base Statistics:
| category  | attribute     | value    | desc.                                                           |
| --------: | :-----------: | :------: | --------------------------------------------------------------- |
| QA        | unit          | 615      | # of tests (solely relating to core functionality)              |
| QA        | performance   | 258      | # of tests (solely relating to performance)                     |
| QA        | DB            | 88       | # of tests (solely relating to the database)                    |
| CI        | audits        | 37       | # of tests (solely relating to non-functionality based audits)  |
| structure | features      | ~28      | # of distinct features (that are categorized & tracked) `wip`   |
| coverage  | LOCs          | ???      | `wip` |
| coverage  | runtime       | ???      | `wip` |
| coverage  | documentation | ???      | `wip` |

---

### Gems:
| gem                        | version   | :development  | :runtime  |
| -------------------------: | :-------: | :-----------: | :-------: |
| `tty-command`              | `0.9.0`   | ✅            | ✅       |
| `sqlite3`                  | `1.4.2`   | ✅            | ❌       |
| `activerecord`             | `5.2.4.1` | ✅            | ❌       |
| `schema_plus_foreign_keys` | `0.1.8`   | ✅            | ❌       |
| `bundler`                  | `2.1.4`   | ✅            | ❌       |
| `rake-compiler`            | `1.1.0`   | ✅            | ❌       |
| `rdoc`                     | `6.2.1`   | ✅            | ❌       |
| `rake`                     | `13.0.1`  | ✅            | ❌       |
| `rspec`                    | `3.9.0`   | ✅            | ❌       |
| `rspec-benchmark`          | `0.5.1`   | ✅            | ❌       |

---

## Commands

#### General Tasks:
|  preface           | cmd                 | description                                          |
| -----------------: | ------------------- | ---------------------------------------------------- |
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
| preface            | cmd                 | w/ warnings? | description |
| -----------------: | ------------------- | :----------: | ----------- |
| `bundle exec rake` | `rspec_unit`        | ❌           | run all unit-tests except tags: {audit, performance, db} |
| `bundle exec rake` | `rspec_db`          | ❌           | run only db based unit-tests |
| `bundle exec rake` | `rspec_audit`       | ❌           | run only audit based unit-tests  |
| `bundle exec rake` | `rspec_performance` | ❌           | run only performance based unit-tests   |
| `bundle exec rake` | `rspec_all`         | ✅           | run all unit-tests |

---

### Project Layout:
|  directory     | description of contents                         |
| -------------: | ----------------------------------------------- |
| `app`          | currently only holds `ORM` definitions           |
| `bin`          | `executable` files                               |
| `db`           | database `schema`, `seed`, and `migrations`     |
| `ext`          | `C` portion of this Gem's code <br/> (and future location for `JRuby-extensions`) |
| `help`         | any helpful additional `documentation & notes`  |
| `lib`          | `Ruuuby` portion of this `Gem's code`           |
| `spec`         | `RSpecs` (unit tests + other `QA` and `Audits`) |

---

>#### Contributing
>###### Bug reports and pull requests are welcome on GitHub at https://github.com/utarsuno/ruuuby. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/utarsuno/ruuuby/blob/master/CODE_OF_CONDUCT.md).
>
>#### License
>###### The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
>
>#### Code of Conduct
>###### Everyone interacting in the Ruuuby project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/utarsuno/ruuuby/blob/master/CODE_OF_CONDUCT.md).
