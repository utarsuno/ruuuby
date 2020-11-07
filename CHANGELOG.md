---

#### ⚠️: documentation & testing synchronization targeted {0.1.0}

---

# `v0.1.0.pre.2`

 * modify `.gitattributes` to track `.sql` files
 * update gem{`activerecord`}
 * continue `DB` migration
 * apply miscellaneous clean ups

# `v0.1.0.pre.1`

 * start migration from `CHANGELOG.md` to `History.txt`
 * update gems{`tty-command`,`rspec`}
 * continue migration for `RabbitMQ` and `DB`
 * apply miscellaneous clean ups

# `v0.1.0.pre.0`

> abstract: Kintsugi!

 * upgrade to `Ruby` version{`3.0.0-preview1`}
   * gems{`tty-command`, `rugged`} require source code modification for compatibility, alternative solutions to be sought towards end of migration to version{`0.1.0`}
 * better isolate `feature interdependency`, helping `lazy-loading` but also enables setting targeted completion of `Ruuuby Dockerization` for version{`0.1.0`}
   * ⚠️: following suite, almost all `DB` related code will finally be getting overhauled (`to re-enable versioning & documentation 'automation' but with more micro granularity covered as to enable smaller code pushes w/o changing time spent on dev`)
 * begin structure overhaul of `commands, tasks, jobs, etc`, functionality designation to be re-balanced amongst `shell scripts`, `Ruby gems`, `Ruuuby scripts`, `RabbitMQ + DB`, etc

> noticeable mentions:

 * add gem{`bunny`} and a `Docker service` to help monitor `RabbitMQ`
 * add gem{`finite-machine`}, apply some design cleanup (w/ lots more to be done)
 * for `web-based services`: add `webmanifest` file and `JSON minification` to the existing single `node.js REST end-point`
   * generating file & directory `checksums` also added (wip) w/ results cross-checked between `JS` and `Ruuuby`
 * iterative upgrade for being able to set & apply development preferences such as `OS level configurations`

# `v0.0.49`

> abstract:
 * ⚠️: intermediate version release for organizational purposes, many `Classes`/`functions` added are temporary, intentionally created with later removal planned)

> discrete:
 * add `Docker`{`service_js`}
   * create `node.js server`, add first `REST end-point` offering `minification` of `HTML` and `CSS` files
 * add `multi-stage-builds` to existing services
   * add `zsh` to `development-environment` based `images`

> iterative:
 * further organize/upgrade various utility APIs: `git`, `docker`, `zsh`, `brew`, etc
 * further enable `lazy-loading`, lots more to be done
 * for `mac-os`, start utilizing `osascript`
   * (enables niche automation areas, silly ex: compiling w/ voice commands)

| gem updated | version previous | version current |
| ----: | :---: | :---- |
| `docker-api` | `1.34.2` | `2.0.0.pre.1` |

| path added | reference | notes | feature(s) |
| ----: | ---- | ---- | ---- |
| `lib/ruuuby/module/bundler.rb` | `Bundler` |  | `f10` |
| `lib/ruuuby/module/gem.rb` | `Gem` |  | `f10` |
| `services/web_assets/*` | `multiple files & dirs` | code not directly relating to `ruuuby engine` will not normally be documented (until pending `DB` overhaul) | `f10` |
| `lib/ruuuby/api/docker/docker_service.rb` | `RuuubyService` | temp util | `f39` |
| `lib/ruuuby/api/docker/docker_service_set.rb` | `RuuubyServiceSet` | temp util | `f39` |
| `bin/console_docker` | `RuuubyServiceSetDev` | offers funcs like: `build_web_assets`, `build_js`, `build_html`, `build_css`, `run_dev` | `f39` |

| context | method(s) added | feature(s) |
| ---: | :--- | ---: |
| `Object` | `attribute_versionable` | `f10` |
| `ENV` | `∀🔑∃_value?` | `f10` |
| `Hash` | `∄🔑?`, `∀🔑∃_value?` | `f10` |
| `Array` | `convert_to_json` | `f10` |
| `String` | `clean!` | `f10` |
| `Heuristics` | `clean` | `f10` |
| `Net::HTTPResponse` | `time_received`, `content_length` | `f10` |
| `💎.engine.api_zsh` | `run_script` | `f10` |
| `💎.engine` | `run_apple_script!`, `curl_get` | `f10` |
| `💎.engine.api_locale` | `healthy?`, `healthy_encoding?` | `f10` |
| `🍺` | `doctor`, `cleanup`, `healthy?`, `analytics?`, `analytics_disabled?`, `analytics_set_on`, `analytics_set_off` | `f10` |
| `💎.engine.api_git` | `∃index_conflicts?`, `∃fixable_syntax_errors?` | `f31` |
| ``🐋`/`💎.engine.api_locale.api_docker`` | `∀🐋`, `connected?`, `connect`, `connect!`, `disconnect`, `disconnect!`, `version_compose` | `f40` |
| `Docker::Container` | `alpine?`, `debian?`, `dev?`, `prod?`, `healthy?`, `env_vars`, `os`, `os_version`, `linux_kernel_version`, `os_architecture`, `mounts`, `∃mount?`, `file_create`, `cmd!` | `f40` |

---

# `v0.0.48`

 * add initial `Docker services:` {`nginx`, `postgresql`, `pgadmin4`} all `wip` w/ others inc
   * just for development utilities, not anything to be required by gem or for runtime
 * designate feature support/expansion for `WebGL` based derivatives to fully precede over `OpenGL` for `> 95.0% of scenarios`
 * add `RSpec categories:` {`system`}
   * `system tests` for now will act as a combination of `acceptance-testing`, `system-tests`, and `chaos-monkey-testing`
 * apply initial steps for cross-OS compatibility, process of doing so is revealing lots of code areas requiring adjustments, some addressed this version
 * indeterminate hiatus to provide time for math/theory studies to avoid adding tech-debt that would otherwise get created over the next 10+ versions

| gem added | version previous | version current | notes |
| ----: | :---: | :---- | :-----: |
| `pg` | `N/A` | `1.2.3` | comparing (apples & oranges) use-cases against `ActiveRecord` |
| `docker-api` | `N/A` | `1.34.2` | offers tons of functionality, way more to be utilized |

| path(s) added | reference | notes | feature(s) |
| ----: | ---- | ---- | ---- |
| `services/nginx/includes/*.nginx` | (multiple files & directories) | | `f39` |
| `services/web_assets/Dockerfile` | | file added early, will be utilizing various `JS` libs/environments | `f39` |
| `services/web_assets/ruuuby.html` | | same as above | `f39` |
| `services/web_assets/ruuuby.js` | | same as above | `f39` |

| context | method(s) added | feature(s) |
| ----: | :---- | ----: |
| `Array` | `∀𝚡λ𝑓🖨️` | `f10` |
| `Hash` | `λ𝑓∀🔑：₍🔑∉₎`, `λ𝑓∀🔑：₍🔑∉₎!` | `f10` |
| `File::YAML` | `read` | `f12` |
| `💎.engine.os` | `windows?`, `unix?`, `mac?`, `linux?` | `f22` |
| `🐋`/`💎.engine.api_locale.api_docker` | `healthy?`, `∃🌐?`, `∃🐋?`, `find_🌐_by_name`, `find_🐋_by_name`, `find_🐋_by_id`, `♻️_🌐_by_name` | `f40` |

---

# `v0.0.47`

 * add T e C h D e B t ♪~ ᕕ(ᐛ)ᕗ

| gem updated | version previous | version current |
| ----: | :---: | :---- |
| `rake-compiler` | `1.1.0` | `1.1.1` |
| `rubygems-update` | `3.1.4` | `3.2.0.rc.1` |

| path added | reference | notes | feature(s) |
| ----: | ---- | ---- | ---- |
| `lib/ruuuby/math/finance/benchmarks.rb` |  | not currently utilized, just file added early | `f10` |
| `lib/ruuuby/heuristics/heuristics.rb` | `Ruuuby::Heuristics` | same as above description | `f10` |

| context | method(s) added | feature(s) |
| ---: | :--- | ---: |
| `Matrix` | `ᵀ` | `f10` |
| `File::CSV` | `read` | `f12` |
| `💎.engine.api` | `pid_terminate` | `f22` |
| `💎.engine.api_locale` | `iconv_version`, `iconv_supported_encodings` | `f22` |
| `PseudoGraph` | `[]`, `set_edge`, `set_edge_inverse`, `num_nodes`, `empty?`, `free_memory`, `print_debugging` | `f37` |
| `TimeSeriesData` | `Q₁`, `Q₃`, `IQR`, `outliers_lower`, `outliers_upper`, `boundary_outliers_min`, `boundary_outliers_max`, `sum_squared`, `sum_of_squares`, `sum_weighted`, `mean_weighted`, `mean_geometric`, `nᵗʰ_percent_rank`, `healthy?` | `f38` |

---

# `v0.0.46`

 * add initial support for `Tropical Algebra`
 * `wip`: track `OpenMP` in same style as w/ `OpenGL` & `OpenCL`
 * ⚠️: greatly increase scope of upcoming wide-scale refactors
   > tech-debt will out-pace rate of implementation/testing for at least a few versions, then more effective code clean-up will be enabled and performed

