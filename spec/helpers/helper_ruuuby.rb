
RSpec.shared_context 'shared_context_language_deltas' do

  let(:cΔ_Integer){RuuubyTestHelper::Nums::CONFIG_INTEGER}
  let(:cΔ_Float){RuuubyTestHelper::Nums::CONFIG_FLOAT}
  let(:cΔ_NilClass){RuuubyTestHelper::CONFIG_NIL}
  let(:cΔ_Set){RuuubyTestHelper::CONFIG_SET}
  let(:cΔ_Array){RuuubyTestHelper::CONFIG_ARRAY}
  let(:cΔ_Hash){RuuubyTestHelper::CONFIG_HASH}
  let(:cΔ_Numeric){RuuubyTestHelper::CONFIG_NUMERIC}
  let(:cΔ_Module){RuuubyTestHelper::CONFIG_MODULE}
  let(:cΔ_Object){RuuubyTestHelper::CONFIG_OBJECT}
  let(:cΔ_Symbol){RuuubyTestHelper::CONFIG_SYMBOL}

  def expect_added_ruby_methods(the_class, the_configs)
    the_configs[:ruby].∀{|c| expect(the_class.∃⨍?(c)).to eq(true)}
  end

  def expect_added_c_methods(the_class, the_configs)
    the_configs[:c].∀{|c| expect(the_class.∃⨍?(c)).to eq(true)}
  end

  def expect_added_method_aliases(the_class, the_configs)
    the_configs[:aliases].∀{|base_func, aliased_name| expect(the_class.∃⨍_alias?(base_func, aliased_name)).to eq(true)}
  end

  def throw_wrong_param_type(the_class, the_method, arg_name, received_type, expected_types)
    raise_error(ArgumentError, Ruuuby::ParamErr::generate_error_text(the_class, the_method, arg_name, received_type, expected_types))
  end

end

RSpec.shared_context 'shared_context_general' do
  let(:data_big_decimal_nan){BigDecimal('NaN')}
  let(:data_big_decimal_inf){BigDecimal('Infinity')}
  let(:data_big_decimal_negative_inf){BigDecimal('-Infinity')}
  let(:data_big_decimal_zero){BigDecimal('0.0')}
  let(:data_big_decimal_negative_one){BigDecimal('-1.0')}
  let(:data_big_decimal_one){BigDecimal('1.0')}
  let(:data_big_decimal_leet){BigDecimal('1337.0')}
  let(:data_big_decimal_negative_leet){BigDecimal('-1337.0')}
  let(:data_big_decimal_error_cases){[data_big_decimal_nan, data_big_decimal_inf, data_big_decimal_negative_inf]}
  let(:data_complex_nan){ℂ(Float::NAN)}
  let(:data_complex_nan_w_complex){ℂ(Float::NAN, 1.5)}
  let(:data_complex_inf){ℂ(1.0/0.0)}
  let(:data_complex_negative_inf){ℂ(-1.0/0.0)}
  let(:data_complex_error_cases){[data_complex_nan, data_complex_nan_w_complex, data_complex_inf, data_complex_negative_inf]}
  let(:data_complex_zero){ℂ(0)}
  let(:data_complex_one){ℂ(1)}
  let(:data_complex_3i){ℂ(0, 3)}
  let(:data_complex_leet){ℂ(1337)}
  let(:data_int_leet){1337}
  let(:data_int_negative_one){-1}
  let(:data_float_nan){0.0/0.0}
  let(:data_float_inf){1.0/0.0}
  let(:data_float_negative_inf){-1.0/0.0}
  let(:data_float_error_cases){[data_float_nan, data_float_inf, data_float_negative_inf]}
  let(:data_range_complex_simple){[ℂ(-1337.0), ℂ(-10.0), ℂ(-1.0), ℂ(0.0), ℂ(1.0), ℂ(10.0), ℂ(1337.0)]}
  let(:data_range_complex){[ℂ(-1337.0, 1.25), ℂ(-10.0, 1.25), ℂ(-1.0, 1.25), ℂ(0.0, 1.25), ℂ(1.0, 1.25), ℂ(10.0, 1.25), ℂ(1337.0, 1.25)]}
  let(:data_range_complex_nan_and_infs){[data_complex_nan, data_complex_inf, data_complex_negative_inf]}
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
  let(:data_range_rational_w_complex){[Rational(ℂ(1.0, 1.5), 1), Rational(2, ℂ(1.0, -1.5))]}
  let(:data_range_rational_positive_decimals){[Rational(1, 1.5), Rational(2, 1.5), Rational(10, 1.5), Rational(1337, 1.5)]}
  let(:data_range_rational_zero_to_positive){[Rational(0)] + data_range_rational_positive}
  let(:data_range_rational_negative){[Rational(-1337, 1), Rational(-10, 1), Rational(-3, 1), Rational(-2, 1), Rational(-1, 1)]}
  let(:data_range_rational_all_but_zero){data_range_rational_negative + data_range_rational_positive}
  let(:data_range_rational){data_range_rational_negative + data_range_rational_zero_to_positive}
  let(:data_range_complex_one_to_positive){[ℂ(0, 1), ℂ(0, 3), ℂ(0, 1337), ℂ(1, 1), ℂ(1, 3), ℂ(1, 1337)]}
  let(:data_range_complex_one_from_zero_to_positive){[data_complex_zero] + data_range_complex_one_to_positive}
  let(:data_range_complex_negative_one){[ℂ(-1, 1), ℂ(-1, 3), ℂ(-1, 1337), ℂ(-1, 1), ℂ(-1, 3), ℂ(-1, 1337)]}
  let(:data_range_complex_one_w_negative_complex){[ℂ(1, -1), ℂ(1, -3), ℂ(1, -1337), ℂ(1, -1), ℂ(1, -3), ℂ(1, -1337)]}
  let(:data_range_complex_just_infs){[ℂ(data_float_inf, 0), ℂ(data_float_negative_inf, 0)]}
  let(:data_rational_default){Rational(2, 3)}
  let(:data_rational_zero){Rational(0)}
  let(:data_rational_zero_w_complex_denominator){Rational(0, ℂ(0, 1.5))}
  let(:data_rational_one){Rational(1, 1)}
  let(:data_rational_complex_numerator){Rational(ℂ(0, 1.5), 1)}
  let(:data_rational_complex_denominator){Rational(1, ℂ(0, 1.5))}
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

  let(:data_ary_leet){[1, 3, 3, 7]}
  let(:data_set_leet){Set[1, 3, 3, 7]}

  let(:data_str_fake_name){'fake_name'}
  let(:data_str_fake_name2){'second_fake_name'}
