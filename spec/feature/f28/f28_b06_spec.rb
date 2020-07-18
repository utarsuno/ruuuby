# encoding: UTF-8

RSpec.describe 'f28_b06' do
  context 'functionality' do
    context 'plastic ratio' do
      context 'has correct value' do
        it 'ρ == ∛((9+√(69))/18.0) + ∛((9-√(69))/18.0)' do
          expect(::Float::RATIO_PLASTIC.≈≈(∛((9+√(69))/18.0) + ∛((9-√(69))/18.0))).to eq(true)
        end
        it 'ρ³ = ρ + 1' do
          expect(::Float::RATIO_PLASTIC ** 3).to eq(::Float::RATIO_PLASTIC + 1)
        end
      end
    end # end: {plastic ratio}
  end
end
