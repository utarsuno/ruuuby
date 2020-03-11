# coding: utf-8

RSpec.describe 'int.rb' do
  context 'extends class[Integer]' do

    context 'by adding needed functions' do
      it 'exists' do
        RuuubyTestHelper::Nums::CONFIG_INTEGER[:ruby].∀{|c| expect(::Integer.∃func?(c)).to eq(true)}
      end
    end

    context 'by adding function{ℕ?}' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          data_range_ints_zero_to_positive.∀{|n| expect(n.ℕ?).to eq(true)}
        end
        it 'cases: negative' do
          data_range_ints_negative.∀{|n| expect(n.ℕ?).to eq(false)}
        end
      end
    end

    context 'by adding function{ℤ?}' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          data_range_ints.∀{|n| expect(n.ℤ?).to eq(true)}
        end
      end
    end

    context 'by adding function{ℂ?}' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          data_range_ints.∀{|n| expect(n.ℂ?).to eq(true)}
        end
      end
    end

    context 'by adding function{ℚ?}' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          data_range_ints.∀{|n| expect(n.ℚ?).to eq(true)}
        end
      end
    end

    context 'by adding function{ℝ?}' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          data_range_ints.∀{|n| expect(n.ℝ?).to eq(true)}
        end
      end
    end

    context 'by adding function{𝕌?}' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          data_range_ints.∀{|n| expect(n.𝕌?).to eq(true)}
        end
      end
    end

    context 'by adding function{finite?}' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          data_range_ints.∀{|n| expect(n.finite?).to eq(true)}
        end
      end
    end

    context 'by adding function{infinite?}' do
      context 'handles needed scenarios' do
        it 'cases: false' do
          data_range_ints.∀{|n| expect(n.infinite?).to eq(false)}
          data_range_ints.∀{|n| expect(n.∞?).to eq(false)}
        end
      end
    end

    context 'adds support for power operations' do

      context 'without breaking existing XOR operations', :'preserving_ruby_original_functionality' do
        it 'matches XOR truth table' do
          expect(0 ^ 0).to eq(0)
          expect(0 ^ 1).to eq(1)
          expect(1 ^ 0).to eq(1)
          expect(1 ^ 1).to eq(0)
        end
        it 'works for values outside of (1)' do
          expect(1337 ^ 1337).to eq(0)
          expect(1337 ^ 0).to eq(1337)
          expect(0 ^ 1337).to eq(1337)
        end
      end

      context 'by supporting operation {^⁰}' do
        it 'works' do
          data_range_ints.∀{|n| expect(n^⁰).to eq(1)}
        end
      end

      context 'by supporting operation {^¹}' do
        it 'works' do
          data_range_ints.∀{|n| expect(n^¹).to eq(n)}
        end
      end

      context 'by supporting operation {^²}' do
        it 'works' do
          data_range_ints.∀{|n| expect(n^²).to eq(n * n)}
        end
      end

      context 'by supporting operation {^³}' do
        it 'works' do
          data_range_ints.∀{|n| expect(n^³).to eq(n * n * n)}
        end
      end

      context 'by supporting operation {^⁴}' do
        it 'works' do
          data_range_ints.∀{|n| expect(n^⁴).to eq(n * n * n * n)}
        end
      end

      context 'by supporting operation {^⁵}' do
        it 'works' do
          data_range_ints.∀{|n| expect(n^⁵).to eq(n * n * n * n * n)}
        end
      end

      context 'by supporting operation {^⁶}' do
        it 'works' do
          data_range_ints.∀{|n| expect(n^⁶).to eq(n * n * n * n * n * n)}
        end
      end

      context 'by supporting operation {^⁷}' do
        it 'works' do
          data_range_ints.∀{|n| expect(n^⁷).to eq(n * n * n * n * n * n * n)}
        end
      end

      context 'by supporting operation {^⁸}' do
        it 'works' do
          data_range_ints.∀{|n| expect(n^⁸).to eq(n * n * n * n * n * n * n * n)}
        end
      end

      context 'by supporting operation {^⁹}' do
        it 'works' do
          data_range_ints.∀{|n| expect(n^⁹).to eq(n * n * n * n * n * n * n * n * n)}
        end
      end

    end

  end

  #  __   ___  __   ___  __   __                   __   ___
  # |__) |__  |__) |__  /  \ |__)  |\/|  /\  |\ | /  ` |__
  # |    |___ |  \ |    \__/ |  \  |  | /~~\ | \| \__, |___
  context 'performance', :'performance' do

    context 'func{finite?}: performs extremely quickly' do
      it 'for cases: true' do
        expect{1337.finite?}.to perform_extremely_quickly
      end
    end

    context 'func{infinite?}: performs extremely quickly' do
      it 'for cases: false' do
        expect{1337.∞?}.to perform_extremely_quickly
        expect{1337.infinite?}.to perform_extremely_quickly
      end
    end

    context 'func{ℕ?}: performs extremely quickly' do
      it 'for cases: true' do
        expect{0.ℕ?}.to perform_extremely_quickly
      end
      it 'for cases: false' do
        expect{-1.ℕ?}.to perform_extremely_quickly
      end
    end

    context 'func{ℤ?}: performs extremely quickly' do
      it 'for cases: true' do
        expect{-1.ℤ?}.to perform_extremely_quickly
      end
    end

    context 'func{ℂ?}: performs extremely quickly' do
      it 'for cases: true' do
        expect{1.ℂ?}.to perform_extremely_quickly
      end
    end

    context 'func{ℚ?}: performs extremely quickly' do
      it 'for cases: true' do
        expect{1337.ℚ?}.to perform_extremely_quickly
      end
    end

    context 'func{ℝ?}: performs extremely quickly' do
      it 'for cases: true' do
        expect{1337.ℝ?}.to perform_extremely_quickly
      end
    end

    context 'func{𝕌?}: performs extremely quickly' do
      it 'for cases: true' do
        expect{1337.𝕌?}.to perform_extremely_quickly
      end
    end

    # TODO: Math powers performance tests
  end

end