end

# TODO: ORM SHOULD BE ABLE TO DYNAMICALLY GENERATE THIS DATA ONCE ALL VERSION HISTORY IS TRACKED & ABSTRACTED
module RuuubyTestHelper

  module FeatureMath
    NUMERICAL_SETS = [:ℕ?, :ℤ?, :ℂ?, :ℚ?, :ℝ?, :𝕌?]
  end

  module Nums
    CONFIG_INTEGER = {
        ruby: [:finite?, :infinite?, :♾️?, :∞?, :∞ℂ?, :nan?, :¿?] + RuuubyTestHelper::FeatureMath::NUMERICAL_SETS
    }
    CONFIG_FLOAT = {
        ruby: RuuubyTestHelper::FeatureMath::NUMERICAL_SETS
    }
    CONFIG_RATIONAL = {
        ruby: RuuubyTestHelper::FeatureMath::NUMERICAL_SETS
    }
    CONFIG_COMPLEX = {
        ruby: RuuubyTestHelper::FeatureMath::NUMERICAL_SETS
    }
    CONFIG_BIG_DECIMAL = {
        ruby: RuuubyTestHelper::FeatureMath::NUMERICAL_SETS
    }
    CONFIG_NUMERIC = {
        ruby: [:∞?, :♾️?, :𝔹?] + RuuubyTestHelper::FeatureMath::NUMERICAL_SETS,
        aliases: {
            finite?: :𝕌?
        }
    }
  end

  module IO
    CONFIG_FILE = {
        ruby: [:∃?, :dirname², :dirname³]
    }

    CONFIG_DIR = {
        ruby: [:∃?]
    }
  end

  CONFIG_OBJECT = {
      ruby: [:🛑bool❓, :🛑🅱️❓, :🛑int❓, :🛑ary❓, :🛑str❓, :🛑stry❓, :🛑countable❓, :⁻¹, :⁻², :⁻³, :⁻⁴, :⁻⁵, :⁻⁶, :⁻⁷, :⁻⁸, :⁻⁹],
      c: [:int?, :str?, :stry?, :hsh?, :ary?, :bool?, :sym?],
      aliases: {
          object_id: :🆔,
          freeze: :❄️,
          frozen?: :❄️?,
          bool?: :🅱️?
      }
  }

  CONFIG_MODULE = {
      ruby: [:∃⨍_alias?, :∃⨍?],
      aliases: {
          private: :🙈,
          protected: :🛡️,
          🙈constants⟶: :private_constant,
          ∃const?: :const_defined?,
          private_method_defined?: :∃🙈func?
      }
  }

  CONFIG_METHOD = {
      aliases: {
          source_location: :🏠
      }
  }

  CONFIG_SYMBOL = {
      aliases: {
          ⬇️: :downcase,
          ⬇: :downcase,
          🔡: :downcase,
          ⬆️: :upcase,
          ⬆: :upcase,
          🔠: :upcase
      }
  }

  CONFIG_NIL = {
      c: [:empty?],
      aliases: {empty?: :∅?}
  }

  CONFIG_HASH = {
      aliases: {
          🔑?: :key?,
          ∃🔑?: :key?,
          🗝?: :key?,
          ∃🗝?: :key?,
          ∀: :each,
          ∅?: :empty?,
          ∋?: :include?,
          𝔠: :length
      },
  }

  CONFIG_NUMERIC = {
      ruby: [:𝔹?, :𝕌?, :∞?],
      aliases: {
          infinite?: :∞?,
          finite?: :𝕌?
      }
  }

  CONFIG_SET = {
      ruby: [:remove_empty!],
      aliases: {
          empty?: :∅?,
          each: :∀,
          include?: :∋?,
          length: :𝔠
      }
  }

  CONFIG_ARRAY = {
      ruby: [:📊, :∌?, :⊕, :∖, :≈≈, :end_with?, :start_with?, :ensure_start!, :ensure_ending!],
      c: [:remove_empty!, :disjunctive_union, :equal_contents?, :frequency_counts, :>>],
      aliases: {
          each: [:∀],
          uniq_to_me: :∖,
          include?: :∋?,
          empty?: :∅?,
          reverse: :↩️,
          reverse!: :↩️!,
          reverse_each: :↩️∀,
          length: :𝔠,
      }
  }

end
