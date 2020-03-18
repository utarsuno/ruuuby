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
          data_range_ints.∀{|n| expect(n^²).to eq(n ** 2)}
        end
      end

      context 'by supporting operation {^³}' do
        it 'works' do
          data_range_ints.∀{|n| expect(n^³).to eq(n ** 3)}
        end
      end

      context 'by supporting operation {^⁴}' do
        it 'works' do
          data_range_ints.∀{|n| expect(n^⁴).to eq(n ** 4)}
        end
      end

      context 'by supporting operation {^⁵}' do
        it 'works' do
          data_range_ints.∀{|n| expect(n^⁵).to eq(n ** 5)}
        end
      end

      context 'by supporting operation {^⁶}' do
        it 'works' do
          data_range_ints.∀{|n| expect(n^⁶).to eq(n ** 6)}
        end
      end

      context 'by supporting operation {^⁷}' do
        it 'works' do
          data_range_ints.∀{|n| expect(n^⁷).to eq(n ** 7)}
        end
      end

      context 'by supporting operation {^⁸}' do
        it 'works' do
          data_range_ints.∀{|n| expect(n^⁸).to eq(n ** 8)}
        end
      end

      context 'by supporting operation {^⁹}' do
        it 'works' do
          data_range_ints.∀{|n| expect(n^⁹).to eq(n ** 9)}
        end
      end

    end

  end

  #  __   ___  __   ___  __   __                   __   ___
  # |__) |__  |__) |__  /  \ |__)  |\/|  /\  |\ | /  ` |__
  # |    |___ |  \ |    \__/ |  \  |  | /~~\ | \| \__, |___
  context 'performance', :'performance' do

    context 'funcs performing O(1), extremely quickly' do
      context 'func{finite?}' do
        it 'for cases: true' do
          expect{data_int_leet.finite?}.to perform_extremely_quickly
          expect{data_int_leet.finite?}.to perform_O1
        end
      end

      context 'func{infinite?}' do
        it 'for cases: false' do
          expect{data_int_leet.∞?}.to perform_extremely_quickly
          expect{data_int_leet.infinite?}.to perform_extremely_quickly
          expect{data_int_leet.∞?}.to perform_O1
          expect{data_int_leet.infinite?}.to perform_O1
        end
      end

      context 'func{ℤ?}' do
        it 'for cases: true' do
          expect{data_int_negative_one.ℤ?}.to perform_extremely_quickly
          expect{data_int_negative_one.ℤ?}.to perform_O1
        end
      end

      context 'func{ℂ?}' do
        it 'for cases: true' do
          expect{1.ℂ?}.to perform_extremely_quickly
          expect{1.ℂ?}.to perform_O1
        end
      end

      context 'func{ℚ?}' do
        it 'for cases: true' do
          expect{data_int_leet.ℚ?}.to perform_extremely_quickly
          expect{data_int_leet.ℚ?}.to perform_O1
        end
      end

      context 'func{ℝ?}' do
        it 'for cases: true' do
          expect{data_int_leet.ℝ?}.to perform_extremely_quickly
          expect{data_int_leet.ℝ?}.to perform_O1
        end
      end

      context 'func{𝕌?}' do
        it 'for cases: true' do
          expect{data_int_leet.𝕌?}.to perform_extremely_quickly
          expect{data_int_leet.𝕌?}.to perform_O1
        end
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

    context 'roughly preserves original pre-extension-performance' do

      it 'performance hit for bitwise_xor is under 75%' do
        expect{(1^1)}.to perform_slower_than {(1.bitwise_xor(1))}.at_most(1.75).times
        expect{(0^1)}.to perform_slower_than {(0.bitwise_xor(1))}.at_most(1.75).times
        expect{(1^0)}.to perform_slower_than {(1.bitwise_xor(0))}.at_most(1.75).times
        expect{(0^0)}.to perform_slower_than {(0.bitwise_xor(0))}.at_most(1.75).times
      end

      it 'performance hit for `^0` (compared to `** 0`) is under 85%' do
        expect{(1^⁰)}.to perform_slower_than {(1 ** 0)}.at_most(1.85).times
      end

      it 'performance hit for `^1` (compared to `** 1`) is under 85%' do
        expect{(1^¹)}.to perform_slower_than {(1 ** 1)}.at_most(1.85).times
      end

      it 'performance hit for `^2` (compared to `** 2`) is under 200%' do
        expect{(1^²)}.to perform_slower_than {(1 ** 2)}.at_most(3).times
      end

      it 'performance hit for `^3` (compared to `** 3`) is under 200%' do
        expect{(1^³)}.to perform_slower_than {(1 ** 3)}.at_most(3).times
      end

      it 'performance hit for `^4` (compared to `** 4`) is under 200%' do
        expect{(1^⁴)}.to perform_slower_than {(1 ** 4)}.at_most(3).times
      end

      it 'performance hit for `^5` (compared to `** 5`) is under 200%' do
        expect{(1^⁵)}.to perform_slower_than {(1 ** 5)}.at_most(3).times
      end

      it 'performance hit for `^6` (compared to `** 6`) is under 200%' do
        expect{(1^⁶)}.to perform_slower_than {(1 ** 6)}.at_most(3).times
      end

      it 'performance hit for `^7` (compared to `** 7`) is under 200%' do
        expect{(1^⁷)}.to perform_slower_than {(1 ** 7)}.at_most(3).times
      end

      it 'performance hit for `^8` (compared to `** 9`) is under 200%' do
        expect{(1^⁸)}.to perform_slower_than {(1 ** 8)}.at_most(3).times
      end

      it 'performance hit for `^9` (compared to `** 0`) is under 200%' do
        expect{(1^⁹)}.to perform_slower_than {(1 ** 9)}.at_most(3).times
      end

      # TODO: remaining math powers performance tests

    end

  end

end
