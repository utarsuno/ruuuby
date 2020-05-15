
RSpec.shared_context 'shared_context_language_deltas' do

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
  let(:data_complex_nan){Complex(Float::NAN)}
  let(:data_complex_nan_w_complex){Complex(Float::NAN, 1.5)}
  let(:data_complex_inf){Complex(1.0/0.0)}
  let(:data_complex_negative_inf){Complex(-1.0/0.0)}
  let(:data_complex_error_cases){[data_complex_nan, data_complex_nan_w_complex, data_complex_inf, data_complex_negative_inf]}
  let(:data_complex_zero){Complex(0)}
  let(:data_complex_one){Complex(1)}
  let(:data_complex_1i){1i}
  let(:data_complex_3i){3i}
  let(:data_complex_leet){Complex(1337)}
  let(:data_int_leet){1337}
  let(:data_int_negative_one){-1}
  let(:data_float_nan){0.0/0.0}
  let(:data_float_inf){1.0/0.0}
  let(:data_float_negative_inf){-1.0/0.0}
  let(:data_float_error_cases){[data_float_nan, data_float_inf, data_float_negative_inf]}
  let(:data_range_complex_simple){[Complex(-1337.0), Complex(-10.0), Complex(-1.0), Complex(0.0), Complex(1.0), Complex(10.0), Complex(1337.0)]}
  let(:data_range_complex){[Complex(-1337.0, 1.25), Complex(-10.0, 1.25), Complex(-1.0, 1.25), Complex(0.0, 1.25), Complex(1.0, 1.25), Complex(10.0, 1.25), Complex(1337.0, 1.25)]}
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
  let(:data_range_rational_w_complex){[Rational(Complex(1.0, 1.5), 1), Rational(2, Complex(1.0, -1.5))]}
  let(:data_range_rational_positive_decimals){[Rational(1, 1.5), Rational(2, 1.5), Rational(10, 1.5), Rational(1337, 1.5)]}
  let(:data_range_rational_zero_to_positive){[Rational(0)] + data_range_rational_positive}
  let(:data_range_rational_negative){[Rational(-1337, 1), Rational(-10, 1), Rational(-3, 1), Rational(-2, 1), Rational(-1, 1)]}
  let(:data_range_rational_all_but_zero){data_range_rational_negative + data_range_rational_positive}
  let(:data_range_rational){data_range_rational_negative + data_range_rational_zero_to_positive}
  let(:data_range_complex_one_to_positive){[data_complex_1i, Complex(0, 3), Complex(0, 1337), Complex(1, 1), Complex(1, 3), Complex(1, 1337)]}
  let(:data_range_complex_one_from_zero_to_positive){[data_complex_zero] + data_range_complex_one_to_positive}
  let(:data_range_complex_negative_one){[Complex(-1, 1), Complex(-1, 3), Complex(-1, 1337), Complex(-1, 1), Complex(-1, 3), Complex(-1, 1337)]}
  let(:data_range_complex_one_w_negative_complex){[Complex(1, -1), Complex(1, -3), Complex(1, -1337), Complex(1, -1), Complex(1, -3), Complex(1, -1337)]}
  let(:data_range_complex_just_infs){[Complex(data_float_inf, 0), Complex(data_float_negative_inf, 0)]}
  let(:data_rational_default){Rational(2, 3)}
  let(:data_rational_zero){Rational(0)}
  let(:data_rational_zero_w_complex_denominator){Rational(0, Complex(0, 1.5))}
  let(:data_rational_one){Rational(1, 1)}
  let(:data_rational_complex_numerator){Rational(Complex(0, 1.5), 1)}
  let(:data_rational_complex_denominator){Rational(1, Complex(0, 1.5))}
  let(:data_rational_3){Rational(3, 1)}
  let(:data_rational_negative_3){Rational(-3, 1)}
  let(:data_rational_negative_one){Rational(-1, 1)}
  let(:data_rational_leet){Rational(1337, 1)}
  let(:data_rational_negative_leet){Rational(-1337, 1)}

  let(:data_ary_leet){[1, 3, 3, 7]}
  let(:data_set_leet){Set[1, 3, 3, 7]}

  let(:data_str_fake_name){'fake_name'}
  let(:data_str_fake_name2){'second_fake_name'}

  let(:data_minus_leet){Complex(-1337)}
  let(:data_minus_leet2){Rational(-1337, 2)}
  let(:data_with_complex_only_real_component){Rational(Complex(1, 0.0), 1.5)}
  let(:data_with_complex){Rational(Complex(1, 1.5), 1.5)}

  let(:data_big_decimal_leet_kinda){BigDecimal('1.337')}

  let(:dataf_one){Complex(1.0)}
  let(:datac_one){Complex(1, 1)}

  let(:data_new_obj){Object.new}

  let(:data_nan_with_complex){Complex(Float::NAN, 1.5)}
  let(:data_infinity_with_complex){Complex(1.0/0.0, 1.5)}
  let(:data_negative_infinity_with_complex){Complex(1.0/0.0, 1.5)}
end
