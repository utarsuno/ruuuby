
# `v0.1.0.pre.5`

* add gem{`rubocop`}
* add a `docker registry service`
* start adding & preparing needed `tooling` for various `CICD methodologies`
* for `docker images`, begin better utilization of `docker tags` to enable a more hierarchical design
  * (enabling more `layer caching`, `code re-use`, reducing `build times`, etc)
* start formal division between `Ruuuby` as a `gem` and as a `stateful engine` (latter requiring `gem + git source`)
  * `Ruuuby as a gem` will converge to `TDD` towards {`0.1.0`}
  * `Ruuuby as a stateful engine` to accelerate `ad hoc refactorings & design testing` towards {`0.1.0`}

# `v0.1.0.pre.4`

* continue `DB` migrations
* apply miscellaneous clean ups
* (*unofficially*) add gems{`rails`, `keycutter`, `github-linguist`}
* remove `rng` tests among others while reviewing scope of needed `statistics formulas` and approaches
* start of (critically needed) migration for more formal `CICD`
  * begin preparation for proper git branching w/ `git hooks` on both `client` and `server` side
  * begin preparation for proper build pipelines w/ a hybrid of custom code + a (to be chosen) `CICD` framework(s)
  * iterative refactor of mapping between features & code; `Ruuuby Dockerization` to resume following more cleanup

# `v0.1.0.pre.3`

 * add gem{`open3`}
 * continue `DB` migrations
 * iterative improvement for custom builds, lazy-loading, and separation between `dev`/`test`/`prod` environments
 * apply clean ups, any removed core functionality to return closer to version{`0.1.0`}

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
 * for `web-based services`: add `webmanifest` file and `JSON minification` to the existing `node.js REST end-point`
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

| path added | reference | notes |
| ----: | ---- | ---- |
| `lib/ruuuby/module/bundler.rb` | `Bundler` |  |
| `lib/ruuuby/module/gem.rb` | `Gem` |  |
| `services/web_assets/*` | `multiple files & dirs` | code not directly relating to `ruuuby engine` will not normally be documented (until pending `DB` overhaul) |
| `lib/ruuuby/api/docker/docker_service.rb` | `RuuubyService` | temp util |
| `lib/ruuuby/api/docker/docker_service_set.rb` | `RuuubyServiceSet` | temp util |
| `bin/console_docker` | `RuuubyServiceSetDev` | offers funcs like: `build_web_assets`, `build_js`, `build_html`, `build_css`, `run_dev` |

| for | method(s) added |
| ---: | :--- |
| `Object` | `attribute_versionable` |
| `ENV` | `∀🔑∃_value?` |
| `Hash` | `∄🔑?`, `∀🔑∃_value?` |
| `Array` | `convert_to_json` |
| `String` | `clean!` |
| `Heuristics` | `clean` |
| `Net::HTTPResponse` | `time_received`, `content_length` |
| `💎.engine.api_zsh` | `run_script` |
| `💎.engine` | `run_apple_script!`, `curl_get` |
| `💎.engine.api_locale` | `healthy?`, `healthy_encoding?` |
| `🍺` | `doctor`, `cleanup`, `healthy?`, `analytics?`, `analytics_disabled?`, `analytics_set_on`, `analytics_set_off` |
| `💎.engine.api_git` | `∃index_conflicts?`, `∃fixable_syntax_errors?` |
| ``🐋`/`💎.engine.api_locale.api_docker`` | `∀🐋`, `connected?`, `connect`, `connect!`, `disconnect`, `disconnect!`, `version_compose` |
| `Docker::Container` | `alpine?`, `debian?`, `dev?`, `prod?`, `healthy?`, `env_vars`, `os`, `os_version`, `linux_kernel_version`, `os_architecture`, `mounts`, `∃mount?`, `file_create`, `cmd!` |

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

| path(s) added | reference | notes |
| ----: | ---- | ---- |
| `services/nginx/includes/*.nginx` | (multiple files & directories) | |
| `services/web_assets/Dockerfile` | | file added early, will be utilizing various `JS` libs/environments |
| `services/web_assets/ruuuby.html` | | same as above |
| `services/web_assets/ruuuby.js` | | same as above |

| for | method(s) added |
| ----: | :---- |
| `Array` | `∀𝚡λ𝑓🖨️` |
| `Hash` | `λ𝑓∀🔑：₍🔑∉₎`, `λ𝑓∀🔑：₍🔑∉₎!` |
| `File::YAML` | `read` |
| `💎.engine.os` | `windows?`, `unix?`, `mac?`, `linux?` |
| `🐋`/`💎.engine.api_locale.api_docker` | `healthy?`, `∃🌐?`, `∃🐋?`, `find_🌐_by_name`, `find_🐋_by_name`, `find_🐋_by_id`, `♻️_🌐_by_name` |

---

# `v0.0.47`

| gem updated | version previous | version current |
| ----: | :---: | :---- |
| `rake-compiler` | `1.1.0` | `1.1.1` |
| `rubygems-update` | `3.1.4` | `3.2.0.rc.1` |

| path added | reference | notes |
| ----: | ---- | ---- |
| `lib/ruuuby/math/finance/benchmarks.rb` |  | not currently utilized, just file added early |
| `lib/ruuuby/heuristics/heuristics.rb` | `Ruuuby::Heuristics` | same as above description |

| for | method(s) added |
| ---: | :--- |
| `Matrix` | `ᵀ` |
| `File::CSV` | `read` |
| `💎.engine.api` | `pid_terminate` |
| `💎.engine.api_locale` | `iconv_version`, `iconv_supported_encodings` |
| `PseudoGraph` | `[]`, `set_edge`, `set_edge_inverse`, `num_nodes`, `empty?`, `free_memory`, `print_debugging` |
| `TimeSeriesData` | `Q₁`, `Q₃`, `IQR`, `outliers_lower`, `outliers_upper`, `boundary_outliers_min`, `boundary_outliers_max`, `sum_squared`, `sum_of_squares`, `sum_weighted`, `mean_weighted`, `mean_geometric`, `nᵗʰ_percent_rank`, `healthy?` |

---

# `v0.0.46`

 * add initial support for `Tropical Algebra`
 * `wip`: track `OpenMP` in same style as w/ `OpenGL` & `OpenCL`
 * ⚠️: greatly increase scope of upcoming wide-scale refactors
   > tech-debt will out-pace rate of implementation/testing for at least a few versions, then more effective code clean-up will be enabled and performed

| path added | reference | notes |
| ----: | ---- | ---- |
| `lib/ruuuby/math/physics/physics.rb` | `Math::Physics` | not currently utilized, just file added early |
| `lib/ruuuby/math/physics/wave.rb` | `Math::Physics::Wave` | same as above desc. |
| `lib/ruuuby/math/physics/harmonic_analysis.rb` | `Math::Physics::HarmonicAnalysis` | same as above desc. |
| `lib/ruuuby/math/forex/forex.rb` | `Math::Forex` | same as above desc. |
| `lib/ruuuby/math/forex/currency_matrix.rb` | `Math::Forex::CurrencyMatrix` | `wip` |
| `lib/ruuuby/class/nums/vector.rb` | `Vector` | `Ruby` built-in Class (now loaded in) |
| `lib/ruuuby/class/nums/matrix.rb` | `Matrix` | `Ruby` built-in Class (now loaded in) |
| `lib/ruuuby/math/algebra/tropical.rb` | `Math::Algebra::Tropical` |  |
| `ext/ruby_class_mods/c8_graphs.h` | `PseudoGraph` | same creation style as `ThetaAngle` & `TimeSeriesData` |
| `lib/ruuuby/protocol/unix_socket.rb` | `UNIXSocket` | `Ruby` built-in Class (now loaded in) |
| `help/extensions/c/open_mp.md` |  | |

