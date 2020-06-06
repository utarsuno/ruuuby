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
