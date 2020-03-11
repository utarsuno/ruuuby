# coding: utf-8

RSpec.describe 'float.rb' do
  context 'extends class[Float]' do

    context 'by adding needed functions' do
      it 'exists' do
        RuuubyTestHelper::Nums::CONFIG_FLOAT[:ruby].∀{|c| expect(::Float.∃func?(c)).to eq(true)}
      end
    end

    context 'by adding function{ℕ?}' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          expect(0.0.ℕ?).to eq(true)
          expect(1.0.ℕ?).to eq(true)
          expect(1337.0.ℕ?).to eq(true)
        end
        it 'cases: negative' do
          data_float_error_cases.∀{|n| expect(n.ℕ?).to eq(false)}
          expect((-1.0).ℕ?).to eq(false)
          expect(1337.1337.ℕ?).to eq(false)
        end
      end
    end

    context 'by adding function{ℤ?}' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          data_range_floats.∀{|n| expect(n.ℤ?).to eq(true)}
        end
        it 'cases: negative' do
          data_float_error_cases.∀{|n| expect(n.ℤ?).to eq(false)}
        end
      end
    end

    context 'by adding function{ℚ?}' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          expect(1.0.ℚ?).to eq(true)
        end
        it 'cases: negative' do
          data_float_error_cases.∀{|n| expect(n.ℚ?).to eq(false)}
        end
        it 'cases: un-covered scope' do
          expect(1.1337.ℚ?).to eq(nil)
        end
      end
    end

    context 'by adding function{ℂ?}' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          expect(1.337.ℂ?).to eq(true)
        end
        it 'cases: negative' do
          data_float_error_cases.∀{|n| expect(n.ℂ?).to eq(false)}
        end
      end
    end

    context 'by adding function{ℝ?}' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          expect(0.0.ℝ?).to eq(true)
        end
        it 'cases: negative' do
          data_float_error_cases.∀{|n| expect(n.ℝ?).to eq(false)}
        end
      end
    end

    context 'by adding function{𝕌?}' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          expect(0.0.𝕌?).to eq(true)
        end
        it 'cases: negative' do
          data_float_error_cases.∀{|n| expect(n.𝕌?).to eq(false)}
        end
      end
    end

    context 'by supporting operation {^⁰}' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          data_range_floats.∀{|n| expect(n^⁰).to eq(1)}
        end
        it 'cases: negative' do
          data_float_error_cases.∀{|n| expect{n^⁰}.to raise_error(RuntimeError)}
        end
      end
    end

    context 'by supporting operation {^¹}' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          data_range_floats.∀{|n| expect(n^¹).to eq(n)}
          expect(data_float_inf^¹).to eq(data_float_inf)
          expect(data_float_negative_inf^¹).to eq(data_float_negative_inf)
        end
        it 'cases: negative' do
          expect{data_float_nan^¹}.to raise_error(RuntimeError)
        end
      end
    end

    context 'by supporting operation {^²}' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          data_range_floats.∀{|n| expect(n^²).to eq(n * n)}
          expect(data_float_inf^²).to eq(data_float_inf)
          expect(data_float_negative_inf^²).to eq(data_float_inf)
        end
        it 'cases: negative' do
          expect{data_float_nan^²}.to raise_error(RuntimeError)
        end
      end
    end

    context 'by supporting operation {^³}' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          data_range_floats.∀{|n| expect(n^³).to eq(n * n * n)}
          expect(data_float_inf^³).to eq(data_float_inf)
          expect(data_float_negative_inf^³).to eq(data_float_negative_inf)
        end
        it 'cases: negative' do
          expect{data_float_nan^³}.to raise_error(RuntimeError)
        end
      end
    end

    context 'by supporting operation {^⁴}' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          data_range_floats.∀{|n| expect(n^⁴).to eq(n * n * n * n)}
          expect(data_float_inf^⁴).to eq(data_float_inf)
          expect(data_float_negative_inf^⁴).to eq(data_float_inf)
        end
        it 'cases: negative' do
          expect{data_float_nan^⁴}.to raise_error(RuntimeError)
        end
      end
    end

    context 'by supporting operation {^⁵}' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          data_range_floats.∀{|n| expect(n^⁵).to eq(n * n * n * n * n)}
          expect(data_float_inf^⁵).to eq(data_float_inf)
          expect(data_float_negative_inf^⁵).to eq(data_float_negative_inf)
        end
        it 'cases: negative' do
          expect{data_float_nan^⁵}.to raise_error(RuntimeError)
        end
      end
    end

    context 'by supporting operation {^⁶}' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          data_range_floats.∀{|n| expect(n^⁶).to eq(n * n * n * n * n * n)}
          expect(data_float_inf^⁶).to eq(data_float_inf)
          expect(data_float_negative_inf^⁶).to eq(data_float_inf)
        end
        it 'cases: negative' do
          expect{data_float_nan^⁶}.to raise_error(RuntimeError)
        end
      end
    end

    context 'by supporting operation {^⁷}' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          data_range_floats.∀{|n| expect(n^⁷).to eq(n * n * n * n * n * n * n)}
          expect(data_float_inf^⁷).to eq(data_float_inf)
          expect(data_float_negative_inf^⁷).to eq(data_float_negative_inf)
        end
        it 'cases: negative' do
          expect{data_float_nan^⁷}.to raise_error(RuntimeError)
        end
      end
    end

    context 'by supporting operation {^⁸}' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          data_range_floats.∀{|n| expect(n^⁸).to eq(n * n * n * n * n * n * n * n)}
          expect(data_float_inf^⁸).to eq(data_float_inf)
          expect(data_float_negative_inf^⁸).to eq(data_float_inf)
        end
        it 'cases: negative' do
          expect{data_float_nan^⁸}.to raise_error(RuntimeError)
        end
      end
    end

    context 'by supporting operation {^⁹}' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          data_range_floats.∀{|n| expect(n^⁹).to eq(n * n * n * n * n * n * n * n * n)}
          expect(data_float_inf^⁹).to eq(data_float_inf)
          expect(data_float_negative_inf^⁹).to eq(data_float_negative_inf)
        end
        it 'cases: negative' do
          expect{data_float_nan^⁹}.to raise_error(RuntimeError)
        end
      end
    end

  end

  #  __   ___  __   ___  __   __                   __   ___
  # |__) |__  |__) |__  /  \ |__)  |\/|  /\  |\ | /  ` |__
  # |    |___ |  \ |    \__/ |  \  |  | /~~\ | \| \__, |___
  context 'performance', :'performance' do
    context 'func{ℕ?}: performs very quickly' do
      it 'for cases: true' do
        expect{0.0.ℕ?}.to perform_very_quickly
      end
      it 'cases: negative' do
        expect{data_float_nan.ℕ?}.to perform_very_quickly
      end
    end

    context 'func{ℤ?}: performs very quickly' do
      it 'for cases: true' do
        expect{-1337.0.ℤ?}.to perform_very_quickly
      end
      it 'cases: negative' do
        expect{data_float_nan.ℤ?}.to perform_very_quickly
      end
    end

    context 'func{ℂ?}: performs very quickly' do
      it 'for cases: true' do
        expect{1.337.ℂ?}.to perform_very_quickly
      end
      it 'cases: negative' do
        expect{data_float_nan.ℂ?}.to perform_very_quickly
      end
    end

    context 'func{ℚ?}: performs very quickly' do
      it 'for cases: true' do
        expect{1.0.ℚ?}.to perform_very_quickly
      end
      it 'cases: negative' do
        expect{data_float_nan.ℚ?}.to perform_very_quickly
      end
    end

    context 'func{ℝ?}: performs extremely quickly' do
      it 'for cases: true' do
        expect{0.0.ℝ?}.to perform_extremely_quickly
      end
      it 'cases: negative' do
        expect{data_float_nan.ℝ?}.to perform_extremely_quickly
      end
    end

    context 'func{𝕌?}: performs extremely quickly' do
      it 'for cases: true' do
        expect{0.0.𝕌?}.to perform_extremely_quickly
      end
      it 'cases: negative' do
        expect{data_float_nan.𝕌?}.to perform_extremely_quickly
      end
    end

    # TODO: Math powers performance tests

  end

end
