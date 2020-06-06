# Ruuuby [![Gem Version](https://badge.fury.io/rb/ruuuby.svg)](https://badge.fury.io/rb/ruuuby)

```flavored modifications & extensions for increased quality of Ruby coding life```

## Usage

| for           | use                                                         |
| ------------: | :---------------------------------------------------------- |
| `Gemfile`      | `gem 'ruuuby', '~> 0.0.39'`                                 |
| ruby scripts  | `require 'ruuuby'`                                          |
| gem url       | https://rubygems.org/gems/ruuuby                            |
| changelog     | https://github.com/utarsuno/ruuuby/blob/master/CHANGELOG.md |

#### Example


```ruby
# true, true
√(1787569)      == 1337
√(√(-1337.0^⁴)) == 1337

# true, true, true, true
𝚽 == 1 + (𝚽^⁻¹)
𝚽 == 2 * sin(θ°(54))
𝚽 == (θ°(360) - Ⴔ) / Ⴔ
π == 5 * acos(𝚽 / 2)

# true, true
θ°(180) == θ𝞽(0.5)
θᵍ(200) == θʳ(π)

# true, true, false
'b'.∈? 'abc'
'abc'.∌? 'd'
'd'.∈? 'abc'

# true, false
elements_a = [1, 'a', 2, nil, [], 2]
elements_b = [nil, 2, 2, 'a', 1, []]
[elements_a.≈≈(elements_b), elements_a == elements_b]

# true, true, true, true
['snake_case'.🐍?, 'AHHH_CAPITALS'.🐍⬆?, 'UpperCaseCamel'.🐫?, 'lowerCaseCamel'.🐫⬇?]

# [false, true, false, true]
[ℕ.∋?(-5), ℤ.∋?(7.0), ℝ.∋?(∞), ℚ.∋?(Rational(2, 3))]

# [1, 4, 2]
[1, 2, 3].⊕ [3, 4]

# [4]
[2, 3, 4].∖ [1, 2, 3] 

# [true, false]
data = {haaallo: 'wooorld', ye: 'ee'}
[data.∃🔑?(:haaallo), data.∃🔑?(:👁️👅👁️)]

# stdout ->
#          'world'
#          'hello'
['world', 1337, 'hello', 'abc'.❄️].∀{|x| puts x if x.str? && !x.❄️?}

# stdout ->
#          'hello'
#          'world'
['world', 1337, 'hello', 'abc'.❄️].↩∀{|x| puts x if x.str? && !x.❄️?}
```

---

# ⚠️: documentation & test-coverage not fully synced atm

---

## Language Changes:

#### Operations Supported (patched in)

> (⚠️ wip): raising to powers(via-superscripts: `⁻⁹...⁻¹, ⁰, ¹...⁹`) with operator(`^`)

| class(es)/obj  | example | (at least partially) utilizing C-extension?<br/>(java-wip) | notes |
| ----------:| ------- | :---: |----- |
| `Integer`  | `1337^²` | ✅ | coexists w/ `Integer`'s pre-existing `bitwise XOR` functionality<br/>`performance penalties`: `<= 115% slower` than using{`**`} |
| `Float`    | `1337.1337^²` | ✅ | `performance penalties`: `<= 115% slower` than using{`**`} |
| `Rational` | `3/4r^²` | ✅ | `performance penalties`: `<= 95% slower` than using{`**`} |
| `Complex`  | `1337i^²` | ✅ | `performance penalties`: `<= 85% slower` than using{`**`} |
| `BigDecimal` | `inc` | `inc` | `inc` |
| `ThetaAngle` | `inc` | `inc` | outputs to unit: `steradian` (depending on input) |
| `Quaternion` | `inc` | `inc` | |
| `℮` | `inc` | `inc` |

### TOPLEVEL_BINDING Modifications:

