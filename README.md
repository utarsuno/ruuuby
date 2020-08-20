# Ruuuby [![Gem Version](https://badge.fury.io/rb/ruuuby.svg)](https://badge.fury.io/rb/ruuuby)

```flavored modifications & extensions for increased quality of Ruby coding life```

| for           | use                                                         |
| ------------: | :---------------------------------------------------------- |
| `Gemfile`      | `gem 'ruuuby', '~> 0.0.49'`                                 |
| ruby scripts  | `require 'ruuuby'`                                          |
| gem url       | https://rubygems.org/gems/ruuuby                            |
| changelog     | https://github.com/utarsuno/ruuuby/blob/master/CHANGELOG.md |
| `JIT` testing | ```RUBYOPT="--jit --jit-warnings --jit-wait --jit-max-cache=1337 --jit-verbose=2 --jit-debug -w" ./bin/console``` |

### Examples

> Development & Utilities

```ruby
# run node.js tests on live container{A}, transfer results as file to container{B}
qa_results = 🐋.find_🐋('service_js').cmd!(%w(npm test --check-leaks)).join.as_utf8
🐋.find_🐋('service_nginx').📁_create('/v/js_qa_results.txt', qa_results)
```

> Ruuuby

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

# true
Matrix[[1,3,5],[2,4,6]].ᵀ == Matrix[[1,2],[3,4],[5,6]]

# [1, 4, 2]
[1, 2, 3].⨁ [3, 4]

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

## ⚠️: documentation & test-coverage not fully synced atm

---

## Overview:

#### Operations Supported (patched in)

> (⚠️ wip): raising to powers(via-superscripts: `⁻⁹...⁻¹, ⁰, ¹...⁹`) with operator(`^`)

| context | example | `performance penalties` compared to operator{`**`} |
| ----------:| ------- |----- |
| `Integer`  | `1337^²` | <ul><li>`<= 95% slower`</li><li>coexisting w/ `Integer's bitwise XOR`</li></ul> |
| `Float`    | `1337.1337^²` | `<= 95% slower` |
| `Rational` | `3/4r^²`  | `<= 95% slower` |
| `Complex`  | `1337i^²` | `<= 75% slower` |
| `BigDecimal` | `inc` | `inc` | `inc` |
| `ThetaAngle` | `inc` | `inc` | outputs to unit: `steradian` (depending on input) |
| `Matrix`     | `inc` | `inc` | |
| `Quaternion` | `inc` | `inc` | |
| `℮` | `inc` | `inc` |

### Refinements:

| Base Context | added under | applies to | funcs/aliases added            |
| ------------ | ----------- | -----------| ------------------------------ |
| `ThetaAngle` | `ContextStr`        | `String`   | ex: `ʳ?`, `ᵍ?`, `ʳ`, `ᵍ`       |
| `ThetaAngle` | `ContextRuuuby`     | `Object`   | <ul><li><em>ex:</em> `θ°`, `θʳ`, `θᵍ`, `θ𝞽`</li><li><em>global-const: `𝞽`</em></li></ul> |
| `ThetaAngle` | `ContextParamCheck` | `Object`   | `θ?`, `🛑θ❓`, `🛑θs❓`       |
| `Math::Algebra::Tropical` | `ContextNumeric` | `Numeric` | `⨁`, `⨂`              |
| `Math::Algebra::Tropical` | `ContextMatrix`  | `Matrix`  | `⨁`, `⨁!`, `⨂`, `⨂ⁿ` |
| `Math::NumberTheory`      | `ℤ³`             | `Integer` | `≡` |
| `Heuristics` | `ContextParsingCommandOutput` | <ul><li>`String`</li><li>`Array`</li></ul> | `clean` |

### TOPLEVEL_BINDING Modifications:

| func(s) added | notes |
| ---: | :--- |
| `℮`, `logₑ`, `log₂`, `log₁₀`, `√`, `∛`<br/>`¼`, `½`, `¾`, `⅓`, `⅕`, `⅕`,`⅖`,`⅗`,`⅘`,`⅙`,`⅐`, `⅛`, `⅜`, `⅝`, `⅞`, `⅑`, `⅒`<br/>`π`, `Ⴔ`, `∞`, `∞ℂ` | |
| `📁`, `🗄️` | `File`, `Dir` |
| `📅`, `🕒`, `📅🕒` | `Date`, `Time`, `DateTime` |

#### Math Modules:

| module(s) | sub-module | func(s) added |
| ------: | :----: | :---------------- |
| `Math` | `Ratio` | `golden?`, `super_golden?` |
| `Trig` | | `cot²`, `cos²`, `sin²`, `tan²`, `sec²`, `csc²` |
| `Trig` | `ℕ³` | `pythagorean?` |
| `NumberTheory` | | `semiprime?` |
| `NumberTheory` | `ℕ¹` | `prime_factors`, `divisors`, `proper_divisors`, `aliquot_sum`, `perfect?`, `almost_perfect?`, `abundant?`, `abundance`, `abundancy_index`, `deficient?`, `deficiency`, `composite?` |
| `NumberTheory` | `𝕎¹` |  `nᵗʰ_euler_totient`, `nᵗʰ_cototient`, `digit_sum`, `digital_root`, `additive_persistence` |
| `NumberTheory` | `ℕ²` | `coprime?`, `friendly?` |
| `NumberTheory` | `ℤ³` | `congruent?` |
| `Combinatorics` | `𝕎¹` | `len_powerset` |
| `Combinatorics` | `𝕎²` | `n_choose_k`, `permutations`, `len_ordered_with_replacement` |
| `Stats` | | `μ`⟶`arithmetic_mean`, `x̃`⟶`median` |
| `Stats` | `TimeSeries` | `simple_moving_average`, `weighted_moving_average`, `exponential_moving_average`, `aroon_up`, `aroon_down`, `aroon_oscillator` |
| `Stats` | `Probability` | |
| `Stats` | `Descriptive` | `𝛿`⟶`percentage_error`, `relative_diff` |
| `Stats` | `StatisticalLearning` | |

#### Custom Math Classes:

| base-context   | sub-context  | sample functionality |
| -------------: | :----------: | :------ |
| `Trigonometry` | <em>class:</em> `ThetaAngle` | <ul><li>`°?`⟶`degrees?`, `°`⟶`as_degree`, `ʳ?`⟶`radians?`, `ʳ`⟶`as_radian`</li><li>`∅?`⟶`zero?`, `⦜?`⟶`right?`, `○?`⟶`perigon?`</li><li>`η̂?`⟶`normal?`, `η̂!`⟶`normalize!`</li></ul> |
| `Statistics`   | <em>class:</em> `TimeSeriesData` | <ul><li>`μ`⟶`mean`, `x̃`⟶`median`, `σ`⟶`std_dev`, `σ²`⟶`variance`,</li><li>`ρ`⟶`pearson_correlation_coefficient`, `mse`⟶`mean_square_of_errors`, `mape`⟶`mean_absolute_percentage_error`</li><li>`λ`⟶`scale_by_addition`, `Λ`⟶`scale_by_multiplication`</li><li>`η̂?`⟶`normalized?`, `η̂!`⟶`normalize!`</li><li>`mem_size`, `free_memory`</li><li>`Q₁`, `Q₂`, `Q₃`, `IQR`, `outliers_lower`, `outliers_upper`</li></ul> |
| `NumberTheory::𝕎¹` | <em>singleton-objs of class:</em> `Math::Expr::Sequence` | <ul><li>`seq_pronic`, `seq_fibonacci`, `seq_lucas`, `seq_square`, `seq_triangle`, `seq_hexagonal`</li></ul> |
| `Forex`        | <em>class: `CurrencyMatrix`</em> | |
| `GraphTheory`  | <em>class:</em> `PseudoGraph` | |

### Class Modifications:

| class(es)              | func(s) added                       |
| ---------------------: | :---------------------------------- |
| `File`, `Dir`          | `∃?`                                |
| `Module`               | `∃⨍_alias?`, `∃⨍?`                  |
| `File`                 | `replace_expr_with`, `replace_expr_with!`, `insert_line_before_expr` |
| `Dir`                  | `η̂_paths`                           |
| `File`, `Dir`, `ENV`, `NilClass`, `Vector` | `∅?`            |
| `Object`               | <ul><li>`Ⓣ`, `ary?`, `bool?`, `hsh?`, `int?`, `flt?`, `num?`, `str?`, `chr?`, `sym?`, `matrix?`, `vec?`</li><li>`🛑bool❓`, `🛑int❓`, `🛑flt❓`, `🛑num❓`, `🛑ary❓`, `🛑str❓`, `🛑sym❓`</li></ul> |
| `Array`, `Set`         | `remove_empty!`                     |
| `String`               | <ul><li>`♻️⟵`, `♻️⟶`, `♻️⟶∞`</li><li>`⬇?`⟶`downcase?`, `⬆?`⟶`upcase?`, `⬇!`⟶`downcase!`, `⬆!`⟶`upcase!`</li><li>`🐫?`, `🐫⬇?`, `to_🐫`<br/>`🐍⬆?`, `🐍?`, `to_🐍`</li><li>`digit?`, `to_num`, `to_num?`, `palindrome?`</li><li>`as_utf8`, `iso8601?`, `to_iso8601`, `as_iso8601`</li><li>`∋?`, `∌?`, `∈?`, `∉?`</li></ul> |
| `Array`, `String`      | `η̂!`                               |
| `Array`                | <ul><li>`⨁`⟶`disjunctive_union`, `∖`</li><li>`end_with?`, `start_with?`</li></ul> |
| `Enumerable`           | `∌?`, `∀τ²∈λ𝑓₍ᵢ،ᵢ₊₁₎`              |
| `Array`, `String`      | `>>`                               |
| `String`, `Array`      | `ensure_start!`, `ensure_ending!`  |
| `Integer`              | `finite?`, `infinite?`               |
| `Numeric`              | `∞?`                               |
| `Float`                | `≈≈`, `∞ℂ?`                        |
| `Matrix`               |  `∀ₓ↘`, `∀ₓᵢ↘`, `↘_to_a`, `∀ₓᵢⱼ`   |