| path added | reference | notes | feature(s) |
| ----: | ---- | ---- | ---- |
| `lib/ruuuby/math/physics/physics.rb` | `Math::Physics` | not currently utilized, just file added early | `f10` |
| `lib/ruuuby/math/physics/wave.rb` | `Math::Physics::Wave` | same as above desc. | `f10` |
| `lib/ruuuby/math/physics/harmonic_analysis.rb` | `Math::Physics::HarmonicAnalysis` | same as above desc. | `f10` |
| `lib/ruuuby/math/forex/forex.rb` | `Math::Forex` | same as above desc. | `f10` |
| `lib/ruuuby/math/forex/currency_matrix.rb` | `Math::Forex::CurrencyMatrix` | `wip` | `f10` |
| `lib/ruuuby/class/nums/vector.rb` | `Vector` | `Ruby` built-in Class (now loaded in) | `f10` |
| `lib/ruuuby/class/nums/matrix.rb` | `Matrix` | `Ruby` built-in Class (now loaded in) | `f37` |
| `lib/ruuuby/math/algebra/tropical.rb` | `Math::Algebra::Tropical` |  | `f38` |
| `ext/ruby_class_mods/c8_graphs.h` | `PseudoGraph` | same creation style as `ThetaAngle` & `TimeSeriesData` | `f38` |
| `lib/ruuuby/protocol/unix_socket.rb` | `UNIXSocket` | `Ruby` built-in Class (now loaded in) | `f39` |
| `help/extensions/c/open_mp.md` |  | `wip` | `f98` |

| context | method(s) added | feature(s) |
| ---: | :--- | ---: |
| `Vector` | `∅?` | `f11` |
| `Matrix` | `▣?`, `∀ₓ↘`, `∀ₓᵢ↘`, `↘_to_a`, `∀ₓᵢⱼ`, `num_rows`, `num_cols` | `f38` |
| `Math::Forex::CurrencyMatrix` | `η̂!`,`algo_🌴_arbitrage`, `karps_algorithm` | `f38` |
| `Math::Algebra::Tropical::ContextNumeric` | `⨁`, `⨂` | `f38` |
| `Math::Algebra::Tropical::ContextMatrix` | `⨁`, `⨁!`, `⨂`, `⨂ⁿ` | `f38` |

---

# `v0.0.45`

 * apply iterative upgrade to `Ruuuby Engine`
   * **ex:** track `GIT attributes` w/ `💎.engine.api_git`
 * fix various edge-case bugs w/ `ThetaAngle` <em>bitwise flags</em>; apply same design to `TimeSeriesData`; start creation of re-usable base code for `Bitwise Flags` in general
 * `ORM`: apply start of refactors for proper support of `RuuubyChangelog` and other automation-functionality; design still `wip`
   * and thus full `DB TDD` & `documentation` is still withheld
 * <em>**remove:**</em> global{`$PRM_MANY`}, update funcs in{`f06`} as needed and slightly increase testing coverage
 * move various math functions to better suited locations; more to be done

| gem updated | version previous | version current |
| ----: | :---: | :---- |
| `bundler` | `2.1.4` | `2.2.0.rc.1` |

| path added | reference | notes | feature(s) |
| ----: | ---- | ---- | ---- |
| `lib/ruuuby/class/bitwise_flag.rb` | `Ruuuby::BitwiseFlag` | utility/helper, non-core class | `f10` |
| `.gitattributes` |  |  | `f22` |
| `lib/ruuuby/math/geometry/shape/sphere.rb` | `Math::Geometry::Sphere` | not currently utilized, just file added early | `f35` |

| context | method(s) added | feature(s) |
| ---: | :--- | ---: |
| `ApplicationRecord` | `orm_Ⓣ_🐍`, `empty?` | `f15` |
| `Ruuuby::MetaData::RuuubyEngine` | `num_cpu_cores`, `current_user`, `get_compiled_code` | `f22` |
| `💎.engine.api_git` | `validate_attribute` | `f31` |
| `Math::Stats::Descriptive` | `percentage_error` | `f36` |
| `TimeSeriesData` | `ρ`, `flags`, `mape`, `normalize!`, `print_debugging`, `first`, `last`, `λ`, `Λ`, `has_zero?`, `has_negative?`, `normalized?`, `even?`, `strictly_increasing?`, `strictly_decreasing?`, `all_same?` | `f36` |

---

# `v0.0.44`

 * enable `non-core feature code` to be included/excluded during `pre-processing` as opposed to during `start-up` and/or `runtime`
 * (`wip`) track `OpenCL` & `OpenGL` through `locale RSpecs` (and eventually the `'Ruuuby Engine'`)
 * update gem(`rugged`) version from{`1.0.0`} to{`1.0.1`}
 * update gem(`rspec-benchmark`) version from{`0.5.1`} to{`0.6.0`}
 * add majority of needed initial `ThetaAngle` syntax parsing content; remaining is pending implementation of new functionality/refactors for `ThetaAngle`
 * (`wip`) create class{`TimeSeriesData`}, in similair fashion as `ThetaAngle` (`Ruby object` wrapper over a `C struct instance`)
 * increase and track various default-values for `Ruby Garbage Collector configs`
   * `TimeSeriesData` will eventually be able to be used for discovering optimal `GC-settings`
   * ex: finding optimal `heap-size` and `garbage-collection-frequency` depending on context of script

| path added | reference | notes | feature(s) |
| ---: | --- | --- | --- |
| `lib/ruuuby/math/stats/time_series_data.rb` | `TimeSeriesData` | `wip` | `f34` |
| `ext/ruby_class_mods/c7_times_series_data.rb` | `TimeSeriesData` | `wip` | `f35` |
| `lib/ruuuby/ruuuby/engine/ruuuby_api_component.rb` |  | `temp/wip` | `f97` |
| `bin/compilation_modes/build_w_debugging` |  | `temp/wip` | `f97` |
| `bin/compilation_modes/build_simple` |  | `temp/wip` | `f97` |

| context | method(s) added | feature(s) |
| --- | --- | --- |
| `Ruuuby::MetaData::RuuubyEngine::F22B00` | `percentage_protected_from_minor_marks`, `percentage_fragmentation`, `stats_bytes_per_object_slot`, `stats_slots_per_heap_page`, `perform_quick`, `perform_full` | `f23` |
| (Refinement) `String` | `ʳ?`, `ʳ`, `ᵍ?`, `ᵍ`, `𝞽?`, `𝞽` | `f28` |
| `TimeSeriesData` | `mem_size`, `free_memory`, `len`, `mean`, `sum`, `max`, `min`, `median`, `range`, `σ²`=>`variance`, `σ`=>`std_dev`, `percentile`, `mse` | `f36` |

---

# `v0.0.43`
 * add{`f06_b04`} to provide normalizer{`∈𝕌`} for funcs{`flt?`, `🛑flt❓`}
 * start adding textual parsing for `ThetaAngle` via `Refinement` in{`ThetaAngle::ContextStrParsing`}
 * increase scope tested in some db_audit funcs

| path added | reference | notes | feature(s) |
| ---: | --- | --- | --- |
| `lib/ruuuby/math/geometry/theta_angle/context_str.rb` | `ThetaAngle::ContextStrParsing` | Refinements onto `String` for parsing to and from `ThetaAngle` | `f27` |
| `lib/ruuuby/ruuuby/engine/ruuuby_engine_component.rb` | `Ruuuby::MetaData::RuuubyEngineComponent` | start of cleaner design w/ `RuuubyEngine` and relating objs | `f10` |
| `lib/ruuuby/ruuuby/api/api_locale.rb` | `Ruuuby::MetaData::LocaleAPI` |  | `f10` |
| `bin/manually_execute/clean_up` |  | delete any temporary/generated content, quick way to force a full re-compile | `f10` |

| context | method(s) added | feature(s) |
| --- | --- | --- |
| `Math::Stats::TimeSeries` | `aroon_up`, `aroon_down`, `aroon_oscillator`, `simple_moving_average` | `f35` |
| `Math::Combinatorics::𝕎¹` | `len_powerset` | `f33` |
| `Math::Combinatorics::𝕎²` | `len_ordered_with_replacement` | `f33` |
| (`Refinement`) `String` | `°?`, `°` | `f27` |

---

# `v0.0.42`
 * change normalizer from{!∅} to{∉∅}; add{f06_b03} to provide this normalizer for funcs{ary?, 🛑ary❓}
 * provide function aliases{`wma`, `ema`} to `Math::Stats::TimeSeries`

| class | method(s) added | feature(s) |
| --- | --- | --- |
| `ThetaAngle` | `octant?` | `f28` |
| `Math::Stats` | `median` | `f35` |
| `Math::Stats::TimeSeries` | `weighted_moving_average` | `f35` |

---

# `v0.0.41`
 * iterative upgrade for `💎.engine`'s `JIT`, `CLI`, and `logging`
   * (further track stats like memory, cpu, and other OS specifics)
 * apply clean-ups to{`ThetaAngle`}
   * (increased bitwise-flags utilization, misc bug-fixes, field{repr} represented w/ FIXNUM instead of Symbol, etc)
 * where possible, apply cleaner `OOP`, remove many `Ruuuby` functions and/or data
   * ex: remove various `Singletons & globals`
 * (wip) create logical-divisions within the `RSpec` categories, significantly enabling more `lazy-loading`
   * faster start-up time esp. for targeted scripts
   * ex: compare `rspec_locale{0.04s}` vs `rspec_locale_full{1.33s}`

