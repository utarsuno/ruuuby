# coding: utf-8

RSpec.describe 'float.rb' do
  let(:data_nan){0.0/0.0}

  context 'extends class[Float]' do

    context 'by adding functions for (ℕ?, ℤ?, ℂ?, ℚ?, ℝ?)' do
      it 'exists' do
        expect(::Float.∃func?(:ℕ?)).to eq(true)
        expect(::Float.∃func?(:ℤ?)).to eq(true)
        expect(::Float.∃func?(:ℂ?)).to eq(true)
        expect(::Float.∃func?(:ℚ?)).to eq(true)
        expect(::Float.∃func?(:ℝ?)).to eq(true)
      end
    end

    context 'by adding function[ℕ?]' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          expect(0.0.ℕ?).to eq(true)
          expect(1.0.ℕ?).to eq(true)
          expect(1337.0.ℕ?).to eq(true)
        end
        it 'cases: negative' do
          expect(data_nan.ℕ?).to eq(false)
          expect((-1.0).ℕ?).to eq(false)
          expect(1337.1337.ℕ?).to eq(false)
        end
      end
    end

    context 'by adding function[ℤ?]' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          expect(-1337.0.ℤ?).to eq(true)
          expect(-1.0.ℤ?).to eq(true)
          expect(0.0.ℤ?).to eq(true)
          expect(1.0.ℤ?).to eq(true)
          expect(1337.0.ℤ?).to eq(true)
        end
        it 'cases: negative' do
          expect(data_nan.ℤ?).to eq(false)
        end
      end
    end

    context 'by adding function[ℚ?]' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          expect(1.0.ℚ?).to eq(true)
        end
        it 'cases: negative' do
          expect(data_nan.ℚ?).to eq(false)
        end
        it 'cases: un-covered scope' do
          expect(1.1337.ℚ?).to eq(nil)
        end
      end
    end

    context 'by adding function[ℂ?]' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          expect(1.337.ℂ?).to eq(true)
        end
        it 'cases: negative' do
          expect(data_nan.ℂ?).to eq(false)
        end
      end
    end

    context 'by adding function[ℝ?]' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          expect(0.0.ℝ?).to eq(true)
        end
        it 'cases: negative' do
          expect(data_nan.ℝ?).to eq(false)
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
        expect{0.0.ℕ?}.to perform_very_quickly
      end
      it 'cases: negative' do
        expect{data_nan.ℕ?}.to perform_very_quickly
      end
    end

    context 'func[ℤ?]: performs very quickly' do
      it 'for cases: true' do
        expect{-1337.0.ℤ?}.to perform_very_quickly
      end
      it 'cases: negative' do
        expect{data_nan.ℤ?}.to perform_very_quickly
      end
    end

    context 'func[ℂ?]: performs very quickly' do
      it 'for cases: true' do
        expect{1.337.ℂ?}.to perform_very_quickly
      end
      it 'cases: negative' do
        expect{data_nan.ℂ?}.to perform_very_quickly
      end
    end

    context 'func[ℚ?]: performs very quickly' do
      it 'for cases: true' do
        expect{1.0.ℚ?}.to perform_very_quickly
      end
      it 'cases: negative' do
        expect{data_nan.ℚ?}.to perform_very_quickly
      end
    end

    context 'func[ℝ?]: performs very quickly' do
      it 'for cases: true' do
        expect{0.0.ℝ?}.to perform_very_quickly
      end
      it 'cases: negative' do
        expect{data_nan.ℝ?}.to perform_very_quickly
      end
    end
  end

end