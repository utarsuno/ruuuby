# encoding: UTF-8

require 'bundler/setup'
require 'ruuuby'

require_relative 'helpers/helper_performance'
require_relative 'helpers/helper_ruuuby'
require_relative 'helpers/static_test_data'
require_relative 'helpers/helper_db'

require 'rdoc'
require 'rake'
require 'rspec'
require 'rspec-benchmark'

module HelpersSyntaxCache

  def expect_syntax(the_class, syntax_id, syntax_before_processing)
    expect(the_class.respond_to?(syntax_id)).to eq(true)
    expect(the_class.send(syntax_id).class).to eq(Regexp)
    expect(the_class.send(syntax_id).source).to eq("\\A#{syntax_before_processing}\\z")
  end

  def do_not_expect_syntax(the_class, syntax_id)
    expect(the_class.respond_to?(syntax_id)).to eq(false)
  end

end

module HelpersFeature16

  def expect_scenarios_power_operations(scenarios, superscripts, power_operation, to_pass=true)

    if power_operation == 0
      scenarios.∀ do |n|
        expect((n^(superscripts)) == 1).to eq(to_pass)
      end
    elsif power_operation == 1
      scenarios.∀ do |n|
        expect((n^(superscripts)) == n).to eq(to_pass)
      end
    elsif power_operation < 0
      scenarios.∀ do |n|
        expect((n^(superscripts)) == (Rational(1, n ** (-power_operation)))).to eq(to_pass)
      end
    else
      scenarios.∀ do |n|
        expect((n^(superscripts)) == (n ** power_operation)).to eq(to_pass)
      end
    end
  end

end

module HelpersGeneral

  def expect_regular_int(val_scenario, val_expected)
    expect(val_scenario).to eq(val_expected)
    expect(val_scenario.class).to eq(Integer)
  end

  def expect_regular_flt(val_scenario, val_expected)
    expect(val_scenario).to eq(val_expected)
    expect(val_scenario.class).to eq(Float)
  end

  def expect_∃⨍(the_func, owner, expected_result=true)
    expect(owner.∃⨍?(the_func)).to eq(expected_result)
  end

  def expect_∃class(the_class, owner=nil, expected_result=true)
    if owner != nil
      expect(∃class?(the_class.to_sym, owner)).to eq(expected_result)
      expect(∃class?(the_class.to_s, owner)).to eq(expected_result)
    else
      expect(∃class?(the_class.to_sym)).to eq(expected_result)
      expect(∃class?(the_class.to_s)).to eq(expected_result)
    end
  end

  def do_not_expect_∃class(the_class, owner=nil)
    expect_∃class(the_class, owner, false)
  end

  def expect_∃module(the_module, owner=nil, expected_result=true)
    if owner != nil
      expect(∃module?(the_module.to_sym, owner)).to eq(expected_result)
      expect(∃module?(the_module.to_s, owner)).to eq(expected_result)
    else
      expect(∃module?(the_module.to_sym)).to eq(expected_result)
      expect(∃module?(the_module.to_s)).to eq(expected_result)
    end
  end

  def do_not_expect_∃module(the_module, owner=nil)
    expect_∃module(the_module, owner, false)
  end

end

RSpec.configure do |config|

  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  #config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.profile_examples = 6

  config.include ::Ruuuby::Feature::Extendable::MainF12
  config.include ::Ruuuby::Feature::Extendable::MainF17::MathAliases
  config.include ::Ruuuby::Feature::Extendable::MainF17::FloatAliases
  config.include ::Ruuuby::Feature::Extendable::MainF17::Trigonometry

  config.include_context 'shared_context_language_deltas'
  config.include_context 'shared_context_general'

  config.include HelpersGeneral
  config.include HelpersFeature16
  config.include HelpersSyntaxCache

  config.include HelpersDB, :db
  config.include_context 'shared_context_db', :db

  config.include PerformanceTestHelper, :performance
  config.include RSpec::Benchmark::Matchers, :performance
  config.include_context 'shared_context_performance', :performance

end
