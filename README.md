# Ruuuby [![Gem Version](https://badge.fury.io/rb/ruuuby.svg)](https://badge.fury.io/rb/ruuuby)

> flavored modifications & extensions for increased quality of Ruby coding life

| for resource        | reference                                                   |
| ------------------: | :---------------------------------------------------------- |
| latest: `Gemfile`    | `gem 'ruuuby', '~> 0.1.0.pre.2'`                            |
| stable: `Gemfile`    | `gem 'ruuuby', '~> 0.0.49`                                  |
| ruby scripts        | `require 'ruuuby'`                                          |
| gem url             | https://rubygems.org/gems/ruuuby                            |
| changelog           | https://github.com/utarsuno/ruuuby/blob/master/CHANGELOG.md <br>`note: style of changelog will be adapted to the` [`[History.txt format]`](https://guides.rubygems.org/releasing-rubygems/) |
| `JIT` testing       | `RUBYOPT="--jit --jit-warnings --jit-wait --jit-max-cache=1337 --jit-verbose=2 --jit-debug -w" ./bin/console/ruuuby` |
| common<br>non-ascii | `∅`,`∃`,`∄`,`∋`,`∌`,`∈`,`∉`,`ⓣ`,`Ⓣ`,`≈`,`∞`,`π`,`℮`,`𝚽`<br>`η̂`,`μ`,`∴`,`𝔠`,`𝔦`,`𝔣`,`Λ`,`λ`,`∫`,`⨍`,`𝑓`,`∀`,`τ`,`x̃`,`𝚡`,`𝛿`,`σ`,`⌋`,`⌈`<br>`𝔹`,`ℂ`,`ℕ`,`𝕎`,`ℤ`,`ℚ`,`𝔸ᵣ`,`ℂ`,`𝕋`,`𝕀`,`ℝ`,`𝕌`,`𝕊`,`🅱`<br>`±`,`Ω`,`γ`,`Ψ`,`ρ`,`δ`,`Ⴔ`,`⨁`,`⨂`,`∖`,`≡`,`√`,`∛`,`↩`,`‣`,`⟶`,`↘`,`⬇`,`⬆`<br>`𝞽`,`θ`,`°`,`ʳ`,`ᵍ`,`⦜`,`○`,`ₑ`,`₀`,`₁`,`₂`,`₃`,`ₓ`,`ᵢ`,`ᵀ`,`▣`<br>`⁻ⁿ`,`⁰`,`¹`,`²`,`³`,`⁴`,`⁵`,`⁶`,`⁷`,`⁸`,`⁹`<br>`¼`,`½`,`¾`,`⅓`,`⅕`,`⅕`,`⅖`,`⅗`,`⅘`,`⅙`,`⅐`,`⅛`,`⅜`,`⅝`,`⅞`,`⅑`,`⅒`<br>`📁`,`🗄️`,`💾`,`🕒`,`🎲`,`📊`,`🧟`,`💻`,`📱`,`🌐`,`❄️`,`💎`,`⚠️`,`🔑`,`✏️`,`📖`,`🏠`<br>`✅`,`♻️`,`🍺`,`🛡`,`📅`,`🛑`,`❌`,`❓`,`🆔`,`🧬`<br>`🐇`,`🐋`,`🐍`,`🐫`,`🙈` |
| download source for utilized version of Ruby | [Ruby3.0.0-preview1](https://www.ruby-lang.org/en/news/2020/09/25/ruby-3-0-0-preview1-released/) |

### Examples

```ruby
#  __   ___              ___          ___    ___  __  
# |  \ |__  \  /    |  |  |  | |    |  |  | |__  /__` 
# |__/ |___  \/     \__/  |  | |___ |  |  | |___ .__/ 

# run node.js tests on live container{A}, transfer results as file to live container{B}
qa_results = 🐋['service_js'].cmd!(%w(npm test --check-leaks)).join.as_utf8
🐋['service_nginx'].📁✏️('/v/js_qa_results.txt', qa_results)

# send chat message, triggering execution of background QA tests which involve randomness
#   ‣ allowing relatively ∞ time for tests to complete, as needed
#   ‣ jobs can be scheduled from mobile-phone! 📱
#
# AMQP & REST: Ruuuby ⟶ Discord ⟶ JavaScript ⟶ RabbitMQ ⟶ Ruuuby ⟶ Discord
$discord.msg('!cmd: RUUUBY_F01="b00"; bundle exec rake rspec_rng')

# ‣ check if today's average temperature in Chicago is below freezing
# ‣ check if specified file does not already exists
# ‣ if both checks pass, create file w/ results from local command ran (updating brew)
path_to_log_file = "brew_update_#{📅.today.to_s}.txt"
chicago_weather = 🌐.get_json!('https://www.metaweather.com/api/location/2379574/')
if chicago_weather['consolidated_weather'].first['the_temp'] < 0 
  💻("brew update > #{path_to_log_file}") unless 📁.∃?(path_to_log_file)
end

```

```ruby
#  ___  ___      ___       __   ___     __     __   ___  __  ___ 
# |__  |__   /\   |  |  | |__) |__     |  \ | / _` |__  /__`  |  
# |    |___ /~~\  |  \__/ |  \ |___    |__/ | \__> |___ .__/  |  

# | ✔ | ✔ | ✔ | ✔ | ✔ | ✔ | ✔ |
𝚽 == 1 + (𝚽^⁻¹)
𝚽 == 2 * sin(θ°(54))
𝚽 == (θ°(360) - Ⴔ) / Ⴔ
π == 5 * acos(𝚽 / 2) 
√(√(-1337.0^⁴)) == 1337
θ°(360)  == θʳ(π/2) * 4
θ𝞽(0.75) == 𝞽 - θᵍ(100)

# | ✔ | ✔ | ✘ | ✘ | ✔ |
'b'.∈? 'abc'
'abc'.∌? 'd'
'd'.∈? 'abc'
'xyz'.∉? [1337, 'xyz']
[1337, 'xyz'].∋? 1337

# | ✔ | ✘ |
elements_a = [1, 'a', 2, nil, [], 2]
elements_b = [nil, 2, 2, 'a', 1, []]
[elements_a.≈≈(elements_b), elements_a == elements_b]

# | ✔ | ✔ | ✔ | ✔ |
['snake_case'.🐍?, 'AHHH_CAPITALS'.🐍⬆?, 'UpperCaseCamel'.🐫?, 'lowerCaseCamel'.🐫⬇?]

# | ✘ | ✔ | ✔ | ✘ | ✘ | ✔ |
[ℕ.∋?(-5), 𝕎.∋?(0.0), ℤ.∋?(7.0), ℝ.∋?(∞), ℝ.∋?(3i), ℚ.∋?(2/3r)]

# | ✔ | ✔ | ✔ |
Matrix[[1,3,5],[2,4,6]].ᵀ == Matrix[[1,2],[3,4],[5,6]]
([1, 2, 3].⨁ [3, 4]) == [1, 4, 2]
([2, 3, 4].∖ [1, 2, 3]) == [4]

# | ✔ | ✘ |
data = {haaallo: 'wooorld', ye: 'ee'}
[data.∃🔑?(:haaallo), data.∃🔑?(:👁️👅👁️)]

# stdout ⟶ 'world'
#            'hello'
['world', 1337, 'hello', 'abc'.❄️].∀{|x| puts x if x.str? && !x.❄️?}

# stdout ⟶ 'hello'
#            'world'
['world', 1337, 'hello', 'abc'.❄️].↩∀{|x| puts x if x.str? && !x.❄️?}
```

### Gems:

| gem | version | :development, :runtime | notes |
| ---: | :--- | :---: | ---: |
| `tty-command` | [`0.10.0`](https://rubygems.org/gems/tty-command/versions/0.10.0) | ✅, ✅ | always required |
| `finite_machine` | [`0.14.0`](https://rubygems.org/gems/finite_machine/versions/0.14.0) | ✅, ✅ | always required |
| `bunny` | [`2.17.0`](https://rubygems.org/gems/bunny/versions/2.17.0) | ✅, ❌ | toggleable feature |
| `docker-api` | [`2.0.0`](https://rubygems.org/gems/docker-api/versions/2.0.0) | ✅, ❌ | toggleable feature |
| `pg` | [`1.2.3`](https://rubygems.org/gems/pg/versions/1.2.3) | ✅, ❌ | toggleable feature |
| `activerecord` | [`6.1.0.rc1`](https://rubygems.org/gems/activerecord/versions/6.1.0.rc1) | ✅, ❌ | toggleable feature |
| `rdoc` | [`6.2.1`](https://rubygems.org/gems/rdoc/versions/6.2.1) | ✅, ❌ | development utility |
| `rspec` | [`3.10.0`](https://rubygems.org/gems/rspec/versions/3.10.0) | ✅, ❌ | development utility |
| `rspec-benchmark` | [`0.6.0`](https://rubygems.org/gems/rspec-benchmark/versions/0.6.0) | ✅, ❌ | development utility |
| `rake` | [`13.0.1`](https://rubygems.org/gems/rake/versions/13.0.1) | ✅, ❌ | development utility |
| `rake-compiler` | [`1.1.1`](https://rubygems.org/gems/rake-compiler/versions/1.1.1) | ✅, ❌ | development utility |
| `rugged` | [`1.1.0`](https://rubygems.org/gems/rugged/versions/1.1.0) | ❌, ❌ | broke w/ migration, fix wip |
| `rubygems-update` | [`3.2.0.rc.2`](https://rubygems.org/gems/rubygems-update/versions/3.2.0.rc.2) | ❌, ❌ | recommended version |
| `bundler` | [`2.2.0.rc.2`](https://rubygems.org/gems/bundler/versions/2.2.0.rc.2) | ❌, ❌ | recommended version |

## Overview:

### Example Refinements:

| base context | sub context | applies to | example of added functions  |
| ------------ | ----------- | -----------| --------------------------- |
| `ThetaAngle` | `ContextStr`        | `String`   | `ʳ?`,`ᵍ?`,`ʳ`,`ᵍ`   |
| `ThetaAngle` | -`ContextRuuuby`<br>-`ContextParamCheck` | `Object`   | `θ°`,`θʳ`,`θᵍ`,`θ𝞽`<br>`θ?`, `🛑θ❓` |
| `Math::Algebra::Tropical` | `ContextNumeric` | `Numeric` | `⨁`, `⨂` |
| `Math::Algebra::Tropical` | `ContextMatrix`  | `Matrix`  | `⨁`, `⨁!`, `⨂`, `⨂ⁿ` |
| `Math::NumberTheory`      | `ℤ³`             | `Integer` | `≡` |
| `Heuristics` | `ContextParsingCommandOutput` | -`String`<br>-`Array` | `clean` |

### Example Math Modules Modification:

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

### Example Custom Math Classes:

| base-context   | sub-context  | sample functionality |
| -------------: | :----------: | :------ |
| `Trigonometry` | <em>class:</em> `ThetaAngle` | <ul><li>`°?`⟶`degrees?`, `°`⟶`as_degree`, `ʳ?`⟶`radians?`, `ʳ`⟶`as_radian`</li><li>`∅?`⟶`zero?`, `⦜?`⟶`right?`, `○?`⟶`perigon?`</li><li>`η̂?`⟶`normal?`, `η̂!`⟶`normalize!`</li></ul> |
| `Statistics`   | <em>class:</em> `TimeSeriesData` | <ul><li>`μ`⟶`mean`, `x̃`⟶`median`, `σ`⟶`std_dev`, `σ²`⟶`variance`,</li><li>`ρ`⟶`pearson_correlation_coefficient`, `mse`⟶`mean_square_of_errors`, `mape`⟶`mean_absolute_percentage_error`</li><li>`λ`⟶`scale_by_addition`, `Λ`⟶`scale_by_multiplication`</li><li>`η̂?`⟶`normalized?`, `η̂!`⟶`normalize!`</li><li>`mem_size`, `free_memory`</li><li>`Q₁`, `Q₂`, `Q₃`, `IQR`, `outliers_lower`, `outliers_upper`</li></ul> |
| `NumberTheory::𝕎¹` | <em>singleton-objs of class:</em> `Math::Expr::Sequence` | <ul><li>`seq_pronic`, `seq_fibonacci`, `seq_lucas`, `seq_square`, `seq_triangle`, `seq_hexagonal`</li></ul> |
| `Forex`        | <em>class: `CurrencyMatrix`</em> | |
| `GraphTheory`  | <em>class:</em> `PseudoGraph` | |

### Example Class Modifications:

| class(es)              | func(s) added                       |
| ---------------------: | :---------------------------------- |
| `File`, `Dir`, `ENV`, `NilClass`, `Vector` | `∅?`            |
| `File`, `Dir`          | `∃?`                                |
| `Module`               | `∃⨍_alias?`, `∃⨍?`                  |
| `File`                 | `replace_expr_with`, `replace_expr_with!`, `insert_line_before_expr` |
| `Object`               | `Ⓣ`, `ary?`, `bool?`, `hsh?`, `int?`, `flt?`, `num?`, `str?`, `chr?`, `sym?`, `matrix?`, `vec?`<br>`🛑bool❓`, `🛑int❓`, `🛑flt❓`, `🛑num❓`, `🛑ary❓`, `🛑str❓`, `🛑sym❓` |
| `String`               | `♻️⟵`, `♻️⟶`, `♻️⟶∞`,`∋?`, `∌?`, `∈?`, `∉?`<br>`⬇?`⟶`downcase?`, `⬆?`⟶`upcase?`, `⬇!`⟶`downcase!`, `⬆!`⟶`upcase!`<br>`🐫?`, `🐫⬇?`, `to_🐫``🐍⬆?`, `🐍?`, `to_🐍`<br>`digit?`, `to_num`, `to_num?`, `palindrome?`<br>`as_utf8`, `iso8601?`, `to_iso8601`, `as_iso8601` |
| `Array`, `String`      | `η̂!`                               |
| `Array`                | `⨁`⟶`disjunctive_union`, `∖`, `end_with?`, `start_with?` |
| `Enumerable`           | `∌?`, `∀τ²∈λ𝑓₍ᵢ،ᵢ₊₁₎`              |
| `Array`, `String`      | `>>`                               |
| `String`, `Array`      | `ensure_start!`, `ensure_ending!`  |
| `Float`                | `≈≈`, `∞ℂ?`                        |
| `Matrix`               |  `∀ₓ↘`, `∀ₓᵢ↘`, `↘_to_a`, `∀ₓᵢⱼ`   |

### Example Aliases:

| for                    | base method(s) reference(s)               | alias(es)                |
| ---------------------: | ----------------------------------------- | ------------------------ |
| `Kernel`               | `raise`                                   | `🛑` |
| `Object`               | `object_id`, `class`, `freeze`, `frozen?` | `🆔`, `ⓣ`, `❄️`, `❄️?` |
| `Module`               | `private`, `protected`, `const_defined?`, `private_method_defined?`, `protected_method_defined?` | `🙈`, `🛡️`, `∃const?`, `∃🙈⨍`, `∃🛡️⨍?` |
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

#### Runnable Commands

> documentation to update here prior to version{0.1.0}

---

### Code Base Statistics:

> tests marked with a ~~strikethrough~~ will not exist/work before version{`0.1.0`}

| category    | attribute               | value(s)         | # of  |
| ----------: | :---------------------: | ---------------: | :---- |
| `QA`        | `unit`                  | `1274`           | tests (core functionality) |
| `QA`        | `integration`           | `22`             | tests (state & functionality of grouped units) |
| `QA`        | `performance (runtime)` | ~~142 : 85~~     | ~~tests{`non_numeric`,`numeric`}~~ |
| `QA`        | `DB`                    | ~~291~~          | ~~tests (combined categories of `DB`, `ORM`, & `Service`)~~ |
| `QA`        | `rng`                   | `2`              | tests (involving statistics/randomness, ex: verifying a geometric distribution) |
| `QA`        | `system`                | `7`              | tests (`integration` scaled to `micro-services` & w/ randomness involved to help encounter niche error-states) |
| `CI`        | `audit`                 | `124`            | tests (anything non-functionality based) |
| `CI`        | `locale`                | `66`:`32`        | tests on local setup & configs{`core`:`excessive_checks`} |
| `tech-debt` | `coverage`              | `31`             | tests (tracking missing functionality) |
| `structure` | `features`              | `1`:`32`:`9`:`6` | features{`stable`:`wip`:`⚠️`:`todo`} |
| `coverage`  | `LOCs`                  | `???`            | `wip` |
| `coverage`  | `runtime`               | `???`            | `wip` |
| `coverage`  | `documentation`         | `???`            | `wip` |

---

>#### Contributing
>###### Bug reports and pull requests are welcome on GitHub at https://github.com/utarsuno/ruuuby. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/utarsuno/ruuuby/blob/master/CODE_OF_CONDUCT.md).
>
>#### License
>###### The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
>
>#### Code of Conduct
>###### Everyone interacting in the Ruuuby project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/utarsuno/ruuuby/blob/master/CODE_OF_CONDUCT.md).