| for | method(s) added |
| ---: | :--- |
| `Vector` | `∅?` |
| `Matrix` | `▣?`, `∀ₓ↘`, `∀ₓᵢ↘`, `↘_to_a`, `∀ₓᵢⱼ`, `num_rows`, `num_cols` |
| `Math::Forex::CurrencyMatrix` | `η̂!`,`algo_🌴_arbitrage`, `karps_algorithm` |
| `Math::Algebra::Tropical::ContextNumeric` | `⨁`, `⨂` |
| `Math::Algebra::Tropical::ContextMatrix` | `⨁`, `⨁!`, `⨂`, `⨂ⁿ` |

---

# `v0.0.45`

 * apply iterative upgrade to `Ruuuby Engine`
   * **ex:** track `GIT attributes` w/ `💎.engine.api_git`
 * fix various edge-case bugs w/ `ThetaAngle` <em>bitwise flags</em>; apply same design to `TimeSeriesData`; start creation of re-usable base code for `Bitwise Flags` in general
 * `ORM`: apply start of refactors for proper support of `RuuubyChangelog` and other automation-functionality; design still `wip`
   * and thus full `DB TDD` & `documentation` is still withheld
 * <em>**remove:**</em> global{`$PRM_MANY`}, update funcs as needed and slightly increase testing coverage
 * move various math functions to better suited locations; more to be done

| gem updated | version previous | version current |
| ----: | :---: | :---- |
| `bundler` | `2.1.4` | `2.2.0.rc.1` |

| path added | reference | notes |
| ----: | ---- | ---- |
| `lib/ruuuby/class/bitwise_flag.rb` | `Ruuuby::BitwiseFlag` | utility/helper, non-core class |
| `.gitattributes` |  |  |
| `lib/ruuuby/math/geometry/shape/sphere.rb` | `Math::Geometry::Sphere` | not currently utilized, just file added early |

| for | method(s) added |
| ---: | :--- |
| `ApplicationRecord` | `orm_Ⓣ_🐍`, `empty?` |
| `Ruuuby::MetaData::RuuubyEngine` | `num_cpu_cores`, `current_user`, `get_compiled_code` |
| `💎.engine.api_git` | `validate_attribute` |
| `Math::Stats::Descriptive` | `percentage_error` |
| `TimeSeriesData` | `ρ`, `flags`, `mape`, `normalize!`, `print_debugging`, `first`, `last`, `λ`, `Λ`, `has_zero?`, `has_negative?`, `normalized?`, `even?`, `strictly_increasing?`, `strictly_decreasing?`, `all_same?` |

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

| path added | reference | notes |
| ---: | --- | --- |
| `lib/ruuuby/math/stats/time_series_data.rb` | `TimeSeriesData` | |
| `ext/ruby_class_mods/c7_times_series_data.rb` | `TimeSeriesData` | |
| `lib/ruuuby/ruuuby/engine/ruuuby_api_component.rb` |  | |
| `bin/compilation_modes/build_w_debugging` |  | |
| `bin/compilation_modes/build_simple` |  | |

| for | method(s) added |
| --- | --- |
| `Ruuuby::MetaData::RuuubyEngine::F22B00` | `percentage_protected_from_minor_marks`, `percentage_fragmentation`, `stats_bytes_per_object_slot`, `stats_slots_per_heap_page`, `perform_quick`, `perform_full` |
| (Refinement) `String` | `ʳ?`, `ʳ`, `ᵍ?`, `ᵍ`, `𝞽?`, `𝞽` |
| `TimeSeriesData` | `mem_size`, `free_memory`, `len`, `mean`, `sum`, `max`, `min`, `median`, `range`, `σ²`=>`variance`, `σ`=>`std_dev`, `percentile`, `mse` |

---

# `v0.0.43`
 * add normalizer{`∈𝕌`} for funcs{`flt?`, `🛑flt❓`}
 * start adding textual parsing for `ThetaAngle` via `Refinement` in{`ThetaAngle::ContextStrParsing`}
 * increase scope tested in some db_audit funcs

| path added | reference | notes |
| ---: | --- | --- |
| `lib/ruuuby/math/geometry/theta_angle/context_str.rb` | `ThetaAngle::ContextStrParsing` | Refinements onto `String` for parsing to and from `ThetaAngle` |
| `lib/ruuuby/ruuuby/engine/ruuuby_engine_component.rb` | `Ruuuby::MetaData::RuuubyEngineComponent` | start of cleaner design w/ `RuuubyEngine` and relating objs |
| `lib/ruuuby/ruuuby/api/api_locale.rb` | `Ruuuby::MetaData::LocaleAPI` |  |
| `bin/manually_execute/clean_up` |  | delete any temporary/generated content, quick way to force a full re-compile |

| for | method(s) added |
| --- | --- |
| `Math::Stats::TimeSeries` | `aroon_up`, `aroon_down`, `aroon_oscillator`, `simple_moving_average` |
| `Math::Combinatorics::𝕎¹` | `len_powerset` |
| `Math::Combinatorics::𝕎²` | `len_ordered_with_replacement` |
| (`Refinement`) `String` | `°?`, `°` |

---

# `v0.0.42`
 * change normalizer from{!∅} to{∉∅}; add{f06_b03} to provide this normalizer for funcs{ary?, 🛑ary❓}
 * provide function aliases{`wma`, `ema`} to `Math::Stats::TimeSeries`

| for | method(s) added |
| --- | --- |
| `ThetaAngle` | `octant?` |
| `Math::Stats` | `median` |
| `Math::Stats::TimeSeries` | `weighted_moving_average` |

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

| path added | reference | notes |
| ---: | --- | --- |
| `ext/ruby_class_mods/c5_internal_structs.h` |  |  |
| `ext/ruby_class_mods/c6_feature_macros.h` |  |  |
| `lib/ruuuby/math/stats/stats.rb` | `Math::Stats` | |
| `lib/ruuuby/math/stats/time_series.rb` | `Math::Stats::TimeSeries` | |
| `lib/ruuuby/math/geometry/shape/shape.rb` | `Math::Geometry::Shape` | not currently utilized, just file added early |
| `lib/ruuuby/math/geometry/shape/plane_figure.rb` | `Math::Geometry::PlaneFigure` | same as ↑ |
| `lib/ruuuby/math/geometry/shape/quadrilateral.rb` | `Math::Geometry::Triangle` | same as ↑ |
| `lib/ruuuby/math/geometry/shape/shape.rb` | `Math::Geometry::Quadrilateral` | same as ↑ |
| `db/db_schema.rb` |  |  |
| `lib/ruuuby/ruuuby/api/abstract_space.rb` |  | not currently utilized, just file added early |
| `lib/ruuuby/ruuuby/api/api_brew.rb` |  | same as ↑ |
| `lib/ruuuby/ruuuby/api/api_docker.rb` |  | same as ↑ |

| for | method(s) added |
| --- | --- |
| `String` | `palindrome?` |
| `ApplicationRecord` | `num_where` |
| `GitCommit` | `num_release_tags` |
| `RuuubyRelease` | `num_released` |
| `Ruuuby::MetaData::RuuubyEngine` | `memory_peak_this_runtime` |
| `Math::NumberTheory` | `semiprime?` |
| `Math::Combinatorics` | `permutations` |
| `Math::Stats` | `arithmetic_mean` |
| `Math::Stats::TimeSeries` | `exponential_moving_average` |

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

