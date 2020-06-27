# coding: UTF-8

RSpec.describe 'float.rb' do

  context 'verify func{next_float}' do
    it 'works as expected' do
      expect(0.0.next_float + 1.0).to eq(1.0)
      expect(1.0.next_float + 0.0).to_not eq(1.0)
    end
  end

  context 'extends class{Float}' do

    context 'by adding function{has_decimals?}' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          [-1337.1, -1.2, -0.3, 0.999999999999, 1.4, 1.5, 1337.6].∀{|scenario| expect(scenario.has_decimals?).to eq(true)}
        end
        it 'cases: negative' do
          [-1337.0, -2.0, -1.0, -0.0, 0.0, 1.0, 2.0, 1337.0].∀{|scenario| expect(scenario.has_decimals?).to eq(false)}
        end
      end
    end

    # for unit-tests involving{≈≈}: original source code referenced from:
    # @see https://floating-point-gui.de/errors/NearlyEqualsTest.java
    context 'by adding function{≈≈}' do
      context 'handles needed scenarios' do
        context 'cases: positive' do

          it 'edge cases' do
            expect(Float::MAX.≈≈(Float::MAX)).to eq(true)
            expect(data_float_inf.≈≈(data_float_inf)).to eq(true)
            expect(::Float::INFINITY_NEGATIVE.≈≈(::Float::INFINITY_NEGATIVE)).to eq(true)
          end

          it 'w/ zero' do
            expect(0.0.≈≈(0.0)).to eq(true)
            expect(0.0.≈≈(-0.0)).to eq(true)
            expect(-0.0.≈≈(-0.0)).to eq(true)

            expect(1e-400.≈≈(0.0)).to eq(true)
            expect(0.0.≈≈(1e-400)).to eq(true)
            expect(-1e-400.≈≈(0.0)).to eq(true)
            expect(0.0.≈≈(-1e-400)).to eq(true)
          end

          it 'nearly zero' do
            expect(Float::MIN.≈≈(0)).to eq(true)
            expect((-Float::MIN).≈≈(0)).to eq(true)
            expect(0.0.≈≈(Float::MIN)).to eq(true)
            expect(0.0.≈≈(-Float::MIN)).to eq(true)
          end

          it 'nearly magnitude-one' do
            expect(-1.0.≈≈(-1.0)).to eq(true)
            expect(1.0.≈≈(1.0)).to eq(true)

            expect(0.999999999999999999.≈≈(1.0)).to eq(true)
            expect(1.000000000000000001.≈≈(1.0)).to eq(true)
            expect(1.000000000000000001.≈≈(1.00000000000000002)).to eq(true)
            expect(1.00000000000000002.≈≈(1.000000000000000001)).to eq(true)
          end

          it 'nearly negative one' do
            expect(-1.000000000000000001.≈≈(-1.00000000000000002)).to eq(true)
            expect(-1.00000000000000002.≈≈(-1.000000000000000001)).to eq(true)
          end

          it 'large-magnitude values' do
            num_a = 133700000000000000.0
            num_b = 133700000000000001.0
            expect(num_a.≈≈(num_b)).to eq(true)
            expect(num_b.≈≈(num_a)).to eq(true)
            expect((-num_a).≈≈(-num_b)).to eq(true)
            expect((-num_b).≈≈(-num_a)).to eq(true)
          end

          it 'small-magnitude values' do
            num_a = 0.000000001000000000000000001
            num_b = 0.000000001000000000000000002
            expect(num_a.≈≈(num_b)).to eq(true)
            expect(num_b.≈≈(num_a)).to eq(true)
            expect((-num_a).≈≈(-num_b)).to eq(true)
            expect((-num_b).≈≈(-num_a)).to eq(true)
            expect(0.3.≈≈(0.300000000000000003)).to eq(true)
            expect((-0.3).≈≈(-0.300000000000000003)).to eq(true)
            expect(Float::MIN.≈≈(-Float::MIN)).to eq(true)
            expect((-Float::MIN).≈≈(Float::MIN)).to eq(true)
          end

          it 'regular cases' do
            expect(359.9999999999999999.≈≈(360)).to eq(true)
          end

          it 'w/ NaN' do
            expect(data_float_nan.≈≈(data_float_nan)).to eq(true)
          end
        end # end: {cases: positive}
        context 'cases: negative' do
          it 'medium-magnitude values' do
            expect(13370.0.≈≈(13371.0)).to eq(false)
            expect(13371.0.≈≈(13370.0)).to eq(false)
            expect((-13370.0).≈≈(-13371.0)).to eq(false)
            expect((-13371.0).≈≈(-13370.0)).to eq(false)
          end

          it 'small-magnitude values' do
            expect(0.000000000001002.≈≈(0.000000000001001)).to eq(false)
            expect(0.000000000001001.≈≈(0.000000000001002)).to eq(false)
            expect((-0.000000000001002).≈≈(-0.000000000001001)).to eq(false)
            expect((-0.000000000001001).≈≈(-0.000000000001002)).to eq(false)
          end

          it 'with zero' do
            expect(0.00000001.≈≈(0.0)).to eq(false)
            expect(0.0.≈≈(0.00000001)).to eq(false)
            expect((-0.00000001).≈≈(0.0)).to eq(false)
            expect(0.0.≈≈(-0.00000001)).to eq(false)

            expect(0.0.≈≈(1.0)).to eq(false)

            #expect(1e-40.≈≈(0.0)).to eq(false)
            #expect(0.0.≈≈(1e-40)).to eq(false)
            #expect(-1e-40.≈≈(0.0)).to eq(false)
            #expect(0.0.≈≈(-1e-40)).to eq(false)
          end

          it 'nearly zero' do
            expect(0.000000001.≈≈(-Float::MIN)).to eq(false)
            expect(0.000000001.≈≈(Float::MIN)).to eq(false)
            expect(Float::MIN.≈≈(0.000000001)).to eq(false)
            expect((-Float::MIN).≈≈(0.000000001)).to eq(false)
          end

          it 'around magnitude-one' do
            expect(1.0002.≈≈(1.0001)).to eq(false)
            expect(1.0001.≈≈(1.0002)).to eq(false)
            expect((-1.0002).≈≈(-1.0001)).to eq(false)
            expect((-1.0001).≈≈(-1.0002)).to eq(false)

            expect((-1.0).≈≈(1.0)).to eq(false)
          end

          it 'w/ NaN' do
            expect(0.0.≈≈(data_float_nan)).to eq(false)
            expect(data_float_nan.≈≈(0)).to eq(false)
            expect((-0.0).≈≈(data_float_nan)).to eq(false)
            expect(data_float_nan.≈≈(-0.0)).to eq(false)
            expect(0.0.≈≈(data_float_nan)).to eq(false)
            expect(data_float_nan.≈≈(data_float_inf)).to eq(false)
            expect(data_float_inf.≈≈(data_float_nan)).to eq(false)
            expect(data_float_nan.≈≈(::Float::INFINITY_NEGATIVE)).to eq(false)
            expect(::Float::INFINITY_NEGATIVE.≈≈(data_float_nan)).to eq(false)
            expect(data_float_nan.≈≈(Float::MAX)).to eq(false)
            expect(Float::MAX.≈≈(data_float_nan)).to eq(false)
            expect(data_float_nan.≈≈(-Float::MAX)).to eq(false)
            expect((-Float::MAX).≈≈(data_float_nan)).to eq(false)
            expect(data_float_nan.≈≈(Float::MIN)).to eq(false)
            expect(Float::MIN.≈≈(data_float_nan)).to eq(false)
            expect(data_float_nan.≈≈(-Float::MIN)).to eq(false)
            expect((-Float::MIN).≈≈(data_float_nan)).to eq(false)
          end

          it 'edge cases' do
            expect(0.0.≈≈(data_float_inf)).to eq(false)
            expect(0.0.≈≈(::Float::INFINITY_NEGATIVE)).to eq(false)

            expect(Float::MAX.≈≈(-Float::MAX)).to eq(false)
            expect((-Float::MAX).≈≈(Float::MAX)).to eq(false)
            expect(Float::MAX.≈≈(Float::MAX / 2)).to eq(false)
            expect(Float::MAX.≈≈(-Float::MAX / 2)).to eq(false)
            expect((-Float::MAX).≈≈(Float::MAX / 2)).to eq(false)

            expect(data_float_inf.≈≈(::Float::INFINITY_NEGATIVE)).to eq(false)
            expect(::Float::INFINITY_NEGATIVE.≈≈(data_float_inf)).to eq(false)
            expect(data_float_inf.≈≈(Float::MAX)).to eq(false)
            expect(::Float::INFINITY_NEGATIVE.≈≈(-Float::MAX)).to eq(false)
          end
        end
        it 'cases: bad-args' do
          expect(0.0.≈≈(nil)).to eq(false)
          expect(0.0.≈≈([])).to eq(false)
        end
      end
    end

    context 'supports feature(`f16`)' do

      context 'by supporting operation {^⁻⁹}' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            expect_scenarios_power_operations(data_range_floats_all_but_zero, :⁻⁹, -9, true)
          end
          it 'cases: negative' do
            expect{0.0^⁻⁹}.to raise_error(ZeroDivisionError)
            expect{data_float_nan^⁻⁹}.to raise_error(RuntimeError)
            expect(data_float_inf^⁻⁹).to eq(0)
            expect(::Float::INFINITY_NEGATIVE^⁻⁹).to eq(0)
          end
        end
      end

      context 'by supporting operation {^⁻⁸}' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            expect_scenarios_power_operations(data_range_floats_all_but_zero, :⁻⁸, -8, true)
          end
          it 'cases: negative' do
            expect{0.0^⁻⁸}.to raise_error(ZeroDivisionError)
            expect{data_float_nan^⁻⁸}.to raise_error(RuntimeError)
            expect(data_float_inf^⁻⁸).to eq(0)
            expect(::Float::INFINITY_NEGATIVE^⁻⁸).to eq(0)
          end
        end
      end

      context 'by supporting operation {^⁻⁷}' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            expect_scenarios_power_operations(data_range_floats_all_but_zero, :⁻⁷, -7, true)
          end
          it 'cases: negative' do
            expect{0.0^⁻⁷}.to raise_error(ZeroDivisionError)
            expect{data_float_nan^⁻⁷}.to raise_error(RuntimeError)
            expect(data_float_inf^⁻⁷).to eq(0)
            expect(::Float::INFINITY_NEGATIVE^⁻⁷).to eq(0)
          end
        end
      end

      context 'by supporting operation {^⁻⁶}' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            expect_scenarios_power_operations(data_range_floats_all_but_zero, :⁻⁶, -6, true)
          end
          it 'cases: negative' do
            expect{0.0^⁻⁶}.to raise_error(ZeroDivisionError)
            expect{data_float_nan^⁻⁶}.to raise_error(RuntimeError)
            expect(data_float_inf^⁻⁶).to eq(0)
            expect(::Float::INFINITY_NEGATIVE^⁻⁶).to eq(0)
          end
        end
      end

      context 'by supporting operation {^⁻⁵}' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            expect_scenarios_power_operations(data_range_floats_all_but_zero, :⁻⁵, -5, true)
          end
          it 'cases: negative' do
            expect{0.0^⁻⁵}.to raise_error(ZeroDivisionError)
            expect{data_float_nan^⁻⁵}.to raise_error(RuntimeError)
            expect(data_float_inf^⁻⁵).to eq(0)
            expect(::Float::INFINITY_NEGATIVE^⁻⁵).to eq(0)
          end
        end
      end

      context 'by supporting operation {^⁻⁴}' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            expect_scenarios_power_operations(data_range_floats_all_but_zero, :⁻⁴, -4, true)
          end
          it 'cases: negative' do
            expect{0.0^⁻⁴}.to raise_error(ZeroDivisionError)
            expect{data_float_nan^⁻⁴}.to raise_error(RuntimeError)
            expect(data_float_inf^⁻⁴).to eq(0)
            expect(::Float::INFINITY_NEGATIVE^⁻⁴).to eq(0)
          end
        end
      end

      context 'by supporting operation {^⁻³}' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            expect_scenarios_power_operations(data_range_floats_all_but_zero, :⁻³, -3, true)
          end
          it 'cases: negative' do
            expect{0.0^⁻³}.to raise_error(ZeroDivisionError)
            expect{data_float_nan^⁻³}.to raise_error(RuntimeError)
            expect(data_float_inf^⁻³).to eq(0)
            expect(::Float::INFINITY_NEGATIVE^⁻³).to eq(0)
          end
        end
      end

      context 'by supporting operation {^⁻²}' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            expect_scenarios_power_operations(data_range_floats_all_but_zero, :⁻², -2, true)
          end
          it 'cases: negative' do
            expect{0.0^⁻²}.to raise_error(ZeroDivisionError)
            expect{data_float_nan^⁻²}.to raise_error(RuntimeError)
            expect(data_float_inf^⁻²).to eq(0)
            expect(::Float::INFINITY_NEGATIVE^⁻²).to eq(0)
          end
        end
      end

      context 'by supporting operation {^⁻¹}' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            expect_scenarios_power_operations(data_range_floats_all_but_zero, :⁻¹, -1, true)
          end
          it 'cases: negative' do
            # TODO: change this to return complex infinity
            expect{0.0^⁻¹}.to raise_error(ZeroDivisionError)
            expect{data_float_nan^⁻¹}.to raise_error(RuntimeError)
            expect(data_float_inf^⁻¹).to eq(0)
            expect(::Float::INFINITY_NEGATIVE^⁻¹).to eq(0)
          end
        end
      end

      context 'by supporting operation {^⁰}' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            expect_scenarios_power_operations(data_range_floats, :⁰, 0, true)
            expect((data_float_inf^⁰).nan?).to eq(true)
            expect((::Float::INFINITY_NEGATIVE^⁰).nan?).to eq(true)
          end
          it 'cases: negative' do
            expect{data_float_nan^⁰}.to raise_error(RuntimeError)
          end
        end
      end

      context 'by supporting operation {^¹}' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            expect_scenarios_power_operations(data_range_floats_w_infs, :¹, 1, true)
          end
          it 'cases: negative' do
            expect{data_float_nan^¹}.to raise_error(RuntimeError)
          end
        end
      end

      context 'by supporting operation {^²}' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            expect_scenarios_power_operations(data_range_floats_w_infs, :², 2, true)
          end
          it 'cases: negative' do
            expect{data_float_nan^²}.to raise_error(RuntimeError)
          end
        end
      end

      context 'by supporting operation {^³}' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            expect_scenarios_power_operations(data_range_floats_w_infs, :³, 3, true)
          end
          it 'cases: negative' do
            expect{data_float_nan^³}.to raise_error(RuntimeError)
          end
        end
      end

      context 'by supporting operation {^⁴}' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            expect_scenarios_power_operations(data_range_floats_w_infs, :⁴, 4, true)
          end
          it 'cases: negative' do
            expect{data_float_nan^⁴}.to raise_error(RuntimeError)
          end
        end
      end

      context 'by supporting operation {^⁵}' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            expect_scenarios_power_operations(data_range_floats_w_infs, :⁵, 5, true)
          end
          it 'cases: negative' do
            expect{data_float_nan^⁵}.to raise_error(RuntimeError)
          end
        end
      end

      context 'by supporting operation {^⁶}' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            expect_scenarios_power_operations(data_range_floats_w_infs, :⁶, 6, true)
          end
          it 'cases: negative' do
            expect{data_float_nan^⁶}.to raise_error(RuntimeError)
          end
        end
      end

      context 'by supporting operation {^⁷}' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            expect_scenarios_power_operations(data_range_floats_w_infs, :⁷, 7, true)
          end
          it 'cases: negative' do
            expect{data_float_nan^⁷}.to raise_error(RuntimeError)
          end
        end
      end

      context 'by supporting operation {^⁸}' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            expect_scenarios_power_operations(data_range_floats_w_infs, :⁸, 8, true)
          end
          it 'cases: negative' do
            expect{data_float_nan^⁸}.to raise_error(RuntimeError)
          end
        end
      end

      context 'by supporting operation {^⁹}' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            expect_scenarios_power_operations(data_range_floats_w_infs, :⁹, 9, true)
          end
          it 'cases: negative' do
            expect{data_float_nan^⁹}.to raise_error(RuntimeError)
          end
        end
      end
    end # end-of: supports feature(`f16`)

  end

  #  __   ___  __   ___  __   __                   __   ___
  # |__) |__  |__) |__  /  \ |__)  |\/|  /\  |\ | /  ` |__
  # |    |___ |  \ |    \__/ |  \  |  | /~~\ | \| \__, |___
  context 'performance', :performance => :slow do
    context 'func{∞ℂ?}: performs extremely quickly' do
      it 'for cases: all' do
        expect{0.0.∞ℂ?}.to perform_extremely_quickly
      end
    end

    context 'roughly preserves original pre-extension-performance' do

      context 'performance hit for following funcs, are under 115%' do
        it '`^⁻¹` (compared to `** -1`)' do
          expect {3.0^⁻¹}.to perform_slower_than {3.0 ** -1}.within(tΔ_within).warmup(tΔ_warmup).at_most(pΔ_115)
        end

        it '`^⁰` (compared to `** 0`)' do
          expect {3.0^⁰}.to perform_slower_than {3.0 ** 0}.within(tΔ_within).warmup(tΔ_warmup).at_most(pΔ_115)
        end

        it '`^¹` (compared to `** 1`)' do
          expect {3.0^¹}.to perform_slower_than {3.0 ** 1}.within(tΔ_within).warmup(tΔ_warmup).at_most(pΔ_115)
        end
      end

      context 'performance hit for following funcs, are under 115%' do
        context 'positive exponents' do
          it '`^²` (compared to `** 2`)' do
            expect {3.0^²}.to perform_slower_than {3.0 ** 2}.within(tΔ_within).warmup(tΔ_warmup).at_most(pΔ_115)
          end

          it '`^³` (compared to `** 3`)' do
            expect {3.0^³}.to perform_slower_than {3.0 ** 3}.within(tΔ_within).warmup(tΔ_warmup).at_most(pΔ_115)
          end

          it '`^⁴` (compared to `** 4`)' do
            expect {3.0^⁴}.to perform_slower_than {3.0 ** 4}.within(tΔ_within).warmup(tΔ_warmup).at_most(pΔ_115)
          end

          it '`^⁵` (compared to `** 5`)' do
            expect {3.0^⁵}.to perform_slower_than {3.0 ** 5}.within(tΔ_within).warmup(tΔ_warmup).at_most(pΔ_115)
          end

          it '`^⁶` (compared to `** 6`)' do
            expect {3.0^⁶}.to perform_slower_than {3.0 ** 6}.within(tΔ_within).warmup(tΔ_warmup).at_most(pΔ_115)
          end

          it '`^⁷` (compared to `** 7`)' do
            expect {3.0^⁷}.to perform_slower_than {3.0 ** 7}.within(tΔ_within).warmup(tΔ_warmup).at_most(pΔ_115)
          end

          it '`^⁸` (compared to `** 8`)' do
            expect {3.0^⁸}.to perform_slower_than {3.0 ** 8}.within(tΔ_within).warmup(tΔ_warmup).at_most(pΔ_115)
          end

          it '`^⁹` (compared to `** 9`)' do
            expect {3.0^⁹}.to perform_slower_than {3.0 ** 9}.within(tΔ_within).warmup(tΔ_warmup).at_most(pΔ_115)
          end
        end
        context 'negative exponents' do
          it '`^⁻²` (compared to `** -2`)' do
            expect {3.0^⁻²}.to perform_slower_than {3.0 ** -2}.within(tΔ_within).warmup(tΔ_warmup).at_most(pΔ_115)
          end

          it '`^⁻³` (compared to `** -3`)' do
            expect {3.0^⁻³}.to perform_slower_than {3.0 ** -3}.within(tΔ_within).warmup(tΔ_warmup).at_most(pΔ_115)
          end

          it '`^⁻⁴` (compared to `** -4`)' do
            expect {3.0^⁻⁴}.to perform_slower_than {3.0 ** -4}.within(tΔ_within).warmup(tΔ_warmup).at_most(pΔ_115)
          end

          it '`^⁻⁵` (compared to `** -5`)' do
            expect {3.0^⁻⁵}.to perform_slower_than {3.0 ** -5}.within(tΔ_within).warmup(tΔ_warmup).at_most(pΔ_115)
          end

          it '`^⁻⁶` (compared to `** -6`)' do
            expect {3.0^⁻⁶}.to perform_slower_than {3.0 ** -6}.within(tΔ_within).warmup(tΔ_warmup).at_most(pΔ_115)
          end

          it '`^⁻⁷` (compared to `** -7`)' do
            expect {3.0^⁻⁷}.to perform_slower_than {3.0 ** -7}.within(tΔ_within).warmup(tΔ_warmup).at_most(pΔ_115)
          end

          it '`^⁻⁸` (compared to `** -8`)' do
            expect {3.0^⁻⁸}.to perform_slower_than {3.0 ** -8}.within(tΔ_within).warmup(tΔ_warmup).at_most(pΔ_115)
          end

          it '`^⁻⁹` (compared to `** -9`)' do
            expect {3.0^⁻⁹}.to perform_slower_than {3.0 ** -9}.within(tΔ_within).warmup(tΔ_warmup).at_most(pΔ_115)
          end
        end
      end

    end

    # TODO: Add performance tests for (≈≈)

  end
end
