# coding: utf-8

RSpec.describe 'numeric.rb' do
  context 'extends class[Numeric]' do

    context 'by adding functions {∞?, 𝕌?}' do
      it 'exists' do
        RuuubyTestHelper::CONFIG_NUMERIC[:ruby].∀{|func_name| expect(::Numeric.∃func?(func_name)).to eq(true)}
      end
    end

    context 'by adding function{∞?}' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          expect(data_float_inf.∞?).to eq(true)
          expect(data_float_negative_inf.∞?).to eq(true)
        end
        it 'cases: negative' do
          expect(data_float_nan.∞?).to eq(false)
          expect(0.0.∞?).to eq(false)
          expect(1.0.∞?).to eq(false)
          expect(-1.0.∞?).to eq(false)
        end
      end
    end

    context 'by adding function{𝔹?}' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          [
              0, 0.0, 1, 1.0, Rational(10, 10), Rational(0, 1337), Complex(0, 0), Complex(1, 0), BigDecimal('0.0'), BigDecimal('1.0')
          ].∀{|n| expect(n.𝔹?).to eq(true)}
        end
        it 'cases: negative' do
          [
              -1337, -1, -1.0, 0.000000001, 1.0000000001, 0.99999999999999, Complex(1, 2), Rational(Complex(-1, 2), 2), data_float_nan, data_float_inf, data_float_negative_inf
          ].∀{|n| expect(n.𝔹?).to eq(false)}
        end
      end
    end

    context 'by adding function{𝕌?}' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          expect(0.0.𝕌?).to eq(true)
          expect(1.0.𝕌?).to eq(true)
          expect(-1.0.𝕌?).to eq(true)
          expect(Complex(1, 2).𝕌?).to eq(true)
          expect(Rational(Complex(-1, 2), 2).𝕌?).to eq(true)
        end
        it 'cases: negative' do
          data_float_error_cases.∀{|n| expect(n.𝕌?).to eq(false)}
        end
      end
    end

  end

  #  __   ___  __   ___  __   __                   __   ___
  # |__) |__  |__) |__  /  \ |__)  |\/|  /\  |\ | /  ` |__
  # |    |___ |  \ |    \__/ |  \  |  | /~~\ | \| \__, |___
  context 'performance', :'performance' do
    context 'func[∞?]: performs very quickly' do
      it 'for cases: true' do
        expect{data_float_inf.∞?}.to perform_very_quickly
        expect{data_float_negative_inf.∞?}.to perform_very_quickly
      end
      it 'cases: negative' do
        expect{data_float_nan.∞?}.to perform_very_quickly
        expect{0.0.∞?}.to perform_very_quickly
        expect{1.0.∞?}.to perform_very_quickly
        expect{-1.0.∞?}.to perform_very_quickly
      end
    end
    context 'func[𝔹?]: performs extremely quickly' do
      it 'for cases: true' do
        expect{0.𝔹?}.to perform_extremely_quickly
        expect{1.0.𝔹?}.to perform_extremely_quickly
      end
      context 'cases: negative' do
        it 'for floats' do
          data_float_error_cases.∀{|n| expect{n.𝔹?}.to perform_extremely_quickly}
        end
        it 'for big-decimals' do
          data_big_decimal_error_cases.∀{|n| expect{n.𝔹?}.to perform_extremely_quickly}
        end
        it 'for complexes' do
          data_complex_error_cases.∀{|n| expect{n.𝔹?}.to perform_extremely_quickly}
        end
      end
    end
    context 'func[𝕌?]: performs extremely quickly' do
      it 'for cases: true' do
        expect{55.𝕌?}.to perform_extremely_quickly
        expect{-1.𝕌?}.to perform_extremely_quickly
      end
      context 'cases: negative' do
        it 'for floats' do
          data_float_error_cases.∀{|n| expect{n.𝕌?}.to perform_extremely_quickly}
        end
        it 'for big-decimals' do
          data_big_decimal_error_cases.∀{|n| expect{n.𝕌?}.to perform_extremely_quickly}
        end
        it 'for complexes' do
          data_complex_error_cases.∀{|n| expect{n.𝕌?}.to perform_extremely_quickly}
        end
      end
    end
  end

end