| for | method(s) added |
| --- | --- |
| `Symbol` | `as_source_ruby` |
| `ENV` | `parse_feature_behaviors`, `validate_feature_behavior_syntax!` |
| `RuuubyGem` | `fetch_by_type` |
| `Math::NumberTheory::ℤ²` | `fast_gcd` |
| `Math::NumberTheory::ℤ³` | `congruent?` |
| (Refinement) `Integer` | `≡` |

---

# `v0.0.39`
 * update to Ruby version{`2.7.1`} from{`2.7.0`}
 * update gem(`activerecord`) version from{`5.2.4.1`} to{`5.2.4.3`}
 * add `RSpec` sections: `integration` & `tech_debt`
 * add the following `Sequence` objs to `Math::NumberTheory::𝕎¹`: `seq_pronic`, `seq_square`, `seq_fibonacci`, `seq_lucas`, `seq_triangle`, `seq_hexagonal`
 * remove some non-ASCII characters in `.h` and `.c` files while testing between compilers `clang` & `gcc`
 * fix typo for const{ANGLE_TAU}, it is now correctly referenced by{`𝞽`} and not{`τ`}
 * various edge-case bugs w/ `ThetaAngle` identified, some are fixed for this version

| path added | reference | notes |
| ---: | --- | --- |
| `lib/ruuuby/math/expr/seq/arithmetic.rb` | `Math::Expr::ArithmeticSequence` | (`Ruby` version{`2.7.1`} just added `Enumerator::ArithmeticSequence` which will be looked at prior to further modifications & clean-up of these `Sequence` classes) |
| `lib/ruuuby/math/expr/seq/geometric.rb` | `Math::Expr::GeometricSequence` |  |
| `lib/ruuuby/math/expr/seq/recursive.rb` | `Math::Expr::RecursiveSequence` |  |

| for | method(s) added |
| --- | --- |
| `Math::NumberTheory` | `digit_sum`, `digital_root`, `additive_persistence`, `almost_perfect?`, `nᵗʰ_cototient`, `nᵗʰ_euler_totient`, `friendly?` |
| `Math::Combinatorics` | `n_choose_k` |

---

# `v0.0.38`
 * replace all usages of c-ext-func{`rb_eval_string`} and others that were significantly slowing down `startup/initial-load time`
 * remove funcs{`class?`, `module?`, `singleton?`} from Class(`Object`); (functionality covered by `🧬`)
 * remove func{`𝔠`} from `Kernel` (and thus remove `functional-style` support from previously{`f05`})
 * track `git tags` w/ related `ORMs` & `APIs`; however, version automation tasks paused until `TDD` catches up for `DB` and/or some event/queue-based logic is added (ex: `RabbitMQ`)
 * apply various misc cleanups w/ others `wip`

| path added | reference | notes |
| ---: | --- | --- |
| `lib/math/statistics/statistical_learning.rb` | `Math::Stats::StatisticalLearning` | not currently in use |
| `lib/math/statistics/probability_theory.rb` | `Math::Stats::ProbabilityTheory` | not currently in use |
| `lib/math/statistics/descriptive_statistics.rb` | `Math::Stats::DescriptiveStatistics` | not currently in use |
| `lib/math/combinatorics/combinatorics.rb` | `Math::Stats` | not currently in use |

| for | method(s) added |
| --- | --- |
| `Math::Space::NucleotideSpace` | `∋ˢ?` |
| `Ruuuby::MetaData::GitAPI` | `release_tags`, `branch_names`, `remote_release_current`, `remote_release_previous` |
| `Math::NumberTheory` | `aliquot_sum`, `deficient?`, `deficiency`, `abundant?`, `abundance`, `abundancy_index`, `composite?` |

---

# `v0.0.37`
 * have `ORM`: `RuuubyRelease` and `GitCommit` include `Comparable`; replacing redundant funcs{`>`, `<`} to the single func{`<=>`}
 * remove `♾️`, `¿` from all sources, textual parsing, code aliases, etc; (too redundant)
 * remove func{∞?} from Class(`String`)
 * add `ORM`{`RuuubyGem`}, some functionality was added; also removed runtime constants needed solely for unit-tests (these tests are now semi-generated w/ `ORM` data)
 * add `RSpec` section for `locale` (local configs); `(not final design)`

| path added | reference | notes |
| ---: | --- | --- |
| `lib/virtual/f06.rb` |  |  |
| `app/models/ruuuby_gem.rb` | `RuuubyGem` |  |
| `lib/virtual/f28.rb` |  |  |
| `lib/math/complex_analysis/complex_analysis.rb` | `Math::ComplexAnalysis` | |
| `lib/math/trigonometry/trigonometry.rb` | `Math::Trigonometry` | |
| `lib/math/graph_theory/graph_theory.rb` | `Math::GraphTheory` | |
| `lib/math/geometry/geometry.rb` | `Math::Geometry` | | |
| `lib/math/space/discrete/symbolic_numbers_space.rb` | `Math::Space::SymbolicNumbersSpace` | 𝕊 |

| for | method(s) added |
| --- | --- |
| `Object` | `ⓣ`, `Ⓣ` |

---

# `v0.0.36`
 * remove func{`get_prime_factors`} from `Integer`, newly created module{`Math::NumberTheory`} now offers that functionality
 * local git-config settings are now enforced with newly created `💎.api_git`, version-automation refactorings started

| path added | reference | notes |
| ---: | --- | --- |
| `lib/math/expression/equation.rb` | `Math::Expression::Equation` | |
| `lib/math/expression/sequence.rb` | `Math::Expression::Sequence` | |
| `lib/math/group_theory/circle_group.rb` | `Math::GroupTheory::CircleGroup` | aliased via(`𝕋`) |
| `lib/ruuuby/ruuuby/git_api.rb` | `Ruuuby::MetaData::GitAPI` | `💎.api_git` (to fully replace existing `git` functionality found in `💎.api` and elsewhere) |
| `lib/math/number_theory/number_theory.rb` | `Math::Ruuuby::NumberTheory` |  |

| for | class-method(s) added |
| --- | --- |
| `Math::NumberTheory::ℕ¹` | `get_prime_factors`, `get_divisors`, `get_proper_divisors`, `perfect_number?` |
| `Math::NumberTheory::ℕ²` | `gcd`, `coprime?` |

---

# `v0.0.35`
 * add `gem 'rugged', '~> 1.0.0'`
 * apply general clean-ups, next few versions to have similar target
 * remove many function calls and variables that didn't need to be executed or exist; start adding extra checks via{`mkmf`} which will halt/fail even before the compilations step
 * remove alias `🧬?`, `🧬` is now a 'global-alias' for the singleton{`NucleotideLikeSpace`}
 * remove alias `🅱️?`, `🛑🅱️❓`, etc; just `🅱` is now a 'global-alias' for the single{`BooleanLikeSpace`}
 * remove funcs{`stry?`, `countable?`} and{`🛑stry❓`, `🛑countable❓`}
 * remove `::Ruuuby::VirtualTypes` and it's file
 * remove funcs{`∃class?`, `∃module?`} from `Kernel`, functionality is now covered by singleton{`NucleotideLikeSpace`} which is aliased via{`🧬`}
 * remove various redundant emoji aliases as the added feature{`f97`}, will enable selected character sets without the clutter of unwanted characters and aliases
 * add more detail to various `ORM` features/funcs, documentation and TDD still intentionally not fully present for these
 * add class `DescriptiveStandardError`

