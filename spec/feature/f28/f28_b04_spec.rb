# coding: UTF-8

RSpec.describe 'f28_b04' do
  context 'functionality' do
    context 'infinity' do
      context 'has correct value' do
        it '∞ == Float::INFINITY' do
          expect(∞).to eq(::Float::INFINITY)
          expect(∞.ⓣ).to eq(::Float)
        end
      end
    end
  end
end
