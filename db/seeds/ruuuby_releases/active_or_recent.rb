# encoding: UTF-8

@v0_0_40 = ::RuuubyRelease.spawn(0, 0, 40)
@v0_0_40.add_comments(
    [
        "track `Just-In-Time Compiler` feature through `locale RSpecs` (and eventually the `'Ruuuby Engine'`)",
        'add first usage of Ruby `Refinements` w/ `using ::Math::NumberTheory::ℤ³` to refine func{`≡`} onto Class{`Integer`}',
        'move func{`gcd`} to `Math::NumberTheory::ℤ²`, core-implementation moved to `C-ext` (note: while this ~doubles the performance (for just math operations during runtime w/o initial error checks) funcs like `🛑num❓` CAN take `90%` of the functions execution time (atm))',
        'start adding content for `ORMs: {`RuuubyDir`, `RuuubyFile`}` to help determine direction of most useful functionality needed',
        'start preparing extension code for large scale refactorings to `ThetaAngle`; (also remove func{`to_a`} while it does not have a use-case for `ThetaAngle`',
        'switch `Ruuuby Engine Logging` to utilize the same feature loading & setup w/ `environment variables`'
    ]
)
@v0_0_40.spawn_kclass_method(@f10, 'as_source_ruby', 'Symbol')
@v0_0_40.spawn_kclass_methods(@f10, 'ENV', %w(parse_feature_behaviors validate_feature_behavior_syntax!))
@v0_0_40.spawn_kclass_method(@f15, 'fetch_by_type', 'RuuubyGem')
@v0_0_40.spawn_kclass_method(@f32, 'fast_gcd', 'Math::NumberTheory::ℤ²')
@v0_0_40.spawn_kclass_method(@f32, 'congruent?', 'Math::NumberTheory::ℤ³')
@v0_0_40.spawn_kclass_method(@f32, '≡', 'Integer')

@v0_0_41 = ::RuuubyRelease.spawn(0, 0, 41)
@v0_0_41.path_added('ext/ruby_class_mods/c5_internal_structs.h', '', '', @f98)
@v0_0_41.path_added('ext/ruby_class_mods/c6_feature_macros.h', '', '', @f98)
#@v0_0_41.path_added('lib/ruuuby/math/stats/stats.rb', '', '', @f35)
#@v0_0_41.path_added('lib/ruuuby/math/stats/time_series_analysis.rb', '', '', @f35)
@v0_0_41.path_added('lib/ruuuby/math/geometry/shape/shape.rb', 'Math::Geometry::Shape', 'not currently utilized, just file added early', @f34)
@v0_0_41.path_added('lib/ruuuby/math/geometry/shape/plane_figure.rb', 'Math::Geometry::PlaneFigure', 'same as above desc.', @f34)
@v0_0_41.path_added('lib/ruuuby/math/geometry/shape/quadrilateral.rb', 'Math::Geometry::Triangle', 'same as above desc.', @f34)
@v0_0_41.path_added('lib/ruuuby/math/geometry/shape/shape.rb', 'Math::Geometry::Quadrilateral', 'same as above desc.', @f34)
@v0_0_41.path_added('db/db_schema.rb', '', 'split content from file `db/db.rb`', @f15)
@v0_0_41.path_added('lib/ruuuby/ruuuby/api/abstract_space.rb', '', 'starting ground for molding base-abstract class needed for API-like classes', @f02)
@v0_0_41.path_added('lib/ruuuby/ruuuby/api/api_brew.rb', '', 'not currently utilized, just file added early', @f02)
@v0_0_41.path_added('lib/ruuuby/ruuuby/api/api_docker.rb', '', 'same as above desc.', @f02)
@v0_0_41.add_comments(
    [
        'iterative upgrade for `💎.engine` w/ `JIT`, `CLI`, `logging`; (further enable tracking patterns w/ memory, cpu, and other OS stats)',
        'apply clean-ups to{`ThetaAngle`}; (bug-fixes, repetitive-code elimination, increased bitwise-flags utilization, Symbol repr replace w/ FIXNUM, etc)',
        'start applying cleaner `OOP` design for badly needed areas (ex: remove various `Singletons & globals`)',
        '(wip) create logical-divisions within the `RSpec` categories, significantly enabling more content to be `lazy-loaded` (faster start-up time esp. for targeted scripts; ex: compare `rspec_locale{0.04s}` vs `rspec_locale_full{1.33s})`',
        'continued resolution of missing coverage from previous versions, still `wip`',
    ]
)
@v0_0_41.spawn_kclass_method(@f10, 'palindrome?', 'String')
@v0_0_41.spawn_kclass_method(@f15, 'num_where', 'ApplicationRecord')
@v0_0_41.spawn_kclass_method(@f15, 'num_release_tags', 'GitCommit')
@v0_0_41.spawn_kclass_method(@f15, 'num_released', 'RuuubyRelease')
@v0_0_41.spawn_kclass_method(@f22, 'memory_peak_this_runtime', 'Ruuuby::MetaData::RuuubyEngine')
@v0_0_41.spawn_kclass_method(@f32, 'semiprime?', 'Math::NumberTheory')
@v0_0_41.spawn_kclass_method(@f33, 'permutations', 'Math::Combinatorics')
@v0_0_41.spawn_kclass_method(@f35, 'arithmetic_mean', 'Math::Stats')
@v0_0_41.spawn_kclass_method(@f35, 'exponential_moving_average', 'Math::Stats::TimeSeries')

