# coding: UTF-8

RSpec.describe 'rational.rb' do

  context 'extends class[Rational]' do

    context 'func{μ?}' do
      context 'handles needed scenarios' do
        context 'cases: positive' do
          it 'w/ ints' do
            [1, 2, 3, 4, 5, 1337].∀{|scenario| expect(Rational(1, scenario).μ?).to eq(true)}
          end
          it 'w/ floats' do
            [1.0, 2.0, 3.0, 4.0, 5.0, 1337.0].∀{|scenario| expect(Rational(1.0, scenario).μ?).to eq(true)}
          end
        end
        context 'cases: negative' do
          it 'w/ ints' do
            [-1, -2, -3, -4, -5, -1337].∀{|scenario| expect(Rational(1, scenario).μ?).to eq(false)}
          end
          it 'w/ floats' do
            [1.6, 2.5, 3.4, 4.3, 5.2, 1337.1, -1.0, -2.0, -3.0, -4.0, -5.0, -1337.0].∀{|scenario| expect(Rational(1.0, scenario).μ?).to eq(false)}
          end
        end
      end
    end

    context 'func{one?}' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          expect(Rational(1, 1).one?).to eq(true)
          expect(Rational(10, 10).one?).to eq(true)
          expect(Rational(-1, -1).one?).to eq(true)
        end
        it 'cases: negative' do
          expect(Rational(-1, 1).one?).to eq(false)
          expect(Rational(1, -1).one?).to eq(false)
        end
      end
    end # end: {func{one?}}

    context 'func{smells_like_int?}' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          expect(Rational(1).smells_like_int?).to eq(true)
          expect(Rational(1.0).smells_like_int?).to eq(true)
          expect(Rational(0).smells_like_int?).to eq(true)
          expect(Rational(10, 10).smells_like_int?).to eq(true)
          expect(Rational(-1, -1).smells_like_int?).to eq(true)
          expect(Rational(-1, 1).smells_like_int?).to eq(true)
          expect(Rational(1, -1).smells_like_int?).to eq(true)
          expect(Rational(2.25, 2.25).smells_like_int?).to eq(true)
        end
        it 'cases: negative' do
          expect(Rational(1, 2).smells_like_int?).to eq(false)
          expect(Rational(3i, 2i).smells_like_int?).to eq(false)
          expect(Rational(-1.1).smells_like_int?).to eq(false)
        end
      end
    end # end: {func{smells_like_int?}}

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
  context 'performance', :performance => :slow do

    context 'needed funcs perform fast enough' do
      context 'func{μ?}' do
        context 'handles needed scenarios' do
          context 'cases: positive' do
            it 'w/ ints' do
              expect{Rational(1, 1337).μ?}.to perform_very_quickly
            end
            it 'w/ floats' do
              expect{Rational(1, 1337.0).μ?}.to perform_very_quickly
            end
          end
          context 'cases: negative' do
            it 'w/ ints' do
              expect{Rational(1, -1337).μ?}.to perform_very_quickly
            end
            it 'w/ floats' do
              expect{Rational(1, 1337.1).μ?}.to perform_very_quickly
              expect{Rational(1, -1337.0).μ?}.to perform_very_quickly
            end
          end
        end
      end # end: {func{μ?}}
    end # end: {performance}

    context 'roughly preserves original pre-extension-performance' do

      context 'performance hit for following funcs, are under 105%' do
        it '`^⁻⁹` (compared to `** -9`)' do
          expect {data_rational_3^⁻⁹}.to perform_slower_than {data_rational_3 ** -9}.within(tΔ_within).warmup(tΔ_warmup).at_most(pΔ_95)
          expect {data_rational_3 ** -9}.to perform_faster_than {data_rational_3^⁻⁹}.within(tΔ_within).warmup(tΔ_warmup).at_most(pΔ_95)
        end

        it '`^⁻⁸` (compared to `** -8`)' do
          expect {data_rational_3^⁻⁸}.to perform_slower_than {data_rational_3 ** -8}.within(tΔ_within).warmup(tΔ_warmup).at_most(pΔ_95)
        end

        it '`^⁻⁷` (compared to `** -7`)' do
          expect {data_rational_3^⁻⁷}.to perform_slower_than {data_rational_3 ** -7}.within(tΔ_within).warmup(tΔ_warmup).at_most(pΔ_95)
        end

        it '`^⁻⁶` (compared to `** -6`)' do
          expect {data_rational_3^⁻⁶}.to perform_slower_than {data_rational_3 ** -6}.within(tΔ_within).warmup(tΔ_warmup).at_most(pΔ_95)
        end

        it '`^⁻⁵` (compared to `** -5`)' do
          expect {data_rational_3^⁻⁵}.to perform_slower_than {data_rational_3 ** -5}.within(tΔ_within).warmup(tΔ_warmup).at_most(pΔ_95)
        end

        it '`^⁻⁴` (compared to `** -4`)' do
          expect {data_rational_3^⁻⁴}.to perform_slower_than {data_rational_3 ** -4}.within(tΔ_within).warmup(tΔ_warmup).at_most(pΔ_95)
        end

        it '`^⁻³` (compared to `** -3`)' do
          expect {data_rational_3^⁻³}.to perform_slower_than {data_rational_3 ** -3}.within(tΔ_within).warmup(tΔ_warmup).at_most(pΔ_95)
        end

        it '`^⁻²` (compared to `** -2`)' do
          expect {data_rational_3^⁻²}.to perform_slower_than {data_rational_3 ** -2}.within(tΔ_within).warmup(tΔ_warmup).at_most(pΔ_95)
        end

        it '`^⁻¹` (compared to `** -1`)' do
          expect {data_rational_3^⁻¹}.to perform_slower_than {data_rational_3 ** -1}.within(tΔ_within).warmup(tΔ_warmup).at_most(pΔ_95)
        end

        it '`^⁰` (compared to `** 0`)' do
          expect {data_rational_3^⁰}.to perform_slower_than {data_rational_3 ** 0}.within(tΔ_within).warmup(tΔ_warmup).at_most(pΔ_95)
        end

        it '`^¹` (compared to `** 1`)' do
          expect {data_rational_3^¹}.to perform_slower_than {data_rational_3 ** 1}.within(tΔ_within).warmup(tΔ_warmup).at_most(pΔ_95)
        end

        it '`^²` (compared to `** 2`)' do
          expect {data_rational_3^²}.to perform_slower_than {data_rational_3 ** 2}.within(tΔ_within).warmup(tΔ_warmup).at_most(pΔ_95)
        end

        it '`^³` (compared to `** 3`)' do
          expect {data_rational_3^³}.to perform_slower_than {data_rational_3 ** 3}.within(tΔ_within).warmup(tΔ_warmup).at_most(pΔ_95)
        end

        it '`^⁴` (compared to `** 4`)' do
          expect {data_rational_3^⁴}.to perform_slower_than {data_rational_3 ** 4}.within(tΔ_within).warmup(tΔ_warmup).at_most(pΔ_95)
        end

        it '`^⁵` (compared to `** 5`)' do
          expect {data_rational_3^⁵}.to perform_slower_than {data_rational_3 ** 5}.within(tΔ_within).warmup(tΔ_warmup).at_most(pΔ_95)
        end

        it '`^⁶` (compared to `** 6`)' do
          expect {data_rational_3^⁶}.to perform_slower_than {data_rational_3 ** 6}.within(tΔ_within).warmup(tΔ_warmup).at_most(pΔ_95)
        end

        it '`^⁷` (compared to `** 7`)' do
          expect {data_rational_3^⁷}.to perform_slower_than {data_rational_3 ** 7}.within(tΔ_within).warmup(tΔ_warmup).at_most(pΔ_95)
        end

        it '`^⁸` (compared to `** 8`)' do
          expect {data_rational_3^⁸}.to perform_slower_than {data_rational_3 ** 8}.within(tΔ_within).warmup(tΔ_warmup).at_most(pΔ_95)
        end

        it '`^⁹` (compared to `** 9`)' do
          expect {data_rational_3^⁹}.to perform_slower_than {data_rational_3 ** 9}.within(tΔ_within).warmup(tΔ_warmup).at_most(pΔ_95)
        end
      end

    end

  end
end