| path added | reference | notes |
| ---: | --- | --- |
| `lib/math/expression/expression.rb` |  | |
| `lib/math/expression/formula.rb` |  |  |
| `lib/math/space/tuple_space.rb` |  |  |
| `lib/math/space/types_space.rb` |  |  |
| `lib/math/space/discrete/boolean-like_space.rb` | ``Math::Space::BooleanLikeSpace`` |  |
| `lib/math/space/discrete/number-like_space.rb` | ``Math::Space::NumberLikeSpace`` |  |
| `lib/math/space/discrete/nucleotide-like_space.rb` | ``Math::Space::NucleotideLikeSpace`` |  |

| for | method(s) added |
| --- | --- |
| `TrueClass`, `FalseClass` | `to_i`, `to_b` |
| `Rational` | `μ?` |
| `String` | `to_🐫⬇`, `to_🐍⬆` |

# `v0.0.34`
 * increase precision of various funcs (ex: `sin²` and `cos²`), by performing calculations in `long double` instead of `double`
 * add `𝞽` as a 'global-const' which is a ThetaAngle representing a single complete turn
 * adjust parameter style of class-functions for `Math` to use named params
 * remove global-alias-funcs{`ℂ`, `ℚ`}; these now correspond to a specific singleton instance of the newly created class(`Math::SetTheory::NumberSet`)
 * add `super golden ratio` as `Ψ`, `silver ratio` as `δ`, `plastic ratio` as `ρ`, `omega constant` as `Ω`
 * remove various out-dated testing helper functions, meta-data generation/processing will eventually replace this
 * remove `Array::EMPTY_INSTANCE`, `∅` by itself now aliases a singleton of type{`NumberSet`}
 * create `ORM`{`RuuubyFeatureBehavior`} which is many to one{`RuuubyFeature`}
 * remove number-set membership check funcs from `Numerics` and create `singleton` instances of `NumberSet` which covers the previous functionality (just more scalable)
 * remove as much deprecated code as possible, file structure adjustments started
 * move `Float`'s method{`≈≈`} into `C-extensions`
 * remove funcs (and related ones): `🛑ℤ❓` and `🛑𝕌❓`, these checks are now covered by existing functions w/ new types of normalizers added for existing normalizer feature

| path added | reference | notes |
| ---: | --- | --- |
| `lib/ruuuby/math/set_theory/closure.rb` | ``Math::SetTheory::Closure`` |  |
| `lib/ruuuby/math/set_theory/number_set.rb` | ``Math::SetTheory::NumberSet`` |  |
| `lib/ruuuby/math/set_theory/discrete/algebraic_numbers.rb` | ``Math::SetTheory::AlgebraicNumbers`` |  |
| `lib/ruuuby/math/set_theory/discrete/boolean_numbers.rb` | ``Math::SetTheory::BooleanNumbers`` |  |
| `lib/ruuuby/math/set_theory/discrete/complex_numbers.rb` | ``Math::SetTheory::ComplexNumbers`` |  |
| `lib/ruuuby/math/set_theory/discrete/empty_set.rb` | ``Math::SetTheory::EmptySet`` |  |
| `lib/ruuuby/math/set_theory/discrete/imaginary_numbers.rb` | ``Math::SetTheory::ImaginaryNumbers`` |  |
| `lib/ruuuby/math/set_theory/discrete/integer_numbers.rb` | ``Math::SetTheory::IntegerNumbers`` |  |
| `lib/ruuuby/math/set_theory/discrete/irrational_numbers.rb` | ``Math::SetTheory::IrrationalNumbers`` |  |
| `lib/ruuuby/math/set_theory/discrete/natural_numbers.rb` | ``Math::SetTheory::NaturalNumbers`` |  |
| `lib/ruuuby/math/set_theory/discrete/null_set.rb` | ``Math::SetTheory::NullSet`` |  |
| `lib/ruuuby/math/set_theory/discrete/rational_numbers.rb` | ``Math::SetTheory::RationalNumbers`` |  |
| `lib/ruuuby/math/set_theory/discrete/real_algebraic_numbers.rb` | ``Math::SetTheory::RealAlgebraicNumbers`` |  |
| `lib/ruuuby/math/set_theory/discrete/real_numbers.rb` | ``Math::SetTheory::RealNumbers`` |  |
| `lib/ruuuby/math/set_theory/discrete/universal_set.rb` | ``Math::SetTheory::UniversalSet`` |  |
| `lib/ruuuby/math/set_theory/discrete/whole_numbers.rb` | ``Math::SetTheory::WholeNumbers`` |  |
| `app/models/ruuuby_feature_behavior.rb` |  |  |
| `ext/ruby_class_mods/c4_theta_angle.h` |  | for organization |

| for | method(s) added |
| --- | --- |
| `Object` | `set?`, `🛑set❓` |
| `Integer` | `get_prime_factors` |
| `ThetaAngle` | `normalize`, `windings` |

---

# `v0.0.33`
 * create new Class(`ThetaAngle`) which is essentially a wrapper over a `C-struct`
 * modify global-funcs `sin`, `cos`, `tan`, etc to utilize the `ThetaAngle` class
 * add empty code file(`lib/ruuuby/class/method/math_function.rb`) for future versions
 * apply lots of misc clean-ups and/or adjustments
 * `v0.0.34` to resolve missing parts from `ThetaAngle` and clean-up relating funcs from `String`

| path added | reference | notes |
| ---: | --- | --- |
| `lib/ruuuby/class/nums/theta_angle.rb` | `ThetaAngle` |  |

| for | method(s) added |
| --- | --- |
| `Object` | `θ?`, `🛑θ❓`, `enumerable?`, `🛑enumerable❓` |
| `Math` | `pythagoras_τ³?`, `cot`, `csc`, `sec`, `sin²`, `cos²` |
| `TOPLEVEL_BINDING` | `℮`, `logₑ`, `log₂`, `log₁₀`, `arcsin`, `arccos`, `arctan`, `cot`, `csc`, `sec`, `sin²`, `cos²` |
| `TOPLEVEL_BINDING` | `⅓`, `⅕`, `⅕`,`⅖`,`⅗`,`⅘`,`⅙`,`⅐`, `⅛`, `⅜`, `⅝`, `⅞`, `⅑`, `⅒` |
| `TOPLEVEL_BINDING` | `θ°`, `θʳ`, `θᵍ`, `θ𝞽` |
| `ThetaAngle` | `real`, `repr`, `as_radian`, `as_degree`, `as_gon`, `as_turn`, `radians?`, `degrees?`, `gons?`, `turns?`, `-@`, `+@`, `coerce`, `~`, `!`, `+`, `-`, `*`, `%`,`==`, `/`, `<=>`, `angle?`, `normal?`, `normalize!`, `golden_with?`, `explementary_with?`, `supplementary_with?`, `complementary_with?`, |

| from       | methods/aliases removed |
| ---------- | ----------------------- |
| `Kernel`   | `∠ᶜ`, `∠°` |

---

# `v0.0.32`
 * add flags to the compilation and linker steps (`wip`); replace locations in `C-extensions` that were previously accessing pointers not intended to be used beyond its internal scope (internal to `Ruby`)
 * global-func(`φ`) removed, reference replaced with(`𝚽`), a `Kernel` constant; also add the golden-angle constant(`Ⴔ`)
 * start utilizing more generic math notation where possible, ex-func(`∀τ²∈λ𝑓₍ᵢ،ᵢ₊₁₎`), very useful as this automatically applies (for example) to both regular objects like `Array` and also `ORM` objects like `RuuubyRelease` while still applicable to both
 * `v0.0.33` to utilize `golden-angle` as well as dramatically alter angle-trig related functions