| path added | reference | notes | feature(s) |
| ---: | --- | --- | --- |
| `ext/ruby_class_mods/c5_internal_structs.h` |  |  | `f98` |
| `ext/ruby_class_mods/c6_feature_macros.h` |  |  | `f98` |
| `lib/ruuuby/math/stats/stats.rb` | `Math::Stats` | | `f35` |
| `lib/ruuuby/math/stats/time_series.rb` | `Math::Stats::TimeSeries` | | `f35` |
| `lib/ruuuby/math/geometry/shape/shape.rb` | `Math::Geometry::Shape` | not currently utilized, just file added early | `f34` |
| `lib/ruuuby/math/geometry/shape/plane_figure.rb` | `Math::Geometry::PlaneFigure` | same as ↑ | `f34` |
| `lib/ruuuby/math/geometry/shape/quadrilateral.rb` | `Math::Geometry::Triangle` | same as ↑ | `f34` |
| `lib/ruuuby/math/geometry/shape/shape.rb` | `Math::Geometry::Quadrilateral` | same as ↑ | `f34` |
| `db/db_schema.rb` |  |  | `f15` |
| `lib/ruuuby/ruuuby/api/abstract_space.rb` |  | not currently utilized, just file added early | `f02` |
| `lib/ruuuby/ruuuby/api/api_brew.rb` |  | same as ↑ | `f02` |
| `lib/ruuuby/ruuuby/api/api_docker.rb` |  | same as ↑ | `f02` |

| class | method(s) added | feature(s) |
| --- | --- | --- |
| `String` | `palindrome?` | `f10` |
| `ApplicationRecord` | `num_where` | `f11` |
| `GitCommit` | `num_release_tags` | `f11` |
| `RuuubyRelease` | `num_released` | `f11` |
| `Ruuuby::MetaData::RuuubyEngine` | `memory_peak_this_runtime` | `f22` |
| `Math::NumberTheory` | `semiprime?` | `f32` |
| `Math::Combinatorics` | `permutations` | `f33` |
| `Math::Stats` | `arithmetic_mean` | `f35` |
| `Math::Stats::TimeSeries` | `exponential_moving_average` | `f35` |

---

# `v0.0.40`
 * track `Just-In-Time Compiler` feature through `locale RSpecs` (and eventually the `'Ruuuby Engine'`)
 * add first usage of Ruby `Refinements` w/ `using Math::NumberTheory::ℤ³` for func{`≡`} w/ Class{`Integer`}
 * move func{`gcd`} to `Math::NumberTheory::ℤ²`, core-implementation moved to `C-ext`
 * start adding content for `ORMs:` {`RuuubyDir`, `RuuubyFile`}
 * start preparing extension code for large scale refactorings to `ThetaAngle`; (also remove func{`to_a`}, no use-case identified)
 * switch `Ruuuby Engine Logging` to utilize the same loading & setup w/ `environment variables` as `ORM-Features` do
 * add/track `gem 'rubygems-update', '~> 3.1.4'`
   * update version from{`3.1.2`} to{`3.1.4`}

| context | method(s) added | feature(s) |
| --- | --- | --- |
| (c) `Symbol` | `as_source_ruby` | `f10` |
| (v) `ENV` | `parse_feature_behaviors`, `validate_feature_behavior_syntax!` | `f10` |
| (c) `RuuubyGem` | `fetch_by_type` | `f15` |
| (m) `Math::NumberTheory::ℤ²` | `fast_gcd` | `f32` |
| (m) `Math::NumberTheory::ℤ³` | `congruent?` | `f32` |
| (Refinement) `Integer` | `≡` | `f32` |

---

# `v0.0.39`
 * update to Ruby version{`2.7.1`} from{`2.7.0`}
 * update gem(`activerecord`) version from{`5.2.4.1`} to{`5.2.4.3`}
 * add `RSpec` sections: `integration` & `tech_debt`
 * add the following `Sequence` objs to `Math::NumberTheory::𝕎¹`: `seq_pronic`, `seq_square`, `seq_fibonacci`, `seq_lucas`, `seq_triangle`, `seq_hexagonal`
 * remove some non-ASCII characters in `.h` and `.c` files while testing between compilers `clang` & `gcc`
 * remove both (`f01`, `f02`), (`f10`) now covers these scenarios w/ feature-behaviors
 * fix typo for const{ANGLE_TAU}, it is now correctly referenced by{`𝞽`} and not{`τ`}
 * various edge-case bugs w/ `ThetaAngle` identified, some are fixed for this version

| path added | reference | notes | feature(s) |
| ---: | --- | --- | --- |
| `lib/ruuuby/math/expr/seq/arithmetic.rb` | `Math::Expr::ArithmeticSequence` | (`Ruby` version{`2.7.1`} just added `Enumerator::ArithmeticSequence` which will be looked at prior to further modifications & clean-up of these `Sequence` classes) | `f10` |
| `lib/ruuuby/math/expr/seq/geometric.rb` | `Math::Expr::GeometricSequence` |  | `f10` |
| `lib/ruuuby/math/expr/seq/recursive.rb` | `Math::Expr::RecursiveSequence` |  | `f10` |

| class | method(s) added | feature(s) |
| --- | --- | --- |
| `Math::NumberTheory` | `digit_sum`, `digital_root`, `additive_persistence`, `almost_perfect?`, `nᵗʰ_cototient`, `nᵗʰ_euler_totient`, `friendly?` | `f31` |
| `Math::Combinatorics` | `n_choose_k` | `f32` |

---

# `v0.0.38`
 * (`f98`) replace all usages of c-ext-func{`rb_eval_string`} and others that were significantly slowing down `startup/initial-load time`
 * (`f18`) moved to {`f98_b02`}, `f18` will now cover the math module `Space`
 * remove funcs{`class?`, `module?`, `singleton?`} from Class(`Object`); (functionality covered by `🧬`)
 * remove func{`𝔠`} from `Kernel` (and thus remove `functional-style` support from (`f05`))
 * track `git tags` w/ related `ORMs` & `APIs`; however, version automation tasks paused until `TDD` catches up for `DB` and/or some event/queue-based logic is added (ex: `RabbitMQ`)
 * apply various misc cleanups w/ others `wip`

| path added | reference | notes | feature(s) |
| ---: | --- | --- | --- |
| `lib/math/statistics/statistical_learning.rb` | `Math::Stats::StatisticalLearning` | not currently in use | `f30` |
| `lib/math/statistics/probability_theory.rb` | `Math::Stats::ProbabilityTheory` | not currently in use | `f30` |
| `lib/math/statistics/descriptive_statistics.rb` | `Math::Stats::DescriptiveStatistics` | not currently in use | `f30` |
| `lib/math/combinatorics/combinatorics.rb` | `Math::Stats` | not currently in use | `f30` |

| class | method(s) added | feature(s) |
| --- | --- | --- |
| `Math::Space::NucleotideSpace` | `∋ˢ?` | `f30` |
| `Ruuuby::MetaData::GitAPI` | `release_tags`, `branch_names`, `remote_release_current`, `remote_release_previous` | `f31` |
| `Math::NumberTheory` | `aliquot_sum`, `deficient?`, `deficiency`, `abundant?`, `abundance`, `abundancy_index`, `composite?` | `f32` |

---

# `v0.0.37`
 * have `ORM`: `RuuubyRelease` and `GitCommit` include `Comparable`; replacing redundant funcs{`>`, `<`} to the single func{`<=>`}
 * remove `♾️`, `¿` from all sources, textual parsing, code aliases, etc; (too redundant)
 * remove func{∞?} from Class(`String`)
 * add `ORM`{`RuuubyGem`}, some functionality was added; also removed runtime constants needed solely for unit-tests (these tests are now semi-generated w/ `ORM` data)
 * add `RSpec` section for `locale` (local configs); `(not final design)`
 * (`f22`) will now be designated for `GC` and the `GC::Profiler`, previous `f22` moved to {`f28_b12`}

| path added | reference | notes | feature(s) |
| ---: | --- | --- | --- |
| `lib/virtual/f06.rb` |  |  | `f06` |
| `app/models/ruuuby_gem.rb` | `RuuubyGem` |  | `f15` |
| `lib/virtual/f28.rb` |  |  | `f28` |
| `lib/math/complex_analysis/complex_analysis.rb` | `Math::ComplexAnalysis` | not currently in use | `f30` |
| `lib/math/trigonometry/trigonometry.rb` | `Math::Trigonometry` | not currently in use | `f30` |
| `lib/math/graph_theory/graph_theory.rb` | `Math::GraphTheory` | not currently in use | `f30` |
| `lib/math/geometry/geometry.rb` | `Math::Geometry` | not currently in use | `f30` |
| `lib/math/space/discrete/symbolic_numbers_space.rb` | `Math::Space::SymbolicNumbersSpace` | 𝕊 | `f30` |

| class | method(s) added | feature(s) |
| --- | --- | --- |
| `Object` | `ⓣ`, `Ⓣ` | `f06` |

---

# `v0.0.36`
 * remove func{`get_prime_factors`} from `Integer`, newly created module{`Math::NumberTheory`} now offers that functionality
 * local git-config settings are now enforced with newly created `💎.api_git`, version-automation refactorings started

