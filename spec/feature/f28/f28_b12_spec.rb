# coding: UTF-8

RSpec.describe 'f28_b12' do
  context 'functionality' do
    context 'infinity complex' do
      context 'has correct value' do
        it '∞ℂ == Float::INFINITY_COMPLEX' do
          expect(∞ℂ).to eq(::Float::INFINITY_COMPLEX)
          expect(∞ℂ.ⓣ).to eq(::Symbol)
        end
      end
    end
  end
end