@v0_0_42 = ::RuuubyRelease.spawn(0, 0, 42)
@v0_0_42.add_comments(
    [
        'change normalizer from{!∅} to{∉∅}; add{f06_b03} to provide this normalizer for funcs{ary?, 🛑ary❓}',
        'provide function aliases{`wma`, `ema`} to `Math::Stats::TimeSeries`'
    ]
)
@v0_0_42.spawn_kclass_method(@f27, 'octant?', 'ThetaAngle')
@v0_0_42.spawn_kclass_method(@f35, 'median', 'Math::Stats')
@v0_0_42.spawn_kclass_method(@f35, 'weighted_moving_average', 'Math::Stats::TimeSeries')

@v0_0_43 = ::RuuubyRelease.spawn(0, 0, 43)
@v0_0_43.path_added('lib/ruuuby/math/geometry/theta_angle/context_str.rb', '', 'Refinements onto `String` for parsing to and from `ThetaAngle`', @f27)
@v0_0_43.path_added('lib/ruuuby/ruuuby/engine/ruuuby_engine_component.rb', '', 'start of cleaner design w/ `RuuubyEngine` and relating objs', @f10)
@v0_0_43.path_added('lib/ruuuby/ruuuby/api/api_locale.rb', '', '', @f10)
@v0_0_43.path_added('bin/manually_execute/clean_up', '', 'delete any temporary/generated content, quick way to force a full re-compile', @f10)
@v0_0_43.add_comments(
    [
        'add{f06_b04} to provide normalizer{∈𝕌} for funcs{flt? 🛑flt❓}',
        'start adding textual parsing for `ThetaAngle` via `Refinement` in{`ThetaAngle::ContextStrParsing`}',
        'increase scope tested in some db_audit funcs',
    ]
)

# (Refinements)
@v0_0_43.spawn_kclass_methods(@f27, 'String', %w(° °?))
@v0_0_43.spawn_kclass_method(@f33, 'len_powerset', 'Math::Combinatorics::𝕎¹')
@v0_0_43.spawn_kclass_method(@f33, 'len_ordered_with_replacement', 'Math::Combinatorics::𝕎²')
@v0_0_43.spawn_kclass_methods(@f34, 'Math::Stats::TimeSeries', %w(aroon_up aroon_down aroon_oscillator simple_moving_average))

