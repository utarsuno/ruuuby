# coding: utf-8

RSpec.describe 'rational.rb' do
  let(:data_minus_leet2){Rational(-1337, 2)}

  let(:data_with_complex_only_real_component){Rational(Complex(1, 0.0), 1.5)}
  let(:data_with_complex){Rational(Complex(1, 1.5), 1.5)}

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
          expect(Rational(Complex(3, 0), 1).ℤ?).to eq(true)
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

  end

  #  __   ___  __   ___  __   __                   __   ___
  # |__) |__  |__) |__  /  \ |__)  |\/|  /\  |\ | /  ` |__
  # |    |___ |  \ |    \__/ |  \  |  | /~~\ | \| \__, |___
  context 'performance', :'performance' do
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

  end
end
