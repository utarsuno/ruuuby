# Ruuuby [![Gem Version](https://badge.fury.io/rb/ruuuby.svg)](https://badge.fury.io/rb/ruuuby)

| for resource        | reference                                                   |
| ------------------: | :---------------------------------------------------------- |
| latest version      | [`0.1.0.pre.3`](https://rubygems.org/gems/ruuuby/versions/0.1.0.pre.3-x86_64-darwin-19) |
| stable version      | [`0.0.49`](https://rubygems.org/gems/ruuuby/versions/0.0.49-x86_64-darwin-18)           |
| changelog           | [`CHANGELOG.md`](https://github.com/utarsuno/ruuuby/blob/master/CHANGELOG.md) with in progress migration to [`[History.txt format]`](https://guides.rubygems.org/releasing-rubygems/) |
| `JIT` testing       | `RUBYOPT="--jit --jit-warnings --jit-wait --jit-max-cache=1337 --jit-verbose=2 --jit-debug -w" ./bin/console/ruuuby` |
| common<br>non-ascii | `∅`,`∃`,`∄`,`∋`,`∌`,`∈`,`∉`,`ⓣ`,`Ⓣ`,`≈`,`∞`,`π`,`℮`,`𝚽`<br>`η̂`,`μ`,`∴`,`𝔠`,`𝔦`,`𝔣`,`Λ`,`λ`,`∫`,`⨍`,`𝑓`,`∀`,`τ`,`x̃`,`𝚡`,`𝛿`,`σ`,`⌋`,`⌈`<br>`𝔹`,`ℂ`,`ℕ`,`𝕎`,`ℤ`,`ℚ`,`𝔸ᵣ`,`ℂ`,`𝕋`,`𝕀`,`ℝ`,`𝕌`,`𝕊`,`🅱`<br>`±`,`Ω`,`γ`,`Ψ`,`ρ`,`δ`,`Ⴔ`,`⨁`,`⨂`,`∖`,`≡`,`√`,`∛`,`↩`,`‣`,`⟶`,`↘`,`⬇`,`⬆`<br>`𝞽`,`θ`,`°`,`ʳ`,`ᵍ`,`⦜`,`○`,`ₑ`,`₀`,`₁`,`₂`,`₃`,`ₓ`,`ᵢ`,`ᵀ`,`▣`<br>`⁻ⁿ`,`⁰`,`¹`,`²`,`³`,`⁴`,`⁵`,`⁶`,`⁷`,`⁸`,`⁹`,`●`,`◆`,`▲,`▬,`▰`<br>`¼`,`½`,`¾`,`⅓`,`⅕`,`⅕`,`⅖`,`⅗`,`⅘`,`⅙`,`⅐`,`⅛`,`⅜`,`⅝`,`⅞`,`⅑`,`⅒`<br>`📁`,`🗄️`,`💾`,`🕒`,`🎲`,`📊`,`🧟`,`💻`,`📱`,`🌐`,`❄️`,`💎`,`⚠️`,`🔑`,`✏️`,`📖`,`🏠`<br>`✅`,`♻️`,`🍺`,`🛡`,`📅`,`🛑`,`❌`,`❓`,`🆔`,`🧬`<br>`🐇`,`🐋`,`🐍`,`🐫`,`🙈` |
| download source for utilized version of Ruby | [Ruby3.0.0-preview1](https://www.ruby-lang.org/en/news/2020/09/25/ruby-3-0-0-preview1-released/) |
| summary & purpose   | in migration until version{`0.1.0`} |

### Examples

```ruby
#  __   ___              ___          ___    ___  __  
# |  \ |__  \  /    |  |  |  | |    |  |  | |__  /__` 
# |__/ |___  \/     \__/  |  | |___ |  |  | |___ .__/ 

# run node.js tests on live container{A}, transfer results as file to live container{B}
qa_results = 🐋['service_js_dev'].cmd!(%w(npm test --check-leaks)).join.as_utf8
🐋['service_nginx_dev'].📁✏️('/example/file/path', qa_results)

# send chat message, triggering execution of background QA tests which involve randomness
#   ‣ allowing relatively ∞ time for tests to complete, as needed
#   ‣ jobs can be scheduled from mobile-phone! 📱
#
# AMQP & REST: Ruuuby ⟶ Discord ⟶ JavaScript ⟶ RabbitMQ ⟶ Ruuuby ⟶ Discord
$discord.msg('!cmd: bundle exec rake qa:rng')

# ‣ A) is the specified path an empty file or not exist?
# ‣ B) is today's average temperature in Chicago below freezing?
# ‣ if yes to (A) and (B), save results of brew update command to file at path specified
path_file = "brew_update_#{📅.today.to_s}.txt"
unless 📁.∃?(path_file) || 📁.∅?(path_file)
  chicago_data     = 🌐.get_json!('https://www.metaweather.com/api/location/2379574/')
  avg_temp_celsius = chicago_data['consolidated_weather'].first['the_temp']
  💻("brew update > #{path_file}") if avg_temp_celsius < 0
end
```

```ruby
#  ___  ___      ___       __   ___     __     __   ___  __  ___ 
# |__  |__   /\   |  |  | |__) |__     |  \ | / _` |__  /__`  |  
# |    |___ /~~\  |  \__/ |  \ |___    |__/ | \__> |___ .__/  |  

# | ✔ | ✔ | ✔ | ✔ | ✔ |
𝚽 == 1 + (𝚽^⁻¹)
𝚽 == 2 * sin(θ°(54))
π == 5 * acos(𝚽 / 2) 
θ°(360) == θʳ(π/2) * 4
√(√(-1337.0^⁴)) == 1337

# | ✔ | ✔ | ✘ | ✘ | ✔ |
'b'.∈? 'abc'
'abc'.∌? 'd'
'd'.∈? 'abc'
'xyz'.∉? [1337, 'xyz']
[1337, 'xyz'].∋? 1337

# | ✔ | ✘ |
[1, 'a', 2, nil, [], 2].≈≈ [nil, 2, 2, 'a', 1, []]
[1, 'a', 2, nil, [], 2] == [nil, 2, 2, 'a', 1, []]

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
| `open3` | [`0.1.0`](https://rubygems.org/gems/open3/versions/0.1.0) | ✅, ❌ | toggleable feature |
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
| `ThetaAngle` | -`ContextRuuuby`<br>-`ContextParamCheck` | `Object`   | -`θ°`,`θʳ`,`θᵍ`,`θ𝞽`<br>-`θ?`,`🛑θ❓` |
| `Math::Algebra::Tropical` | `ContextNumeric` | `Numeric` | `⨁`, `⨂` |
| `Math::Algebra::Tropical` | `ContextMatrix`  | `Matrix`  | `⨁`, `⨁!`, `⨂`, `⨂ⁿ` |
| `Heuristics` | `ContextParsingCommandOutput` | -`String`<br>-`Array` | `clean` |

### Example Math Modules Modification:

| module(s) | sub-module | func(s) added |
| ------: | :----: | :---------------- |
| `Math` | `Ratio` | `golden?`, `super_golden?` |
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
| `Trigonometry` | <em>class:</em> `ThetaAngle` | `°?`,`°`,`ʳ?`,`ʳ`,`∅?`,`⦜?`,`○?`,`η̂?`,`η̂!` |
| `Statistics`   | <em>class:</em> `TimeSeriesData` | `μ`,`x̃`,`σ`,`σ²`,`ρ`,`mse`,`mape`,`λ`,`Λ`,`η̂?`,`η̂!`<br>`mem_size`,`free_memory`,`Q₁`,`Q₂`,`Q₃`,`IQR`,`outliers_lower`,`outliers_upper` |
| `NumberTheory::𝕎¹` | <em>singleton-objs of class:</em> `Math::Expr::Sequence` | `seq_pronic`,`seq_fibonacci`,`seq_lucas`,`seq_square`,`seq_triangle`,`seq_hexagonal` |
| `Forex`        | <em>class: `CurrencyMatrix`</em> | |
| `GraphTheory`  | <em>class:</em> `PseudoGraph` | |

### Example Class Modifications:

| class(es)              | func(s) added                       |
| ---------------------: | :---------------------------------- |
| `File`, `Dir`, `ENV`, `NilClass`, `Vector` | `∅?`            |
| `Module`               | `∃⨍_alias?`, `∃⨍?`                  |
| `File`                 | `replace_expr_with`, `replace_expr_with!`, `insert_line_before_expr` |
| `Object`               | `Ⓣ`, `ary?`, `bool?`, `hsh?`, `int?`, `flt?`, `num?`, `str?`, `chr?`, `sym?`, `matrix?`, `vec?`<br>`🛑bool❓`, `🛑int❓`, `🛑flt❓`, `🛑num❓`, `🛑ary❓`, `🛑str❓`, `🛑sym❓` |
| `String`               | `♻️⟵`, `♻️⟶`, `♻️⟶∞`,`∋?`, `∌?`, `∈?`, `∉?`<br>`⬇?`⟶`downcase?`, `⬆?`⟶`upcase?`, `⬇!`⟶`downcase!`, `⬆!`⟶`upcase!`<br>`🐫?`, `🐫⬇?`, `to_🐫``🐍⬆?`, `🐍?`, `to_🐍`<br>`digit?`, `to_num`, `to_num?`, `palindrome?`<br>`as_utf8`, `iso8601?`, `to_iso8601`, `as_iso8601` |
| `Enumerable`           | `∌?`, `∀τ²∈λ𝑓₍ᵢ،ᵢ₊₁₎`              |
| `Array`, `String`      | `>>`, `η̂!`, `ensure_start!`, `ensure_ending!` |
| `Matrix`               |  `∀ₓ↘`, `∀ₓᵢ↘`, `↘_to_a`, `∀ₓᵢⱼ`   |

### Example Aliases:

| for                    | base method(s) reference(s)               | alias(es)                |
| ---------------------: | ----------------------------------------- | ------------------------ |
| `Kernel`               | `raise`                                   | `🛑` |
| `Object`               | `object_id`, `class`, `freeze`, `frozen?` | `🆔`, `ⓣ`, `❄️`, `❄️?` |
| `Module`               | `private`, `protected`, `const_defined?`, `private_method_defined?`, `protected_method_defined?` | `🙈`, `🛡️`, `∃const?`, `∃🙈⨍`, `∃🛡️⨍?` |
| `String`, `Symbol`     | `upcase`, `downcase`                      | `⬆`, `⬇` |
| `Array`, `Hash`, `Set` | `each`                                    | `∀` |
| `Enumerable`           | `map`, `each_with_index`                  | `⨍`, `∀ₓᵢ` |
| `Hash`                 | `key?`                                    | `∃🔑?` |
| `NilClass`, `Hash`, `Array`, `String`, `Set` | `empty?`            | `∅?`|
| `String`, `Array`, `Set`, `Hash`, `Proc` | `length` (`arity` for `Proc`) * | `𝔠` |

---

#### Runnable Commands

> documentation to update here prior to version{0.1.0}

---

### Code Base Statistics:

| categories         | attribute                | value(s)    | stable before version{`0.1.0`} | # of  |
| -----------------: | :----------------------: | ----------: | :-----: | :---- |
| `QA`               | `unit`                   | `1202`      | ✅ | tests (core functionality) |
| `QA`               | `integration`            | `20`        | ✅ | tests (state & functionality of grouped units) |
| `QA`,`performance` | `benchmarks-runtime`     |             | ❌ |  |
| `QA`,`performance` | `benchmarks-memory`      |             | ❌ |  |
| `QA`               | `rng`                    | `2`         | ✅ | tests (involving statistics/randomness, ex: verifying a geometric distribution)) |
| `QA`,`DB`          | `system`                 | `7`         | ✅ | tests (`integration` scaled to `micro-services` & w/ randomness involved to help encounter niche error-states) |
| `QA`,`DB`          | `engine`                 |             | ❌ |  |
| `QA`,`DB`          | `ORM`                    |             | ❌ |  |
| `QA`,`DB`          | `services`               |             | ❌ |  |
| `QA`,`CICD`,`DB`   | `domain`                 |             | ❌ |  |
| `CICD`             | `audit`                  | `83`        | ✅ | tests (anything non-functionality based) |
| `CICD`             | `locale`                 | `66`        | ✅ | tests (verifying `Ruuuby` needed build configs) |
| `CICD`             | `preferences`            | `20`        | ❌ | tests (verifying preferred `OS & development configs & values`) |
| `structure`        | `tech-debt`              | `8`         | ✅ | tests (tracking missing functionality) |
| `structure`        | `features`               |             | ❌ |  |
| `coverage`         | `code-documentation`     | `? %`       | ❌ |  |
| `coverage`         | `code-coverage-tested`   | `? %`       | ❌ |  |
