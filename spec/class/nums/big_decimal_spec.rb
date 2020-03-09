# coding: utf-8

RSpec.describe 'big_decimal.rb' do
  let(:data_nan){BigDecimal('NaN')}
  let(:data_zero){BigDecimal('0.0')}
  let(:data_minus_one){BigDecimal('-1.0')}
  let(:data_one){BigDecimal('1.0')}
  let(:data_leet){BigDecimal('1337.0')}
  let(:data_minus_leet){BigDecimal('-1337.0')}
  let(:data_leet_kinda){BigDecimal('1.337')}

  context 'extends class[BigDecimal]' do

    context 'by adding needed functions' do
      it 'exists' do
        RuuubyTestHelper::Nums::CONFIG_BIG_DECIMAL[:ruby].∀{|c| expect(::BigDecimal.∃func?(c)).to eq(true)}
      end
    end

    context 'by adding function{ℕ?}' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          expect(data_zero.ℕ?).to eq(true)
          expect(data_one.ℕ?).to eq(true)
          expect(data_leet.ℕ?).to eq(true)
        end
        it 'cases: negative' do
          expect(data_nan.ℕ?).to eq(false)
          expect(data_minus_one.ℕ?).to eq(false)
          expect(BigDecimal('1337.1337').ℕ?).to eq(false)
        end
      end
    end

    context 'by adding function{ℤ?}' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          expect(data_minus_leet.ℤ?).to eq(true)
          expect(data_minus_one.ℤ?).to eq(true)
          expect(data_zero.ℤ?).to eq(true)
          expect(data_one.ℤ?).to eq(true)
          expect(data_leet.ℤ?).to eq(true)
        end
        it 'cases: false' do
          expect(data_nan.ℤ?).to eq(false)
        end
      end
    end

    context 'by adding function{ℚ?}' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          expect(data_one.ℚ?).to eq(true)
        end
        it 'cases: negative' do
          expect(data_nan.ℚ?).to eq(false)
        end
      end
    end

    context 'by adding function{ℂ?}' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          expect(data_leet_kinda.ℂ?).to eq(true)
        end
        it 'cases: false' do
          expect(data_nan.ℂ?).to eq(false)
        end
      end
    end

    context 'by adding function{ℝ?}' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          expect(data_leet_kinda.ℝ?).to eq(true)
        end
        it 'cases: false' do
          expect(data_nan.ℝ?).to eq(false)
        end
      end
    end

    context 'by adding function{𝕌?}' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          expect(data_leet_kinda.𝕌?).to eq(true)
        end
        it 'cases: false' do
          expect(data_nan.𝕌?).to eq(false)
        end
      end
    end
  end

  #  __   ___  __   ___  __   __                   __   ___
  # |__) |__  |__) |__  /  \ |__)  |\/|  /\  |\ | /  ` |__
  # |    |___ |  \ |    \__/ |  \  |  | /~~\ | \| \__, |___
  context 'performance', :'performance' do
    context 'func{ℕ?}: performs very quickly' do
      it 'for cases: true' do
        expect{data_zero.ℕ?}.to perform_very_quickly
      end
      it 'for cases: false' do
        expect{data_minus_one.ℕ?}.to perform_very_quickly
        expect{data_nan.ℕ?}.to perform_very_quickly
      end
    end

    context 'func{ℤ?}: performs very quickly' do
      it 'for cases: true' do
        expect{data_minus_leet.ℤ?}.to perform_very_quickly
      end
      it 'for cases: false' do
        expect{data_nan.ℤ?}.to perform_very_quickly
      end
    end

    context 'func{ℂ?}: performs very quickly' do
      it 'for cases: true' do
        expect{data_zero.ℂ?}.to perform_very_quickly
      end
      it 'for cases: false' do
        expect{data_minus_one.ℂ?}.to perform_very_quickly
        expect{data_nan.ℂ?}.to perform_very_quickly
      end
    end

    context 'func{ℚ?}: performs very quickly' do
      it 'for cases: true' do
        expect{data_one.ℚ?}.to perform_very_quickly
      end
      it 'for cases: false' do
        expect{data_nan.ℚ?}.to perform_very_quickly
      end
    end

    context 'func{ℝ?}: performs very quickly' do
      it 'for cases: true' do
        expect{data_leet_kinda.ℝ?}.to perform_very_quickly
      end
      it 'for cases: false' do
        expect{data_nan.ℝ?}.to perform_very_quickly
      end
    end

    context 'func{𝕌?}: performs very quickly' do
      it 'for cases: true' do
        expect{data_leet_kinda.𝕌?}.to perform_very_quickly
      end
      it 'for cases: false' do
        expect{data_nan.𝕌?}.to perform_very_quickly
      end
    end

  end

end