@v0_0_44 = ::RuuubyRelease.spawn(0, 0, 44)
@v0_0_44.path_added('lib/ruuuby/math/stats/time_series_data.rb', '', '', @f34)
@v0_0_44.path_added('ext/ruby_class_mods/c7_times_series_data.h', '', '', @f35)
@v0_0_44.path_added('lib/ruuuby/ruuuby/engine/ruuuby_api_component.rb', '', '', @f97)
@v0_0_44.update_gem(::RuuubyGem.find_by_name('rugged'), '1.0.1')
@v0_0_44.update_gem(::RuuubyGem.find_by_name('rspec-benchmark'), '0.6.0')
@v0_0_44.add_comments(
    [
        'start migration of enabling `non-core feature code` to be included/excluded before `compilation` during `pre-processing` as opposed to during `start-up` and/or `runtime`',
        "(`wip`) track `OpenCL` & `OpenGL` through `locale RSpecs` (and eventually the `'Ruuuby Engine'`)",
        'add majority of needed initial `ThetaAngle` syntax parsing content; remaining is pending implementation of new functionality/refactors for `ThetaAngle`',
        '(`wip`) create class{`TimeSeriesData`}, in similair fashion as `ThetaAngle` (`Ruby object` wrapper over a `C struct instance`)',
        'increase and track various default-values for `Ruby Garbage Collector configs`; `TimeSeriesData` will eventually be able to be used for discovering optimal `GC-settings`',
     ]
)
@v0_0_44.spawn_kclass_methods(@f22, 'Ruuuby::MetaData::RuuubyEngine::F22B00', %w(percentage_protected_from_minor_marks percentage_fragmentation stats_bytes_per_object_slot stats_slots_per_heap_page perform_full perform_quick))
# (Refinements)
@v0_0_44.spawn_kclass_methods(@f27, 'String', %w(ʳ? ʳ ᵍ? ᵍ 𝞽? 𝞽))
@v0_0_44.spawn_kclass_methods(@f35, 'TimeSeriesData', %w(mem_size free_memory len sma mean sum max min median range variance std_dev percentile mse))

@v0_0_45 = ::RuuubyRelease.spawn(0, 0, 45)
@v0_0_45.path_added('lib/ruuuby/class/bitwise_flag.rb', 'Ruuuby::BitwiseFlag', '', @f10)
@v0_0_45.path_added('.gitattributes', '', '', @f22)
@v0_0_45.path_added('lib/ruuuby/math/geometry/shape/sphere.rb', 'Math::Geometry::Sphere', 'not currently utilized, just file added early', @f35)
@v0_0_45.update_gem(::RuuubyGem.find_by_name('bundler'), '2.2.0.rc.1')
@v0_0_45.add_comments(
    [
        'apply iterative upgrade for `Ruuuby Engine`, also track `GIT attributes` w/ `💎.engine.api_git`',
        'fix various edge-case bugs w/ `ThetaAngle` <em>bitwise flags</em>; apply same design to `TimeSeriesData`; start creation of re-usable base code for `Bitwise Flags` in general',
        '`ORM`: apply start of refactors for proper support of `RuuubyChangelog` and other automation-functionality; design still `wip` (and thus full `TDD` still withheld)',
        '<em>**remove:**</em> global{`$PRM_MANY`}, update funcs in{`f06`} as needed and slightly increase testing coverage',
        'move various math functions to better suited locations; more to be done',
    ]
)
@v0_0_45.spawn_kclass_methods(@f15, 'RuuubyFeatureBehavior', %w(num_optional num_required))
@v0_0_45.spawn_kclass_methods(@f15, 'RuuubyGem', %w(spawn_version_update spawn_version_initial current_max_changelog_index))
@v0_0_45.spawn_kclass_method(@f15, 'spawn_version_update', 'RuuubyGem')
@v0_0_45.spawn_kclass_methods(@f15, 'ApplicationRecord', %w(orm_Ⓣ_🐍 empty?))
@v0_0_45.spawn_kclass_methods(@f22, 'Ruuuby::MetaData::RuuubyEngine', %w(num_cpu_cores current_user get_compiled_code))
@v0_0_45.spawn_kclass_method(@f31, '∃attribute?', '💎.engine.api_git')
@v0_0_45.spawn_kclass_method(@f35, 'percentage_error', 'Math::Stats::Descriptive')
@v0_0_45.spawn_kclass_methods(@f35, 'TimeSeriesData', %w(ρ flags mape normalize! print_debugging first last λ Λ has_zero? has_negative? normalized? even? strictly_increasing? strictly_decreasing? all_same?))

