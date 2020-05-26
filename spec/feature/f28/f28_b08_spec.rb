# coding: UTF-8

RSpec.describe 'f28_b08' do
  context 'functionality' do
    context 'angle tau' do
      context 'has correct value' do
        it 'γ == Float::EULER_MASCHERONI_CONSTANT' do
          expect(γ).to eq(::Float::EULER_MASCHERONI_CONSTANT)
          expect(γ.ⓣ).to eq(::Float)

          as_string = γ.to_s
          first_50   = '0.57721566490153286060651209008240243104215933593992'
          expect(γ).to eq(0.5772156649015329)
          expect(as_string[0..as_string.length-2]).to eq(first_50[0..16])
        end
      end
    end
  end
end
