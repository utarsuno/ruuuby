# coding: utf-8

require 'bundler/setup'
require 'ruuuby'

require 'helpers/helper_performance'
require 'helpers/helper_ruuuby'
require 'helpers/static_test_data'
require 'helpers/helper_db'

# TODO: fix having to require this
require 'rdoc'
require 'rake'
require 'rspec'

require 'rspec-benchmark'

RSpec.shared_context 'RSPEC_GLOBAL_UTILITIES' do
  let(:data_big_decimal_nan){BigDecimal('NaN')}
  let(:data_big_decimal_inf){BigDecimal('Infinity')}
  let(:data_big_decimal_negative_inf){BigDecimal('-Infinity')}
  let(:data_big_decimal_zero){BigDecimal('0.0')}
  let(:data_big_decimal_negative_one){BigDecimal('-1.0')}
  let(:data_big_decimal_one){BigDecimal('1.0')}
  let(:data_big_decimal_leet){BigDecimal('1337.0')}
  let(:data_big_decimal_negative_leet){BigDecimal('-1337.0')}
  let(:data_big_decimal_error_cases){[data_big_decimal_nan, data_big_decimal_inf, data_big_decimal_negative_inf]}
  let(:data_complex_nan){Complex(Float::NAN)}
  let(:data_complex_inf){Complex(1.0/0.0)}
  let(:data_complex_negative_inf){Complex(-1.0/0.0)}
  let(:data_complex_error_cases){[data_complex_nan, data_complex_inf, data_complex_negative_inf]}
  let(:data_complex_zero){Complex(0)}
  let(:data_complex_one){Complex(1)}
  let(:data_complex_leet){Complex(1337)}
  let(:data_int_leet){1337}
  let(:data_int_negative_one){-1}
  let(:data_float_nan){0.0/0.0}
  let(:data_float_inf){1.0/0.0}
  let(:data_float_negative_inf){-1.0/0.0}
  let(:data_float_error_cases){[data_float_nan, data_float_inf, data_float_negative_inf]}
  let(:data_range_complex_simple){[Complex(-1337.0), Complex(-10.0), Complex(-1.0), Complex(0.0), Complex(1.0), Complex(10.0), Complex(1337.0)]}
  let(:data_range_complex){[Complex(-1337.0, 1.25), Complex(-10.0, 1.25), Complex(-1.0, 1.25), Complex(0.0, 1.25), Complex(1.0, 1.25), Complex(10.0, 1.25), Complex(1337.0, 1.25)]}
  let(:data_range_floats_negative){[-1337.0, -10.0, -3.0, -2.0, -1.0]}
  let(:data_range_floats_positive){[1.0, 2.0, 3.0, 10.0, 1337.0]}
  let(:data_range_floats_zero_to_positive){[0.0] + data_range_floats_positive}
  let(:data_range_floats){data_range_floats_negative + data_range_floats_zero_to_positive}
  let(:data_range_floats_w_infs){data_range_floats + [data_float_inf, data_float_negative_inf]}
  let(:data_range_floats_all_but_zero){data_range_floats_negative + data_range_floats_positive}
  let(:data_range_floats_boolean){[-1.0, 0.0, 1.0]}
  let(:data_range_ints){[-1337, -10, -3, -2, -1, 0, 1, 2, 3, 10, 1337]}
  let(:data_range_ints_zero_to_nine){[0, 1, 2, 3, 4, 5, 6, 7, 8, 9]}
  let(:data_range_ints_boolean){[-1, 0, 1]}
  let(:data_range_ints_positive){[1, 2, 3, 10, 1337]}
  let(:data_range_ints_zero_to_positive){[0] + data_range_ints_positive}
  let(:data_range_ints_negative){[-1337, -10, -3, -2, -1]}
  let(:data_range_rational_positive){[Rational(1, 1), Rational(2, 1), Rational(3, 1), Rational(10, 1), Rational(1337, 1)]}
  let(:data_range_rational_positive_decimals){[Rational(1, 1.5), Rational(2, 1.5), Rational(10, 1.5), Rational(1337, 1.5)]}
  let(:data_range_rational_zero_to_positive){[Rational(0)] + data_range_rational_positive}
  let(:data_range_rational_negative){[Rational(-1337, 1), Rational(-10, 1), Rational(-3, 1), Rational(-2, 1), Rational(-1, 1)]}
  let(:data_range_rational_all_but_zero){data_range_rational_negative + data_range_rational_positive}
  let(:data_range_rational){data_range_rational_negative + data_range_rational_zero_to_positive}
  let(:data_rational_default){Rational(2, 3)}
  let(:data_rational_zero){Rational(0)}
  let(:data_rational_one){Rational(1, 1)}
  let(:data_rational_3){Rational(3, 1)}
  let(:data_rational_negative_3){Rational(-3, 1)}
  let(:data_rational_negative_one){Rational(-1, 1)}
  let(:data_rational_leet){Rational(1337, 1)}
  let(:data_rational_negative_leet){Rational(-1337, 1)}

  let(:data_unit_circle_points){[
      [0  , '0'    , 0.0],
      [30 , 'π/6'  , π / 6],
      [45 , 'π/4'  , π / 4],
      [60 , 'π/3'  , π / 3],
      [90 , 'π/2'  , π / 2],
      [120, '2π/3' , (2 * π) / 3],
      [135, '3π/4' , (3 * π) / 4],
      [150, '5π/6' , (5 * π) / 6],
      [180, 'π'    , π],
      [210, '7π/6' , π * (7.0/6)],
      [225, '5π/4' , (5 * π) / 4],
      [240, '4π/3' , (4 * π) / 3],
      [270, '3π/2' , (3 * π) / 2],
      [300, '5π/3' , (5 * π) / 3],
      [315, '7π/4' , (7 * π) / 4],
      [330, '11π/6', (11 * π) / 6],
      [360, '2π'   , 2 * π],
  ]}

  let(:data_ary_empty){[]}
  let(:data_ary_leet){[1, 3, 3, 7]}
  let(:data_set_leet){Set[1, 3, 3, 7]}

  let(:data_str_fake_name){'fake_name'}
  let(:data_str_fake_name2){'second_fake_name'}
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

  require_relative '../lib/ruuuby/global_funcs'
  config.include ::Ruuuby::Feature::Extendable::MainF12
  config.include ::Ruuuby::Feature::Extendable::MainF17::MathAliases
  config.include ::Ruuuby::Feature::Extendable::MainF17::FloatAliases
  config.include ::Ruuuby::Feature::Extendable::MainF17::Trigonometry

  config.include_context 'lets_language_deltas'
  config.include_context 'RSPEC_GLOBAL_UTILITIES'

  config.include HelpersGeneral
  config.include HelpersFeature16

  config.include HelpersDB, :db
  config.include_context 'shared_context_db', :db

  config.include PerformanceTestHelper, :performance
  config.include RSpec::Benchmark::Matchers, :performance
  config.include_context 'lets_performance', :performance

end