@v0_0_46 = ::RuuubyRelease.spawn(0, 0, 46)
@v0_0_46.path_added('lib/ruuuby/math/physics/physics.rb', 'Math::Physics', 'not currently utilized, just file added early', @f10)
@v0_0_46.path_added('lib/ruuuby/math/physics/wave.rb', 'Math::Physics::Wave', 'same as above desc.', @f10)
@v0_0_46.path_added('lib/ruuuby/math/physics/harmonic_analysis.rb', 'Math::Physics::HarmonicAnalysis', 'same as above desc.', @f10)
@v0_0_46.path_added('lib/ruuuby/math/forex/forex.rb', 'Math::Forex', 'same as above desc.', @f10)
@v0_0_46.path_added('lib/ruuuby/math/forex/currency_matrix.rb', 'Math::Forex::CurrencyMatrix', '`wip`', @f10)
@v0_0_46.path_added('lib/ruuuby/class/nums/vector.rb', 'Vector', '`Ruby` built-in Class (now loaded in)', @f10)
@v0_0_46.path_added('lib/ruuuby/class/nums/matrix.rb', 'Matrix', '`Ruby` built-in Class (now loaded in)', @f37)
@v0_0_46.path_added('lib/ruuuby/math/algebra/tropical.rb', 'Math::Algebra::Tropical', '', @f38)
@v0_0_44.path_added('ext/ruby_class_mods/c8_graphs.h', 'PseudoGraph', 'same creation style as `ThetaAngle` & `TimeSeriesData`', @f38)
@v0_0_44.path_added('lib/ruuuby/protocol/unix_socket.rb', 'UNIXSocket', '`Ruby` built-in Class (now loaded in)', @f39)
@v0_0_46.path_added('help/extensions/c/open_mp.md', '', '`wip`', @f98)
@v0_0_46.add_comments(
    [
        'add support for `Tropical Algebra`',
        "`wip`: track `OpenMP` in same style as w/ `OpenGL` & `OpenCL`",
        '⚠️: start of wide-scale refactoring to general structure; tech-debt will out-pace rate of implementation/testing for at least a few versions, then more effective code clean-up will be enabled and performed',
    ]
)
@v0_0_46.spawn_kclass_methods(@f10, 'Vector', %w(∅?))
@v0_0_46.spawn_kclass_methods(@f37, 'Matrix', %w(▣? num_rows num_cols ∀ₓ↘ ∀ₓᵢ↘ ↘_to_a ∀ₓᵢⱼ))
@v0_0_46.spawn_kclass_methods(@f37, 'Math::Forex::CurrencyMatrix', %w(η̂! algo_🌴_arbitrage karps_algorithm))
# (Refinements)
@v0_0_46.spawn_kclass_methods(@f37, 'Math::Algebra::Tropical::ContextNumeric', %w(⨁ ⨂))
@v0_0_46.spawn_kclass_methods(@f37, 'Math::Algebra::Tropical::ContextMatrix', %w(⨁ ⨁! ⨂ ⨂ⁿ))

@v0_0_47 = ::RuuubyRelease.spawn(0, 0, 47)
@v0_0_47.path_added('lib/ruuuby/math/finance/benchmarks', '', 'not currently utilized, just file added early', @f10)
@v0_0_47.path_added('lib/ruuuby/heuristics', 'Ruuuby::', 'same as above description', @f10)
@v0_0_47.update_gem(::RuuubyGem.find_by_name('rake-compiler'), '1.1.1')
@v0_0_47.update_gem(::RuuubyGem.find_by_name('rubygems-update'), '3.2.0.rc.1')
@v0_0_47.add_comments(
    [
        'add T e C h D e B t ♪~ ᕕ(ᐛ)ᕗ',
    ]
)
@v0_0_47.spawn_kclass_methods(@f10, 'Matrix', %w(ᵀ))
@v0_0_47.spawn_kclass_methods(@f12, 'File::CSV', %w(read))
@v0_0_47.spawn_kclass_methods(@f22, '💎.engine.api', %w(pid_terminate))
@v0_0_47.spawn_kclass_methods(@f22, '💎.engine.api_locale', %w(iconv_version iconv_supported_encodings))
@v0_0_47.spawn_kclass_methods(@f38, 'TimeSeriesData', %w(Q₁ Q₃ IQR outliers_lower outliers_upper boundary_outliers_min boundary_outliers_max sum_squared sum_of_squares sum_weighted mean_weighted mean_geometric nᵗʰ_percent_rank healthy?))
@v0_0_47.spawn_kclass_methods(@f38, 'PseudoGraph', %w([] set_edge set_edge_inverse num_nodes empty? free_memory print_debugging))

