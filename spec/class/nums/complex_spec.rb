# coding: utf-8

RSpec.describe 'complex.rb' do
  let(:data_nan){Complex(Float::NAN)}

  context 'extends class[Complex]' do

    context 'by adding functions for (ℕ?, ℤ?, ℂ?, ℚ?, ℝ?)' do
      it 'exists' do
        expect(::Complex.∃func?(:ℕ?)).to eq(true)
        expect(::Complex.∃func?(:ℤ?)).to eq(true)
        expect(::Complex.∃func?(:ℂ?)).to eq(true)
        expect(::Complex.∃func?(:ℚ?)).to eq(true)
        expect(::Complex.∃func?(:ℝ?)).to eq(true)
      end
    end

    context 'by adding function[ℕ?]' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          expect(Complex(0).ℕ?).to eq(true)
          expect(Complex(1).ℕ?).to eq(true)
          expect(Complex(1337).ℕ?).to eq(true)
        end
        it 'cases: negative' do
          expect(data_nan.ℕ?).to eq(false)
          expect(Complex(0, 1).ℕ?).to eq(false)
          expect(Complex(1, 1).ℕ?).to eq(false)
          expect(Complex(-1).ℕ?).to eq(false)
          expect(Complex(1337.1337).ℕ?).to eq(false)
        end
      end
    end

    context 'by adding function[ℤ?]' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          expect(Complex(-1337).ℤ?).to eq(true)
          expect(Complex(-1).ℤ?).to eq(true)
          expect(Complex(0).ℤ?).to eq(true)
          expect(Complex(1).ℤ?).to eq(true)
          expect(Complex(1337).ℤ?).to eq(true)
        end
        it 'cases: negative' do
          expect(data_nan.ℤ?).to eq(false)
          expect(Complex(0, 1).ℤ?).to eq(false)
          expect(Complex(1, 1).ℤ?).to eq(false)
          expect(Complex(1337.1337).ℤ?).to eq(false)
        end
      end
    end

    context 'by adding function[ℚ?]' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          expect(Complex(1.0).ℚ?).to eq(true)
        end
        it 'cases: negative' do
          expect(data_nan.ℚ?).to eq(false)
        end
        it 'cases: un-covered scope' do
          expect(Complex(1.1337).ℚ?).to eq(nil)
        end
      end
    end

    context 'by adding function[ℂ?]' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          expect(Complex(1, 1).ℂ?).to eq(true)
        end
        it 'cases: negative' do
          expect(data_nan.ℂ?).to eq(false)
        end
      end
    end

    context 'by adding function[ℝ?]' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          expect(Complex(1).ℝ?).to eq(true)
        end
        it 'cases: negative' do
          expect(Complex(1, 1).ℝ?).to eq(false)
          expect(data_nan.ℂ?).to eq(false)
        end
      end
    end

  end

  #  __   ___  __   ___  __   __                   __   ___
  # |__) |__  |__) |__  /  \ |__)  |\/|  /\  |\ | /  ` |__
  # |    |___ |  \ |    \__/ |  \  |  | /~~\ | \| \__, |___
  context 'performance', :'performance' do
    context 'func[ℕ?]: performs very quickly' do
      it 'for cases: true' do
        expect{Complex(0).ℕ?}.to perform_very_quickly
      end
      it 'for cases: false' do
        expect{data_nan.ℕ?}.to perform_very_quickly
      end
    end

    context 'func[ℤ?]: performs very quickly' do
      it 'for cases: true' do
        expect{Complex(-1337).ℤ?}.to perform_very_quickly
      end
      it 'for cases: false' do
        expect{data_nan.ℤ?}.to perform_very_quickly
      end
    end

    context 'func[ℂ?]: performs very quickly' do
      it 'for cases: true' do
        expect{Complex(1, 1).ℕ?}.to perform_very_quickly
      end
      it 'for cases: false' do
        expect{data_nan.ℕ?}.to perform_very_quickly
      end
    end

    context 'func[ℚ?]: performs very quickly' do
      it 'for cases: true' do
        expect{Complex(1.0).ℚ?}.to perform_very_quickly
      end
      it 'for cases: false' do
        expect{data_nan.ℚ?}.to perform_very_quickly
      end
    end

    context 'func[ℝ?]: performs very quickly' do
      it 'for cases: true' do
        expect{Complex(1).ℝ?}.to perform_very_quickly
      end
      it 'for cases: false' do
        expect{data_nan.ℝ?}.to perform_very_quickly
      end
    end
  end

end
