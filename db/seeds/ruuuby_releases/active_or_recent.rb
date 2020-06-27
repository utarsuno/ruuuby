# coding: UTF-8

@v0_0_38 = RuuubyRelease.spawn(0, 0, 38)
@v0_0_38.add_file('lib/math/stats/statistical_learning.rb', 'Math::Stats::StatisticalLearning', 'not currently in use', @f30)
@v0_0_38.add_file('lib/math/stats/probability_theory.rb', 'Math::Stats::ProbabilityTheory', 'not currently in use', @f30)
@v0_0_38.add_file('lib/math/stats/descriptive_statistics.rb', 'Math::Stats::DescriptiveStatistics', 'not currently in use', @f30)
@v0_0_38.add_file('lib/math/combinatorics/combinatorics.rb', 'Math::Combinatorics', 'not currently in use', @f30)
@v0_0_38.add_comments(
    [
        '(`f98`) replace all usages of c-ext-func{`rb_eval_string`} and others that were significantly slowing down `startup/initial-load time`',
        '(`f18`) moved to {`f98_b02`}, `f18` will now cover the math module `Space`',
        'remove funcs{`class?`, `module?`, `singleton?`} from Class(`Object`); (functionality covered by `🧬`)',
        'remove func{`𝔠`} from `Kernel` (and thus remove `functional-style` support from (`f05`))',
        'track `git tags` w/ related `ORMs` & `APIs`; however, version automation tasks paused until `TDD` catches up for `DB` and/or some event/queue-based logic is added (ex: RabbitMQ)',
        'apply various misc cleanups w/ others `wip`'
    ]
)
@v0_0_38.changelog.added_method_to_class(@f30, :∋ˢ?, ::Math::Space::NucleotideSpace)
@v0_0_38.changelog.added_method_to_class(@f31, :release_tags, ::Ruuuby::MetaData::GitAPI)
@v0_0_38.changelog.added_method_to_class(@f31, :branch_names, ::Ruuuby::MetaData::GitAPI)
@v0_0_38.changelog.added_method_to_class(@f31, :remote_release_current, ::Ruuuby::MetaData::GitAPI)
@v0_0_38.changelog.added_method_to_class(@f31, :remote_release_previous, ::Ruuuby::MetaData::GitAPI)
=begin
# TODO: off by one bug will be fixed once actual `changelog` gets implemented
@v0_0_38.changelog.added_method_to_class(@f32, :aliquot_sum, ::Math::NumberTheory)
@v0_0_38.changelog.added_method_to_class(@f32, :deficient?, ::Math::NumberTheory)
@v0_0_38.changelog.added_method_to_class(@f32, :deficiency, ::Math::NumberTheory)
@v0_0_38.changelog.added_method_to_class(@f32, :abundant?, ::Math::NumberTheory)
@v0_0_38.changelog.added_method_to_class(@f32, :abundance, ::Math::NumberTheory)
@v0_0_38.changelog.added_method_to_class(@f32, :abundancy_index, ::Math::NumberTheory)
@v0_0_38.changelog.added_method_to_class(@f32, :composite?, ::Math::NumberTheory)
=end

@v0_0_39 = RuuubyRelease.spawn(0, 0, 39)
@v0_0_39.add_file('lib/ruuuby/math/expr/seq/arithmetic', 'Math::Expr::ArithmeticSequence', '(`Ruby` version{`2.7.1`} just added `Enumerator::ArithmeticSequence`; the timing! Will be investigating before further expanding this Class)', @f10)
@v0_0_39.add_file('lib/ruuuby/math/expr/seq/geometric', 'Math::Expr::GeometricSequence', '', @f10)
@v0_0_39.add_file('lib/ruuuby/math/expr/seq/recursive', 'Math::Expr::RecursiveSequence', '', @f10)
@v0_0_39.add_comments(
    [
        'update to Ruby version{2.7.1} from{2.7.0}',
        'gem(`activerecord`) version update from{`5.2.4.1`} to{`5.2.4.3`}',
        'add `RSpec`/QA sections: `integration` & `tech_debt`',
        'add the following `Sequence` objs to `Math::NumberTheory::𝕎¹`: `seq_pronic`, `seq_square`, `seq_fibonacci`, `seq_lucas`, `seq_triangle`, `seq_hexagonal`',
        'remove some non-ASCII characters in `.h` and `.c` files to ease testing/investigation between compilers `clang` & `gcc`',
        '(`f01`, `f02`) both removed, (`f10`) now covers these scenarios w/ feature-behaviors',
        'fix typo for const{ANGLE_TAU}, it is now correctly referenced by{`𝞽`} and not{`τ`}',
        'various edge-case bugs w/ `ThetaAngle` identified, some are fixed for this version',
    ]
)
@v0_0_39.changelog.added_method_to_class(@f32, :digit_sum, ::Math::NumberTheory)
@v0_0_39.changelog.added_method_to_class(@f32, :digital_root, ::Math::NumberTheory)
@v0_0_39.changelog.added_method_to_class(@f32, :additive_persistence, ::Math::NumberTheory)
@v0_0_39.changelog.added_method_to_class(@f32, :almost_perfect?, ::Math::NumberTheory)
@v0_0_39.changelog.added_method_to_class(@f32, :nᵗʰ_euler_totient, ::Math::NumberTheory)
@v0_0_39.changelog.added_method_to_class(@f32, :nᵗʰ_cototient, ::Math::NumberTheory)
@v0_0_39.changelog.added_method_to_class(@f32, :friendly?, ::Math::NumberTheory)
@v0_0_39.changelog.added_method_to_class(@f33, :n_choose_k, ::Math::Combinatorics)