| path added | reference | notes | feature(s) |
| ---: | --- | --- | --- |
| `lib/math/expression/equation.rb` | `Math::Expression::Equation` | not currently in use | `f10` |
| `lib/math/expression/sequence.rb` | `Math::Expression::Sequence` | not currently in use | `f10` |
| `lib/math/group_theory/circle_group.rb` | `Math::GroupTheory::CircleGroup` | not currently in use, aliased via(`𝕋`) | `f30` |
| `lib/ruuuby/ruuuby/git_api.rb` | `Ruuuby::MetaData::GitAPI` | `💎.api_git` (to fully replace existing `git` functionality found in `💎.api` and elsewhere) | `f31` |
| `lib/math/number_theory/number_theory.rb` | `Math::Ruuuby::NumberTheory` |  | `f32` |

| module | class-method(s) added | feature(s) |
| --- | --- | --- |
| `Math::NumberTheory::ℕ¹` | `get_prime_factors`, `get_divisors`, `get_proper_divisors`, `perfect_number?` | `f32` |
| `Math::NumberTheory::ℕ²` | `gcd`, `coprime?` | `f32` |

---

# `v0.0.35`
 * add `gem 'rugged', '~> 1.0.0'`
 * apply general clean-ups, next few versions to have similar target
 * (`f98`): remove many function calls and variables that didn't need to be executed or exist; start adding extra checks via{`mkmf`} which will halt/fail even before the compilations step
 * remove alias `🧬?`, `🧬` is now a 'global-alias' for the singleton{`NucleotideLikeSpace`}
 * remove alias `🅱️?`, `🛑🅱️❓`, etc; just `🅱` is now a 'global-alias' for the single{`BooleanLikeSpace`}
 * remove funcs{`stry?`, `countable?`} and{`🛑stry❓`, `🛑countable❓`}
 * remove `::Ruuuby::VirtualTypes` and it's file
 * remove funcs{`∃class?`, `∃module?`} from `Kernel`, functionality is now covered by singleton{`NucleotideLikeSpace`} which is aliased via{`🧬`}
 * remove various redundant emoji aliases as the added feature{`f97`}, will enable selected character sets without the clutter of unwanted characters and aliases
 * add more detail to various `ORM` features/funcs, documentation and TDD still intentionally not fully present for these
 * add class `DescriptiveStandardError`

| path added | reference | notes | feature(s) |
| ---: | --- | --- | --- |
| `lib/math/expression/expression.rb` |  | not currently in use | `f10` |
| `lib/math/expression/formula.rb` |  | not currently in use | `f10` |
| `lib/math/space/tuple_space.rb` |  |  | `f30` |
| `lib/math/space/types_space.rb` |  |  | `f30` |
| `lib/math/space/discrete/boolean-like_space.rb` | ``Math::Space::BooleanLikeSpace`` |  | `f30` |
| `lib/math/space/discrete/number-like_space.rb` | ``Math::Space::NumberLikeSpace`` |  | `f30` |
| `lib/math/space/discrete/nucleotide-like_space.rb` | ``Math::Space::NucleotideLikeSpace`` |  | `f30` |

| class | method(s) added | feature(s) |
| --- | --- | --- |
| `TrueClass`, `FalseClass` | `to_i`, `to_b` | `f06` |
| `Rational` | `μ?` | `f10` |
| `String` | `to_🐫⬇`, `to_🐍⬆` | `f24` |

# `v0.0.34`
 * increase precision of various funcs (ex: `sin²` and `cos²`), by performing calculations in `long double` instead of `double`
 * add `𝞽` as a 'global-const' which is a ThetaAngle representing a single complete turn
 * adjust parameter style of class-functions for `Math` to use named params
 * remove global-alias-funcs{`ℂ`, `ℚ`}; these now correspond to a specific singleton instance of the newly created class(`Math::SetTheory::NumberSet`)
 * (`f28`): add `super golden ratio` as `Ψ`, `silver ratio` as `δ`, `plastic ratio` as `ρ`, `omega constant` as `Ω`
 * remove various out-dated testing helper functions, meta-data generation/processing will eventually replace this
 * remove `Array::EMPTY_INSTANCE`, `∅` by itself now aliases a singleton of type{`NumberSet`}
 * (`f15`): create `ORM`{`RuuubyFeatureBehavior`} which is many to one{`RuuubyFeature`}
 * remove number-set membership check funcs from `Numerics` and create `singleton` instances of `NumberSet` which covers the previous functionality (just more scalable)
 * remove as much deprecated code as possible, file structure adjustments started
 * (`f98`): move `Float`'s method{`≈≈`} into `C-extensions`
 * remove funcs (and related ones): `🛑ℤ❓` and `🛑𝕌❓`, these checks are now covered by existing functions w/ new types of normalizers added for existing normalizer feature

| path added | reference | notes | feature(s) |
| ---: | --- | --- | --- |
| `lib/ruuuby/math/set_theory/closure.rb` | ``Math::SetTheory::Closure`` |  | `f11` |
| `lib/ruuuby/math/set_theory/number_set.rb` | ``Math::SetTheory::NumberSet`` |  | `f11` |
| `lib/ruuuby/math/set_theory/discrete/algebraic_numbers.rb` | ``Math::SetTheory::AlgebraicNumbers`` |  | `f11` |
| `lib/ruuuby/math/set_theory/discrete/boolean_numbers.rb` | ``Math::SetTheory::BooleanNumbers`` |  | `f11` |
| `lib/ruuuby/math/set_theory/discrete/complex_numbers.rb` | ``Math::SetTheory::ComplexNumbers`` |  | `f11` |
| `lib/ruuuby/math/set_theory/discrete/empty_set.rb` | ``Math::SetTheory::EmptySet`` |  | `f11` |
| `lib/ruuuby/math/set_theory/discrete/imaginary_numbers.rb` | ``Math::SetTheory::ImaginaryNumbers`` |  | `f11` |
| `lib/ruuuby/math/set_theory/discrete/integer_numbers.rb` | ``Math::SetTheory::IntegerNumbers`` |  | `f11` |
| `lib/ruuuby/math/set_theory/discrete/irrational_numbers.rb` | ``Math::SetTheory::IrrationalNumbers`` |  | `f11` |
| `lib/ruuuby/math/set_theory/discrete/natural_numbers.rb` | ``Math::SetTheory::NaturalNumbers`` |  | `f11` |
| `lib/ruuuby/math/set_theory/discrete/null_set.rb` | ``Math::SetTheory::NullSet`` |  | `f11` |
| `lib/ruuuby/math/set_theory/discrete/rational_numbers.rb` | ``Math::SetTheory::RationalNumbers`` |  | `f11` |
| `lib/ruuuby/math/set_theory/discrete/real_algebraic_numbers.rb` | ``Math::SetTheory::RealAlgebraicNumbers`` |  | `f11` |
| `lib/ruuuby/math/set_theory/discrete/real_numbers.rb` | ``Math::SetTheory::RealNumbers`` |  | `f11` |
| `lib/ruuuby/math/set_theory/discrete/universal_set.rb` | ``Math::SetTheory::UniversalSet`` |  | `f11` |
| `lib/ruuuby/math/set_theory/discrete/whole_numbers.rb` | ``Math::SetTheory::WholeNumbers`` |  | `f11` |
| `app/models/ruuuby_feature_behavior.rb` |  |  | `f15` |
| `ext/ruby_class_mods/c4_theta_angle.h` |  | for organization | `f27` |

| class | method(s) added | feature(s) |
| --- | --- | --- |
| `Object` | `set?`, `🛑set❓` | `f06` |
| `Integer` | `get_prime_factors` | `f17` |
| `ThetaAngle` | `normalize`, `windings` | `f28` |

---

# `v0.0.33`
 * (`f98`): create new Class(`ThetaAngle`) which is essentially a wrapper over a `C-struct`
 * modify global-funcs `sin`, `cos`, `tan`, etc to utilize the `ThetaAngle` class
 * add empty code file(`lib/ruuuby/class/method/math_function.rb`) for future versions
 * apply lots of misc clean-ups and/or adjustments
 * `v0.0.34` to resolve missing parts from `ThetaAngle` and clean-up relating funcs from `String`

| path added | reference | notes | feature(s) |
| ---: | --- | --- | --- |
| `lib/ruuuby/class/nums/theta_angle.rb` | `ThetaAngle` |  | `f27` |

| class / module | method(s) added | feature(s) |
| --- | --- | --- |
| `Object` | `θ?`, `🛑θ❓`, `enumerable?`, `🛑enumerable❓` | `f06` |
| `Math` | `pythagoras_τ³?`, `cot`, `csc`, `sec`, `sin²`, `cos²` | `f17` |
| `TOPLEVEL_BINDING` | `℮`, `logₑ`, `log₂`, `log₁₀`, `arcsin`, `arccos`, `arctan`, `cot`, `csc`, `sec`, `sin²`, `cos²` | `f17` |
| `TOPLEVEL_BINDING` | `⅓`, `⅕`, `⅕`,`⅖`,`⅗`,`⅘`,`⅙`,`⅐`, `⅛`, `⅜`, `⅝`, `⅞`, `⅑`, `⅒` | `f17` |
| `TOPLEVEL_BINDING` | `θ°`, `θʳ`, `θᵍ`, `θ𝞽` | `f27` |
| `ThetaAngle` | `real`, `repr`, `as_radian`, `as_degree`, `as_gon`, `as_turn`, `radians?`, `degrees?`, `gons?`, `turns?`, `-@`, `+@`, `coerce`, `~`, `!`, `+`, `-`, `*`, `%`,`==`, `/`, `<=>`, `angle?`, `normal?`, `normalize!`, `golden_with?`, `explementary_with?`, `supplementary_with?`, `complementary_with?`, | `f27` |

