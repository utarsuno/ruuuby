# coding: UTF-8

@v0_0_38 = RuuubyRelease.spawn(0, 0, 38)
@v0_0_38.add_file('lib/math/statistics/statistical_learning.rb', '::Math::Statistics::StatisticalLearning', 'not currently in use', @f30)
@v0_0_38.add_file('lib/math/statistics/probability_theory.rb', 'Math::Statistics::ProbabilityTheory', 'not currently in use', @f30)
@v0_0_38.add_file('lib/math/statistics/descriptive_statistics.rb', 'Math::Statistics::DescriptiveStatistics', 'not currently in use', @f30)
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
