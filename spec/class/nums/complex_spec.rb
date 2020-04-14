# coding: utf-8

RSpec.describe 'complex.rb' do
  let(:data_nan_with_complex){ℂ(Float::NAN, 1.5)}
  let(:data_infinity_with_complex){ℂ(1.0/0.0, 1.5)}
  let(:data_negative_infinity_with_complex){ℂ(1.0/0.0, 1.5)}
  let(:dataf_one){ℂ(1.0)}
  let(:datac_one){ℂ(1, 1)}
  let(:data_minus_leet){ℂ(-1337)}

  context 'extends class[Complex]' do

    context 'by adding needed functions' do
      it 'exists' do
        RuuubyTestHelper::Nums::CONFIG_COMPLEX[:ruby].∀{|c| expect(::Complex.∃⨍?(c)).to eq(true)}
      end
    end

    context 'by adding function{ℕ?}' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          expect(data_complex_zero.ℕ?).to eq(true)
          expect(data_complex_one.ℕ?).to eq(true)
          expect(data_complex_leet.ℕ?).to eq(true)
        end
        context 'cases: negative' do
          it 'normal non-matching data' do
            expect(ℂ(0, 1).ℕ?).to eq(false)
            expect(datac_one.ℕ?).to eq(false)
            expect(ℂ(-1).ℕ?).to eq(false)
            expect(ℂ(1337.1337).ℕ?).to eq(false)

            data_range_complex_nan_and_infs.∀{|c| expect(c.ℕ?).to eq(false)}
          end
        end
      end
    end

    context 'by adding function{ℤ?}' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          expect(data_minus_leet.ℤ?).to eq(true)
          expect(ℂ(-1).ℤ?).to eq(true)
          expect(data_complex_zero.ℤ?).to eq(true)
          expect(data_complex_one.ℤ?).to eq(true)
          expect(data_complex_leet.ℤ?).to eq(true)
        end
        it 'cases: negative' do
          data_range_complex_nan_and_infs.∀{|c| expect(c.ℤ?).to eq(false)}
          expect(ℂ(0, 1).ℤ?).to eq(false)
          expect(datac_one.ℤ?).to eq(false)
          expect(ℂ(1337.1337).ℤ?).to eq(false)
        end
      end
    end

    context 'by adding function{ℚ?}' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          expect(dataf_one.ℚ?).to eq(true)
        end
        it 'cases: negative' do
          data_range_complex_nan_and_infs.∀{|c| expect(c.ℚ?).to eq(false)}
        end
        it 'cases: un-covered scope' do
          expect(ℂ(1.1337).ℚ?).to eq(nil)
        end
      end
    end

    context 'by adding function{ℂ?}' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          expect(datac_one.ℂ?).to eq(true)
        end
        it 'cases: negative' do
          data_range_complex_nan_and_infs.∀{|c| expect(c.ℂ?).to eq(false)}
        end
      end
    end

    context 'by adding function{ℝ?}' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          expect(data_complex_one.ℝ?).to eq(true)
        end
        it 'cases: negative' do
          expect(datac_one.ℝ?).to eq(false)
          data_range_complex_nan_and_infs.∀{|c| expect(c.ℝ?).to eq(false)}
        end
      end
    end

    context 'by adding function{𝕌?}' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          expect(data_complex_one.𝕌?).to eq(true)
        end
        it 'cases: negative' do
          data_range_complex_nan_and_infs.∀{|c| expect(c.𝕌?).to eq(false)}
        end
      end
    end

    context 'supports feature(`f16`)' do
      context 'by supporting operation {^⁻⁹}' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            expect_scenarios_power_operations(data_range_complex_one_to_positive, :⁻⁹, -9, true)
            expect_scenarios_power_operations(data_range_complex_negative_one, :⁻⁹, -9, true)
            expect_scenarios_power_operations(data_range_complex_one_w_negative_complex, :⁻⁹, -9, true)
            expect_scenarios_power_operations(data_range_complex_just_infs, :⁻⁹, -9, true)
          end
          it 'cases: negative' do
            expect{data_rational_zero^⁻⁹}.to raise_error(ZeroDivisionError)
          end
        end
      end
      context 'by supporting operation {^⁻⁸}' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            expect_scenarios_power_operations(data_range_complex_one_to_positive, :⁻⁸, -8, true)
            expect_scenarios_power_operations(data_range_complex_negative_one, :⁻⁸, -8, true)
            expect_scenarios_power_operations(data_range_complex_one_w_negative_complex, :⁻⁸, -8, true)
            expect_scenarios_power_operations(data_range_complex_just_infs, :⁻⁸, -8, true)
          end
          it 'cases: negative' do
            expect{data_rational_zero^⁻⁸}.to raise_error(ZeroDivisionError)
          end
        end
      end
      context 'by supporting operation {^⁻⁷}' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            expect_scenarios_power_operations(data_range_complex_one_to_positive, :⁻⁷, -7, true)
            expect_scenarios_power_operations(data_range_complex_negative_one, :⁻⁷, -7, true)
            expect_scenarios_power_operations(data_range_complex_one_w_negative_complex, :⁻⁷, -7, true)
            expect_scenarios_power_operations(data_range_complex_just_infs, :⁻⁷, -7, true)
          end
          it 'cases: negative' do
            expect{data_rational_zero^⁻⁷}.to raise_error(ZeroDivisionError)
          end
        end
      end
      context 'by supporting operation {^⁻⁶}' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            expect_scenarios_power_operations(data_range_complex_one_to_positive, :⁻⁶, -6, true)
            expect_scenarios_power_operations(data_range_complex_negative_one, :⁻⁶, -6, true)
            expect_scenarios_power_operations(data_range_complex_one_w_negative_complex, :⁻⁶, -6, true)
            expect_scenarios_power_operations(data_range_complex_just_infs, :⁻⁶, -6, true)
          end
          it 'cases: negative' do
            expect{data_rational_zero^⁻⁶}.to raise_error(ZeroDivisionError)
          end
        end
      end
      context 'by supporting operation {^⁻⁵}' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            expect_scenarios_power_operations(data_range_complex_one_to_positive, :⁻⁵, -5, true)
            expect_scenarios_power_operations(data_range_complex_negative_one, :⁻⁵, -5, true)
            expect_scenarios_power_operations(data_range_complex_one_w_negative_complex, :⁻⁵, -5, true)
            expect_scenarios_power_operations(data_range_complex_just_infs, :⁻⁵, -5, true)
          end
          it 'cases: negative' do
            expect{data_rational_zero^⁻⁵}.to raise_error(ZeroDivisionError)
          end
        end
      end
      context 'by supporting operation {^⁻⁴}' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            expect_scenarios_power_operations(data_range_complex_one_to_positive, :⁻⁴, -4, true)
            expect_scenarios_power_operations(data_range_complex_negative_one, :⁻⁴, -4, true)
            expect_scenarios_power_operations(data_range_complex_one_w_negative_complex, :⁻⁴, -4, true)
            expect_scenarios_power_operations(data_range_complex_just_infs, :⁻⁴, -4, true)
          end
          it 'cases: negative' do
            expect{data_rational_zero^⁻⁴}.to raise_error(ZeroDivisionError)
          end
        end
      end
      context 'by supporting operation {^⁻³}' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            expect_scenarios_power_operations(data_range_complex_one_to_positive, :⁻³, -3, true)
            expect_scenarios_power_operations(data_range_complex_negative_one, :⁻³, -3, true)
            expect_scenarios_power_operations(data_range_complex_one_w_negative_complex, :⁻³, -3, true)
            expect_scenarios_power_operations(data_range_complex_just_infs, :⁻³, -3, true)
          end
          it 'cases: negative' do
            expect{data_rational_zero^⁻³}.to raise_error(ZeroDivisionError)
          end
        end
      end
      context 'by supporting operation {^⁻²}' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            expect_scenarios_power_operations(data_range_complex_one_to_positive, :⁻², -2, true)
            expect_scenarios_power_operations(data_range_complex_negative_one, :⁻², -2, true)
            expect_scenarios_power_operations(data_range_complex_one_w_negative_complex, :⁻², -2, true)
            expect_scenarios_power_operations(data_range_complex_just_infs, :⁻², -2, true)
          end
          it 'cases: negative' do
            expect{data_rational_zero^⁻²}.to raise_error(ZeroDivisionError)
          end
        end
      end
      context 'by supporting operation {^⁻¹}' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            expect_scenarios_power_operations(data_range_complex_one_to_positive, :⁻¹, -1, true)
            expect_scenarios_power_operations(data_range_complex_negative_one, :⁻¹, -1, true)
            expect_scenarios_power_operations(data_range_complex_one_w_negative_complex, :⁻¹, -1, true)
            expect_scenarios_power_operations(data_range_complex_just_infs, :⁻¹, -1, true)
          end
          it 'cases: negative' do
            expect{data_rational_zero^⁻¹}.to raise_error(ZeroDivisionError)
          end
        end
      end
      context 'by supporting operation {^⁰}' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            expect_scenarios_power_operations(data_range_complex_one_to_positive, :⁰, 0, true)
            expect_scenarios_power_operations(data_range_complex_negative_one, :⁰, 0, true)
            expect_scenarios_power_operations(data_range_complex_one_w_negative_complex, :⁰, 0, true)
            expect_scenarios_power_operations(data_range_complex_just_infs, :⁰, 0, true)
          end
          it 'cases: negative' do
            expect((data_rational_zero^⁰).nan?).to eq(true)
          end
        end
      end
      context 'by supporting operation {^¹}' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            expect_scenarios_power_operations(data_range_complex_one_from_zero_to_positive, :¹, 1, true)
            expect_scenarios_power_operations(data_range_complex_negative_one, :¹, 1, true)
            expect_scenarios_power_operations(data_range_complex_one_w_negative_complex, :¹, 1, true)
            expect_scenarios_power_operations(data_range_complex_just_infs, :¹, 1, true)
          end
        end
      end
      context 'by supporting operation {^²}' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            expect_scenarios_power_operations(data_range_complex_one_from_zero_to_positive, :², 2, true)
            expect_scenarios_power_operations(data_range_complex_negative_one, :², 2, true)
            expect_scenarios_power_operations(data_range_complex_one_w_negative_complex, :², 2, true)
            expect_scenarios_power_operations(data_range_complex_just_infs, :², 2, true)
          end
        end
      end
      context 'by supporting operation {^³}' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            expect_scenarios_power_operations(data_range_complex_one_from_zero_to_positive, :³, 3, true)
            expect_scenarios_power_operations(data_range_complex_negative_one, :³, 3, true)
            expect_scenarios_power_operations(data_range_complex_one_w_negative_complex, :³, 3, true)
            expect_scenarios_power_operations(data_range_complex_just_infs, :³, 3, true)
          end
        end
      end
      context 'by supporting operation {^⁴}' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            expect_scenarios_power_operations(data_range_complex_one_from_zero_to_positive, :⁴, 4, true)
            expect_scenarios_power_operations(data_range_complex_negative_one, :⁴, 4, true)
            expect_scenarios_power_operations(data_range_complex_one_w_negative_complex, :⁴, 4, true)
            expect_scenarios_power_operations(data_range_complex_just_infs, :⁴, 4, true)
          end
        end
      end
      context 'by supporting operation {^⁵}' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            expect_scenarios_power_operations(data_range_complex_one_from_zero_to_positive, :⁵, 5, true)
            expect_scenarios_power_operations(data_range_complex_negative_one, :⁵, 5, true)
            expect_scenarios_power_operations(data_range_complex_one_w_negative_complex, :⁵, 5, true)
            expect_scenarios_power_operations(data_range_complex_just_infs, :⁵, 5, true)
          end
        end
      end
      context 'by supporting operation {^⁶}' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            expect_scenarios_power_operations(data_range_complex_one_from_zero_to_positive, :⁶, 6, true)
            expect_scenarios_power_operations(data_range_complex_negative_one, :⁶, 6, true)
            expect_scenarios_power_operations(data_range_complex_one_w_negative_complex, :⁶, 6, true)
            expect_scenarios_power_operations(data_range_complex_just_infs, :⁶, 6, true)
          end
        end
      end
      context 'by supporting operation {^⁷}' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            expect_scenarios_power_operations(data_range_complex_one_from_zero_to_positive, :⁷, 7, true)
            expect_scenarios_power_operations(data_range_complex_negative_one, :⁷, 7, true)
            expect_scenarios_power_operations(data_range_complex_one_w_negative_complex, :⁷, 7, true)
            expect_scenarios_power_operations(data_range_complex_just_infs, :⁷, 7, true)
          end
        end
      end
      context 'by supporting operation {^⁸}' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            expect_scenarios_power_operations(data_range_complex_one_from_zero_to_positive, :⁸, 8, true)
            expect_scenarios_power_operations(data_range_complex_negative_one, :⁸, 8, true)
            expect_scenarios_power_operations(data_range_complex_one_w_negative_complex, :⁸, 8, true)
            expect_scenarios_power_operations(data_range_complex_just_infs, :⁸, 8, true)
          end
        end
      end
      context 'by supporting operation {^⁹}' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            expect_scenarios_power_operations(data_range_complex_one_from_zero_to_positive, :⁹, 9, true)
            expect_scenarios_power_operations(data_range_complex_negative_one, :⁹, 9, true)
            expect_scenarios_power_operations(data_range_complex_one_w_negative_complex, :⁹, 9, true)
            expect_scenarios_power_operations(data_range_complex_just_infs, :⁹, 9, true)
          end
        end
      end
    end # end: {supports feature(`f16`)}

  end

  #  __   ___  __   ___  __   __                   __   ___
  # |__) |__  |__) |__  /  \ |__)  |\/|  /\  |\ | /  ` |__
  # |    |___ |  \ |    \__/ |  \  |  | /~~\ | \| \__, |___
  context 'performance', :performance do
    context 'func{ℕ?}: performs very quickly' do
      it 'for cases: true' do
        expect{data_complex_zero.ℕ?}.to perform_very_quickly
      end
      it 'for cases: false' do
        expect{data_complex_nan.ℕ?}.to perform_very_quickly
      end
    end

    context 'func{ℤ?}: performs very quickly' do
      it 'for cases: true' do
        expect{data_minus_leet.ℤ?}.to perform_very_quickly
      end
      it 'for cases: false' do
        expect{data_complex_nan.ℤ?}.to perform_very_quickly
      end
    end

    context 'func{ℂ?}: performs very quickly' do
      it 'for cases: true' do
        expect{datac_one.ℂ?}.to perform_very_quickly
      end
      it 'for cases: false' do
        expect{data_complex_nan.ℂ?}.to perform_very_quickly
      end
    end

    context 'func{ℚ?}: performs very quickly' do
      it 'for cases: true' do
        expect{dataf_one.ℚ?}.to perform_very_quickly
      end
      it 'for cases: false' do
        expect{data_complex_nan.ℚ?}.to perform_very_quickly
      end
    end

    context 'func{ℝ?}: performs very quickly' do
      it 'for cases: true' do
        expect{data_complex_one.ℝ?}.to perform_very_quickly
      end
      it 'for cases: false' do
        expect{data_complex_nan.ℝ?}.to perform_very_quickly
      end
    end

    context 'func{𝕌?}: performs very quickly' do
      it 'for cases: true' do
        expect{data_complex_one.𝕌?}.to perform_very_quickly
      end
      it 'for cases: false' do
        expect{data_complex_nan.𝕌?}.to perform_very_quickly
      end
    end

    context 'roughly preserves original pre-extension-performance' do
      context 'performance hit for following funcs, are under 85%' do
        it '`^⁻⁹` (compared to `** -9`)' do
          expect {data_complex_3i^⁻⁹}.to perform_slower_than {data_complex_3i ** -9}.within(tΔ_within).warmup(tΔ_warmup).at_most(pΔ_85)
        end

        it '`^⁻⁸` (compared to `** -8`)' do
          expect {data_complex_3i^⁻⁸}.to perform_slower_than {data_complex_3i ** -8}.within(tΔ_within).warmup(tΔ_warmup).at_most(pΔ_85)
        end

        it '`^⁻⁷` (compared to `** -7`)' do
          expect {data_complex_3i^⁻⁷}.to perform_slower_than {data_complex_3i ** -7}.within(tΔ_within).warmup(tΔ_warmup).at_most(pΔ_85)
        end

        it '`^⁻⁶` (compared to `** -6`)' do
          expect {data_complex_3i^⁻⁶}.to perform_slower_than {data_complex_3i ** -6}.within(tΔ_within).warmup(tΔ_warmup).at_most(pΔ_85)
        end

        it '`^⁻⁵` (compared to `** -5`)' do
          expect {data_complex_3i^⁻⁵}.to perform_slower_than {data_complex_3i ** -5}.within(tΔ_within).warmup(tΔ_warmup).at_most(pΔ_85)
        end

        it '`^⁻⁴` (compared to `** -4`)' do
          expect {data_complex_3i^⁻⁴}.to perform_slower_than {data_complex_3i ** -4}.within(tΔ_within).warmup(tΔ_warmup).at_most(pΔ_85)
        end

        it '`^⁻³` (compared to `** -3`)' do
          expect {data_complex_3i^⁻³}.to perform_slower_than {data_complex_3i ** -3}.within(tΔ_within).warmup(tΔ_warmup).at_most(pΔ_85)
        end

        it '`^⁻²` (compared to `** -2`)' do
          expect {data_complex_3i^⁻²}.to perform_slower_than {data_complex_3i ** -2}.within(tΔ_within).warmup(tΔ_warmup).at_most(pΔ_85)
        end

        it '`^⁻¹` (compared to `** -1`)' do
          expect {data_complex_3i^⁻¹}.to perform_slower_than {data_complex_3i ** -1}.within(tΔ_within).warmup(tΔ_warmup).at_most(pΔ_85)
        end

        it '`^⁰` (compared to `** 0`)' do
          expect {data_complex_3i^⁰}.to perform_slower_than {data_complex_3i ** 0}.within(tΔ_within).warmup(tΔ_warmup).at_most(pΔ_85)
        end

        it '`^¹` (compared to `** 1`)' do
          expect {data_complex_3i^¹}.to perform_slower_than {data_complex_3i ** 1}.within(tΔ_within).warmup(tΔ_warmup).at_most(pΔ_85)
        end

        it '`^²` (compared to `** 2`)' do
          expect {data_complex_3i^²}.to perform_slower_than {data_complex_3i ** 2}.within(tΔ_within).warmup(tΔ_warmup).at_most(pΔ_85)
        end

        it '`^³` (compared to `** 3`)' do
          expect {data_complex_3i^³}.to perform_slower_than {data_complex_3i ** 3}.within(tΔ_within).warmup(tΔ_warmup).at_most(pΔ_85)
        end

        it '`^⁴` (compared to `** 4`)' do
          expect {data_complex_3i^⁴}.to perform_slower_than {data_complex_3i ** 4}.within(tΔ_within).warmup(tΔ_warmup).at_most(pΔ_85)
        end

        it '`^⁵` (compared to `** 5`)' do
          expect {data_complex_3i^⁵}.to perform_slower_than {data_complex_3i ** 5}.within(tΔ_within).warmup(tΔ_warmup).at_most(pΔ_85)
        end

        it '`^⁶` (compared to `** 6`)' do
          expect {data_complex_3i^⁶}.to perform_slower_than {data_complex_3i ** 6}.within(tΔ_within).warmup(tΔ_warmup).at_most(pΔ_85)
        end

        it '`^⁷` (compared to `** 7`)' do
          expect {data_complex_3i^⁷}.to perform_slower_than {data_complex_3i ** 7}.within(tΔ_within).warmup(tΔ_warmup).at_most(pΔ_85)
        end

        it '`^⁸` (compared to `** 8`)' do
          expect {data_complex_3i^⁸}.to perform_slower_than {data_complex_3i ** 8}.within(tΔ_within).warmup(tΔ_warmup).at_most(pΔ_85)
        end

        it '`^⁹` (compared to `** 9`)' do
          expect {data_complex_3i^⁹}.to perform_slower_than {data_complex_3i ** 9}.within(tΔ_within).warmup(tΔ_warmup).at_most(pΔ_85)
        end
      end
    end # end: {roughly preserves original pre-extension-performance}
  end # end: {performance}

end