* remove the following methods/aliases:

| from       | methods/aliases removed |
| ---------- | ----------------------- |
| `Kernel`   | `∠ᶜ`, `∠°` |

---

# `v0.0.32`
 * (`f98`) add flags to the compilation and linker steps (`wip`); replace locations in `C-extensions` that were previously accessing pointers not intended to be used beyond its internal scope (internal to `Ruby`)
 * global-func(`φ`) removed, reference replaced with(`𝚽`), a `Kernel` constant; also add the golden-angle constant(`Ⴔ`)
 * start utilizing more generic math notation where possible, ex-func(`∀τ²∈λ𝑓₍ᵢ،ᵢ₊₁₎`), very useful as this automatically applies (for example) to both regular objects like `Array` and also `ORM` objects like `RuuubyRelease` while still applicable to both
 * `v0.0.33` to utilize `golden-angle` as well as dramatically alter angle-trig related functions

| path added | reference | notes | feature(s) |
| ---: | --- | --- | --- |
| `lib/ruuuby/module/attribute/includable/singleton.rb` | `Ruuuby::Attribute::Includable::RuuubySingleton` |  | `f10` |
| `lib/ruuuby/module/attribute/extendable/singleton.rb` | `Ruuuby::Attribute::Extendable::RuuubySingleton` |  | `f10` |
| `lib/ruuuby/class/proc.rb` | ``Proc`` |  | `f10` |

| class | method(s) added | feature(s) |
| --- | --- | --- |
| `Enumerable` | `∀τ²∈λ𝑓₍ᵢ،ᵢ₊₁₎` | `f11` |

---

# `v0.0.31`
 * remove constants needed previous for supporting exponential operations from m(`Numeric`), needed values are now dynamically generated by `C-extensions` instead of relying on pre-existing constants (created specifically for just this purpose)
 * (`f98`): lots of misc edits/clean-ups in `C-extensions`
 * remove various un-used or now deprecated Modules such as `Ruuuby::MetaData::Vocabulary` (was a temporary location for `normalizers`)
 * engine/configs cleaned up and support started for multi-flag ENV_VARs
 * automation for `db/seeds/git_commits.rb` updated to better handle scenario where release had multiple commits, still lots of TODOs and missing `TDD` to be added
 * various modifications & additions to existing `ORM` Classes for general stability/reliability
 * flipped functionality of String's funcs `to_iso8601` and `as_iso8601` to closer match `Ruby style`

| path added | reference | notes | feature(s) |
| ---: | --- | --- | --- |
| `lib/ruuuby/virtual/env` | ``ENV`` | note: `class << ENV` | `f10` |
| `db/seeds/ruuuby_releases/future_ruuuby_releases.rb` |  | not currently used | `f15` |

| class | method(s) added | feature(s) |
| --- | --- | --- |
| `String` | `as_utf8` | `f08` |
| TOPLEVEL_BINDING | `¼`, `½`, `¾`, `🌽` | `f10` |
| `File` | `insert_lines_before_expr` | `f12` |
| `GitCommit` | `get_latest`, `query_get_newest_within_version` | `f15` |
| `RuuubyRelease` | `on_before_save` | `f15` |

| (c)lass or (m)odule | methods/aliases *removed* |
| ------------------- | --------------------- |
| (c) `Symbol`   | `power?`, `pow_to_i` |

---

# `v0.0.30`
 * add normalizers to `sym?`
 * continued ORM cleanups started in `v0.0.29`
 * add `f26` as continued step in enabling textual parsing for more useful code-file automations

| path added | reference | notes | feature(s) |
| ---: | --- | --- | --- |
| `app/model_attributes/extendable/uid.rb` | | | `f15` |
| `app/model_attributes/includable/uid.rb` | | | `f15` |

| (c)lass or (m)odule | method(s) added | feature(s) | notes |
| --- | --- | --- | --- |
| (c) `Object` | `singleton?` | `f06` | |
| (c) `Object` | `🅱?`, `🛑🅱❓`, `🧬?` | `f10` | |
| (m) `Module` | `get_all_defined_modules`, `get_all_defined_classes` | `f10` | |
| (c) `String` | `iso8601?`, `to_iso8601`, `as_iso8601` | `f26` | |

---

# `v0.0.29`
 * misc cleanup for `ORM`, example: remove un-needed m(`ApplicationRecord::ORMAttributeCache`)
 * general cleanup for `QA`/`RSpecs`, especially w/ file loading order
 * add initial start of `ORM` schemas `RuuubyFiles` and `RuuubyDirs`
 * general functionality increases for `Ruuuby` `MetaData`, add global func `💎` for quicker reference
 * add logger with output in directory{`tmp`}, file{`ruuuby.log`}

| path added | reference | notes | feature(s) |
| ---: | --- | --- | --- |
| `lib/ruuuby/ruuuby/engine/ruuuby_engine.rb` | `Ruuuby::MetaData::RuuubyEngine` | alias{`💎.engine`} | `f15` |
| `lib/ruuuby/ruuuby/engine/ruuuby_logging.rb` | `Ruuuby::MetaData::RuuubyEngine.instance.logger` | alias{`💎.engine.logger`} | `f15` |
| `lib/ruuuby/ruuuby/metadata/ruuuby_metadata_constants.rb` | ``Ruuuby::MetaData`` |  | `f15` |
| `app/models/ruuuby_dir` | ``RuuubyDir`` | directory operations specifically for `ORM` related context/use-cases | `f15` |
| `app/models/ruuuby_file` | ``RuuubyFile`` | file operations specifically for `ORM` related context/use-cases | `f15` |

| (c)lass or (m)odule | method(s) added | feature(s) | notes |
| --- | --- | --- | --- |
| (c) `Array` | `∅` | `f05` | starting point of adding similar immutable references like `nil` but for (assumable to be immutable) objects that are `∅` |
| (c) `Object` | `🛑sym❓` | `f07` | |
| (m) `Ruuuby::MetaData` | `orm`, `orm_meta`, `paths`, `engine` | `f10` | shortcuts to either modules or singleton-instanced objects |
| (m) `Ruuuby::MetaData` | `info`, `debug` | `f10` | shortcuts for logging statements |
| TOPLEVEL_BINDING | `ℂ`, `ℚ` | `f11` | alias to `Complex`<br/>alias to `Rational` |
| (m) `Kernel` | `💎` | `f11` | alias to `Ruuuby::MetaData` | |
| (c) `File` | `insert_line_before_expr` | `f13` | |

---

# `v0.0.28`
 * (`f15`): updating contents of `db/seeds/git_commits.rb` is now automated (starting point, LOTs of TODOs to guard against any edge case scenarios and future functionality requirements)
 * (`f06`, `f98`): move funcs `class?`, `module?`, `nucleotide?` into `C-extensions` (also add `char?`)
 * add `f24` as continued step in enabling textual parsing for more useful code-file automations
 * (`f98`): add normalizers to funcs `int?` and `str?`, allows (mainly-visual) clean-up for `Ruuuby` funcs `🛑str❓` and `🛑int❓`
 * add types to `Ruuuby::VirtualTypes`
 * rename c(`String`)'s func{♻️until!} to {remove_until}, add alias(`♻️⟶`); also add reverse direction w/ func{`♻️⟵`}

| path added | reference | notes | feature(s) |
| ---: | --- | --- | --- |
| `lib/ruuuby/ruuuby/ruuuby_orm.rb` | `Ruuuby::MetaData::RuuubyORM` |  | `f15` |
| `lib/ruuuby/ruuuby/routine_cli.rb` | `Ruuuby::Routine::CommandCLI` |  | `f15` |

| path removed | notes |
| ---: | --- |
| `app/models/db_schema.rb` | seemed like a bad location |
| `conditionals/ide_helper.rb` | moved to `lib/ruuuby/ide_helper.rb`, gets excluded by `ruuuby.gemspec` |

| class | method(s) added | feature(s) |
| --- | --- | --- |
| `String` | `char?`,  | `f06` |
| `String` | `♻️⟵`, `♻️⟶∞` <br/> [`upcase?`, `⬆️?`, `⬆?`, `🔠?`] <br/> [`downcase?`, `⬇️?`, `⬇?`, `🔡?`] | `f08` |
| `String` | `🐫?`, [`🐫⬇️?`, `🐫⬇?`, `🐫🔡?`], `to_🐫` <br/> `🐍?`, [`🐍⬆️?`, `🐍⬆?`, `🐍🔠?`], `to_🐍` | `f23` |

---

# `v0.0.27`
 * contents in `db/seed.rb` split across files in newly created dir: `db/seeds/`; also add new `ORM: GitCommit`, (one `RuuubyRelease` to many `GitCommits`)
 * performing update of version number for `README.md` and `lib/ruuuby/version.rb` is now automated
 * (`f98`): m{`Module`}'s func{`⨍_add_aliases`} converted to alias the func{`f_add_aliases`} created from `C-extensions`

