# encoding: UTF-8

using ::ThetaAngle::ContextRuuuby

RSpec.describe 'f28_b11' do
  let(:pi2){π * 2.0}
  context 'functionality' do
    context 'golden angle' do
      context 'has correct value' do
        it 'Ⴔ == π * (3 - √(5))' do
          expect(Ⴔ).to eq(π * (3 - √(5)))
        end
        it '360 / 𝚽 == 2π - Ⴔ' do
          expect(360.0 / 𝚽).to eq(360.0 - Ⴔ.°)
        end
        it 'Ⴔ == 360 / 𝚽^²' do
          expect(Ⴔ.°.real).to eq(360.0 / (𝚽^²))
        end
        it 'Ⴔ == 2π * (2 - 𝚽)' do
          expect(Ⴔ).to eq(𝞽 * (2.0 - 𝚽))
        end
        it 'Ⴔ == 2π * (1 - (1 / 𝚽))' do
          # 𝚽 - 1 == 1 / 𝚽
          # for above equation, LHS is slightly more precise than the RHS
          expect(Ⴔ).to eq(pi2 * (1.0 - (𝚽 - 1)))
        end
      end
    end # end: {golden angle}
  end
end
