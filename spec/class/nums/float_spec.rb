# coding: utf-8

RSpec.describe 'float.rb' do
  let(:data_nan){0.0/0.0}
  let(:data_infinity){1/0.0}
  let(:data_negative_infinity){-1/0.0}

  context 'extends class[Float]' do

    context 'by adding needed functions' do
      it 'exists' do
        RuuubyTestHelper::Nums::CONFIG_FLOAT[:ruby].∀{|c| expect(::Float.∃func?(c)).to eq(true)}
      end
    end

    context 'by adding function{ℕ?}' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          expect(0.0.ℕ?).to eq(true)
          expect(1.0.ℕ?).to eq(true)
          expect(1337.0.ℕ?).to eq(true)
        end
        it 'cases: negative' do
          expect(data_nan.ℕ?).to eq(false)
          expect(data_infinity.ℕ?).to eq(false)
          expect(data_negative_infinity.ℕ?).to eq(false)
          expect((-1.0).ℕ?).to eq(false)
          expect(1337.1337.ℕ?).to eq(false)
        end
      end
    end

    context 'by adding function{ℤ?}' do
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
          expect(data_infinity.ℤ?).to eq(false)
          expect(data_negative_infinity.ℤ?).to eq(false)
        end
      end
    end

    context 'by adding function{ℚ?}' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          expect(1.0.ℚ?).to eq(true)
        end
        it 'cases: negative' do
          expect(data_nan.ℚ?).to eq(false)
          expect(data_infinity.ℚ?).to eq(false)
          expect(data_negative_infinity.ℚ?).to eq(false)
        end
        it 'cases: un-covered scope' do
          expect(1.1337.ℚ?).to eq(nil)
        end
      end
    end

    context 'by adding function{ℂ?}' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          expect(1.337.ℂ?).to eq(true)
        end
        it 'cases: negative' do
          expect(data_nan.ℂ?).to eq(false)
          expect(data_infinity.ℂ?).to eq(false)
          expect(data_negative_infinity.ℂ?).to eq(false)
        end
      end
    end

    context 'by adding function{ℝ?}' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          expect(0.0.ℝ?).to eq(true)
        end
        it 'cases: negative' do
          expect(data_nan.ℝ?).to eq(false)
          expect(data_infinity.ℝ?).to eq(false)
          expect(data_negative_infinity.ℝ?).to eq(false)
        end
      end
    end

    context 'by adding function{𝕌?}' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          expect(0.0.𝕌?).to eq(true)
        end
        it 'cases: negative' do
          expect(data_nan.𝕌?).to eq(false)
          expect(data_infinity.𝕌?).to eq(false)
          expect(data_negative_infinity.𝕌?).to eq(false)
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
        expect{0.0.ℕ?}.to perform_very_quickly
      end
      it 'cases: negative' do
        expect{data_nan.ℕ?}.to perform_very_quickly
      end
    end

    context 'func{ℤ?}: performs very quickly' do
      it 'for cases: true' do
        expect{-1337.0.ℤ?}.to perform_very_quickly
      end
      it 'cases: negative' do
        expect{data_nan.ℤ?}.to perform_very_quickly
      end
    end

    context 'func{ℂ?}: performs very quickly' do
      it 'for cases: true' do
        expect{1.337.ℂ?}.to perform_very_quickly
      end
      it 'cases: negative' do
        expect{data_nan.ℂ?}.to perform_very_quickly
      end
    end

    context 'func{ℚ?}: performs very quickly' do
      it 'for cases: true' do
        expect{1.0.ℚ?}.to perform_very_quickly
      end
      it 'cases: negative' do
        expect{data_nan.ℚ?}.to perform_very_quickly
      end
    end

    context 'func{ℝ?}: performs extremely quickly' do
      it 'for cases: true' do
        expect{0.0.ℝ?}.to perform_extremely_quickly
      end
      it 'cases: negative' do
        expect{data_nan.ℝ?}.to perform_extremely_quickly
      end
    end

    context 'func{𝕌?}: performs extremely quickly' do
      it 'for cases: true' do
        expect{0.0.𝕌?}.to perform_extremely_quickly
      end
      it 'cases: negative' do
        expect{data_nan.𝕌?}.to perform_extremely_quickly
      end
    end
  end

end