| gem added | version |
| ---: | :---- |
| `schema_plus_foreign_keys` | `0.1.8` |


| path added | reference | notes | feature(s) |
| ---: | --- | --- | --- |
| `db/seeds/git_commits.rb` |  |  | `f15` |
| `db/seeds/ruuuby_features.rb` |  |  | `f15` |
| `db/seeds/ruuuby_releases.rb` |  |  | `f15` |
| `app/models/git_commit.rb` | `::GitCommit` |  | `f15` |
| `lib/ruuuby/ruuuby/ruuuby_api.rb` | `::Ruuuby::RuuubyAPI` |  | `f15` |
| `lib/ruuuby/ruuuby/routine.rb` |  | `example usage: Routine::CMD.new` | `f15` |

| class | method(s) added | feature(s) |
| --- | --- | --- |
| `File` | `dirname⁴` | `f12` |

---

# `v0.0.26`
 * cleanup creation of function aliases (remove redundant declarations, move needed ones into `ide_helper`, and use new func{`⨍_add_aliases`} where possible)
 * `DRY`: attribute-module(`Cardinality`) now auto-assigns the alias `𝔠`
 * reduce number of locations requiring manual edits/checks when releasing version updates
 * add normalizer_option(`:ℕ`) to func(🛑int❓)
 * add `RSpec` section `db`, clean-up various locations where `db/seed` was loaded before

| added path | reference | notes | feature(s) |
| ---: | --- | --- | --- |
| `lib/ruuuby/module/attribute/includable/notation_set_mathematics.rb` | `Ruuuby::Attribute::Includable::Notation::SetMathematics` |  | `f09` |
| `lib/ruuuby/ruuuby/ruuuby_metadata.rb` | `Ruuuby::MetaData` | design pending | |

| class | method(s) added | feature(s) |
| --- | --- | --- |
| `Module` | `⨍_add_aliases` | `f10` |
| `File` | `replace_expr_with`, `replace_expr_with!` | `f12` |
| `RuuubyRelease` | `<`, `>`, `get_next_version_uid`, `get_latest_version_uid` | `f15` |

| class | alias(es) added | feature(s) |
| --- | --- | --- |
| `Object` | (freeze) `❄`, `❄?` | `f10` |

| path removed | notes |
| ---: | --- |
| `conditionals/ruuuby_configs.rb` | configs not needed during runtime should be dynamically handled, not with conditionally loaded files (created explicitly for such need) |

---

# `v0.0.25`
 * start dividing (`f98`)/`C-code` across multiple header files, lots of small misc changes (ex: moved various constants definitions from `Ruuuby's` `Float`)
 * re-structure `Feature` <---> `Module` mapping, add `audit` tests to verify pattern is present/consistent
 * move certain funcs out of `Kernel` and directly add them to `TOPLEVEL_BINDING` to avoid polluting other classes
 * (`f00`) start formalization of existing funcs w/ name(`η̂`, `normalize`) and/or when `normalization` is applied to `args` (any context)
 * symbolic-math support being added only for niche use-cases, `automatic-differentiation` features to take priority in case of any feature-conflicts

| added path | reference | notes | feature(s) |
| ---: | --- | --- | --- |
| `lib/ruuuby/global_funcs.rb` |  |  | `f15` |
| `ext/ruby/class_mods/c0_constants.h` |  |  | `f98` |
| `ext/ruby/class_mods/c1_typed_checks.h` |  |  | `f98` |
| `ext/ruby/class_mods/c2_extension_memory.h` |  |  | `f98` |
| `ext/ruby/class_mods/c3_macro_utilities.h` |  |  | `f98` |

| class | method(s) added | feature(s) |
| --- | --- | --- |
| `String` | `♻️until!` | `f08` |
| `TOPLEVEL_BINDING` | `tan`, `tan°` | `f17` |
| `String` | `to_radian` | `f17` |

| class | alias(es) added | feature(s) |
| --- | --- | --- |
| `Array` | (remove_empty!): `♻️∅!` | `f10` |
| `Set` | (remove_empty!): `♻️∅!` | `f10` |
| `String` | (reverse): `↩️`, `↩️!`, `↩`, `↩!` | `f10` |
| `Array` | (reverse): `↩`, `↩!`, `↩∀` | `f10` |

---

# `v0.0.24`
 * ensure `Ruby` data created from `C-extensions` gets guarded against `garbage-collection`
 * start utilizing configs for `Ruuuby`, especially for debugging information

| added path | reference | notes | feature(s) |
| ---: | --- | --- | --- |
| `lib/ruuuby/configs.rb` |  |  | `f23` |

---

# `v0.0.23`
 * (starting-point) add support for representing `Complex Infinity`; (for now) via Symbol(`∞ℂ`)
 * add Feature(`f03`) and Attribute(`SubscriptIndexing`) to Class(`Symbol`)
 * add missing tests and fix bugs (missing scenario coverage) for c(`Object`)'s funcs `🛑ℤ❓` and `🛑𝕌❓`
 * `power-operations` given support for working with 'custom' `infinitity values`, Class(`Rational`) given support for `superscript-power-operations`
 * various consts defined into c(`Float`) but to soon be moved into (`f98`)
 
| class | method(s) added | feature(s) |
| --- | --- | --- |
| `Kernel` | `¿`, `∞`, `∞ℂ` | `f10`, `f17` |
| `Integer` | `¿?`, `nan?`, `∞ℂ?` | `f17` |
| `Float` | `¿?`, `∞ℂ?` | `f17` |
| `Symbol` | `power?`, `pow_to_i` | `f16` |
| `Rational` | `^` | `f16` |

---

# `v0.0.22`
 * continued (minor) improvements to catching bad parameters & throwing needed errors
 * (`f98`) add func(`err_to_num`) to class(`String`) as a utility function for throwing errors
 * start organizing groups of functions into modules labeled by their `Feature` or `Attribute` (`includable` or `extendable`)
 * tech debt accumulation to be dealt with by `v0.1.0` to remove all `🍝 code` prior to adding support to `automatic differentiation`

| added path | reference | notes | feature(s) |
| ---: | --- | --- | --- |
| `lib/ruuuby/class/sym.rb` | `Symbol` |  | `f10` |
| `lib/ruuuby/module/attribute/includable/cardinality.rb` | `Ruuuby::Attribute::Includable::Cardinality` |  | `f04` |
| `lib/ruuuby/module/attribute/includable/subscript_indexing.rb` | `Ruuuby::Attribute::Includable::SubscriptIndexing` |  | `f10` |
| `lib/ruuuby/module/attribute/includable/syntax_cache.rb` | `Ruuuby::Attribute::Includable::SyntaxCache` |  | `f10` |
| `lib/ruuuby/module/attribute/extendable/syntax_cache.rb` | `Ruuuby::Attribute::Extendable::SyntaxCache` |  | `f10` |

| class | method(s) added | feature(s) |
| --- | --- | --- |
| `Object` | `🛑𝕌❓` | `f06` |
| `Array` | `η̂!` | `f08` |
| `Symbol` | (downcase, upcase) `⬇️`, `⬇`, `🔡`, `⬆️`, `⬆`, `🔠` | `f10` |
| `String` | (downcase, upcase) `⬇️`, `⬇`, `🔡`, `⬆️`, `⬆`, `🔠`, `⬇️!`, `⬇!`, `🔡!`, `⬆️!`, `⬆!`, `🔠!` | `f10` |
| `Enumerable` | `∀ₓᵢ` (each_with_index) | `f10` |
| `Object` | `define_singleton_⨍` (define_singleton_function) | `f10` |
| `Kernel` | `🌽_previous_⨍` | `f10` |
| `String` | `digit?`, `to_num`, `to_num?` | `f21` |

---

# `v0.0.21`
 * add const `NUCLEOTIDES` to `Ruuuby::VirtualTypes`
 * add missing scenarios & tests for `spec/helpers/static_test_data.rb`
 * rename m(`Module`)'s func(`∃func?`) to(`∃⨍?`)
 * rename m(`Module`)'s func(`∃func_alias?`) to(`∃⨍_alias?`)
 * (`f98`) add `global-constant`(`$PRM_MANY`), param-type checking functions expanded for multi-param check use-cases
 * add modules `ORMAttributeUID` and `ORMAttributeCache` to `ApplicationRecord` as well as module(`Syntax`), which each `ORM Class` will also define

| added path | reference | notes | feature(s) |
| ---: | --- | --- | --- |
| `bin/console_db` |  | same as `/bin/console` but also pre-loads `db/seed.rb` |  |
| `lib/ruuuby/class/re.rb` | `Regexp` |  | `f20` |
| `app/models/db_schema.rb` | `RuuubyDBSchema` | `temporary design` | `f15` |
| `lib/ruuuby/module/attribute_extendable/static_attribute_syntax_cache` | `Ruuuby::StaticAttributeSyntaxCache` | | |

| class | method(s) added | feature(s) |
| --- | --- | --- |
| `Object` | `class?`, `module?`, `nucleotide?` | `f06` |
| `Module` | `∋?`, `∌?`, `∈?`, `∉?` | `f09` |
| `Object` | `🛑ℤ❓` | `f14` |

---

# `v0.0.20`
 * (`f98`) add consts `RATIO_DEGREES_TO_RADIAN` and `RATIO_RADIANS_TO_DEGREE` into module `Math`
 * power-operations for `Integer` and `Float` given support for raising from `-1` to `-9` via superscripts(`⁻¹` to `⁻⁹`)