| (`global`) func(s) added | notes | as C-extension?<br/>(java-wip) |
| ---: | :--- | :----: |
| `℮`, `logₑ`, `log₂`, `log₁₀`<br/>`√`, `∛`, `π`, `Ⴔ`<br/>`¼`, `½`, `¾`, `⅓`, `⅕`, `⅕`,`⅖`,`⅗`,`⅘`,`⅙`,`⅐`, `⅛`, `⅜`, `⅝`, `⅞`, `⅑`, `⅒`<br/>`∞`, `∞ℂ`, `γ` | (`f10`) | ❌/✅ |
| `🌽` | (`f10`): aliases `Kernel` | ❌ |
| `📁`, `🗄️` | - (`f12`) aliases to:<br/>`File`, `Dir` | ❌ |
| `📅`, `🕒`, `📅🕒` | - (`f26`) aliases to:<br/>`Date`, `Time`, `DateTime` | ❌ |
| `θ°`, `θʳ`, `θᵍ`, `θ𝞽` | `f27` | ✅ |

### Module Modifications:

| module(s) | func(s) added     | as C-extension? <br/> (java-wip) | obj fields added |
| --------: | :---------------- | :------------------------: | --- |
| `Kernel`  | `∃module?`, `∃class?`<br/>`∃⨍_alias?`, `∃⨍?` | ❌ | |
| `Module`  | `⨍_add_aliases`| ✅ | |
| `Math`    | `relative_Δ`, `τ²_in_golden_ratio?`, `τ²_in_super_golden_ratio?` | ❌ | |

#### Math Modules:

| module(s) | sub-module | func(s) added     | obj fields added |
| :------- | :---: | :----------------: | ------------------------: |
| `Trig` | | `cot²`, `cos²`, `sin²`, `tan²`, `sec²`, `csc²` |
| `Trig` | `ℕ³` | `pythagorean?` | |
| `NumberTheory` | `ℕ¹` | `prime_factors`, `divisors`, `proper_divisors`, `aliquot_sum`, `perfect?`, `abundant?`, `abundance`, `abundancy_index`, `deficient?`, `deficiency`, `composite?` |
| `NumberTheory` | `𝕎¹` |  `nᵗʰ_euler_totient`, `nᵗʰ_cototient`, `digit_sum`, `digital_root`, `additive_persistence` | `seq_pronic`, `seq_fibonacci`, `seq_lucas`, `seq_square`, `seq_triangle`, `seq_hexagonal` |
| `NumberTheory` | `ℕ²` | `gcd`, `coprime?`, `friendly?` |
| `Combinatorics` | `𝕎²` | `n_choose_k` |

### Class Modifications:

| class(es)              | func(s) added                       | as C-extension? <br/> (java-wip) | notes   |
| ---------------------: | ----------------------------------- | :------------------------: | ------- |
| `File`, `Dir`          | `∃?`                                | ❌ | (`f12`) |
| `File`                 | `dirname²`, `dirname³`, `dirname⁴`<br/>`replace_expr_with`, `replace_expr_with!`, `insert_line_before_expr` | ❌ | (`f12`) |
| `Dir`                  | `η̂_paths`                           | ❌ | (`f12`) |
| `File`, `Dir`, `ENV`   | `∅?`                                | ❌ | (`f04`) |
| `Object`               | `ary?`, `bool?`, `hsh?`, `int?`, `flt?`, `num?`, `str?`, `chr?`, `sym?`, `θ?` | ✅ | (`f06`) |
| `Object`               | `Ⓣ`<br/>`🛑bool❓`, `🛑int❓`, `🛑ary❓`, `🛑str❓`, `🛑sym❓`, `🛑θ❓` | ❌ | (`f06`) |
| `Array`, `Set`         | `remove_empty!`                     | ❌/✅ | (`f07`) |
| `String`               | `♻️⟵`, `♻️⟶`, `♻️⟶∞`<br/>`downcase?`{`⬇?`}, `upcase?`{`⬆?`}, `downcase!`{`⬇!`}, `upcase!`{`⬆!`} | ❌ | (`f08`) |
| `String`               | `🐫?`, `🐫⬇?`, `to_🐫`<br/>`🐍⬆?`, `🐍?`, `to_🐍` | ❌ | (`f24`) |
| `String`               | `as_utf8`, `iso8601?`, `to_iso8601`, `as_iso8601` | ❌ | |
| `Array`, `String`      | `η̂!`                               | ❌ | (`f08`) |
| `Array`                | [`disjunctive_union`, `⊕`], `∖`    | ✅ | (`f09`) |
| `Module`, `String`     | `∋?`, `∌?`, `∈?`, `∉?`             | ❌ | (`f09`) |
| `Enumerable`           | `∌?`, `∀τ²∈λ𝑓₍ᵢ،ᵢ₊₁₎`              | ❌ | (`f09`, `f10`) |
| `Array`, `String`      | `>>`                               | ✅ | (`f05`) |
| `String`               | `digit?`, `to_num`, `to_num?`      | ❌ | (`f21`) |
| `Array`                | `end_with?`, `start_with?`         | ❌ | (`f08`) |
| `String`, `Array`      | `ensure_start!`, `ensure_ending!`  | ❌ | (`f08`) |
| `NilClass`             | `empty?`                           | ✅ | - ⚠️: philosophically debatable <br/> - (`f04`) |
| `Integer`              | `finite?`, `infinite?`               | ✅ | (`f11`) |
| `Numeric`              | `∞?`                               | ❌ | (`f11`) |
| `Float`                | `≈≈`, `∞ℂ?`                        | ❌ | (`f17`) |

