# coding: utf-8

RSpec.describe 'complex.rb' do
  let(:data_nan){Complex(Float::NAN)}
  let(:data_zero){Complex(0)}
  let(:data_one){Complex(1)}
  let(:dataf_one){Complex(1.0)}
  let(:datac_one){Complex(1, 1)}
  let(:data_minus_leet){Complex(-1337)}

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
          expect(data_zero.ℕ?).to eq(true)
          expect(data_one.ℕ?).to eq(true)
          expect(Complex(1337).ℕ?).to eq(true)
        end
        it 'cases: negative' do
          expect(data_nan.ℕ?).to eq(false)
          expect(Complex(0, 1).ℕ?).to eq(false)
          expect(datac_one.ℕ?).to eq(false)
          expect(Complex(-1).ℕ?).to eq(false)
          expect(Complex(1337.1337).ℕ?).to eq(false)
        end
      end
    end

    context 'by adding function[ℤ?]' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          expect(data_minus_leet.ℤ?).to eq(true)
          expect(Complex(-1).ℤ?).to eq(true)
          expect(data_zero.ℤ?).to eq(true)
          expect(data_one.ℤ?).to eq(true)
          expect(Complex(1337).ℤ?).to eq(true)
        end
        it 'cases: negative' do
          expect(data_nan.ℤ?).to eq(false)
          expect(Complex(0, 1).ℤ?).to eq(false)
          expect(datac_one.ℤ?).to eq(false)
          expect(Complex(1337.1337).ℤ?).to eq(false)
        end
      end
    end

    context 'by adding function[ℚ?]' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          expect(dataf_one.ℚ?).to eq(true)
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
          expect(datac_one.ℂ?).to eq(true)
        end
        it 'cases: negative' do
          expect(data_nan.ℂ?).to eq(false)
        end
      end
    end

    context 'by adding function[ℝ?]' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          expect(data_one.ℝ?).to eq(true)
        end
        it 'cases: negative' do
          expect(datac_one.ℝ?).to eq(false)
          expect(data_nan.ℂ?).to eq(false)
        end
      end
    end

  end

  #  __   ___  __   ___  __   __                   __   ___
  # |__) |__  |__) |__  /  \ |__)  |\/|  /\  |\ | /  ` |__
  # |    |___ |  \ |    \__/ |  \  |  | /~~\ | \| \__, |___
  context 'performance', :'performance' do
    context 'func[ℕ?]: performs extremely quickly' do
      it 'for cases: true' do
        expect{data_zero.ℕ?}.to perform_extremely_quickly
      end
      it 'for cases: false' do
        expect{data_nan.ℕ?}.to perform_extremely_quickly
      end
    end

    context 'func[ℤ?]: performs extremely quickly' do
      it 'for cases: true' do
        expect{data_minus_leet.ℤ?}.to perform_extremely_quickly
      end
      it 'for cases: false' do
        expect{data_nan.ℤ?}.to perform_extremely_quickly
      end
    end

    context 'func[ℂ?]: performs extremely quickly' do
      it 'for cases: true' do
        expect{datac_one.ℂ?}.to perform_extremely_quickly
      end
      it 'for cases: false' do
        expect{data_nan.ℂ?}.to perform_extremely_quickly
      end
    end

    context 'func[ℚ?]: performs extremely quickly' do
      it 'for cases: true' do
        expect{dataf_one.ℚ?}.to perform_extremely_quickly
      end
      it 'for cases: false' do
        expect{data_nan.ℚ?}.to perform_extremely_quickly
      end
    end

    context 'func[ℝ?]: performs extremely quickly' do
      it 'for cases: true' do
        expect{data_one.ℝ?}.to perform_extremely_quickly
      end
      it 'for cases: false' do
        expect{data_nan.ℝ?}.to perform_extremely_quickly
      end
    end
  end

end