| path added | reference | notes |
| ---: | --- | --- |
| `lib/ruuuby/module/attribute/includable/singleton.rb` | `Ruuuby::Attribute::Includable::RuuubySingleton` |  |
| `lib/ruuuby/module/attribute/extendable/singleton.rb` | `Ruuuby::Attribute::Extendable::RuuubySingleton` |  |
| `lib/ruuuby/class/proc.rb` | ``Proc`` |  |

| for | method(s) added |
| --- | --- |
| `Enumerable` | `∀τ²∈λ𝑓₍ᵢ،ᵢ₊₁₎` |

---

# `v0.0.31`
 * remove constants needed previous for supporting exponential operations from m(`Numeric`), needed values are now dynamically generated by `C-extensions` instead of relying on pre-existing constants (created specifically for just this purpose)
 * lots of misc edits/clean-ups in `C-extensions`
 * remove various un-used or now deprecated Modules such as `Ruuuby::MetaData::Vocabulary` (was a temporary location for `normalizers`)
 * engine/configs cleaned up and support started for multi-flag ENV_VARs
 * automation for `db/seeds/git_commits.rb` updated to better handle scenario where release had multiple commits, still lots of TODOs and missing `TDD` to be added
 * various modifications & additions to existing `ORM` Classes for general stability/reliability
 * flipped functionality of String's funcs `to_iso8601` and `as_iso8601` to closer match `Ruby style`

| path added | reference | notes |
| ---: | --- | --- |
| `lib/ruuuby/virtual/env` | ``ENV`` | note: `class << ENV` |
| `db/seeds/ruuuby_releases/future_ruuuby_releases.rb` |  | not currently used |

| for | method(s) added |
| --- | --- |
| `String` | `as_utf8` |
| TOPLEVEL_BINDING | `¼`, `½`, `¾`, `🌽` |
| `File` | `insert_lines_before_expr` |
| `GitCommit` | `get_latest`, `query_get_newest_within_version` |
| `RuuubyRelease` | `on_before_save` |

| from | methods/aliases *removed* |
| ------------------- | --------------------- |
| `Symbol`   | `power?`, `pow_to_i` |

---

# `v0.0.30`
 * add normalizers to `sym?`
 * continued ORM cleanups started in `v0.0.29`
 * iterative step in enabling textual parsing for more useful code-file automations

| path added | reference | notes |
| ---: | --- | --- |
| `app/model_attributes/extendable/uid.rb` | |
| `app/model_attributes/includable/uid.rb` | |

| for | method(s) added | notes |
| --- | --- | --- |
| `Object` | `singleton?` | |
| `Object` | `🅱?`, `🛑🅱❓`, `🧬?` | |
| `Module` | `get_all_defined_modules`, `get_all_defined_classes` | |
| `String` | `iso8601?`, `to_iso8601`, `as_iso8601` | |

---

# `v0.0.29`
 * misc cleanup for `ORM`, example: remove un-needed m(`ApplicationRecord::ORMAttributeCache`)
 * general cleanup for `QA`/`RSpecs`, especially w/ file loading order
 * add initial start of `ORM` schemas `RuuubyFiles` and `RuuubyDirs`
 * general functionality increases for `Ruuuby` `MetaData`, add global func `💎` for quicker reference
 * add logger with output in directory{`tmp`}, file{`ruuuby.log`}

| path added | reference | notes |
| ---: | --- | --- |
| `lib/ruuuby/ruuuby/engine/ruuuby_engine.rb` | `Ruuuby::MetaData::RuuubyEngine` | alias{`💎.engine`} |
| `lib/ruuuby/ruuuby/engine/ruuuby_logging.rb` | `Ruuuby::MetaData::RuuubyEngine.instance.logger` | alias{`💎.engine.logger`} |
| `lib/ruuuby/ruuuby/metadata/ruuuby_metadata_constants.rb` | ``Ruuuby::MetaData`` |  |
| `app/models/ruuuby_dir` | ``RuuubyDir`` | directory operations specifically for `ORM` related context/use-cases |
| `app/models/ruuuby_file` | ``RuuubyFile`` | file operations specifically for `ORM` related context/use-cases |

| for | method(s) added | notes |
| --- | --- | --- |
| `Array` | `∅` | starting point of adding similar immutable references like `nil` but for (assumable to be immutable) objects that are `∅` |
| `Object` | `🛑sym❓` | |
| `Ruuuby::MetaData` | `orm`, `orm_meta`, `paths`, `engine` | shortcuts to either modules or singleton-instanced objects |
| `Ruuuby::MetaData` | `info`, `debug` | shortcuts for logging statements |
| TOPLEVEL_BINDING | `ℂ`, `ℚ` | alias to `Complex`<br/>alias to `Rational` |
| `Kernel` | `💎`  | alias to `Ruuuby::MetaData` | |
| `File` | `insert_line_before_expr` | |

---

# `v0.0.28`
 * updating contents of `db/seeds/git_commits.rb` is now automated (starting point, LOTs of TODOs to guard against any edge case scenarios and future functionality requirements)
 * move funcs `class?`, `module?`, `nucleotide?` into `C-extensions` (also add `char?`)
 * iterative step in enabling textual parsing for more useful code-file automations
 * add normalizers to funcs `int?` and `str?`, allows (mainly-visual) clean-up for `Ruuuby` funcs `🛑str❓` and `🛑int❓`
 * add types to `Ruuuby::VirtualTypes`
 * rename c(`String`)'s func{♻️until!} to {remove_until}, add alias(`♻️⟶`); also add reverse direction w/ func{`♻️⟵`}

| path added | reference | notes |
| ---: | --- | --- |
| `lib/ruuuby/ruuuby/ruuuby_orm.rb` | `Ruuuby::MetaData::RuuubyORM` |  |
| `lib/ruuuby/ruuuby/routine_cli.rb` | `Ruuuby::Routine::CommandCLI` |  |

| for | method(s) added |
| --- | --- |
| `String` | `char?`,  |
| `String` | `♻️⟵`, `♻️⟶∞` <br/> [`upcase?`, `⬆️?`, `⬆?`, `🔠?`] <br/> [`downcase?`, `⬇️?`, `⬇?`, `🔡?`] |
| `String` | `🐫?`, [`🐫⬇️?`, `🐫⬇?`, `🐫🔡?`], `to_🐫` <br/> `🐍?`, [`🐍⬆️?`, `🐍⬆?`, `🐍🔠?`], `to_🐍` |

---

# `v0.0.27`
 * contents in `db/seed.rb` split across files in newly created dir: `db/seeds/`; also add new `ORM: GitCommit`, (one `RuuubyRelease` to many `GitCommits`)
 * performing update of version number for `README.md` and `lib/ruuuby/version.rb` is now automated
 * m{`Module`}'s func{`⨍_add_aliases`} converted to alias the func{`f_add_aliases`} created from `C-extensions`

| gem added | version |
| ---: | :---- |
| `schema_plus_foreign_keys` | `0.1.8` |


| path added | reference | notes |
| ---: | --- | --- |
| `db/seeds/git_commits.rb` |  |  |
| `db/seeds/ruuuby_features.rb` |  |  |
| `db/seeds/ruuuby_releases.rb` |  |  |
| `app/models/git_commit.rb` | `::GitCommit` |  |
| `lib/ruuuby/ruuuby/ruuuby_api.rb` | `::Ruuuby::RuuubyAPI` |  |
| `lib/ruuuby/ruuuby/routine.rb` |  | `example usage: Routine::CMD.new` |

| for | method(s) added |
| --- | --- |
| `File` | `dirname⁴` |

---

