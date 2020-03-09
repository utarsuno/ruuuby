# coding: utf-8

RSpec.describe 'int.rb' do
  let(:test_scenarios){[-1337, -1, 0, 1, 1337]}

  context 'extends class[Integer]' do

    context 'by adding needed functions' do
      it 'exists' do
        RuuubyTestHelper::Nums::CONFIG_INTEGER[:ruby].∀{|c| expect(::Integer.∃func?(c)).to eq(true)}
      end
    end

    context 'by adding function{ℕ?}' do
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

    context 'by adding function{ℤ?}' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          test_scenarios.∀{|n| expect(n.ℤ?).to eq(true)}
        end
      end
    end

    context 'by adding function{ℂ?}' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          test_scenarios.∀{|n| expect(n.ℂ?).to eq(true)}
        end
      end
    end

    context 'by adding function{ℚ?}' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          test_scenarios.∀{|n| expect(n.ℚ?).to eq(true)}
        end
      end
    end

    context 'by adding function{ℝ?}' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          test_scenarios.∀{|n| expect(n.ℝ?).to eq(true)}
        end
      end
    end

    context 'by adding function{𝕌?}' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          test_scenarios.∀{|n| expect(n.𝕌?).to eq(true)}
        end
      end
    end

    context 'by adding function{finite?}' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          test_scenarios.∀{|n| expect(n.finite?).to eq(true)}
        end
      end
    end

    context 'by adding function{infinite?}' do
      context 'handles needed scenarios' do
        it 'cases: false' do
          test_scenarios.∀{|n| expect(n.infinite?).to eq(false)}
          test_scenarios.∀{|n| expect(n.∞?).to eq(false)}
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
  end

end
