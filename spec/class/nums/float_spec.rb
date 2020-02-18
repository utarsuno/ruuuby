# coding: utf-8

RSpec.describe 'float.rb' do
  let(:data_nan){0.0/0.0}

  context 'extends class[Float]' do

    context 'by adding functions for (ℕ?, ℤ?, ℂ?, ℚ?, ℝ?)' do
      it 'exists' do
        expect_func_in_class(::Float, :ℕ?)
        expect_func_in_class(::Float, :ℤ?)
        expect_func_in_class(::Float, :ℂ?)
        expect_func_in_class(::Float, :ℚ?)
        expect_func_in_class(::Float, :ℝ?)
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
    context 'func[ℕ?]: performs extremely quickly' do
      it 'for cases: true' do
        expect{0.0.ℕ?}.to perform_extremely_quickly
      end
      it 'cases: negative' do
        expect{data_nan.ℕ?}.to perform_extremely_quickly
      end
    end

    context 'func[ℤ?]: performs extremely quickly' do
      it 'for cases: true' do
        expect{-1337.0.ℤ?}.to perform_extremely_quickly
      end
      it 'cases: negative' do
        expect{data_nan.ℤ?}.to perform_extremely_quickly
      end
    end

    context 'func[ℂ?]: performs extremely quickly' do
      it 'for cases: true' do
        expect{1.337.ℂ?}.to perform_extremely_quickly
      end
      it 'cases: negative' do
        expect{data_nan.ℂ?}.to perform_extremely_quickly
      end
    end

    context 'func[ℚ?]: performs extremely quickly' do
      it 'for cases: true' do
        expect{1.0.ℚ?}.to perform_extremely_quickly
      end
      it 'cases: negative' do
        expect{data_nan.ℚ?}.to perform_extremely_quickly
      end
    end

    context 'func[ℝ?]: performs extremely quickly' do
      it 'for cases: true' do
        expect{0.0.ℝ?}.to perform_extremely_quickly
      end
      it 'cases: negative' do
        expect{data_nan.ℝ?}.to perform_extremely_quickly
      end
    end
  end

end
