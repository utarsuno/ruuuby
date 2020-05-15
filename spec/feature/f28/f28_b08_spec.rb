# coding: UTF-8

RSpec.describe 'f28' do
  context 'functionality' do
    context 'golden angle' do
      context 'has correct value' do
        it 'Ⴔ == π * (3 - √(5))' do
          expect(Ⴔ).to eq(θʳ(π * (3 - √(5))).°)
          expect(Ⴔ.ʳ).to eq(θʳ(π * (3 - √(5))))
        end
        it '360 / 𝚽 == 360 - Ⴔ' do
          expect(360.0 / 𝚽).to eq(360.0 - Ⴔ)
        end
        it 'Ⴔ == 360 / 𝚽^²' do
          expect(Ⴔ).to eq(360.0 / (𝚽^²))
        end
        it 'Ⴔ == 360 * (2 - 𝚽)' do
          expect(Ⴔ).to eq(τ * (2.0 - 𝚽))
        end
        it 'Ⴔ == 360 * (1 - (1 / 𝚽))' do
          # 𝚽 - 1 == 1 / 𝚽
          # for above equation, LHS is slightly more precise than the RHS
          expect(Ⴔ).to eq(360 * (1.0 - (𝚽 - 1)))
        end
      end
    end # end: {golden angle}
  end
end
