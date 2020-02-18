# coding: utf-8

RSpec.describe 'int.rb' do
  context 'extends class[Integer]' do

    context 'by adding functions for (ℕ?, ℤ?, ℂ?, ℚ?, ℝ?)' do
      it 'exists' do
        expect_func_in_class(::Integer, :ℕ?)
        expect_func_in_class(::Integer, :ℤ?)
        expect_func_in_class(::Integer, :ℂ?)
        expect_func_in_class(::Integer, :ℚ?)
        expect_func_in_class(::Integer, :ℝ?)
      end
    end

    context 'by adding function[ℕ?]' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          expect(0.ℕ?).to eq(true)
          expect(1.ℕ?).to eq(true)
          expect(1337.ℕ?).to eq(true)
        end
        it 'cases: negative' do
          expect(-1.ℕ?).to eq(false)
          expect(-1337.ℕ?).to eq(false)
        end
      end
    end

    context 'by adding function[ℤ?]' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          expect(-1337.ℤ?).to eq(true)
          expect(-1.ℤ?).to eq(true)
          expect(0.ℤ?).to eq(true)
          expect(1.ℤ?).to eq(true)
          expect(1337.ℤ?).to eq(true)
        end
      end
    end

    context 'by adding function[ℂ?]' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          expect(1.ℂ?).to eq(true)
        end
      end
    end

    context 'by adding function[ℚ?]' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          expect(-1337.ℚ?).to eq(true)
          expect(-1.ℚ?).to eq(true)
          expect(0.ℚ?).to eq(true)
          expect(1.ℚ?).to eq(true)
          expect(1337.ℚ?).to eq(true)
        end
      end
    end

    context 'by adding function[ℝ?]' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          expect(1.ℝ?).to eq(true)
        end
      end
    end

  end

  #  __   ___  __   ___  __   __                   __   ___
  # |__) |__  |__) |__  /  \ |__)  |\/|  /\  |\ | /  ` |__
  # |    |___ |  \ |    \__/ |  \  |  | /~~\ | \| \__, |___
  context 'performance', :'performance' do

    context 'func[int?]: performs extremely quickly' do
      it 'for cases: true' do
        expect{5.int?}.to perform_extremely_quickly
      end
      it 'for cases: false' do
        expect{'0'.int?}.to perform_extremely_quickly
      end
    end

    context 'func[ℕ?]: performs extremely quickly' do
      it 'for cases: true' do
        expect{0.ℕ?}.to perform_extremely_quickly
      end
      it 'for cases: false' do
        expect{-1.ℕ?}.to perform_extremely_quickly
      end
    end

    context 'func[ℤ?]: performs extremely quickly' do
      it 'for cases: true' do
        expect{-1.ℤ?}.to perform_extremely_quickly
      end
    end

    context 'func[ℂ?]: performs extremely quickly' do
      it 'for cases: true' do
        expect{1.ℂ?}.to perform_extremely_quickly
      end
    end

    context 'func[ℚ?]: performs extremely quickly' do
      it 'for cases: true' do
        expect{1337.ℚ?}.to perform_extremely_quickly
      end
    end

    context 'func[ℝ?]: performs extremely quickly' do
      it 'for cases: true' do
        expect{1337.ℝ?}.to perform_extremely_quickly
      end
    end
  end

end
