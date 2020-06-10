# coding: UTF-8

RSpec.describe 'complex.rb' do

  context 'extends class{Complex}' do

    context 'func{one?}' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          expect(Complex(1).one?).to eq(true)
          expect(Complex(1.0).one?).to eq(true)
        end
        it 'cases: negative' do
          expect(Complex(10).one?).to eq(false)
          expect(Complex(0).one?).to eq(false)
          expect(Complex(-1).one?).to eq(false)
          expect(Complex(1, 1).one?).to eq(false)
          expect(Complex(10, 10).one?).to eq(false)
          expect(Complex(-1, -1).one?).to eq(false)
          expect(Complex(-1, 1).one?).to eq(false)
          expect(Complex(1, -1).one?).to eq(false)
        end
      end
    end # end: {func{one?}}

    context 'func{smells_like_int?}' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          expect(Complex(1).smells_like_int?).to eq(true)
          expect(Complex(1.0).smells_like_int?).to eq(true)
          expect(Complex(0).smells_like_int?).to eq(true)
        end
        it 'cases: negative' do
          expect(Complex(3i, 2i).smells_like_int?).to eq(false)
          expect(Complex(1i).smells_like_int?).to eq(false)
          expect(Complex(-1.1).smells_like_int?).to eq(false)
          expect(Complex(1i).smells_like_int?).to eq(false)
          expect(Complex(1i, 0).smells_like_int?).to eq(false)
          expect(Complex(-1, -1).smells_like_int?).to eq(false)
          expect(Complex(-1, 1).smells_like_int?).to eq(false)
          expect(Complex(1, -1).smells_like_int?).to eq(false)
        end
      end
    end # end: {func{smells_like_int?}}

    context 'func{gaussian_integer?}' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          expect(Complex(1).gaussian_integer?).to eq(true)
          expect(Complex(1.0).gaussian_integer?).to eq(true)
          expect(Complex(10).gaussian_integer?).to eq(true)
          expect(Complex(0).gaussian_integer?).to eq(true)
          expect(Complex(1, 1).gaussian_integer?).to eq(true)
          expect(Complex(0, -1).gaussian_integer?).to eq(true)
          expect(Complex(1337, 1337).gaussian_integer?).to eq(true)
          expect(Complex(1337.0, -1337.0).gaussian_integer?).to eq(true)
          expect(Complex(1i).gaussian_integer?).to eq(true)
          expect(Complex(3i, 2i).gaussian_integer?).to eq(true)
        end
        it 'cases: negative' do
          expect(Complex(0.1i).gaussian_integer?).to eq(false)
          expect(Complex(1, 0.5).gaussian_integer?).to eq(false)
          expect(Complex(10.5, 10).gaussian_integer?).to eq(false)
          expect(Complex(-1.6, -1.6).gaussian_integer?).to eq(false)
          expect(Complex(-1, Rational(1.233, 1.5)).gaussian_integer?).to eq(false)
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
  context 'performance', :performance => 'slow' do

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
