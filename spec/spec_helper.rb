# coding: utf-8

require 'bundler/setup'
require 'ruuuby'

require 'helpers/helper_performance'
require 'helpers/helper_ruuuby'
require 'helpers/static_test_data'

# TODO: fix having to require this
require 'rdoc'
require 'rake'
require 'rspec'
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
  let(:data_range_floats_negative){[-1337.0, -10.0, -3.0, -2.0, -1.0]}
  let(:data_range_floats_positive){[1.0, 2.0, 3.0, 10.0, 1337.0]}
  let(:data_range_floats_zero_to_positive){[0.0] + data_range_floats_positive}
  let(:data_range_floats){data_range_floats_negative + data_range_floats_zero_to_positive}
  let(:data_range_floats_all_but_zero){data_range_floats_negative + data_range_floats_positive}
  let(:data_range_floats_boolean){[-1.0, 0.0, 1.0]}
  let(:data_range_ints){[-1337, -10, -3, -2, -1, 0, 1, 2, 3, 10, 1337]}
  let(:data_range_ints_zero_to_nine){[0, 1, 2, 3, 4, 5, 6, 7, 8, 9]}
  let(:data_range_ints_boolean){[-1, 0, 1]}
  let(:data_range_ints_positive){[1, 2, 3, 10, 1337]}
  let(:data_range_ints_zero_to_positive){[0] + data_range_ints_positive}
  let(:data_range_ints_negative){[-1337, -10, -3, -2, -1]}
  let(:data_rational_default){Rational(2, 3)}
  let(:data_rational_zero){Rational(0)}
  let(:data_rational_one){Rational(1, 1)}
  let(:data_rational_negative_one){Rational(-1, 1)}
  let(:data_rational_leet){Rational(1337, 1)}
  let(:data_rational_negative_leet){Rational(-1337, 1)}

  let(:data_ary_empty){[]}
  let(:data_ary_leet){[1, 3, 3, 7]}
  let(:data_set_leet){Set[1, 3, 3, 7]}

  let(:data_str_fake_name){'fake_name'}
  let(:data_str_fake_name2){'second_fake_name'}
end

module AuditHelpers

  def audit_feature(the_feature, feature_str, description)
    expect(the_feature.class).to eq(RuuubyFeature)
    expect(the_feature.id.class).to eq(Integer)
    expect(the_feature.description).to eq(description)
    expect(the_feature.uid).to eq(feature_str)
    expect(the_feature.uid.match?(re_ruuuby_feature_id)).to eq(true)
    expect(the_feature.docs_feature_mapping).to eq("| #{feature_str} | #{description} |")
    expect(the_feature.docs_feature_mapping.match?(re_ruuuby_feature_docs_feature_mapping)).to eq(true)
  end

  def audit_version(the_version, version_str)
    expect(the_version.class).to eq(RuuubyRelease)
    expect(the_version.uid).to eq(version_str)
    expect(version_str.match?(re_ruuuby_release_version)).to eq(true)
    expect(the_version.id.class).to eq(Integer)
  end

end

RSpec.shared_context 'RSpecContextAudit' do
  let(:re_ruuuby_feature){RuuubyFeature::Syntax}
  let(:re_ruuuby_feature_id){RuuubyFeature.cache_fetch(re_ruuuby_feature::UID)}
  let(:re_ruuuby_feature_docs_feature_mapping){RuuubyFeature.cache_fetch(re_ruuuby_feature::DOCS_FEATURE_MAPPING)}
  let(:re_ruuuby_release){RuuubyRelease::Syntax}
  let(:re_ruuuby_release_version){RuuubyRelease.cache_fetch(re_ruuuby_release::UID)}
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

  config.include_context 'lets_language_deltas'
  config.include_context 'RSPEC_GLOBAL_UTILITIES'

  config.include HelpersGeneral

  config.include_context 'RSpecContextAudit', :audits
  config.include AuditHelpers, :audits

  config.include PerformanceTestHelper, :performance
  config.include RSpec::Benchmark::Matchers, :performance
  config.include_context 'lets_performance', :performance

end