| added path | reference | notes | feature(s) |
| ---: | --- | --- | --- |
| `lib/ruuuby/module/math.rb` | ``Math`` |  | `f17` |
| `help/math/automatic_differentiation.rb` |  | `Ruuuby's` current main focus to add functionality support to | `f19` |

| class | method(s) added | feature(s) |
| --- | --- | --- |
| `Object` | `🛑flt❓` | `f06` |
| `Float` | `≈≈` | `f17` |
| `Kernel` | `sin` | `f17` |
| `Kernel` | `sin°` | `f17` |
| `Kernel` | `cos` | `f17` |
| `Kernel` | `cos°` | `f17` |
| `Kernel` | `∠ᶜ` | `f17` |
| `Kernel` | `∠°` | `f17` |

---

# `v0.0.19`
 * add some data-type/db-validation for `ORM`, still lots of TODOs here
 * purge `ruuuby/version.rb` of all content except `constant String`: `VERSION` (as `ORM` functionality will cover prior needed use-cases)
 * add missing test cases for power-operations and `Object's` funcs(`flt?`, `num?`)
 * power-operations for `Float` moved into `ruby_class_mods.c`
 * general improvements for performance-testing and `RSpec` structuring
 * `ruby_class_mods.c` to start using `non-ascii` based `#define` statements
 * start adding code for negative-exponents
 
| class | method(s) added | feature(s) |
| --- | --- | --- |
| `File`, `Dir` | `∅?` | `f04` |
| `ApplicationRecord` | `♻️`, `♻️!` | `f10` |
| `Kernel` | `🎲`, `∛`, `π`, `φ`, `γ` | `f10` |
| `Object` | `⁻¹`, `⁻²`, `⁻³`, `⁻⁴`, `⁻⁵`, `⁻⁶`, `⁻⁷`, `⁻⁸`, `⁻⁹` | `f16` |
| `Dir` | `normalized_paths` | `f12` |

---

# `v0.0.18`
 * renaming existing func(`🛑str_or_ary❓`) to(`🛑countable❓`); it now checks for `Set` as well
 * add `gem 'sqlite3', '~> 1.4.2'`
 * add `gem 'activerecord', '~> 5.2.4.1'`
 * start process of tracking language changes across versions into `ORM`/`db`
   * start process of auto-generating documentation from these objects

| added path | reference | notes | feature(s) |
| ---: | --- | --- | --- |
| `lib/ruuuby/class/io/file.rb` | `File` |  | `f12` |
| `lib/ruuuby/class/io/dir.rb` | `Dir` |  | `f12` |
| `lib/ruuuby/types.rb` | `Ruuuby::VirtualTypes` | adds (module-scoped) constants `🅱️`, `STRY`, `NUMS`, `COUNTABLES`  | `f06` |
| `app/models/application_record.rb` | `ApplicationRecord` |  | `f15` |
| `app/models/ruuuby_changelog.rb` | `RuuubyChangelog` |  | `f15` |
| `app/models/ruuuby_feature.rb` | `RuuubyFeature` |  | `f15` |
| `app/models/ruuuby_release.rb` | `RuuubyRelease` |  | `f15` |
| `lib/ruuuby/class/method.rb` | `Method`` |  |  |
| `conditionals/ide_helper.rb` |  | received all duplicated aliases (for playing nice with IDEs, happens from funcs created in `C-extension`)  |  |
| `db/db.rb` |  |  | `f15` |
| `db/seed.rb` |  |  | `f15` |

| class(es) | method(s) added | feature(s) |
| --- | --- | --- |
| `File`, `Dir` | `∃?` | `f12` |
| `File` | `dirname²`, `dirname³` | `f12` |
| `Kernel` | `📁` (`File`), `📂` (`File`), `🗄️` (`Dir`) | `f12` |
| `Object` | `flt?`, `num?` | `f06` |
| `Integer`, `Numeric` | `♾️?` (infinite?) | `f11` |
| `Method` | `🏠` (`source_location`) | `f10` |

---

# `0.0.17`

#### Abstract
 * (`f15`): start general, wide-scale, re-structuring to manage changes into categorized `features`

#### Discrete
 * continued audit on number classes (see notes from v`0.0.15-16`)
 * for math related `RSpecs`, move common/shared `let` definitions into `spec_helper.rb`, add additional ones to form a general schema for testing data
 
#### Methods & Aliases:
 | (c)lass or (m)odule                  | methods/aliases added | feature |
 | ------------------------------------ | --------------------- | ------- |
 | (m) `Kernel`                         | `𝔠`                   | `f03` |
 | (c) `String`, `Set`, `Array`, `Hash` | `𝔠` (length)          | `f03` |
 | (c) `Class`                          | `🆕` (new)            | `f10` |
 | (c) `Object`                         | `⁰`, `¹`, `²`, `³`, `⁴`, `⁵`, `⁶`, `⁷`, `⁸`, `⁹` | `f16` |
 | (c) `Object` | `🛡️funcs` (protected_methods), `🙈funcs` (private_methods) | [`f01`, `f02`] |
 | (m) `Module` | `🛡️` (protected), `∃🛡️func?` (protected_method_defined?), `🛡️instance_funcs` (protected_instance_methods), `🙈instance_funcs` (private_instance_methods), `🙈class_func` (private_class_method) | [`f01`, `f02`] |
 | (c) `Integer`                        | `^`, `preserved_reference_to_bitwise_or` | `f16` |
 | (c) `Float`                          | `^` | `f16` |

#### Files Added:
 * `ruuuby/class/class.rb`

---

# `v0.0.16`
 * modify various functions to not allocate un-necessary memory (ex: call `.reverse_each` instead of `reverse.each`)
 * continued audit on number classes (see notes from v`0.0.15`), add domain checks for `𝕌?`, `𝔹?`
 * add first multi-step audit test against project file structure (will require better solution, just a starting point)
 * add/move the following methods/aliases:

 | (c)lass or (m)odule                  | methods/aliases added/moved                               | feature |
 | ------------------------------------ | --------------------------------------------------------- | ------- |
 | (c) `Array`                          | `equal_contents?` (`≈≈` now aliases it)                   |
 | (c) `Array`                          | `frequency_counts` (`📊` now aliases it)                  |
 | (c) `Array`                          | `disjunctive_union` (`⊕` now aliases it)                  |
 | (c) `Array`                          | `↩️` (reverse), `↩️!` (reverse!), `↩️∀` (reverse_each)   |
 | (c) `Object`                         | `🅱️?` (alias to `bool?`), `🛑🅱️❓`                       |
 | (c) `Integer`                        | `∞?`, `𝕌?`                                                |
 | (c) `Float`, `Complex`, `BigDecimal` | `𝕌?`                                                      |
 | (c) `Numeric`                        | `𝕌?`, `𝔹?`                                                |
 | (c) `Hash`                           | `🗝?`, `∃🗝?` (both alias `key?`, same as `🔑?`, `∃🔑?`) |

---

# `v0.0.15`
 * add directory `ruuuby/class/enumerable`, move `ary.rb`, `hsh.rb` and newly created `set.rb` into it
 * add files: `ruuuby/module/enumerable.rb` and `ruuuby/class/nums/numeric.rb`
 * move various existing functions/aliases from sub-classes into common parent modules and/or classes where possible, ex: `∌?` out of `Array` and into `enumerable` to share common features w/ others like `Set`
 * move certain module/class initial definition/creation into `ruby_class_mods.c`
 * for number classes (ex: `Integer`), fix various logical/performance/test-coverage flaws for funcs like `ℕ?`

 | (c)lass or (m)odule | methods/aliases added/moved                      | feature |
 | ------------------- | ------------------------------------------------ | ------- |
 | (c) `Array`         | `start_with?`, `ensure_start!`                   | `f08`   |
 | (c) `Set`           | `remove_empty!`, `∅?` (empty?), `∀` (each), `∋?` | `f09`   |
 | (m) `Enumerable`    | `∌?`, `⨍` (map)                                  | `f09`   |
 | (c) `Numeric`       | `∞?` (infinite?)                                  | `f10`   |
 | (c) `Integer`       | `finite?`, `infinite?`                             | `f11`   |

---

# `v0.0.14`
 * add gem `'tty-command', '~> 0.9.0'` to group `runtime`
 * for use by `audit RSpecs`: start various means of tracking internal versions, configs, etc; will help form dynamically generated audits and reports
 * temporarily remove `.travis.yml` (auto-generated at project creation but would be useful to utilize)

| feature | change |
| ------- | ------ |
| `f14`   | adjust naming on param check functions (in `Ruuuby::ParamErr`), ex: `🛑❓bool` change to `🛑bool❓` |

---

# `v0.0.13`
 * move utility functionality from `spec_helper.rb` and others into newly created Directory: `spec/helpers/`
 * remove param:`use_partial_fill_in` from `String`'s funcs `ensure_start!` and `ensure_ending!`
 * heavily adjust usage/style for throwing param errors via `Ruuuby::Err` now(`Ruuuby::ParamErr`)
 * add new type of RSpec: `audit`
 
 | (c)lass or (m)odule      | methods/aliases added | feature |
 | ------------------------ | --------------------- | ------- |
 | (c) `Hash`               | `∀` (each), `∅?` (empty) | `f09`, `f04` |
 | (m) `Kernel`             | `🛑` (raise), `√` (Math.sqrt) | `f14`, `f10` |
 | (m) `Module`             | `∃func?` (func created and alias removed), `∃🙈func?` (private_method_defined?) | `f13` |
 | (c) `NilClass`, `String` | `∅?` (empty) | `f04` |
 | (c) `Array`              | `ensure_ending!`, `end_with?`, `∅?` (empty), `uniq_to_me` (∖) | `f09`, `f04` |
 | (c) `Object`             | `🛑❓bool`, `🛑❓int`, `🛑❓ary`, `🛑❓str`, `🛑❓stry`, `🛑❓str_or_ary` | `f14` |

* remove the following methods/aliases:

| (c)lass or (m)odule | methods/aliases removed |
| ------------------- | --------------------- |
| (m) `Ruuuby::Err`   | `param¬bool`, `param¬str`, `param¬stry`, `param¬ary`, `param¬module`, `param¬class` |

---

# `v0.0.12`
 * organize `ruuuby/version.rb` into major, minor, & tiny versions
 * add string generating macros for `rb_require` in `ruby_class_mods.c`
 * remove certain helper funcs from `spec_helper.rb` as core language adds similar wrappers
 * add organization and new information to `help/ruuuby.md`
 * add files: `ruuuby/module/kernel.rb`, `ruuuby/module/module.rb`, and `ruuuby/arg_err.rb`
 
 | (c)lass or (m)odule | methods/aliases added | feature |
 | ------------------- | --------------------- | ------- |
 | (m) `Module`        | `🙈`, `🙈constants⟶`, `∃const?`, `∃func?`, `∃func_alias?` | `f13` |
 | (m) `Kernel`        | `∃module?`, `∃class?` | `f13`   |
 | (m) `Ruuuby::Err`   | `param¬bool`, `param¬str`, `param¬stry`, `param¬ary`, `param¬module`, `param¬class` | `f14` |
 | (c) `Ruuuby::Err::WrongParamType` | `generate_error_text`, `throw` | `f14` |
 | (c) `Object`        | `stry?`               | `f06`   |

---

# `v0.0.11`
 * add more organization to `extconf.rb`
 * add `bin/audit_quick` for faster iterative development
 * add missing section in performance testing tiers and general cleanup to some RSpec structure
 * move/add the following to `ruby_class_mods.c`
   * move `Array`'s added method `>>`
   * move `String`'s added method `>>`
   * add private method `disjunctive_union` to `Array` for use in method`⊕`
 
 | (c)lass or (m)odule | methods/aliases added | feature |
 | ------------------- | --------------------- | ------- |
 | (c) `Hash`          | `🔑?`, `∃🔑?`         | `f10`   |
 | (c) `Array`         | `∀`, `📊`, `≈`        | `f09`   |
 | (m) `Ruuuby`        | `∃module?`, `∃class?` | `f13`   |

---

# `v0.0.10`
 * move various `require` statements from `ruuuby.rb` to `ruby_class_mods.c`
 * remove all `Ruuuby::Enum`'s and relating references
 * add/update minor details to `README.md`
 * add `help/jruby.md` to document jruby extensions gotchas along the way
 * add initial `Dockerfile` and `docker-compose.yml`
 
 | class        | methods added                | feature |
 | -----------  | ---------------------------- | ------- |
 | `Integer`    | `ℕ?`, `ℤ?`, `ℚ?`, `ℂ?`, `ℝ?` | `f11`   |
 | `Float`      | `ℕ?`, `ℤ?`, `ℚ?`, `ℂ?`, `ℝ?` | `f11`   |
 | `BigDecimal` | `ℕ?`, `ℤ?`, `ℚ?`, `ℂ?`, `ℝ?` | `f11`   |
 | `Complex`    | `ℕ?`, `ℤ?`, `ℚ?`, `ℂ?`, `ℝ?` | `f11`   |
 | `Rational`   | `ℕ?`, `ℤ?`, `ℚ?`, `ℂ?`, `ℝ?` | `f11`   |

---

# `v0.0.9`
 * add example usage in `README.md`
 * add various aliases and functions for additional set math operations
 
 | class    | method(s)/alias(es) added | feature |
 | -------  | ------------------------- | ------- |
 | `Array`  | `∌?`, `∋?`                | `f09`   |
 | `String` | `∌?`, `∋?`, `∈?`, `∉?`    | `f09`   |
 
---

# `v0.0.8`
 * mark various files with `UTF-8` encoding: `# -*- encoding : utf-8 -*-`
 * add `help` directory to contain troubleshooting documentation
 * for now, remove `gem`: `simplecov` and temporarily stop tracking LOCs coverage until JRuby extensions are added in
 * extend usage of pre-processing for C files
 * increase scope of performance RSpecs, light adjustments to remaining RSpecs for clarity & future scope
 * add various aliases to existing Ruby functions/fields/constants/etc
 