@v0_0_40 = RuuubyRelease.spawn(0, 0, 40)
@v0_0_40.add_gem('rubygems-update', '3.1.4', true, false, %W(CI), '::Gem', '.rubygems_version.to_s')
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
# TODO: missing TDD (for class{Symbol}-> m{as_source_ruby})
@v0_0_40.changelog.added_method_to_class(@f10, :as_source_ruby, ::Symbol)
@v0_0_40.changelog.added_method_to_class(@f10, :parse_feature_behaviors, 'ENV')
@v0_0_40.changelog.added_method_to_class(@f10, :validate_feature_behavior_syntax!, 'ENV')
@v0_0_40.changelog.added_method_to_class(@f15, :fetch_by_type, 'RuuubyGem')
@v0_0_40.changelog.added_method_to_class(@f32, :fast_gcd, ::Math::NumberTheory::ℤ²)
@v0_0_40.changelog.added_method_to_class(@f32, :congruent?, ::Math::NumberTheory::ℤ³)
@v0_0_40.changelog.added_method_to_class(@f32, :≡, ::Integer)

@v0_0_41 = RuuubyRelease.spawn(0, 0, 41)
@v0_0_41.add_file('ext/ruby_class_mods/c5_internal_structs.h', '', '', @f98)
@v0_0_41.add_file('ext/ruby_class_mods/c6_feature_macros.h', '', '', @f98)
#@v0_0_41.add_file('lib/ruuuby/math/stats/stats.rb', '', '', @f35)
#@v0_0_41.add_file('lib/ruuuby/math/stats/time_series_analysis.rb', '', '', @f35)
@v0_0_41.add_file('lib/ruuuby/math/geometry/shape/shape.rb', 'Math::Geometry::Shape', 'not currently utilized, just file added early', @f34)
@v0_0_41.add_file('lib/ruuuby/math/geometry/shape/plane_figure.rb', 'Math::Geometry::PlaneFigure', 'same as above desc.', @f34)
@v0_0_41.add_file('lib/ruuuby/math/geometry/shape/quadrilateral.rb', 'Math::Geometry::Triangle', 'same as above desc.', @f34)
@v0_0_41.add_file('lib/ruuuby/math/geometry/shape/shape.rb', 'Math::Geometry::Quadrilateral', 'same as above desc.', @f34)
@v0_0_41.add_file('db/db_schema.rb', '', 'split content from file `db/db.rb`', @f15)
@v0_0_41.add_file('lib/ruuuby/ruuuby/api/abstract_space.rb', '', 'starting ground for molding base-abstract class needed for API-like classes', @f02)
@v0_0_41.add_file('lib/ruuuby/ruuuby/api/api_brew.rb', '', 'not currently utilized, just file added early', @f02)
@v0_0_41.add_file('lib/ruuuby/ruuuby/api/api_docker.rb', '', 'same as above desc.', @f02)
@v0_0_41.add_comments(
    [
        'iterative upgrade for `💎.engine` w/ `JIT`, `CLI`, `logging`; (further enable tracking patterns w/ memory, cpu, and other OS stats)',
        'apply clean-ups to{`ThetaAngle`}; (bug-fixes, repetitive-code elimination, increased bitwise-flags utilization, Symbol repr replace w/ FIXNUM, etc)',
        'start applying cleaner `OOP` design for badly needed areas (ex: remove various `Singletons & globals`)',
        '(wip) create logical-divisions within the `RSpec` categories, significantly enabling more content to be `lazy-loaded` (faster start-up time esp. for targeted scripts; ex: compare `rspec_locale{0.04s}` vs `rspec_locale_full{1.33s})`',
        'continued resolution of missing coverage from previous versions, still `wip`',
    ]
)
@v0_0_41.changelog.added_method_to_class(@f10, :palindrome?, ::String)
@v0_0_41.changelog.added_method_to_class(@f15, :num_where, 'ApplicationRecord')
@v0_0_41.changelog.added_method_to_class(@f15, :num_release_tags, 'GitCommit')
@v0_0_41.changelog.added_method_to_class(@f15, :num_released, 'RuuubyRelease')
@v0_0_41.changelog.added_method_to_class(@f22, :memory_peak_this_runtime, 'Ruuuby::MetaData::RuuubyEngine')
@v0_0_41.changelog.added_method_to_class(@f32, :semiprime?, 'Math::NumberTheory')
@v0_0_41.changelog.added_method_to_class(@f33, :permutations, 'Math::Combinatorics')
#@v0_0_41.changelog.added_method_to_class(@f35, :arithmetic_mean, 'Math::Stats')
#@v0_0_41.changelog.added_method_to_class(@f35, :exponential_moving_average, 'Math::Stats::TimeSeries')

