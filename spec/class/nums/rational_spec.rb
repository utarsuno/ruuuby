# coding: utf-8

RSpec.describe 'rational.rb' do
  let(:data_default){Rational(2, 3)}
  let(:data_minus_leet){Rational(-1337, 1)}
  let(:data_minus_leet2){Rational(-1337, 2)}
  let(:data_for_performance_a){Rational(1, 1)}
  let(:data_for_performance_b){Rational(-1, 1)}

  context 'extends class[Rational]' do

    context 'by adding functions for (ℕ?, ℤ?, ℂ?, ℚ?, ℝ?)' do
      it 'exists' do
        expect_func_in_class(::Rational, :ℕ?)
        expect_func_in_class(::Rational, :ℤ?)
        expect_func_in_class(::Rational, :ℂ?)
        expect_func_in_class(::Rational, :ℚ?)
        expect_func_in_class(::Rational, :ℝ?)
      end
    end

    context 'by adding function[ℕ?]' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          expect(Rational(0).ℕ?).to eq(true)
          expect(Rational(1, 1).ℕ?).to eq(true)
          expect(Rational(1337, 1337).ℕ?).to eq(true)
        end
        it 'cases: negative' do
          expect(Rational(-1, 1).ℕ?).to eq(false)
          expect(Rational(-1337, 1337).ℕ?).to eq(false)
        end
      end
    end

    context 'by adding function[ℤ?]' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          expect(Rational(-1337, 1).ℤ?).to eq(true)
          expect(Rational(-1, 1).ℤ?).to eq(true)
          expect(Rational(0, 1).ℤ?).to eq(true)
          expect(Rational(1, 1).ℤ?).to eq(true)
          expect(Rational(1337, 1).ℤ?).to eq(true)
        end
        it 'cases: negative' do
          expect(Rational(-1337, 2).ℤ?).to eq(false)
          expect(Rational(-1, 2).ℤ?).to eq(false)
          expect(Rational(1, 2).ℤ?).to eq(false)
          expect(Rational(1337, 2).ℤ?).to eq(false)
        end
      end
    end

    context 'by adding function[ℚ?]' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          expect(data_default.ℚ?).to eq(true)
        end
      end
    end

    context 'by adding function[ℂ?]' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          expect(data_default.ℂ?).to eq(true)
        end
      end
    end

    context 'by adding function[ℝ?]' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          expect(data_default.ℝ?).to eq(true)
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
        expect{data_for_performance_a.ℕ?}.to perform_extremely_quickly
      end
      it 'cases: negative' do
        expect{data_for_performance_b.ℕ?}.to perform_extremely_quickly
      end
    end

    context 'func[ℤ?]: performs extremely quickly' do
      it 'for cases: true' do
        expect{data_minus_leet.ℤ?}.to perform_extremely_quickly
      end
      it 'cases: negative' do
        expect{data_minus_leet2.ℤ?}.to perform_extremely_quickly
      end
    end

    context 'func[ℂ?]: performs extremely quickly' do
      it 'for cases: true' do
        expect{data_default.ℂ?}.to perform_extremely_quickly
      end
    end

    context 'func[ℚ?]: performs extremely quickly' do
      it 'for cases: true' do
        expect{data_default.ℚ?}.to perform_extremely_quickly
      end
    end

    context 'func[ℝ?]: performs extremely quickly' do
      it 'for cases: true' do
        expect{data_default.ℝ?}.to perform_extremely_quickly
      end
    end
  end
end