| class           | base reference                          | alias         | feature |
| --------------- | --------------------------------------- | ------------- | ------- |
| `Object`        | method: `object_id`                     | `🆔`          | `f10`   |
| `Object`        | method: `freeze`                        | `❄️`          | `f10`   |
| `Object`        | method: `frozen?`                       | `❄️?`         | `f10`   |
| `Array`         | method: `∑`                             | `each`        | `f10`   |
| `Array`         | method: `⨍`                             | `map`         | `f10`   |

 * added the following methods:
 
 | class    | method added     | feature |
 | -------  | ---------------- | ------- |
 | `Array`  | `>>`             | `f05`   |
 | `Array`  | `⊕`              | `f09`   |
 | `Array`  | `∖`              | `f09`   |

 * add/replace various Ruby functions with native C-extensions (`ruuuby/ext/ruby_class_mods/ruby_class_mods.c`):
 
 | modified class   | funcs added/replaced  | feature |
 | --------------- | --------------------- | ------- |
 | `Object`        | `hsh?`                | `f06`   |
 | `Array`         | `remove_empty!`       | `f07`   |

---

# `v0.0.7`
 * add gem `'rake-compiler', '~> 1.1.0'` to group `development`
 * adjust `bin/audit`, `ruuuby.gemspec`, `Rakefile`, etc to support native C-extensions
 * added section `project layout` and update formatting to `README.md`
 * replace various Ruby functions with native C-extensions (`ruuuby/ext/ruby_class_mods/ruby_class_mods.c`):
 
 | modified class   | funcs replaced                          | feature |
 | --------------- | --------------------------------------- | ------- |
 | `Object`        | `ary?`, `bool?`, `int?`, `str?`, `sym?` | `f06`   |
 | `NilClass`      | `empty?`                                | `f04`   |

---

# `v0.0.6`
 * add {`Ruuuby::Enum::Text`}
 * minor changes/functions-added to DRY some code
 * add `Gemfile.lock` to `.gitignore`
 
 | class    | method added     | feature |
 | -------  | ---------------- | ------- |
 | `Object` | `sym?`           | `f06`   |
 | `String` | `>>`             | `f05`   |
 | `String` | `ensure_start!`  | `f08`   |
 | `String` | `ensure_ending!` | `f08`   |

---

# `v0.0.5`
 * for time being, remove ruby `v2.7` requirement
 * `freeze` various constants and modules
 * slightly clean-up (with helper functions) and expand RSpec scenario coverage
 
 | class    | method added | feature |
 | -------- | ------------ | ------- |
 | `Object` | `str?`       | `f06`   |

---

# `v0.0.4`
 * add gem `'rspec-benchmark', '~> 0.5.1'`
 * remove file `.rpsec`, add rspec configurations through code
 * add performance tests along with a few missed ones
 * update `ruuuby.gemspec` to require ruby `2.7.0`
 * split testing into the following groups:
 
| category            | command                              |
| ------------------- | ------------------------------------ |
| all but performance | `bundle exec rake rspec`             |
| only performance    | `bundle exec rake rspec_performance` |
| all tests           | `bundle exec rake rspec_all`         |

---

# `v0.0.3`
 * modify `Ruuuby::Enum::Emoji` from `Strings` to `Symbols`
 * fix gemspec to reflect correct git URLs

| added path | reference | notes | feature(s) |
| ---: | --- | --- | --- |
| `lib/class/ary.rb` | ``Array`` |  | `f07`, `f06` |
| `lib/class/int.rb` | ``Integer`` |  | `f06` |

| class | method(s) added | feature(s) |
| --- | --- | --- |
| `Object` | `int?` | `f06` |
| `Object` | `ary?` | `f06` |
| `Array` | `remove_empty!` | `f07` |

---

# `v0.0.2`
| class | method(s) added | feature(s) |
| --- | --- | --- |
| `Object` | `bool?` | `f06` |

---

# `v0.0.1`

| added path | reference | notes | feature(s) |
| ---: | --- | --- | --- |
| `CHANGELOG.md` |  |  |  |
| `lib/ruuuby/class/nil.rb` | `NilClass` |  | `f04` |
| `lib/ruuuby/enum/emoji.rb` |  | `Ruuuby::Enum::Emoji` |  |
| `bin/audit` |  | for running rdoc, rspecs, and coverage reports |  |

| class | method(s) added | feature(s) |
| --- | --- | --- |
| `NilClass` | `empty?` | `f04` |

---

# `v0.0.0`

---