#### Common Aliases:

| for                    | base method(s) reference(s)               | alias(es)                |
| ---------------------: | ----------------------------------------- | ------------------------ |
| `Kernel`               | `raise`, `rand`                           | `🛑`, `🎲` |
| `Object`               | `object_id`, `class`, `freeze`, `frozen?` | `🆔`, `ⓣ`, `❄️`, `❄️?` |
| `Module`               | `private`, `protected`, `const_defined?`, `private_method_defined?`, `protected_method_defined?` | `🙈`, `🛡️`, `∃const?`, `∃🙈⨍`, `∃🛡️⨍?` |
| `Class`                | `new`                                     | `🆕` |
| `String`, `Symbol`     | `upcase`, `downcase`                      | `⬆`, `⬇` |
| `Array`                | `tally`, `↩∀`                             | `📊`, `reverse_each`|
| `Array`, `Hash`, `Set` | `each`                                    | `∀` |
| `Array`, `String`      | `reverse`, `reverse!`                     | `↩`, `↩!` |
| `Enumerable`           | `map`, `each_with_index`                  | `⨍`, `∀ₓᵢ` |
| `Hash`                 | `key?`                                    | `∃🔑?` |
| `NilClass`, `Hash`, `Array`, `String`, `Set` | `empty?`            | `∅?`|
| `String`, `Array`, `Set`, `Hash`, `Proc` | `length` (`arity` for `Proc`) * | `𝔠` |
| `Matrix`               | `square?`, `tranpose`, `row_count`, `column_count` | `▣?`, `ᵀ`, `num_rows`, `num_cols` |

---

### Code Base Statistics:
| category    | attribute       | value(s)         | # of  |
| ----------: | :-------------: | ---------------: | :---- |
| `QA`        | `unit`          | `1337`           | tests (for core functionality) |
| `QA`        | `integration`   | `23`             | tests (for state/functionality checks on grouped features/components) |
| `QA`        | `performance`   | `147`:`85`       | tests{`non_numeric`,`numeric`} (for runtime performance) |
| `QA`        | `DB`            | `291`            | tests (for currently combined categories of `DB`, `ORM`, & `Service`) |
| `QA`        | `system`        | `8`              | tests (compare to `integration` but vastly larger scale w/ randomness involved to help encounter niche error-states) |
| `CI`        | `audit`         | `166`            | tests (for anything non-functionality based) |
| `CI`        | `locale`        | `95`:`34`        | local config tests{`core`:`excessive_checks`} |
| `tech-debt` | `coverage`      | `13`             | tests (for tracking missing functionality) |
| `structure` | `features`      | `1`:`31`:`9`:`6` | features{`stable`:`wip`:`⚠️`:`todo`} |
| `coverage`  | `LOCs`          | `???`            | `wip` |
| `coverage`  | `runtime`       | `???`            | `wip` |
| `coverage`  | `documentation` | `???`            | `wip` |

---

### Gems:

