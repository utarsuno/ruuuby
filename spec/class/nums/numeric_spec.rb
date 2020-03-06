# coding: utf-8

RSpec.describe 'numeric.rb' do
  let(:data_nan){0.0/0.0}
  let(:data_infinity){1/0.0}
  let(:data_negative_infinity){-1/0.0}

  context 'extends class[Float]' do

    context 'by adding functions' do
      it 'function{∞?} exists' do
        expect(::Numeric.∃func?(:∞?)).to eq(true)
      end
    end

    context 'by adding function[∞?]' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          expect(data_infinity.∞?).to eq(true)
          expect(data_negative_infinity.∞?).to eq(true)
        end
        it 'cases: negative' do
          expect(data_nan.∞?).to eq(false)
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
  context 'performance', :'performance' do
    context 'func[∞?]: performs very quickly' do
      it 'for cases: true' do
        expect{data_infinity.∞?}.to perform_very_quickly
        expect{data_negative_infinity.∞?}.to perform_very_quickly
      end
      it 'cases: negative' do
        expect{data_nan.∞?}.to perform_very_quickly
        expect{0.0.∞?}.to perform_very_quickly
        expect{1.0.∞?}.to perform_very_quickly
        expect{-1.0.∞?}.to perform_very_quickly
      end
    end
  end

end