@v0_0_42 = RuuubyRelease.spawn(0, 0, 42)
@v0_0_42.add_comments(
    [
        'change normalizer from{!∅} to{∉∅}; add{f06_b03} to provide this normalizer for funcs{ary?, 🛑ary❓}',
        'provide function aliases{`wma`, `ema`} to `Math::Stats::TimeSeries`'
    ]
)
@v0_0_42.changelog.added_method_to_class(@f27, :octant?, 'ThetaAngle')
#@v0_0_42.changelog.added_method_to_class(@f35, :median, 'Math::Stats')
#@v0_0_42.changelog.added_method_to_class(@f35, :weighted_moving_average, 'Math::Stats::TimeSeries')
#

@v0_0_43 = RuuubyRelease.spawn(0, 0, 43)
@v0_0_43.add_file('lib/ruuuby/math/geometry/theta_angle/context_str.rb', '', 'Refinements onto `String` for parsing to and from `ThetaAngle`', @f27)
@v0_0_43.add_file('lib/ruuuby/ruuuby/engine/ruuuby_engine_component.rb', '', 'start of cleaner design w/ `RuuubyEngine` and relating objs', @f10)
@v0_0_43.add_file('lib/ruuuby/ruuuby/api/api_locale.rb', '', '', @f10)
@v0_0_43.add_file('bin/manually_execute/clean_up', '', 'delete any temporary/generated content, quick way to force a full re-compile', @f10)
@v0_0_43.add_comments(
    [
        'add{f06_b04} to provide normalizer{∈𝕌} for funcs{flt? 🛑flt❓}',
        'start adding textual parsing for `ThetaAngle` via `Refinement` in{`ThetaAngle::ContextStrParsing`}',
        'increase scope tested in some db_audit funcs',
    ]
)

@v0_0_43.changelog.added_method_to_class(@f34, :aroon_up, 'Math::Stats::TimeSeries')
@v0_0_43.changelog.added_method_to_class(@f34, :aroon_down, 'Math::Stats::TimeSeries')
@v0_0_43.changelog.added_method_to_class(@f34, :aroon_oscillator, 'Math::Stats::TimeSeries')
@v0_0_43.changelog.added_method_to_class(@f34, :simple_moving_average, 'Math::Stats::TimeSeries')
@v0_0_43.changelog.added_method_to_class(@f33, :len_powerset, 'Math::Combinatorics::𝕎¹')
@v0_0_43.changelog.added_method_to_class(@f33, :len_ordered_with_replacement, 'Math::Combinatorics::𝕎²')
# (Refinements)
@v0_0_43.changelog.added_method_to_class(@f27, :°?, ::String)
@v0_0_43.changelog.added_method_to_class(@f27, :°, ::String)