# `v0.0.26`
 * cleanup creation of function aliases (remove redundant declarations, move needed ones into `ide_helper`, and use new func{`⨍_add_aliases`} where possible)
 * `DRY`: attribute-module(`Cardinality`) now auto-assigns the alias `𝔠`
 * reduce number of locations requiring manual edits/checks when releasing version updates
 * add normalizer_option(`:ℕ`) to func(🛑int❓)
 * add `RSpec` section `db`, clean-up various locations where `db/seed` was loaded before

| added path | reference | notes |
| ---: | --- | --- |
| `lib/ruuuby/module/attribute/includable/notation_set_mathematics.rb` | `Ruuuby::Attribute::Includable::Notation::SetMathematics` |  |
| `lib/ruuuby/ruuuby/ruuuby_metadata.rb` | `Ruuuby::MetaData` | design pending |

| class | method(s) added |
| --- | --- |
| `Module` | `⨍_add_aliases` |
| `File` | `replace_expr_with`, `replace_expr_with!` |
| `RuuubyRelease` | `<`, `>`, `get_next_version_uid`, `get_latest_version_uid` |

| class | alias(es) added |
| --- | --- |
| `Object` | (freeze) `❄`, `❄?` |

---

# `v0.0.25`
 * start dividing `C-code` across multiple header files, lots of small misc changes (ex: moved various constants definitions from `Ruuuby's` `Float`)
 * re-structure `Feature` <---> `Module` mapping, add `audit` tests to verify pattern is present/consistent
 * move certain funcs out of `Kernel` and directly add them to `TOPLEVEL_BINDING` to avoid polluting other classes
 * start formalization of existing funcs w/ name(`η̂`, `normalize`) and/or when `normalization` is applied to `args` (any context)
 * symbolic-math support being added only for niche use-cases, `automatic-differentiation` features to take priority in case of any feature-conflicts

| added path | reference | notes |
| ---: | --- | --- |
| `lib/ruuuby/global_funcs.rb` |  |  |
| `ext/ruby/class_mods/c0_constants.h` |  |  |
| `ext/ruby/class_mods/c1_typed_checks.h` |  |  |
| `ext/ruby/class_mods/c2_extension_memory.h` |  |  |
| `ext/ruby/class_mods/c3_macro_utilities.h` |  |  |

| for | method(s) added |
| --- | --- |
| `String` | `♻️until!` |
| `TOPLEVEL_BINDING` | `tan`, `tan°` |
| `String` | `to_radian` |

| for | alias(es) added |
| --- | --- |
| `Array` | (remove_empty!): `♻️∅!` |
| `Set` | (remove_empty!): `♻️∅!` |
| `String` | (reverse): `↩️`, `↩️!`, `↩`, `↩!` |
| `Array` | (reverse): `↩`, `↩!`, `↩∀` |

---

# `v0.0.24`
 * ensure `Ruby` data created from `C-extensions` gets guarded against `garbage-collection`
 * start utilizing configs for `Ruuuby`, especially for debugging information

| added path | reference | notes |
| ---: | --- | --- |
| `lib/ruuuby/configs.rb` |  |  |

---

# `v0.0.23`
 * (starting-point) add support for representing `Complex Infinity`; (for now) via Symbol(`∞ℂ`)
 * add Attribute(`SubscriptIndexing`) to Class(`Symbol`)
 * add missing tests and fix bugs (missing scenario coverage) for c(`Object`)'s funcs `🛑ℤ❓` and `🛑𝕌❓`
 * `power-operations` given support for working with 'custom' `infinitity values`, Class(`Rational`) given support for `superscript-power-operations`
 
| for | method(s) added |
| --- | --- |
| `Kernel` | `¿`, `∞`, `∞ℂ` |
| `Integer` | `¿?`, `nan?`, `∞ℂ?` |
| `Float` | `¿?`, `∞ℂ?` |
| `Symbol` | `power?`, `pow_to_i` |
| `Rational` | `^` |

---

# `v0.0.22`
 * continued (minor) improvements to catching bad parameters & throwing needed errors
 * add func(`err_to_num`) to class(`String`) as a utility function for throwing errors
 * start organizing groups of functions into modules labeled by their `Feature` or `Attribute` (`includable` or `extendable`)
 * tech debt accumulation to be dealt with by `v0.1.0` to remove all `🍝 code` prior to adding support to `automatic differentiation`

| added path | reference | notes |
| ---: | --- | --- |
| `lib/ruuuby/class/sym.rb` | `Symbol` |  |
| `lib/ruuuby/module/attribute/includable/cardinality.rb` | `Ruuuby::Attribute::Includable::Cardinality` |  |
| `lib/ruuuby/module/attribute/includable/subscript_indexing.rb` | `Ruuuby::Attribute::Includable::SubscriptIndexing` |  |
| `lib/ruuuby/module/attribute/includable/syntax_cache.rb` | `Ruuuby::Attribute::Includable::SyntaxCache` |  |
| `lib/ruuuby/module/attribute/extendable/syntax_cache.rb` | `Ruuuby::Attribute::Extendable::SyntaxCache` |  |

| for | method(s) added |
| --- | --- |
| `Object` | `🛑𝕌❓` |
| `Array` | `η̂!` |
| `Symbol` | (downcase, upcase) `⬇️`, `⬇`, `🔡`, `⬆️`, `⬆`, `🔠` |
| `String` | (downcase, upcase) `⬇️`, `⬇`, `🔡`, `⬆️`, `⬆`, `🔠`, `⬇️!`, `⬇!`, `🔡!`, `⬆️!`, `⬆!`, `🔠!` |
| `Enumerable` | `∀ₓᵢ` (each_with_index) |
| `Object` | `define_singleton_⨍` (define_singleton_function) |
| `Kernel` | `🌽_previous_⨍` |
| `String` | `digit?`, `to_num`, `to_num?` |

---

# `v0.0.21`
 * add const `NUCLEOTIDES` to `Ruuuby::VirtualTypes`
 * add missing scenarios & tests for `spec/helpers/static_test_data.rb`
 * add `global-constant`(`$PRM_MANY`), param-type checking functions expanded for multi-param check use-cases
 * add modules `ORMAttributeUID` and `ORMAttributeCache` to `ApplicationRecord` as well as module(`Syntax`), which each `ORM Class` will also define

| added path | reference | notes |
| ---: | --- | --- |
| `bin/console_db` |  | same as `/bin/console` but also pre-loads `db/seed.rb` |
| `lib/ruuuby/class/re.rb` | `Regexp` |  |
| `app/models/db_schema.rb` | `RuuubyDBSchema` | `temporary design` |
| `lib/ruuuby/module/attribute_extendable/static_attribute_syntax_cache` | `Ruuuby::StaticAttributeSyntaxCache` | |

| for | method(s) added |
| --- | --- |
| `Object` | `class?`, `module?`, `nucleotide?` |
| `Module` | `∋?`, `∌?`, `∈?`, `∉?` |
| `Object` | `🛑ℤ❓` |

---

# `v0.0.20`
 * add consts `RATIO_DEGREES_TO_RADIAN` and `RATIO_RADIANS_TO_DEGREE` into module `Math`
 * power-operations for `Integer` and `Float` given support for raising from `-1` to `-9` via superscripts(`⁻¹` to `⁻⁹`)

| added path | reference | notes |
| ---: | --- | --- |
| `lib/ruuuby/module/math.rb` | ``Math`` |  |
| `help/math/automatic_differentiation.rb` |  | `Ruuuby's` current main focus to add functionality support to |

| for | method(s) added |
| --- | --- | --- |
| `Object` | `🛑flt❓` |
| `Float` | `≈≈` |
| `Kernel` | `sin` |
| `Kernel` | `sin°` |
| `Kernel` | `cos` |
| `Kernel` | `cos°` |
| `Kernel` | `∠ᶜ` |
| `Kernel` | `∠°` |