#### Aliases:

| for                    | base method(s) reference(s)               | alias(es)                  |
| ---------------------: | ----------------------------------------- | -------------------------- |
| `Kernel`               | `raise`, `rand`                           | `🛑`, `🎲`                 |
| `Object`               | `object_id`, `class`, `freeze`, `frozen?` | `🆔`, `ⓣ`, [`❄️`, `❄`], [`❄️?`, `❄?`] |
| `Class`                | `new`                                     | `🆕`                       |
| `Array`, `Set`         | `remove_empty!`                           | `♻️∅!`                     |    
| `String`, `Symbol`     | `upcase`, `downcase`                      | `⬆`, `⬇`                  |
| `Array`                | `tally`, `↩∀`                             | `📊`, `reverse_each`       |
| `Module`               | `private`, `protected`, `const_defined?`, `private_method_defined?`, `protected_method_defined?` | `🙈`, `🛡️`, `∃const?`, `∃🙈⨍`, `∃🛡️⨍?` |
| `Array`, `Hash`, `Set` | `each`                                    | `∀`                        |
| `Array`, `String`      | `reverse`, `reverse!`                     | `↩`, `↩!`                  |
| `Enumerable`           | `map`, `each_with_index`                  | `⨍`, `∀ₓᵢ`                 |
| `Hash`                 | `key?`                                    | `∃🔑?`                     |
| `NilClass`, `Hash`, `Array`, `String`, `Set` | `empty?`            | `∅?`                       |
| `String`, `Array`, `Set`, `Hash`, `Proc` | `length` (`arity` for `Proc`) *| `𝔠` |

---

### Code Base Statistics:
| category  | attribute     | value    | desc.                                                              |
| --------: | :-----------: | :------: | :----------------------------------------------------------------- |
| `QA`        | `unit`          | `1088`     | # of tests (for core functionality)                 |
| `QA`        | `integration`   | `4`        | # of tests (for state/functionality checks on grouped features/components) |
| `QA`        | `performance`   | `225`      | # of tests (for runtime performance)                |
| `QA`        | `DB`            | `202`      | # of tests (for `DB` & `ORM`)                       |
| `CI`        | `audit`         | `114`      | # of tests (for anything non-functionality based)   |
| `CI`        | `locale`        | `38`       | # of tests (for local-dev configs, setup, preferences, etc) |
| `tech-debt` | `coverage`      | `5`        | # of tests (solely relating to tracking missing functionality-coverage) |
| `structure` | `features`      | `~35`      | # of distinct features (that are categorized & tracked) `wip` |
| `coverage`  | `LOCs`          | `???`      | `wip` |
| `coverage`  | `runtime`       | `???`      | `wip` |
| `coverage`  | `documentation` | `???`      | `wip` |

---

### Gems:

