# encoding: UTF-8

using ::ThetaAngle::ContextRuuuby

::RSpec.shared_context 'shared_context_f32' do
  let(:f𝕎¹_error_scenarios){[10.1, 0.1, -1, nil, '1']}
  let(:fℕ¹_error_scenarios){[10.1, 0.1, 0, -0.0, 0.0, -1, nil, '1']}

  def expect_positive_f32_sequence(the_sequence, max_index)
    the_sequence.∀ₓᵢ(max_index) do |scenario, index|
      expect(the_sequence.∋?(scenario)).to eq(true)
      expect(the_sequence[index]).to eq(scenario)
    end
  end

  def expect_negative_f32_sequence(the_sequence, max_index)
    the_sequence.A∀ₓ(max_index) {|scenario| expect(the_sequence.∋?(scenario)).to eq(false)}
  end

  def expect_error_f32_sequence(the_sequence)
    if the_sequence.input_type == :∈𝕎
      f𝕎¹_error_scenarios.∀{|scenario| expect{the_sequence.∋?(scenario)}.to raise_error(ArgumentError)}
    elsif the_sequence.input_type == :∈ℕ
      fℕ¹_error_scenarios.∀{|scenario| expect{the_sequence.∋?(scenario)}.to raise_error(ArgumentError)}
    else
      raise "unrecognized input type{#{the_sequence.input_type.to_s}} from sequence{#{the_sequence.to_s}}"
    end
  end

end

::RSpec.shared_context 'shared_context_f27' do

  let(:as_degrees){θ°(360)}
  let(:as_radians){θʳ(π * 2)}
  let(:as_gons){θᵍ(400)}
  let(:as_turns){θ𝞽(1)}

  # @param [ThetaAngle]     obj
  # @param [Integer]        expected_type
  # @param [Integer, Float] expected_value
  def expect_theta_angle(obj, expected_type, expected_value)
    expect(obj.ⓣ).to eq(::ThetaAngle)
    expect(obj.real).to eq(expected_value)
    expect(obj.repr).to eq(expected_type)
    expect(obj.ʳ?).to eq(expected_type == 3)
    expect(obj.°?).to eq(expected_type == 4)
    expect(obj.𝞽?).to eq(expected_type == 5)
    expect(obj.ᵍ?).to eq(expected_type == 6)
  end

  # @param [ThetaAngle]     obj
  # @param [Integer, Float] expected_value
  def expect_theta_angle_rad(obj, expected_value); expect_theta_angle(obj, 3, expected_value); end

  # @param [ThetaAngle]     obj
  # @param [Integer, Float] expected_value
  def expect_theta_angle_dgr(obj, expected_value); expect_theta_angle(obj, 4, expected_value); end

  # @param [ThetaAngle]     obj
  # @param [Integer, Float] expected_value
  def expect_theta_angle_trn(obj, expected_value); expect_theta_angle(obj, 5, expected_value); end

  # @param [ThetaAngle]     obj
  # @param [Integer, Float] expected_value
  def expect_theta_angle_gon(obj, expected_value); expect_theta_angle(obj, 6, expected_value); end

end

::RSpec.shared_context 'shared_context_f24' do
  let(:data_syntax_case_camel){%w(HelloWorld NotSnakeCase AnExcellentTestCase)}
  let(:data_syntax_case_camel_nums){%w(HelloToday1337 Hello1337World)}

  let(:data_syntax_case_camel_lower){%w(lower lowerCamel lowerCamelCase lowerCamelCaseButWithManyMoreWords)}
  let(:data_syntax_case_camel_lower_nums){%w(helloWorld1337 helloWorldWith1337Numbers)}

  let(:data_syntax_case_snake){%w(hello_world much_longer_version_of_hello_world)}
  let(:data_syntax_case_snake_nums){%w(hello_world1337 hello1337 hello_1337_world)}

  let(:data_syntax_case_snake_capital){%w(AA HELLO HELLO_WORLD UPPER_SNAKE_CASE)}
  let(:data_syntax_case_snake_capital_nums){%w(AA1337 UPPER_SNAKE_CASE1337 AA_1337)}
end