---

# `v0.0.19`
 * add some data-type/db-validation for `ORM`, still lots of TODOs here
 * purge `ruuuby/version.rb` of all content except `constant String`: `VERSION` (as `ORM` functionality will cover prior needed use-cases)
 * add missing test cases for power-operations and `Object's` funcs(`flt?`, `num?`)
 * power-operations for `Float` moved into `ruby_class_mods.c`
 * general improvements for performance-testing and `RSpec` structuring
 * `ruby_class_mods.c` to start using `non-ascii` based `#define` statements
 * start adding code for negative-exponents
 
| for | method(s) added |
| --- | --- |
| `File`, `Dir` | `∅?` |
| `ApplicationRecord` | `♻️`, `♻️!` |
| `Kernel` | `🎲`, `∛`, `π`, `φ`, `γ` |
| `Object` | `⁻¹`, `⁻²`, `⁻³`, `⁻⁴`, `⁻⁵`, `⁻⁶`, `⁻⁷`, `⁻⁸`, `⁻⁹` |
| `Dir` | `normalized_paths` |

---

# `v0.0.18`
 * renaming existing func(`🛑str_or_ary❓`) to(`🛑countable❓`); it now checks for `Set` as well
 * add `gem 'sqlite3', '~> 1.4.2'`
 * add `gem 'activerecord', '~> 5.2.4.1'`
 * start process of tracking language changes across versions into `ORM`/`db`
   * start process of auto-generating documentation from these objects

| added path | reference | notes |
| ---: | --- | --- |
| `lib/ruuuby/class/io/file.rb` | `File` |  |
| `lib/ruuuby/class/io/dir.rb` | `Dir` |  |
| `lib/ruuuby/types.rb` | `Ruuuby::VirtualTypes` | adds (module-scoped) constants `🅱️`, `STRY`, `NUMS`, `COUNTABLES`  |
| `app/models/application_record.rb` | `ApplicationRecord` |  |
| `app/models/ruuuby_changelog.rb` | `RuuubyChangelog` |  |
| `app/models/ruuuby_feature.rb` | `RuuubyFeature` |  |
| `app/models/ruuuby_release.rb` | `RuuubyRelease` |  |
| `lib/ruuuby/class/method.rb` | `Method`` |  |
| `conditionals/ide_helper.rb` |  | received all duplicated aliases (for playing nice with IDEs, happens from funcs created in `C-extension`)  |
| `db/db.rb` |  |  |
| `db/seed.rb` |  |  |

| class(es) | method(s) added |
| --- | --- |
| `File`, `Dir` | `∃?` |
| `File` | `dirname²`, `dirname³` |
| `Kernel` | `📁` (`File`), `📂` (`File`), `🗄️` (`Dir`) |
| `Object` | `flt?`, `num?` |
| `Integer`, `Numeric` | `♾️?` (infinite?) |
| `Method` | `🏠` (`source_location`) |

---

# `0.0.17`

#### Abstract
 * start general, wide-scale, re-structuring to manage changes into categorized `features`

#### Discrete
 * continued audit on number classes (see notes from v`0.0.15-16`)
 * for math related `RSpecs`, move common/shared `let` definitions into `spec_helper.rb`, add additional ones to form a general schema for testing data
 
#### Methods & Aliases:
 | for                              | methods/aliases added |
 | -------------------------------- | --------------------- |
 | `Kernel`                         | `𝔠`                   |
 | `String`, `Set`, `Array`, `Hash` | `𝔠` (length)          |
 | `Class`                          | `🆕` (new)            |
 | `Object`                         | `⁰`, `¹`, `²`, `³`, `⁴`, `⁵`, `⁶`, `⁷`, `⁸`, `⁹` |
 | `Object` | `🛡️funcs` (protected_methods), `🙈funcs` (private_methods) |
 | `Module` | `🛡️` (protected), `∃🛡️func?` (protected_method_defined?), `🛡️instance_funcs` (protected_instance_methods), `🙈instance_funcs` (private_instance_methods), `🙈class_func` (private_class_method) |
 | `Integer`                        | `^`, `preserved_reference_to_bitwise_or` |
 | `Float`                          | `^` |

#### Files Added:
 * `ruuuby/class/class.rb`

---

# `v0.0.16`
 * modify various functions to not allocate un-necessary memory (ex: call `.reverse_each` instead of `reverse.each`)
 * continued audit on number classes (see notes from v`0.0.15`), add domain checks for `𝕌?`, `𝔹?`
 * add first multi-step audit test against project file structure (will require better solution, just a starting point)
 * add/move the following methods/aliases:

 | for                              | methods/aliases added/moved                               |
 | -------------------------------- | --------------------------------------------------------- |
 | `Array`                          | `equal_contents?` (`≈≈` now aliases it)                   |
 | `Array`                          | `frequency_counts` (`📊` now aliases it)                  |
 | `Array`                          | `disjunctive_union` (`⊕` now aliases it)                  |
 | `Array`                          | `↩️` (reverse), `↩️!` (reverse!), `↩️∀` (reverse_each)   |
 | `Object`                         | `🅱️?` (alias to `bool?`), `🛑🅱️❓`                       |
 | `Integer`                        | `∞?`, `𝕌?`                                                |
 | `Float`, `Complex`, `BigDecimal` | `𝕌?`                                                      |
 | `Numeric`                        | `𝕌?`, `𝔹?`                                                |
 | `Hash`                           | `🗝?`, `∃🗝?` (both alias `key?`, same as `🔑?`, `∃🔑?`) |

---

# `v0.0.15`
 * add directory `ruuuby/class/enumerable`, move `ary.rb`, `hsh.rb` and newly created `set.rb` into it
 * add files: `ruuuby/module/enumerable.rb` and `ruuuby/class/nums/numeric.rb`
 * move various existing functions/aliases from sub-classes into common parent modules and/or classes where possible, ex: `∌?` out of `Array` and into `enumerable` to share common features w/ others like `Set`
 * move certain module/class initial definition/creation into `ruby_class_mods.c`
 * for number classes (ex: `Integer`), fix various logical/performance/test-coverage flaws for funcs like `ℕ?`

 |  for            | methods/aliases added/moved                      |
 | --------------- | ------------------------------------------------ |
 | `Array`         | `start_with?`, `ensure_start!`                   |
 | `Set`           | `remove_empty!`, `∅?` (empty?), `∀` (each), `∋?` |
 | `Enumerable`    | `∌?`, `⨍` (map)                                  |
 | `Numeric`       | `∞?` (infinite?)                                  |
 | `Integer`       | `finite?`, `infinite?`                             |

---

# `v0.0.14`
 * add gem `'tty-command', '~> 0.9.0'` to group `runtime`
 * for use by `audit RSpecs`: start various means of tracking internal versions, configs, etc; will help form dynamically generated audits and reports
 * temporarily remove `.travis.yml` (auto-generated at project creation but would be useful to utilize)
 * adjust naming on param check functions (in `Ruuuby::ParamErr`), ex: `🛑❓bool` change to `🛑bool❓`

---

# `v0.0.13`
 * move utility functionality from `spec_helper.rb` and others into newly created Directory: `spec/helpers/`
 * remove param:`use_partial_fill_in` from `String`'s funcs `ensure_start!` and `ensure_ending!`
 * heavily adjust usage/style for throwing param errors via `Ruuuby::Err` now(`Ruuuby::ParamErr`)
 * add new type of RSpec: `audit`
 
 | for                  | methods/aliases added |
 | -------------------- | --------------------- |
 | `Hash`               | `∀` (each), `∅?` (empty) |
 | `Kernel`             | `🛑` (raise), `√` (Math.sqrt) |
 | `Module`             | `∃func?` (func created and alias removed), `∃🙈func?` (private_method_defined?) |
 | `NilClass`, `String` | `∅?` (empty) |
 | `Array`              | `ensure_ending!`, `end_with?`, `∅?` (empty), `uniq_to_me` (∖) |
 | `Object`             | `🛑❓bool`, `🛑❓int`, `🛑❓ary`, `🛑❓str`, `🛑❓stry`, `🛑❓str_or_ary` |

* remove the following methods/aliases:

| for             | methods/aliases removed |
| --------------- | --------------------- |
| `Ruuuby::Err`   | `param¬bool`, `param¬str`, `param¬stry`, `param¬ary`, `param¬module`, `param¬class` |

---

# `v0.0.12`
 * organize `ruuuby/version.rb` into major, minor, & tiny versions
 * add string generating macros for `rb_require` in `ruby_class_mods.c`
 * remove certain helper funcs from `spec_helper.rb` as core language adds similar wrappers
 * add organization and new information to `help/ruuuby.md`
 * add files: `ruuuby/module/kernel.rb`, `ruuuby/module/module.rb`, and `ruuuby/arg_err.rb`
 
 | for                 | methods/aliases added |
 | ------------------- | --------------------- |
 | `Module`        | `🙈`, `🙈constants⟶`, `∃const?`, `∃func?`, `∃func_alias?` |
 | `Kernel`        | `∃module?`, `∃class?` |
 | `Ruuuby::Err`   | `param¬bool`, `param¬str`, `param¬stry`, `param¬ary`, `param¬module`, `param¬class` |
 | `Ruuuby::Err::WrongParamType` | `generate_error_text`, `throw` |
 | `Object`        | `stry?`               |

---

# `v0.0.11`
 * add more organization to `extconf.rb`
 * add `bin/audit_quick` for faster iterative development
 * add missing section in performance testing tiers and general cleanup to some RSpec structure
 * move/add the following to `ruby_class_mods.c`
   * move `Array`'s added method `>>`
   * move `String`'s added method `>>`
   * add private method `disjunctive_union` to `Array` for use in method`⊕`
 
 | for                 | methods/aliases added |
 | ------------------- | --------------------- |
 | `Hash`              | `🔑?`, `∃🔑?`         |
 | `Array`             | `∀`, `📊`, `≈`        |
 | `Ruuuby`            | `∃module?`, `∃class?` |

---

# `v0.0.10`
 * move various `require` statements from `ruuuby.rb` to `ruby_class_mods.c`
 * remove all `Ruuuby::Enum`'s and relating references
 * add/update minor details to `README.md`
 * add `help/jruby.md` to document jruby extensions gotchas along the way
 * add initial `Dockerfile` and `docker-compose.yml`
 
 | class        | methods added                |
 | -----------  | ---------------------------- |
 | `Integer`    | `ℕ?`, `ℤ?`, `ℚ?`, `ℂ?`, `ℝ?` |
 | `Float`      | `ℕ?`, `ℤ?`, `ℚ?`, `ℂ?`, `ℝ?` |
 | `BigDecimal` | `ℕ?`, `ℤ?`, `ℚ?`, `ℂ?`, `ℝ?` |
 | `Complex`    | `ℕ?`, `ℤ?`, `ℚ?`, `ℂ?`, `ℝ?` |
 | `Rational`   | `ℕ?`, `ℤ?`, `ℚ?`, `ℂ?`, `ℝ?` |

---

# `v0.0.9`
 * add example usage in `README.md`
 * add various aliases and functions for additional set math operations
 
 | class    | method(s)/alias(es) added |
 | -------  | ------------------------- |
 | `Array`  | `∌?`, `∋?`                |
 | `String` | `∌?`, `∋?`, `∈?`, `∉?`    |
 
---

# `v0.0.8`
 * mark various files with `UTF-8` encoding: `# -*- encoding : utf-8 -*-`
 * add `help` directory to contain troubleshooting documentation
 * for now, remove `gem`: `simplecov` and temporarily stop tracking LOCs coverage until JRuby extensions are added in
 * extend usage of pre-processing for C files
 * increase scope of performance RSpecs, light adjustments to remaining RSpecs for clarity & future scope
 * add various aliases to existing Ruby functions/fields/constants/etc
 
