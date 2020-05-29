# coding: UTF-8

RSpec.describe 'f11' do

  context 'functionality' do
    let(:num_sets_aleph_one){[𝕌, 𝕀, ℂ]}
    let(:num_sets_aleph_zero){[ℕ, 𝕎, ℤ, ℚ, 𝔸, 𝔸ᵣ]}
    # TODO: add the ℕ𝕌𝕃𝕃 set here
    let(:num_sets_finite){[∅, 𝔹]}

    context 'global aliases for all instances of `NumberSet`' do

      context 'aleph cardinality' do
        context 'finite cardinality' do
          it 'checked through func{𝔠}' do
            num_sets_finite.∀{|scenario| expect(scenario.𝔠.ⓣ).to eq(::Integer)}
          end
          it 'funcs{finite?}' do
            num_sets_finite.∀{|scenario| expect(scenario.finite?).to eq(true)}
          end
          it 'funcs{countable?}' do
            num_sets_finite.∀{|scenario| expect(scenario.countable?).to eq(true)}
          end
          it 'funcs{countably_infinite?}' do
            num_sets_finite.∀{|scenario| expect(scenario.countably_infinite?).to eq(false)}
          end
          it 'funcs{uncountable?}' do
            num_sets_finite.∀{|scenario| expect(scenario.uncountable?).to eq(false)}
          end
        end # end: {finite cardinality}
        context 'ℵ₀' do
          it 'checked through func{𝔠}' do
            num_sets_aleph_zero.∀{|scenario| expect(scenario.𝔠).to eq(::Math::SetTheory::NumberSet::AlephNumbers::ZERO)}
          end
          it 'funcs{finite?}' do
            num_sets_aleph_zero.∀{|scenario| expect(scenario.finite?).to eq(false)}
          end
          it 'funcs{countable?}' do
            num_sets_aleph_zero.∀{|scenario| expect(scenario.countable?).to eq(true)}
          end
          it 'funcs{countably_infinite?}' do
            num_sets_aleph_zero.∀{|scenario| expect(scenario.countably_infinite?).to eq(true)}
          end
          it 'funcs{uncountable?}' do
            num_sets_aleph_zero.∀{|scenario| expect(scenario.uncountable?).to eq(false)}
          end
        end # end: {ℵ₀}
        context 'ℵ₁' do
          it 'checked through func{𝔠}' do
            num_sets_aleph_one.∀{|scenario| expect(scenario.𝔠).to eq(::Math::SetTheory::NumberSet::AlephNumbers::ONE)}
          end
          it 'funcs{finite?}' do
            num_sets_aleph_one.∀{|scenario| expect(scenario.finite?).to eq(false)}
          end
          it 'funcs{countable?}' do
            num_sets_aleph_one.∀{|scenario| expect(scenario.countable?).to eq(false)}
          end
          it 'funcs{countably_infinite?}' do
            num_sets_aleph_one.∀{|scenario| expect(scenario.countably_infinite?).to eq(false)}
          end
          it 'funcs{uncountable?}' do
            num_sets_aleph_one.∀{|scenario| expect(scenario.uncountable?).to eq(true)}
          end
        end # end: {ℵ₁}
      end

      context '∅' do
        context 'handles needed scenarios' do
          it 'cases: negative' do
            [[], Set[], {}, '', nil, [1], Set[1], {a: 1}, '1', 1, 1.0, 1i, true, false].∀{|scenario| expect(∅.∋?(scenario)).to eq(false)}
          end
        end
      end # end: {∅}

      context 'ℕ𝕌𝕃𝕃' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            [[], Set[], {}, '', nil].∀{|scenario| expect(ℕ𝕌𝕃𝕃.∋?(scenario)).to eq(true)}
          end
          it 'cases: negative' do
            [[1], Set[1], {a: 1}, '1', 1, 1.0, 1i, true, false].∀{|scenario| expect(ℕ𝕌𝕃𝕃.∋?(scenario)).to eq(false)}
          end
        end
      end # end: {ℕ𝕌𝕃𝕃}

      context '𝔹' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            scenarios = [0, 0.0, -0.0, 1, 1.0, Rational(10, 10), Rational(0, 1337), Complex(0, 0), Complex(1, 0), BigDecimal('0.0'), BigDecimal('1.0')]
            scenarios.∀{|n| expect(𝔹.∋?(n)).to eq(true)}
          end
          it 'cases: negative' do
            scenarios = [-1337, -1, -1.0, 0.000000001, 1.0000000001, 0.99999999999999, Complex(1, 2), Rational(Complex(-1, 2), 2), data_float_nan, data_float_inf, data_float_negative_inf]
            scenarios.∀{|n| expect(𝔹.∋?(n)).to eq(false)}
          end
        end
      end # end: {𝔹}

      context '𝔸ᵣ' do
        context 'handles needed scenarios' do
          context 'cases: positive' do
            it 'w/ int' do
              data_range_ints.∀{|n| expect(𝔸ᵣ.∋?(n)).to eq(true)}
            end
            it 'w/ float' do
              expect(𝔸ᵣ.∋?(√(2))).to eq(true)
              expect(𝔸ᵣ.∋?(𝚽)).to eq(true)
            end
          end
          it 'cases: negative' do
            data_float_error_cases.∀{|n| expect(𝔸ᵣ.∋?(n)).to eq(false)}
            [π, ℮, Ω].∀{|n| expect(𝔸ᵣ.∋?(n)).to eq(false)}
          end
        end
      end # end: {𝔸ᵣ}

      context '𝔸' do
        context 'handles needed scenarios' do
          context 'cases: positive' do
            it 'w/ int' do
              data_range_ints.∀{|n| expect(𝔸ᵣ.∋?(n)).to eq(true)}
            end
            it 'w/ float' do
              expect(𝔸.∋?(√(2))).to eq(true)
              expect(𝔸.∋?(𝚽)).to eq(true)
            end
          end
          it 'cases: negative' do
            expect(𝔸.∋?(π)).to eq(false)
            expect(𝔸.∋?(℮)).to eq(false)
          end
        end
      end # end: {𝔸}

      context 'ℕ' do
        context 'handles needed scenarios' do
          context 'cases: positive' do
            it 'w/ complex' do
              expect(ℕ.∋?(data_complex_one)).to eq(true)
              expect(ℕ.∋?(data_complex_leet)).to eq(true)
            end
            it 'w/ big decimal' do
              expect(ℕ.∋?(BigDecimal('1.0'))).to eq(true)
              expect(ℕ.∋?(BigDecimal('1337.0'))).to eq(true)
            end
            it 'w/ rational' do
              data_range_rational_positive.∀{|n| expect(ℕ.∋?(n)).to eq(true)}
            end
          end
          context 'cases: negative' do
            it 'w/ complex' do
              expect(ℕ.∋?(data_complex_zero)).to eq(false)
              expect(ℕ.∋?(data_complex_1i)).to eq(false)
              expect(ℕ.∋?(Complex(-1))).to eq(false)
              expect(ℕ.∋?(Complex(1337.1337))).to eq(false)
              data_range_complex_nan_and_infs.∀{|c| expect(ℕ.∋?(c)).to eq(false)}
            end
            it 'w/ big decimal' do
              expect(ℕ.∋?(BigDecimal('-1.0'))).to eq(false)
              expect(ℕ.∋?(BigDecimal('0.0'))).to eq(false)
              expect(ℕ.∋?(BigDecimal('-1.1'))).to eq(false)
              expect(ℕ.∋?(BigDecimal('0.1'))).to eq(false)
              expect(ℕ.∋?(BigDecimal('1.1'))).to eq(false)
            end
            it 'w/ rational' do
              expect(ℕ.∋?(data_rational_zero)).to eq(false)
              data_range_rational_negative.∀{|n| expect(ℕ.∋?(n)).to eq(false)}
            end
          end
        end
      end # end: {ℕ}

      context '𝕎' do
        context 'handles needed scenarios' do
          context 'cases: positive' do
            it 'w/ int' do
              expect(data_range_ints_zero_to_positive.∀{|n| expect(𝕎.∋?(n)).to eq(true)})
            end
            it 'w/ float' do
              expect(data_range_floats_zero_to_positive.∀{|n| expect(𝕎.∋?(n)).to eq(true)})
            end
            it 'w/ complex' do
              expect(𝕎.∋?(data_complex_zero)).to eq(true)
              expect(𝕎.∋?(data_complex_one)).to eq(true)
              expect(𝕎.∋?(data_complex_leet)).to eq(true)
            end
            it 'w/ rational' do
              data_range_rational_zero_to_positive.∀{|n| expect(𝕎.∋?(n)).to eq(true)}
            end
            it 'w/ big decimal' do
              expect(𝕎.∋?(BigDecimal('1.0'))).to eq(true)
              expect(𝕎.∋?(BigDecimal('1337.0'))).to eq(true)
              expect(𝕎.∋?(BigDecimal('0.0'))).to eq(true)
            end
          end
          context 'cases: negative' do
            it 'w/ int' do
              data_range_ints_negative.∀{|n| expect(𝕎.∋?(n)).to eq(false)}
            end
            it 'w/ float' do
              data_range_floats_negative.∀{|n| expect(𝕎.∋?(n)).to eq(false)}
              data_range_complex_nan_and_infs.∀{|c| expect(𝕎.∋?(c)).to eq(false)}
            end
            it 'w/ complex' do
              expect(𝕎.∋?(data_complex_1i)).to eq(false)
              expect(𝕎.∋?(-1i)).to eq(false)
            end
            it 'w/ rational' do
              data_range_rational_negative.∀{|n| expect(𝕎.∋?(n)).to eq(false)}
            end
            it 'w/ big decimal' do
              expect(𝕎.∋?(BigDecimal('-1.0'))).to eq(false)
              expect(𝕎.∋?(BigDecimal('-1337.0'))).to eq(false)
            end
          end
        end
      end # end: {𝕎}

      context 'ℤ' do
        context 'handles needed scenarios' do
          context 'cases: positive' do
            it 'w/ int' do
              data_range_ints.∀{|n| expect(ℤ.∋?(n)).to eq(true)}
            end
            it 'w/ float' do
              data_range_floats.∀{|n| expect(ℤ.∋?(n)).to eq(true)}
            end
            it 'w/ big decimal' do
              expect(ℤ.∋?(data_big_decimal_negative_leet)).to eq(true)
              expect(ℤ.∋?(data_big_decimal_negative_one)).to eq(true)
              expect(ℤ.∋?(data_big_decimal_zero)).to eq(true)
              expect(ℤ.∋?(data_big_decimal_one)).to eq(true)
              expect(ℤ.∋?(data_big_decimal_leet)).to eq(true)
            end
            it 'w/ rational' do
              expect(ℤ.∋?(data_rational_negative_leet)).to eq(true)
              expect(ℤ.∋?(data_rational_negative_one)).to eq(true)
              expect(ℤ.∋?(data_rational_zero)).to eq(true)
              expect(ℤ.∋?(data_rational_one)).to eq(true)
              expect(ℤ.∋?(data_rational_leet)).to eq(true)
              expect(ℤ.∋?(Rational(Complex(3, 0), 1))).to eq(true)
            end
            it 'w/ complex' do
              expect(ℤ.∋?(data_minus_leet)).to eq(true)
              expect(ℤ.∋?(Complex(-1))).to eq(true)
              expect(ℤ.∋?(data_complex_zero)).to eq(true)
              expect(ℤ.∋?(data_complex_one)).to eq(true)
              expect(ℤ.∋?(data_complex_leet)).to eq(true)
            end
            it 'w/ rational' do
              data_range_rational.∀{|n| expect(ℤ.∋?(n)).to eq(true)}
            end
          end
          it 'cases: negative' do
            data_big_decimal_error_cases.∀{|n| expect(ℤ.∋?(n)).to eq(false)}
            expect(ℤ.∋?(BigDecimal('1.1'))).to eq(false)
            expect(ℤ.∋?(data_with_complex)).to eq(false)
            data_float_error_cases.∀{|n| expect(ℤ.∋?(n)).to eq(false)}

            # complex
            data_range_complex_nan_and_infs.∀{|c| expect(ℤ.∋?(c)).to eq(false)}
            expect(ℤ.∋?(data_complex_1i)).to eq(false)
            expect(ℤ.∋?(datac_one)).to eq(false)
            expect(ℤ.∋?(Complex(1337.1337))).to eq(false)
          end
        end
      end # end: {ℤ}

      context '𝕌' do
        context 'handles needed scenarios' do
          context 'cases: positive' do
            it 'w/ int' do
              data_range_ints.∀{|n| expect(𝕌.∋?(n)).to eq(true)}
            end
            it 'w/ float' do
              expect(𝕌.∋?(0.0)).to eq(true)
              expect(𝕌.∋?(0.0)).to eq(true)
              expect(𝕌.∋?(1.0)).to eq(true)
              expect(𝕌.∋?(-1.0)).to eq(true)
              [π, ℮, 𝚽, Ψ, ρ].∀{|n| expect(𝕌.∋?(n)).to eq(true)}
            end
            it 'w/ big decimal' do
              expect(𝕌.∋?(data_big_decimal_leet_kinda)).to eq(true)
            end
            it 'w/ complex' do
              expect(𝕌.∋?(data_with_complex)).to eq(true)
              expect(𝕌.∋?(data_with_complex_only_real_component)).to eq(true)
              expect(𝕌.∋?(Complex(1, 2))).to eq(true)
              expect(𝕌.∋?(Rational(Complex(-1, 2), 2))).to eq(true)
              expect(𝕌.∋?(data_complex_one)).to eq(true)
            end
            it 'w/ rational' do
              expect(𝕌.∋?(data_rational_default)).to eq(true)
            end
          end
          it 'cases: negative' do
            data_float_error_cases.∀{|n| expect(𝕌.∋?(n)).to eq(false)}
            data_big_decimal_error_cases.∀{|n| expect(𝕌.∋?(n)).to eq(false)}
            data_range_complex_nan_and_infs.∀{|c| expect(𝕌.∋?(c)).to eq(false)}
          end
        end
      end # end: {𝕌}

      context 'ℝ' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            data_range_ints.∀{|n| expect(ℝ.∋?(n)).to eq(true)}
            expect(ℝ.∋?(0.0)).to eq(true)
            expect(ℝ.∋?(data_rational_default)).to eq(true)
            expect(ℝ.∋?(data_with_complex_only_real_component)).to eq(true)
            expect(ℝ.∋?(data_big_decimal_leet_kinda)).to eq(true)
            expect(ℝ.∋?(data_complex_one)).to eq(true)
          end
          it 'cases: negative' do
            data_float_error_cases.∀{|n| expect(ℝ.∋?(n)).to eq(false)}
            data_big_decimal_error_cases.∀{|n| expect(ℝ.∋?(n)).to eq(false)}
            expect(ℝ.∋?(datac_one)).to eq(false)
            data_range_complex_nan_and_infs.∀{|c| expect(ℝ.∋?(c)).to eq(false)}
            expect(ℝ.∋?(data_with_complex)).to eq(false)
          end
        end
      end # end: {ℝ}

      context 'ℂ' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            expect(ℂ.∋?(data_rational_default)).to eq(true)
            expect(ℂ.∋?(data_with_complex)).to eq(true)
            data_range_ints.∀{|n| expect(ℂ.∋?(n)).to eq(true)}
            expect(ℂ.∋?(data_big_decimal_leet_kinda)).to eq(true)
            expect(ℂ.∋?(datac_one)).to eq(true)
            expect(ℂ.∋?(1.337)).to eq(true)
          end
          it 'cases: negative' do
            data_float_error_cases.∀{|n| expect(ℂ.∋?(n)).to eq(false)}
            data_big_decimal_error_cases.∀{|n| expect(ℂ.∋?(n)).to eq(false)}
            data_range_complex_nan_and_infs.∀{|c| expect(ℂ.∋?(c)).to eq(false)}
            data_float_error_cases.∀{|n| expect(ℂ.∋?(n)).to eq(false)}
          end
        end
      end # end: {ℂ}

      context 'ℚ' do
        context 'handles needed scenarios' do
          context 'cases: positive' do
            it 'w/ ints' do
              data_range_ints.∀{|n| expect(ℚ.∋?(n)).to eq(true)}
            end
            context 'w/ float' do
              it 'regular data' do
                expect(ℚ.∋?(1.0)).to eq(true)
              end
              it 'cases: un-covered scope' do
                expect(ℚ.∋?(1.1337)).to eq(nil)
                expect(ℚ.∋?(2.0/3)).to eq(nil)
              end
            end
            it 'w/ rational' do
              expect(ℚ.∋?(data_rational_default)).to eq(true)
            end
            it 'w/ big decimal' do
              expect(ℚ.∋?(data_big_decimal_one)).to eq(true)
            end
            context 'w/ complex' do
              it 'regular data' do
                expect(ℚ.∋?(dataf_one)).to eq(true)
              end
              it 'cases: un-covered scope' do
                expect(ℚ.∋?(Complex(2.0/3))).to eq(nil)
              end
            end
          end
          it 'cases: negative' do
            expect(ℚ.∋?(data_with_complex)).to eq(false)
            data_big_decimal_error_cases.∀{|n| expect(ℚ.∋?(n)).to eq(false)}
            data_range_complex_nan_and_infs.∀{|c| expect(ℚ.∋?(c)).to eq(false)}
            ([π, ℮, 𝚽, Ψ, ρ] + data_float_error_cases).∀{|n| expect(ℚ.∋?(n)).to eq(false)}
          end
        end
      end # end: {ℚ}
    end
  end

  #  __   ___  __   ___  __   __                   __   ___
  # |__) |__  |__) |__  /  \ |__)  |\/|  /\  |\ | /  ` |__
  # |    |___ |  \ |    \__/ |  \  |  | /~~\ | \| \__, |___
  context 'performance', :performance do
    context 'expression{𝔹.∋?(arg)}: performs very quickly' do
      it 'for cases: positive' do
        expect{𝔹.∋?(0)}.to perform_very_quickly
        expect{𝔹.∋?(1.0)}.to perform_very_quickly
      end
      it 'cases: negative' do
        scenarios = [data_float_error_cases + data_big_decimal_error_cases + data_complex_error_cases]
        scenarios.∀{|n| expect{𝔹.∋?(n)}.to perform_very_quickly}
      end
    end
    context 'expression{ℕ.∋?(arg)}: performs very quickly' do
      it 'for cases: positive' do
        expect{ℕ.∋?(data_complex_zero)}.to perform_very_quickly
      end
      it 'for cases: negative' do
        expect{ℕ.∋?(data_complex_nan)}.to perform_very_quickly
      end
    end
    context 'expression{𝕌.∋?(arg)}: performs very quickly' do
      it 'for cases: positive' do
        expect{𝕌.∋?(data_int_leet)}.to perform_very_quickly
        expect{𝕌.∋?(0.0)}.to perform_very_quickly
        expect{𝕌.∋?(data_rational_default)}.to perform_very_quickly
        expect{𝕌.∋?(data_big_decimal_leet_kinda)}.to perform_very_quickly
        expect{𝕌.∋?(55)}.to perform_very_quickly
        expect{𝕌.∋?(-1)}.to perform_very_quickly
        expect{𝕌.∋?(data_complex_one)}.to perform_very_quickly
      end
      it 'for cases: negative' do
        data_float_error_cases.∀{|n| expect{𝕌.∋?(n)}.to perform_very_quickly}
        data_big_decimal_error_cases.∀{|n| expect{𝕌.∋?(n)}.to perform_very_quickly}
        data_complex_error_cases.∀{|n| expect{𝕌.∋?(n)}.to perform_very_quickly}
        expect{𝕌.∋?(data_complex_nan)}.to perform_very_quickly
      end
    end
    context 'expression{ℝ.∋?(arg)}: performs very quickly' do
      it 'for cases: positive' do
        expect{ℝ.∋?(data_int_leet)}.to perform_very_quickly
        expect{ℝ.∋?(0.0)}.to perform_very_quickly
        expect{ℝ.∋?(data_rational_default)}.to perform_very_quickly
        expect{ℝ.∋?(data_big_decimal_leet_kinda)}.to perform_very_quickly
        expect{ℝ.∋?(data_complex_one)}.to perform_very_quickly
      end
      it 'for cases: negative' do
        data_float_error_cases.∀{|n| expect{ℝ.∋?(n)}.to perform_very_quickly}
        data_big_decimal_error_cases.∀{|n| expect{ℝ.∋?(n)}.to perform_very_quickly}
        expect{ℝ.∋?(data_complex_nan)}.to perform_very_quickly
        expect{ℝ.∋?(data_with_complex)}.to perform_very_quickly
      end
    end
    context 'expression{ℂ.∋?(arg)}: performs very quickly' do
      it 'for cases: positive' do
        expect{ℂ.∋?(data_rational_default)}.to perform_very_quickly
        expect{ℂ.∋?(data_with_complex)}.to perform_very_quickly
        expect{ℂ.∋?(1)}.to perform_very_quickly
        expect{ℂ.∋?(1.337)}.to perform_very_quickly
        expect{ℂ.∋?(data_big_decimal_zero)}.to perform_very_quickly
        expect{ℂ.∋?(datac_one)}.to perform_very_quickly
      end
      it 'for cases: negative' do
        expect{ℂ.∋?(data_big_decimal_negative_one)}.to perform_very_quickly
        data_big_decimal_error_cases.∀{|n| expect{ℂ.∋?(n)}.to perform_very_quickly}
        expect{ℂ.∋?(data_complex_nan)}.to perform_very_quickly
        expect{ℂ.∋?(data_float_nan)}.to perform_very_quickly
      end
    end
    context 'expression{ℤ.∋?(arg)}: performs very quickly' do
      it 'for cases: positive' do
        expect{ℤ.∋?(data_int_negative_one)}.to perform_very_quickly
        expect{ℤ.∋?(data_big_decimal_negative_leet)}.to perform_very_quickly
        expect{ℤ.∋?(-1337.0)}.to perform_very_quickly
        expect{ℤ.∋?(data_rational_negative_leet)}.to perform_very_quickly
        expect{ℤ.∋?(data_minus_leet)}.to perform_very_quickly
      end
      it 'for cases: negative' do
        data_big_decimal_error_cases.∀{|n| expect{ℤ.∋?(n)}.to perform_very_quickly}
        expect{ℤ.∋?(data_float_nan)}.to perform_very_quickly
        expect{ℤ.∋?(data_minus_leet2)}.to perform_very_quickly
        expect{ℤ.∋?(data_complex_nan)}.to perform_very_quickly
      end
    end
    context 'expression{ℚ.∋?(arg)}: performs very quickly' do
      it 'for cases: positive' do
        expect{ℚ.∋?(data_rational_default)}.to perform_very_quickly
        expect{ℚ.∋?(data_big_decimal_one)}.to perform_very_quickly
        expect{ℚ.∋?(1.0)}.to perform_very_quickly
        expect{ℚ.∋?(dataf_one)}.to perform_very_quickly
        expect{ℚ.∋?(data_int_leet)}.to perform_extremely_quickly
      end
      it 'for cases: negative' do
        expect{ℚ.∋?(data_with_complex)}.to perform_very_quickly
        data_big_decimal_error_cases.∀{|n| expect{ℚ.∋?(n)}.to perform_very_quickly}
        expect{ℚ.∋?(data_float_nan)}.to perform_very_quickly
        expect{ℚ.∋?(data_complex_nan)}.to perform_very_quickly
      end
    end
  end

end
