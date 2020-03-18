# coding: utf-8

require 'bundler/setup'
require 'ruuuby'

require 'helpers/helper_testing'
require 'helpers/helper_performance'
require 'helpers/helper_ruuuby'
require 'helpers/static_test_data'

# TODO: fix having to require this
require 'rdoc'
require 'rake'
require 'rspec'
require 'ruuuby/version'
require_relative '../db/db'

require_relative '../conditionals/ruuuby_configs'

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
  let(:data_range_floats){[-1337.0, -10.0, -3.0, -2.0, -1.0, 0.0, 1.0, 2.0, 3.0, 10.0, 1337.0]}
  let(:data_range_ints){[-1337, -10, -3, -2, -1, 0, 1, 2, 3, 10, 1337]}
  let(:data_range_ints_zero_to_positive){[0, 1, 2, 3, 10, 1337]}
  let(:data_range_ints_negative){[-1337, -10, -3, -2, -1]}
  let(:data_rational_default){Rational(2, 3)}
  let(:data_rational_zero){Rational(0)}
  let(:data_rational_one){Rational(1, 1)}
  let(:data_rational_negative_one){Rational(-1, 1)}
  let(:data_rational_leet){Rational(1337, 1)}
  let(:data_rational_negative_leet){Rational(-1337, 1)}

  let(:data_ary_leet){[1, 3, 3, 7]}
  let(:data_set_leet){Set[1, 3, 3, 7]}

  let(:data_str_fake_name){'fake_name'}
  let(:data_str_fake_name2){'second_fake_name'}
end

module AuditHelpers

  def feature_tests(the_feature, feature_str, description)
    expect(the_feature.class).to eq(RuuubyFeature)
    expect(the_feature.id.class).to eq(Integer)
    expect(the_feature.description).to eq(description)
    expect(the_feature.feature_id).to eq(feature_str)
    expect(the_feature.docs_feature_mapping).to eq("| #{feature_str} | #{description} |")
  end

  def audit_version(the_version, version_str)
    expect(the_version.class).to eq(RuuubyRelease)
    expect(the_version.version).to eq(version_str)
    expect(the_version.id.class).to eq(Integer)
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

  config.include(RSpec::Benchmark::Matchers)
  config.include(GeneralTestHelper)
  config.include_context 'RSPEC_GLOBAL_UTILITIES'

  config.include PerformanceTestHelper, :performance
  config.include AuditHelpers, :audits

end