@v0_0_48 = ::RuuubyRelease.spawn(0, 0, 48)
@v0_0_48.path_added('lib/ruuuby/protocol/http_request.rb', '', "starting w/ approach of re-inventing the wheel for learning opportunity of up-close testing against `NGINX`, no design locks against replacement w/ any `HTTP gem` in future versions", @f10)
@v0_0_48.path_added('db/queries/migration_test.sql', '', 'for learning purposes (recommended online as well), migrations for PostgreSQL will be created/executed w/ raw SQL statements', @f15)
@v0_0_48.path_added('db/helpers/db_connection.rb', '', 'testing design', @f39)
@v0_0_48.path_added('services/nginx/includes/*.nginx (many files)', '', '', @f39)
@v0_0_48.path_added('services/web_assets/Dockerfile', '', 'file added early, to be completed <= version{`0.0.50`}; to be eventually divided into 2 separate container types, handles JS/CSS/HTML parsing w/ `Node.JS`', @f39)
@v0_0_48.path_added('services/web_assets/ruuuby.html', '', 'same as above', @f39)
@v0_0_48.path_added('services/web_assets/ruuuby.js', '', 'same as above', @f39)
@v0_0_48.add_gem('pg', '1.2.3', 1, %w(DB), '::PG', '::VERSION')
@v0_0_48.add_gem('docker-api', '1.34.2', 1, %w(Docker), '::Docker', '::VERSION')
@v0_0_48.add_comments(
    [
        'add initial `Docker services:` {`nginx`, `postgresql`, `pgadmin4`} all `wip` w/ others inc but just as development-utils atm, not to be required by gem/runtime)',
        'designate feature support/expansion for `WebGL` based derivatives to fully precede over `OpenGL` in `99.9% of scenarios`',
        'add `RSpec categories:` {`service`, `system`}',
        '-> `system tests` for now will act as a combination of `acceptance-testing`, `system-tests`, and `chaos-monkey-testing`',
        '-> `service tests` are not yet utilized, but will be for future `Service objects`, (w/ context of `ORM`/`Onion Architecture`, not `Docker`/`microservices`)',
        'apply initial steps for cross-OS compatibility, process of doing so is helping reveal previously un-noticed design redundancies and/or gaps, a few fixed in this version',
        'indeterminate hiatus for math/theory studies to avoid adding tech-debt that would otherwise get created within the next 10+ versions',
    ]
)
@v0_0_48.spawn_kclass_methods(@f10, 'Net::HTTPHeader', %w(cache_warmup ∃ᴴ?))
@v0_0_48.spawn_kclass_methods(@f10, 'Array', %w(∀𝚡λ𝑓🖨️))
@v0_0_48.spawn_kclass_methods(@f10, 'Hash', %w(λ𝑓∀🔑：₍🔑∉₎ λ𝑓∀🔑：₍🔑∉₎!))
@v0_0_48.spawn_kclass_methods(@f10, 'File::YAML', %w(read))
@v0_0_48.spawn_kclass_methods(@f10, 'Ruuuby::Protocols::RequestHTTP', %w(execute!))
@v0_0_48.spawn_kclass_methods(@f22, '`💎.engine.os`', %w(windows? unix? mac? linux?))
@v0_0_48.spawn_kclass_methods(@f39, '`🐋`/`💎.engine.api_locale.api_docker`', %w(healthy? ∃🌐? ∃🐋? find_🌐_by_name find_🐋_by_name find_🐋_by_id ♻️_🌐_by_name))