| gem | version | :development, :runtime | category |
| ---: | :--- | :---: | ---: |
| `tty-command` | [`0.9.0`](https://rubygems.org/gems/tty-command) | ✅, ✅ | `CLI` |
| `rugged` | [`1.0.0`](https://rubygems.org/gems/rugged) | ✅, ❌ | `GIT` |
| `rdoc` | [`6.2.1`](https://rubygems.org/gems/rdoc) | ✅, ❌ | `DOC` |
| `bundler` | [`2.1.4`](https://rubygems.org/gems/bundler) | ✅, ❌ | `CI` |
| `rspec` | [`3.9.0`](https://rubygems.org/gems/rspec) | ✅, ❌ | `QA` |
| `rspec-benchmark` | [`0.5.1`](https://rubygems.org/gems/rspec-benchmark) | ✅, ❌ | `QA` |
| `rake` | [`13.0.1`](https://rubygems.org/gems/rake) | ✅, ❌ | `EXT` |
| `rake-compiler` | [`1.1.0`](https://rubygems.org/gems/rake-compiler) | ✅, ❌ | `EXT` |
| `sqlite3` | [`1.4.2`](https://rubygems.org/gems/sqlite3) | ✅, ❌ | `DB` |
| `activerecord` | [`5.2.4.3`](https://rubygems.org/gems/activerecord) | ✅, ❌ | `DB` |
| `schema_plus_foreign_keys` | [`0.1.8`](https://rubygems.org/gems/schema_plus_foreign_keys) | ✅, ❌ | `DB` |

---

### Commands

#### General Tasks:
|  preface           | cmd                 | description                                          |
| -----------------: | :-----------------: | :--------------------------------------------------- |
| `bundle exec rake` | `rdoc`              | generate documentation coverage report               |
| `bundle exec rake` | `install`           | install gem onto local machine                       |
| `bundle exec rake` | `compile`           | compile any native C-extensions with code changes    |
| `bundle exec rake` | `release`           | push git version tags and publish gem to Rubygems    |
| `bin/`             | `audit`             | general all-around build & health check              |
| `bin/`             | `audit_db`<br/>`audit_quick`<br/>`audit_quickest`<br/>`audit_all_but_performance`<br/>`audit_functionality` | similar to above but for targeted portions |
| `bin/`             | `setup`             | install dependencies                                 |
| `bin/`             | `console`           | interactive console for easier experimenting         |
| `gem`              | `server`            | host interactive web-page at `http://0.0.0.0:8808` to see documentation for currently installed gems |

#### Testing Tasks:
| preface            | cmd                 | description of test contests | w/ warnings?
| -----------------: | :-----------------: | :---------- | ----------:
| `bundle exec rake` | `rspec_unit`        | all core expected functionality from `Ruuuby` | ❌ |
| `bundle exec rake` | `rspec_integration` | expected state & functionality from `Ruuuby` code areas w/ using more than one feature/component | ❌ |
| `bundle exec rake` | `rspec_db`          | anything relating to the `DB` or `ORM` | ❌ |
| `bundle exec rake` | `rspec_audit`       | extra-checks for expected code-structure; ensures passing `Ruuuby` functionality tests are not occurring from any artifacts | ❌ |
| `bundle exec rake` | `rspec_performance` | defines acceptable runtime-performance benchmarks (`TODO: missing Big-O tests`) | ❌ |
| `bundle exec rake` | `rspec_tech_debt`   | tracks/confirms missing coverage; ∀ resolved-test-case will transfer to a new test-category, lowering the total count of `tech_debt` tests | ❌ |
| `bundle exec rake` | `rspec_locale`      | extra-checks for properly configured local coding environment (`TODO: need to formalize Ruby build process`) | ❌ |
| `bundle exec rake` | `rspec_all`         | run all existing tests | ✅ |

---

### Project Layout:
|  directory     | description of contents                         |
| -------------: | :---------------------------------------------- |
| `app`          | currently only holds `ORM` definitions           |
| `bin`          | `executable` files                               |
| `db`           | database `schema`, `seed`, and `migrations`     |
| `ext`          | `C` portion of this Gem's code <br/> (and future location for `JRuby-extensions`) |
| `help`         | any helpful `documentation & notes`  |
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