| gem | version | :development, :runtime | category |
| ---: | :--- | :---: | ---: |
| `tty-command` | [`0.9.0`](https://rubygems.org/gems/tty-command) | ✅, ✅ | `CLI` |
| `docker-api` | [`2.0.0.pre.1`](https://rubygems.org/gems/docker-api) | ✅, ❌ | `CLI` |
| `rugged` | [`1.0.1`](https://rubygems.org/gems/rugged) | ✅, ❌ | `CLI` |
| `rdoc` | [`6.2.1`](https://rubygems.org/gems/rdoc) | ✅, ❌ | `DOC` |
| `bundler` | [`2.2.0.rc.1`](https://rubygems.org/gems/bundler) | ✅, ❌ | `CI` |
| `rubygems-update` | [`3.2.0.rc.1`](https://rubygems.org/gems/rubygems-update) | ✅, ❌ | `CI` |
| `rspec` | [`3.9.0`](https://rubygems.org/gems/rspec) | ✅, ❌ | `QA` |
| `rspec-benchmark` | [`0.6.0`](https://rubygems.org/gems/rspec-benchmark) | ✅, ❌ | `QA` |
| `rake` | [`13.0.1`](https://rubygems.org/gems/rake) | ✅, ❌ | `EXT` |
| `rake-compiler` | [`1.1.1`](https://rubygems.org/gems/rake-compiler) | ✅, ❌ | `EXT` |
| `pg` | [`1.2.3`](https://rubygems.org/gems/pg) | ✅, ❌ | `DB` |
| `sqlite3` | [`1.4.2`](https://rubygems.org/gems/sqlite3) | ✅, ❌ | `DB` |
| `activerecord` | [`5.2.4.3`](https://rubygems.org/gems/activerecord) | ✅, ❌ | `DB` |
| `schema_plus_foreign_keys` | [`0.1.8`](https://rubygems.org/gems/schema_plus_foreign_keys) | ✅, ❌ | `DB` |

---

>#### Commands
>##### General Tasks:
>|  preface               | cmd                 | description                                          |
>| ---------------------: | :-----------------: | :--------------------------------------------------- |
>| `bundle exec rake`     | `rdoc`              | generate documentation coverage report               |
>| `bundle exec rake`     | `install`           | install gem onto local machine                       |
>| `bundle exec rake`     | `compile`           | compile any native C-extensions with code changes    |
>| `bundle exec rake`     | `release`           | push git version tags and publish gem to Rubygems    |
>| `bin/`                 | `audit`             | general all-around build & health check              |
>| `bin/`                 | `audit_db`<br/>`audit_quick`<br/>`audit_all_but_performance`<br/>`audit_functionality`<br/>`audit_locale`<br/>`audit_locale_full` | similar to above but for targeted portions |
>| `bin/`                 | `setup`             | install dependencies                                 |
>| `bin/`                 | `console`<br/>`console_db`<br/>`console_jit` | interactive console for easier experimenting |
>| `bin/manually_execute` | `clean_up`          | delete any temporary/generated content, quick way to force a full re-compile |
>| `gem`                  | `server`            | host interactive web-page at `http://0.0.0.0:8808` to see documentation for currently installed gems |

>#### Testing Tasks:
>| preface            | cmd                 | description of test contests | w/ warnings?
>| -----------------: | :-----------------: | :---------- | ----------:
>| `bundle exec rake` | `rspec_unit`        | all core expected functionality from `Ruuuby` | ❌ |
>| `bundle exec rake` | `rspec_integration` | expected state & functionality from `Ruuuby` code areas w/ using more than one feature/component | ❌ |
>| `bundle exec rake` | `rspec_db`          | anything relating to the `DB` or `ORM` | ❌ |
>| `bundle exec rake` | `rspec_audit`       | extra-checks for expected code-structure; ensures passing `Ruuuby` functionality tests are not occurring from any artifacts | ❌ |
>| `bundle exec rake` | `rspec_performance` | defines acceptable runtime-performance benchmarks (`TODO: missing Big-O tests`) | ❌ |
>| `bundle exec rake` | `rspec_tech_debt`   | tracks/confirms missing coverage; ∀ resolved-test-case will transfer to a new test-category, lowering the total count of `tech_debt` tests | ❌ |
>| `bundle exec rake` | `rspec_locale`      | extra-checks for properly configured local coding environment (`TODO: need to formalize Ruby build process`) | ❌ |
>| `bundle exec rake` | `rspec_all`         | run all existing tests | ✅ |

---

>### Project Layout:
>|  directory     | description of contents                         |
>| -------------: | :---------------------------------------------- |
>| `app`          | currently only holds `ORM` definitions           |
>| `bin`          | `executable` files                               |
>| `db`           | database `schema`, `seed`, and `migrations`     |
>| `ext`          | `C` portion of this Gem's code <br/> (and future location for `JRuby-extensions`) |
>| `help`         | any helpful `documentation & notes`  |
>| `lib`          | `Ruuuby` portion of this `Gem's code`           |
>| `spec`         | `RSpecs` (unit tests + other `QA` and `Audits`) |

---

>#### Contributing
>###### Bug reports and pull requests are welcome on GitHub at https://github.com/utarsuno/ruuuby. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/utarsuno/ruuuby/blob/master/CODE_OF_CONDUCT.md).
>
>#### License
>###### The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
>
>#### Code of Conduct
>###### Everyone interacting in the Ruuuby project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/utarsuno/ruuuby/blob/master/CODE_OF_CONDUCT.md).