@v0_0_44 = RuuubyRelease.spawn(0, 0, 44)
@v0_0_44.add_file('lib/ruuuby/math/stats/time_series_data.rb', '', '', @f34)
@v0_0_44.add_file('ext/ruby_class_mods/c7_times_series_data.rb', '', '', @f35)
@v0_0_44.add_file('lib/ruuuby/ruuuby/engine/ruuuby_api_component.rb', '', '', @f97)
@v0_0_44.add_file('lib/ruuuby/ruuuby/engine/ruuuby_api_component.rb', '', '', @f97)
@v0_0_44.add_comments(
    [
        'start migration of enabling `non-core feature code` to be included/excluded before `compilation` during `pre-processing` as opposed to during `start-up` and/or `runtime`',
        "(`wip`) track `OpenCL` & `OpenGL` through `locale RSpecs` (and eventually the `'Ruuuby Engine'`)",
        'update gem(`rugged`) version from{`1.0.0`} to{`1.0.1`}',
        'update gem(`rspec-benchmark`) version from{`0.5.1`} to{`0.6.0`}',
        'add majority of needed initial `ThetaAngle` syntax parsing content; remaining is pending implementation of new functionality/refactors for `ThetaAngle`',
        '(`wip`) create class{`TimeSeriesData`}, in similair fashion as `ThetaAngle` (`Ruby object` wrapper over a `C struct instance`)',
        'increase and track various default-values for `Ruby Garbage Collector configs`; `TimeSeriesData` will eventually be able to be used for discovering optimal `GC-settings`',
     ]
)
@v0_0_44.changelog.added_method_to_class(@f22, :percentage_protected_from_minor_marks, 'Ruuuby::MetaData::RuuubyEngine::F22B00')
@v0_0_44.changelog.added_method_to_class(@f22, :percentage_fragmentation, 'Ruuuby::MetaData::RuuubyEngine::F22B00')
@v0_0_44.changelog.added_method_to_class(@f22, :stats_bytes_per_object_slot, 'Ruuuby::MetaData::RuuubyEngine::F22B00')
@v0_0_44.changelog.added_method_to_class(@f22, :stats_slots_per_heap_page, 'Ruuuby::MetaData::RuuubyEngine::F22B00')
@v0_0_44.changelog.added_method_to_class(@f22, :perform_full, 'Ruuuby::MetaData::RuuubyEngine::F22B00')
@v0_0_44.changelog.added_method_to_class(@f22, :perform_quick, 'Ruuuby::MetaData::RuuubyEngine::F22B00')
# (Refinements)
@v0_0_44.changelog.added_method_to_class(@f27, :ʳ?, ::String)
@v0_0_44.changelog.added_method_to_class(@f27, :ʳ, ::String)
@v0_0_44.changelog.added_method_to_class(@f27, :ᵍ?, ::String)
@v0_0_44.changelog.added_method_to_class(@f27, :ᵍ, ::String)
@v0_0_44.changelog.added_method_to_class(@f27, :𝞽?, ::String)
@v0_0_44.changelog.added_method_to_class(@f27, :𝞽, ::String)
@v0_0_44.changelog.added_method_to_class(@f35, :mem_size, 'TimeSeriesData')
@v0_0_44.changelog.added_method_to_class(@f35, :free_memory, 'TimeSeriesData')
@v0_0_44.changelog.added_method_to_class(@f35, :len, 'TimeSeriesData')
@v0_0_44.changelog.added_method_to_class(@f35, :sma, 'TimeSeriesData')
@v0_0_44.changelog.added_method_to_class(@f35, :mean, 'TimeSeriesData')
@v0_0_44.changelog.added_method_to_class(@f35, :sum, 'TimeSeriesData')
@v0_0_44.changelog.added_method_to_class(@f35, :max, 'TimeSeriesData')
@v0_0_44.changelog.added_method_to_class(@f35, :min, 'TimeSeriesData')
@v0_0_44.changelog.added_method_to_class(@f35, :median, 'TimeSeriesData')
@v0_0_44.changelog.added_method_to_class(@f35, :range, 'TimeSeriesData')
@v0_0_44.changelog.added_method_to_class(@f35, :variance, 'TimeSeriesData')
@v0_0_44.changelog.added_method_to_class(@f35, :std_dev, 'TimeSeriesData')
@v0_0_44.changelog.added_method_to_class(@f35, :percentile, 'TimeSeriesData')
@v0_0_44.changelog.added_method_to_class(@f35, :mse, 'TimeSeriesData')
@v0_0_44.save!