::RSpec.shared_context 'shared_context_general' do
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
  let(:data_float_error_cases){[data_float_nan, data_float_inf, ::Float::INFINITY_NEGATIVE]}
  let(:data_range_complex_simple){[Complex(-1337.0), Complex(-10.0), Complex(-1.0), Complex(0.0), Complex(1.0), Complex(10.0), Complex(1337.0)]}
  let(:data_range_complex){[Complex(-1337.0, 1.25), Complex(-10.0, 1.25), Complex(-1.0, 1.25), Complex(0.0, 1.25), Complex(1.0, 1.25), Complex(10.0, 1.25), Complex(1337.0, 1.25)]}
  let(:data_range_complex_nan_and_infs){[data_complex_nan, data_complex_inf, data_complex_negative_inf]}
  let(:data_range_floats_negative){[-1337.0, -10.0, -3.0, -2.0, -1.0]}
  let(:data_range_floats_positive){[1.0, 2.0, 3.0, 10.0, 1337.0]}
  let(:data_range_floats_zero_to_positive){[0.0] + data_range_floats_positive}
  let(:data_range_floats){data_range_floats_negative + data_range_floats_zero_to_positive}
  let(:data_range_floats_w_infs){data_range_floats + [data_float_inf, ::Float::INFINITY_NEGATIVE]}
  let(:data_range_floats_all_but_zero){data_range_floats_negative + data_range_floats_positive}
  let(:data_range_floats_boolean){[-1.0, 0.0, 1.0]}
  let(:data_range_ints){[-1337, -10, -3, -2, -1, 0, 1, 2, 3, 10, 1337]}
  let(:data_range_ints_boolean){[-1, 0, 1]}
  let(:data_range_ints_positive){[1, 2, 3, 10, 1337]}
  let(:data_range_ints_whole_nums){[0] + data_range_ints_positive}
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
  let(:data_range_complex_just_infs){[Complex(data_float_inf, 0), Complex(::Float::INFINITY_NEGATIVE, 0)]}
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

  let(:data_str_fake_name){'fake_name'}

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

  let(:data_∈𝕌_true){[0, 0.0, -1, -1.0, 1, 1.0, Rational(3, 5), Complex(2, 3), BigDecimal('1.337')]}
  let(:data_∈𝕌𝕊_true){data_∈𝕌_true + %w(0 0.0 -1 -1.0 1 1.0 1.337)}

  let(:data_∈𝕌_false){[::Float::INFINITY, ::Float::INFINITY_NEGATIVE, ::Float::NAN, ::Float::INFINITY_COMPLEX]}
  let(:data_∈𝕌𝕊_false){data_∈𝕌_false + %w(∞ -∞)}

  let(:data_∈ℕ_true){[1, 1.0, 1337, 1337.0, Rational(1337), Complex(1337), BigDecimal('1337.0')]}
  let(:data_∈ℕ𝕊_true){data_∈ℕ_true + %w(1 1.0 1337 1337.0)}

  let(:data_∈ℕ_false){[-0.0, 0, 0.0, Complex(0.0), BigDecimal('0.0'), ∞]}
  let(:data_∈ℕ𝕊_false){data_∈ℕ_false + %w(0 0.0)} #-0.0

  let(:data_∈𝕎_true){[0, 0.0, 1, 1.0, Rational(1337), Complex(1337), BigDecimal('1337.0')]}
  let(:data_∈𝕎𝕊_true){data_∈𝕎_true + %w(0 0.0 1 1.0)}

  let(:data_∈𝕎_false){[-1, -1.0, Rational(-1337), Complex(-1337), BigDecimal('-1337.0')]}
  let(:data_∈𝕎𝕊_false){data_∈𝕎_false + %w(0.1337 -0.1337 1337.1337)}

  let(:data_∈ℤ_true){[0, 0.0, -1, -1.0, 1, 1.0, Rational(1337), Complex(1337), BigDecimal('1337.0')]}
  let(:data_∈ℤ𝕊_true){data_∈ℤ_true + %w(0 0.0 -1 -1.0 1 1.0)}

  let(:data_∈ℤ_false){[-1.1, 0.5, 0.1337, 1.1337, Rational(1337.1), Complex(1337.1), 1i, BigDecimal('1337.1')]}
  let(:data_∈ℤ𝕊_false){data_∈ℤ_false + %w(-1.1 -1.1 0.1337, -0.45, 1.1)}
end
