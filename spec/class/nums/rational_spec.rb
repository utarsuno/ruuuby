# coding: utf-8

RSpec.describe 'rational.rb' do
  let(:data_minus_leet2){ℚ(-1337, 2)}

  let(:data_with_complex_only_real_component){ℚ(ℂ(1, 0.0), 1.5)}
  let(:data_with_complex){ℚ(ℂ(1, 1.5), 1.5)}

  context 'extends class[Rational]' do

    context 'by adding needed functions' do
      it 'exists' do
        RuuubyTestHelper::Nums::CONFIG_RATIONAL[:ruby].∀{|c| expect(::Rational.∃⨍?(c)).to eq(true)}
      end
    end

    context 'by adding function{ℕ?}' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          expect(data_rational_zero.ℕ?).to eq(true)
          expect(data_rational_one.ℕ?).to eq(true)
          expect(data_rational_leet.ℕ?).to eq(true)
        end
        it 'cases: negative' do
          expect(data_with_complex.ℕ?).to eq(false)
        end
      end
    end

    context 'by adding function{ℤ?}' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          expect(data_rational_negative_leet.ℤ?).to eq(true)
          expect(data_rational_negative_one.ℤ?).to eq(true)
          expect(data_rational_zero.ℤ?).to eq(true)
          expect(data_rational_one.ℤ?).to eq(true)
          expect(data_rational_leet.ℤ?).to eq(true)
          expect(ℚ(ℂ(3, 0), 1).ℤ?).to eq(true)
        end
        it 'cases: negative' do
          expect(data_with_complex.ℤ?).to eq(false)
        end
      end
    end

    context 'by adding function{ℂ?}' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          expect(data_rational_default.ℂ?).to eq(true)
          expect(data_with_complex.ℂ?).to eq(true)
        end
      end
    end

    context 'by adding function{ℚ?}' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          expect(data_rational_default.ℚ?).to eq(true)
        end
        it 'cases: negative' do
          expect(data_with_complex.ℚ?).to eq(false)
        end
      end
    end

    context 'by adding function{ℝ?}' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          expect(data_rational_default.ℝ?).to eq(true)
          expect(data_with_complex_only_real_component.ℝ?).to eq(true)
        end
        it 'cases: negative' do
          expect(data_with_complex.ℝ?).to eq(false)
        end
      end
    end

    context 'by adding function{𝕌?}' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          expect(data_rational_default.𝕌?).to eq(true)
          expect(data_with_complex.𝕌?).to eq(true)
          expect(data_with_complex_only_real_component.𝕌?).to eq(true)
        end
      end
    end

    context 'supports feature(`f16`)' do
      context 'by supporting operation {^⁻⁹}' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            expect_scenarios_power_operations(data_range_rational_all_but_zero, :⁻⁹, -9, true)
            expect_scenarios_power_operations(data_range_rational_w_complex, :⁻⁹, -9, true)
          end
          it 'cases: negative' do
            expect{data_rational_zero^⁻⁹}.to raise_error(ZeroDivisionError)
          end
        end
      end
      context 'by supporting operation {^⁻⁸}' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            expect_scenarios_power_operations(data_range_rational_all_but_zero, :⁻⁸, -8, true)
            expect_scenarios_power_operations(data_range_rational_w_complex, :⁻⁸, -8, true)
          end
          it 'cases: negative' do
            expect{data_rational_zero^⁻⁸}.to raise_error(ZeroDivisionError)
          end
        end
      end
      context 'by supporting operation {^⁻⁷}' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            expect_scenarios_power_operations(data_range_rational_all_but_zero, :⁻⁷, -7, true)
            expect_scenarios_power_operations(data_range_rational_w_complex, :⁻⁷, -7, true)
          end
          it 'cases: negative' do
            expect{data_rational_zero^⁻⁷}.to raise_error(ZeroDivisionError)
          end
        end
      end
      context 'by supporting operation {^⁻⁶}' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            expect_scenarios_power_operations(data_range_rational_all_but_zero, :⁻⁶, -6, true)
            expect_scenarios_power_operations(data_range_rational_w_complex, :⁻⁶, -6, true)
          end
          it 'cases: negative' do
            expect{data_rational_zero^⁻⁶}.to raise_error(ZeroDivisionError)
          end
        end
      end
      context 'by supporting operation {^⁻⁵}' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            expect_scenarios_power_operations(data_range_rational_all_but_zero, :⁻⁵, -5, true)
            expect_scenarios_power_operations(data_range_rational_w_complex, :⁻⁵, -5, true)
          end
          it 'cases: negative' do
            expect{data_rational_zero^⁻⁵}.to raise_error(ZeroDivisionError)
          end
        end
      end
      context 'by supporting operation {^⁻⁴}' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            expect_scenarios_power_operations(data_range_rational_all_but_zero, :⁻⁴, -4, true)
            expect_scenarios_power_operations(data_range_rational_w_complex, :⁻⁴, -4, true)
          end
          it 'cases: negative' do
            expect{data_rational_zero^⁻⁴}.to raise_error(ZeroDivisionError)
          end
        end
      end
      context 'by supporting operation {^⁻³}' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            expect_scenarios_power_operations(data_range_rational_all_but_zero, :⁻³, -3, true)
            expect_scenarios_power_operations(data_range_rational_w_complex, :⁻³, -3, true)
          end
          it 'cases: negative' do
            expect{data_rational_zero^⁻³}.to raise_error(ZeroDivisionError)
          end
        end
      end
      context 'by supporting operation {^⁻²}' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            expect_scenarios_power_operations(data_range_rational_all_but_zero, :⁻², -2, true)
            expect_scenarios_power_operations(data_range_rational_w_complex, :⁻², -2, true)
          end
          it 'cases: negative' do
            expect{data_rational_zero^⁻²}.to raise_error(ZeroDivisionError)
          end
        end
      end
      context 'by supporting operation {^⁻¹}' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            expect_scenarios_power_operations(data_range_rational_all_but_zero, :⁻¹, -1, true)
            expect_scenarios_power_operations(data_range_rational_w_complex, :⁻¹, -1, true)
          end
          it 'cases: negative' do
            expect{data_rational_zero^⁻¹}.to raise_error(ZeroDivisionError)
          end
        end
      end
      context 'by supporting operation {^⁰}' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            expect_scenarios_power_operations(data_range_rational_all_but_zero, :⁰, 0, true)
            expect_scenarios_power_operations(data_range_rational_w_complex, :⁰, 0, true)
          end
          it 'cases: negative' do
            expect((data_rational_zero^⁰).nan?).to eq(true)
          end
        end
      end
      context 'by supporting operation {^¹}' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            expect_scenarios_power_operations(data_range_rational, :¹, 1, true)
            expect_scenarios_power_operations(data_range_rational_w_complex, :¹, 1, true)
          end
        end
      end
      context 'by supporting operation {^²}' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            expect_scenarios_power_operations(data_range_rational, :², 2, true)
            expect_scenarios_power_operations(data_range_rational_w_complex, :², 2, true)
          end
        end
      end
      context 'by supporting operation {^³}' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            expect_scenarios_power_operations(data_range_rational, :³, 3, true)
            expect_scenarios_power_operations(data_range_rational_w_complex, :³, 3, true)
          end
        end
      end
      context 'by supporting operation {^⁴}' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            expect_scenarios_power_operations(data_range_rational, :⁴, 4, true)
            expect_scenarios_power_operations(data_range_rational_w_complex, :⁴, 4, true)
          end
        end
      end
      context 'by supporting operation {^⁵}' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            expect_scenarios_power_operations(data_range_rational, :⁵, 5, true)
            expect_scenarios_power_operations(data_range_rational_w_complex, :⁵, 5, true)
          end
        end
      end
      context 'by supporting operation {^⁶}' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            expect_scenarios_power_operations(data_range_rational, :⁶, 6, true)
            expect_scenarios_power_operations(data_range_rational_w_complex, :⁶, 6, true)
          end
        end
      end
      context 'by supporting operation {^⁷}' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            expect_scenarios_power_operations(data_range_rational, :⁷, 7, true)
            expect_scenarios_power_operations(data_range_rational_w_complex, :⁷, 7, true)
          end
        end
      end
      context 'by supporting operation {^⁸}' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            expect_scenarios_power_operations(data_range_rational, :⁸, 8, true)
            expect_scenarios_power_operations(data_range_rational_w_complex, :⁸, 8, true)
          end
        end
      end
      context 'by supporting operation {^⁹}' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            expect_scenarios_power_operations(data_range_rational, :⁹, 9, true)
            expect_scenarios_power_operations(data_range_rational_w_complex, :⁹, 9, true)
          end
        end
      end
    end # end: {supports feature(`f16`)}

  end

  #  __   ___  __   ___  __   __                   __   ___
  # |__) |__  |__) |__  /  \ |__)  |\/|  /\  |\ | /  ` |__
  # |    |___ |  \ |    \__/ |  \  |  | /~~\ | \| \__, |___
  context 'performance', :performance do
    context 'func{ℕ?}: performs extremely quickly' do
      it 'for cases: true' do
        expect{data_rational_one.ℕ?}.to perform_extremely_quickly
      end
      it 'for cases: negative' do
        expect{data_rational_negative_one.ℕ?}.to perform_extremely_quickly
      end
    end

    context 'func{ℤ?}: performs very quickly' do
      it 'for cases: true' do
        expect{data_rational_negative_leet.ℤ?}.to perform_very_quickly
      end
      it 'for cases: negative' do
        expect{data_minus_leet2.ℤ?}.to perform_very_quickly
      end
    end

    context 'func{ℂ?}: performs extremely quickly' do
      it 'for cases: true' do
        expect{data_rational_default.ℂ?}.to perform_extremely_quickly
        expect{data_with_complex.ℂ?}.to perform_extremely_quickly
      end
    end

    context 'func{ℚ?}: performs very quickly' do
      it 'for cases: true' do
        expect{data_rational_default.ℚ?}.to perform_very_quickly
      end
      it 'for cases: negative' do
        expect{data_with_complex.ℚ?}.to perform_very_quickly
      end
    end

    context 'func{ℝ?}: performs extremely quickly' do
      it 'for cases: true' do
        expect{data_rational_default.ℝ?}.to perform_extremely_quickly
        expect{data_with_complex.ℝ?}.to perform_extremely_quickly
      end
      it 'for cases: false' do
        expect{data_with_complex.ℝ?}.to perform_extremely_quickly
      end
    end

    context 'func{𝕌?}: performs very quickly' do
      it 'for cases: true' do
        expect{data_rational_default.𝕌?}.to perform_very_quickly
      end
    end

    context 'roughly preserves original pre-extension-performance' do

      context 'performance hit for following funcs, are under 105%' do
        it '`^⁻⁹` (compared to `** -9`)' do
          expect {data_rational_3^⁻⁹}.to perform_slower_than {data_rational_3 ** -9}.within(tΔ_within).warmup(tΔ_warmup).at_most(pΔ_105)
          expect {data_rational_3 ** -9}.to perform_faster_than {data_rational_3^⁻⁹}.within(tΔ_within).warmup(tΔ_warmup).at_most(pΔ_105)
        end

        it '`^⁻⁸` (compared to `** -8`)' do
          expect {data_rational_3^⁻⁸}.to perform_slower_than {data_rational_3 ** -8}.within(tΔ_within).warmup(tΔ_warmup).at_most(pΔ_105)
        end

        it '`^⁻⁷` (compared to `** -7`)' do
          expect {data_rational_3^⁻⁷}.to perform_slower_than {data_rational_3 ** -7}.within(tΔ_within).warmup(tΔ_warmup).at_most(pΔ_105)
        end

        it '`^⁻⁶` (compared to `** -6`)' do
          expect {data_rational_3^⁻⁶}.to perform_slower_than {data_rational_3 ** -6}.within(tΔ_within).warmup(tΔ_warmup).at_most(pΔ_105)
        end

        it '`^⁻⁵` (compared to `** -5`)' do
          expect {data_rational_3^⁻⁵}.to perform_slower_than {data_rational_3 ** -5}.within(tΔ_within).warmup(tΔ_warmup).at_most(pΔ_105)
        end

        it '`^⁻⁴` (compared to `** -4`)' do
          expect {data_rational_3^⁻⁴}.to perform_slower_than {data_rational_3 ** -4}.within(tΔ_within).warmup(tΔ_warmup).at_most(pΔ_105)
        end

        it '`^⁻³` (compared to `** -3`)' do
          expect {data_rational_3^⁻³}.to perform_slower_than {data_rational_3 ** -3}.within(tΔ_within).warmup(tΔ_warmup).at_most(pΔ_105)
        end

        it '`^⁻²` (compared to `** -2`)' do
          expect {data_rational_3^⁻²}.to perform_slower_than {data_rational_3 ** -2}.within(tΔ_within).warmup(tΔ_warmup).at_most(pΔ_105)
        end

        it '`^⁻¹` (compared to `** -1`)' do
          expect {data_rational_3^⁻¹}.to perform_slower_than {data_rational_3 ** -1}.within(tΔ_within).warmup(tΔ_warmup).at_most(pΔ_105)
        end

        it '`^⁰` (compared to `** 0`)' do
          expect {data_rational_3^⁰}.to perform_slower_than {data_rational_3 ** 0}.within(tΔ_within).warmup(tΔ_warmup).at_most(pΔ_105)
        end

        it '`^¹` (compared to `** 1`)' do
          expect {data_rational_3^¹}.to perform_slower_than {data_rational_3 ** 1}.within(tΔ_within).warmup(tΔ_warmup).at_most(pΔ_105)
        end

        it '`^²` (compared to `** 2`)' do
          expect {data_rational_3^²}.to perform_slower_than {data_rational_3 ** 2}.within(tΔ_within).warmup(tΔ_warmup).at_most(pΔ_105)
        end

        it '`^³` (compared to `** 3`)' do
          expect {data_rational_3^³}.to perform_slower_than {data_rational_3 ** 3}.within(tΔ_within).warmup(tΔ_warmup).at_most(pΔ_105)
        end

        it '`^⁴` (compared to `** 4`)' do
          expect {data_rational_3^⁴}.to perform_slower_than {data_rational_3 ** 4}.within(tΔ_within).warmup(tΔ_warmup).at_most(pΔ_105)
        end

        it '`^⁵` (compared to `** 5`)' do
          expect {data_rational_3^⁵}.to perform_slower_than {data_rational_3 ** 5}.within(tΔ_within).warmup(tΔ_warmup).at_most(pΔ_105)
        end

        it '`^⁶` (compared to `** 6`)' do
          expect {data_rational_3^⁶}.to perform_slower_than {data_rational_3 ** 6}.within(tΔ_within).warmup(tΔ_warmup).at_most(pΔ_105)
        end

        it '`^⁷` (compared to `** 7`)' do
          expect {data_rational_3^⁷}.to perform_slower_than {data_rational_3 ** 7}.within(tΔ_within).warmup(tΔ_warmup).at_most(pΔ_105)
        end

        it '`^⁸` (compared to `** 8`)' do
          expect {data_rational_3^⁸}.to perform_slower_than {data_rational_3 ** 8}.within(tΔ_within).warmup(tΔ_warmup).at_most(pΔ_105)
        end

        it '`^⁹` (compared to `** 9`)' do
          expect {data_rational_3^⁹}.to perform_slower_than {data_rational_3 ** 9}.within(tΔ_within).warmup(tΔ_warmup).at_most(pΔ_105)
        end
      end

    end

  end
end