@v0_0_49 = ::RuuubyRelease.spawn(0, 0, 49)
@v0_0_49.path_added('lib/ruuuby/module/bundler.rb', '', '', @f10)
@v0_0_49.path_added('lib/ruuuby/module/gem.rb', '', '', @f10)
@v0_0_49.path_added('services/web_assets/*', 'multiple files & dirs', 'code not directly relating to `ruuuby engine` will not normally be documented (until pending `DB` overhaul)', @f10)
@v0_0_49.path_added('lib/ruuuby/api/docker/docker_service.rb', 'RuuubyService', 'temp util', @f39)
@v0_0_49.path_added('lib/ruuuby/api/docker/docker_service_set.rb', 'RuuubyServiceSet', 'temp util', @f39)
@v0_0_49.path_added('bin/console_docker', 'RuuubyServiceSetDev', 'offers funcs like: `build_web_assets`, `build_js`, `build_html`, `build_css`, `run_dev`', @f39)
@v0_0_49.update_gem(::RuuubyGem.find_by_name('docker-api'), '2.0.0.pre.1')
@v0_0_49.add_comments(
    [
        '⚠️: overall code (esp. `math`/`DB` related) still `on-hold`, intermediate version release for organization (ex: many `Classes`/`functions` added are temporary, intentionally created with later removal planned)',
        'add `Docker`{`service_js`}, add `multi-stage-builds` to existing services, add `zsh` to `development containers`',
        '-> create `node.js server`, add first `REST end-point` offering minification of `HTML` and `CSS` files',
        'apply some organization/expansion to various utility APIs: `git`, `docker`, `zsh`, `brew`, etc',
        '(iterative) further enable `lazy-loading`, lots more to be done (has very significant impact on the \'engine\')',
        'for `mac-os`, start utilizing `osascript` (enables niche automation areas, silly ex: compiling w/ voice commands)'
    ]
)
@v0_0_49.spawn_kclass_methods(@f10, 'Object', %w(attribute_versionable))
@v0_0_49.spawn_kclass_methods(@f10, 'ENV', %w(∀🔑∃_value?))
@v0_0_49.spawn_kclass_methods(@f10, 'Hash', %w(∄🔑? ∀🔑∃_value?))
@v0_0_49.spawn_kclass_methods(@f10, 'Array', %w(convert_to_json))
@v0_0_49.spawn_kclass_methods(@f10, 'String', %w(clean!))
@v0_0_49.spawn_kclass_methods(@f10, 'Heuristics', %w(clean))
@v0_0_49.spawn_kclass_methods(@f10, 'Net::HTTPResponse', %w(time_received content_length))
@v0_0_49.spawn_kclass_methods(@f10, '💎.engine.api_zsh', %w(run_script))
@v0_0_49.spawn_kclass_methods(@f10, '💎.engine', %w(run_apple_script! curl_get))
@v0_0_49.spawn_kclass_methods(@f10, '💎.engine.api_locale', %w(healthy? healthy_encoding?))
@v0_0_49.spawn_kclass_methods(@f10, '🍺', %w(healthy? analytics? analytics_disabled? analytics_set_on analytics_set_off doctor cleanup))
@v0_0_49.spawn_kclass_methods(@f31, '💎.engine.api_git', %w(∃index_conflicts? ∃fixable_syntax_errors?))
@v0_0_49.spawn_kclass_methods(@f39, '`🐋`/`💎.engine.api_locale.api_docker`', %w(∀🐋 connected? connect connect! disconnect disconnect! version_compose))
@v0_0_49.spawn_kclass_methods(@f39, 'Docker::Container', %w(alpine? debian? dev? prod? healthy? env os os_version linux_kernel_version os_architecture mounts ∃mount? env_vars file_create cmd!))

@v0_0_49.save!
$ruuuby_release_obj_curr = @v0_0_49
