# coding: UTF-8

RSpec.describe 'numeric.rb' do
  context 'extends class[Numeric]' do

    context 'by adding function{∞?}' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          expect(data_float_inf.∞?).to eq(true)
          expect(::Float::INFINITY_NEGATIVE.∞?).to eq(true)
        end
        it 'cases: negative' do
          expect(data_float_nan.∞?).to eq(false)
          expect(0.0.∞?).to eq(false)
          expect(1.0.∞?).to eq(false)
          expect(-1.0.∞?).to eq(false)
        end
      end
    end
  end

  #  __   ___  __   ___  __   __                   __   ___
  # |__) |__  |__) |__  /  \ |__)  |\/|  /\  |\ | /  ` |__
  # |    |___ |  \ |    \__/ |  \  |  | /~~\ | \| \__, |___
  context 'performance', :performance do
    context 'func[∞?]: performs very quickly' do
      it 'for cases: true' do
        expect{data_float_inf.∞?}.to perform_very_quickly
        expect{::Float::INFINITY_NEGATIVE.∞?}.to perform_very_quickly
      end
      it 'cases: negative' do
        expect{data_float_nan.∞?}.to perform_very_quickly
        expect{0.0.∞?}.to perform_very_quickly
        expect{1.0.∞?}.to perform_very_quickly
        expect{-1.0.∞?}.to perform_very_quickly
      end
    end
  end

end
