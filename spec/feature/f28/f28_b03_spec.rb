# coding: UTF-8

RSpec.describe 'f28_b03' do
  context 'functionality' do
    context 'π' do
      context 'has correct value' do
        it 'π == Math::PI' do
          expect(π).to eq(::Math::PI)
          expect(π.ⓣ).to eq(::Float)
          expect(π < 4).to eq(true)
          expect(π > 3).to eq(true)
        end
      end
    end
  end
end
