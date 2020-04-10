# coding: utf-8

RSpec.describe 'complex.rb' do
  let(:data_nan_with_complex){ℂ(Float::NAN, 1.5)}
  let(:data_infinity_with_complex){ℂ(1.0/0.0, 1.5)}
  let(:data_negative_infinity_with_complex){ℂ(1.0/0.0, 1.5)}
  let(:dataf_one){ℂ(1.0)}
  let(:datac_one){ℂ(1, 1)}
  let(:data_minus_leet){ℂ(-1337)}

  context 'extends class[Complex]' do

    context 'by adding needed functions' do
      it 'exists' do
        RuuubyTestHelper::Nums::CONFIG_COMPLEX[:ruby].∀{|c| expect(::Complex.∃⨍?(c)).to eq(true)}
      end
    end

    context 'by adding function{ℕ?}' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          expect(data_complex_zero.ℕ?).to eq(true)
          expect(data_complex_one.ℕ?).to eq(true)
          expect(data_complex_leet.ℕ?).to eq(true)
        end
        context 'cases: negative' do
          it 'normal non-matching data' do
            expect(ℂ(0, 1).ℕ?).to eq(false)
            expect(datac_one.ℕ?).to eq(false)
            expect(ℂ(-1).ℕ?).to eq(false)
            expect(ℂ(1337.1337).ℕ?).to eq(false)

            data_range_complex_nan_and_infs.∀{|c| expect(c.ℕ?).to eq(false)}
          end
        end
      end
    end

    context 'by adding function{ℤ?}' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          expect(data_minus_leet.ℤ?).to eq(true)
          expect(ℂ(-1).ℤ?).to eq(true)
          expect(data_complex_zero.ℤ?).to eq(true)
          expect(data_complex_one.ℤ?).to eq(true)
          expect(data_complex_leet.ℤ?).to eq(true)
        end
        it 'cases: negative' do
          data_range_complex_nan_and_infs.∀{|c| expect(c.ℤ?).to eq(false)}
          expect(ℂ(0, 1).ℤ?).to eq(false)
          expect(datac_one.ℤ?).to eq(false)
          expect(ℂ(1337.1337).ℤ?).to eq(false)
        end
      end
    end

    context 'by adding function{ℚ?}' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          expect(dataf_one.ℚ?).to eq(true)
        end
        it 'cases: negative' do
          data_range_complex_nan_and_infs.∀{|c| expect(c.ℚ?).to eq(false)}
        end
        it 'cases: un-covered scope' do
          expect(ℂ(1.1337).ℚ?).to eq(nil)
        end
      end
    end

    context 'by adding function{ℂ?}' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          expect(datac_one.ℂ?).to eq(true)
        end
        it 'cases: negative' do
          data_range_complex_nan_and_infs.∀{|c| expect(c.ℂ?).to eq(false)}
        end
      end
    end

    context 'by adding function{ℝ?}' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          expect(data_complex_one.ℝ?).to eq(true)
        end
        it 'cases: negative' do
          expect(datac_one.ℝ?).to eq(false)
          data_range_complex_nan_and_infs.∀{|c| expect(c.ℝ?).to eq(false)}
        end
      end
    end

    context 'by adding function{𝕌?}' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          expect(data_complex_one.𝕌?).to eq(true)
        end
        it 'cases: negative' do
          data_range_complex_nan_and_infs.∀{|c| expect(c.𝕌?).to eq(false)}
        end
      end
    end

  end

  #  __   ___  __   ___  __   __                   __   ___
  # |__) |__  |__) |__  /  \ |__)  |\/|  /\  |\ | /  ` |__
  # |    |___ |  \ |    \__/ |  \  |  | /~~\ | \| \__, |___
  context 'performance', :performance do
    context 'func{ℕ?}: performs very quickly' do
      it 'for cases: true' do
        expect{data_complex_zero.ℕ?}.to perform_very_quickly
      end
      it 'for cases: false' do
        expect{data_complex_nan.ℕ?}.to perform_very_quickly
      end
    end

    context 'func{ℤ?}: performs very quickly' do
      it 'for cases: true' do
        expect{data_minus_leet.ℤ?}.to perform_very_quickly
      end
      it 'for cases: false' do
        expect{data_complex_nan.ℤ?}.to perform_very_quickly
      end
    end

    context 'func{ℂ?}: performs very quickly' do
      it 'for cases: true' do
        expect{datac_one.ℂ?}.to perform_very_quickly
      end
      it 'for cases: false' do
        expect{data_complex_nan.ℂ?}.to perform_very_quickly
      end
    end

    context 'func{ℚ?}: performs very quickly' do
      it 'for cases: true' do
        expect{dataf_one.ℚ?}.to perform_very_quickly
      end
      it 'for cases: false' do
        expect{data_complex_nan.ℚ?}.to perform_very_quickly
      end
    end

    context 'func{ℝ?}: performs very quickly' do
      it 'for cases: true' do
        expect{data_complex_one.ℝ?}.to perform_very_quickly
      end
      it 'for cases: false' do
        expect{data_complex_nan.ℝ?}.to perform_very_quickly
      end
    end

    context 'func{𝕌?}: performs very quickly' do
      it 'for cases: true' do
        expect{data_complex_one.𝕌?}.to perform_very_quickly
      end
      it 'for cases: false' do
        expect{data_complex_nan.𝕌?}.to perform_very_quickly
      end
    end

  end

end