| class           | base reference                          | alias         |
| --------------- | --------------------------------------- | ------------- |
| `Object`        | method: `object_id`                     | `🆔`          |
| `Object`        | method: `freeze`                        | `❄️`          |
| `Object`        | method: `frozen?`                       | `❄️?`         |
| `Array`         | method: `∑`                             | `each`        |
| `Array`         | method: `⨍`                             | `map`         |

 * added the following methods:
 
 | class    | method added     |
 | -------  | ---------------- |
 | `Array`  | `>>`             |
 | `Array`  | `⊕`              |
 | `Array`  | `∖`              |

 * add/replace various Ruby functions with native C-extensions (`ruuuby/ext/ruby_class_mods/ruby_class_mods.c`):
 
 | modified class   | funcs added/replaced  |
 | --------------- | --------------------- |
 | `Object`        | `hsh?`                |
 | `Array`         | `remove_empty!`       |

---

# `v0.0.7`
 * add gem `'rake-compiler', '~> 1.1.0'` to group `development`
 * adjust `bin/audit`, `ruuuby.gemspec`, `Rakefile`, etc to support native C-extensions
 * added section `project layout` and update formatting to `README.md`
 * replace various Ruby functions with native C-extensions (`ruuuby/ext/ruby_class_mods/ruby_class_mods.c`):
 
 | modified class   | funcs replaced                          |
 | --------------- | --------------------------------------- |
 | `Object`        | `ary?`, `bool?`, `int?`, `str?`, `sym?` |
 | `NilClass`      | `empty?`                                |

---

# `v0.0.6`
 * add {`Ruuuby::Enum::Text`}
 * minor changes/functions-added to DRY some code
 * add `Gemfile.lock` to `.gitignore`
 
 | class    | method added     |
 | -------  | ---------------- |
 | `Object` | `sym?`           |
 | `String` | `>>`             |
 | `String` | `ensure_start!`  |
 | `String` | `ensure_ending!` |

---

# `v0.0.5`
 * for time being, remove ruby `v2.7` requirement
 * `freeze` various constants and modules
 * slightly clean-up (with helper functions) and expand RSpec scenario coverage
 
 | class    | method added |
 | -------- | ------------ |
 | `Object` | `str?`       |

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

| added path | reference | notes |
| ---: | --- | --- |
| `lib/class/ary.rb` | ``Array`` |  |
| `lib/class/int.rb` | ``Integer`` |  |

| class | method(s) added |
| --- | --- |
| `Object` | `int?` |
| `Object` | `ary?` |
| `Array` | `remove_empty!` |

---

# `v0.0.2`
| class | method(s) added |
| --- | --- |
| `Object` | `bool?` |

---

# `v0.0.1`

| added path | reference | notes |
| ---: | --- | --- |
| `CHANGELOG.md` |  |  |
| `lib/ruuuby/class/nil.rb` | `NilClass` |  |
| `lib/ruuuby/enum/emoji.rb` |  | `Ruuuby::Enum::Emoji` |
| `bin/audit` |  | for running rdoc, rspecs, and coverage reports |

| class | method(s) added |
| --- | --- |
| `NilClass` | `empty?` |

---

# `v0.0.0`

---
