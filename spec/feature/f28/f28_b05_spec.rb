# coding: UTF-8

RSpec.describe 'f28' do
  context 'functionality' do
    context 'plastic ratio' do
      context 'has correct value' do
        it 'ρ == ∛((9+√(69))/18.0) + ∛((9-√(69))/18.0)' do
          expect(ρ.≈≈(∛((9+√(69))/18.0) + ∛((9-√(69))/18.0))).to eq(true)
        end
        it 'ρ³ = ρ + 1' do
          expect(ρ ** 3).to eq(ρ + 1)
        end
      end
    end # end: {plastic ratio}
  end
end
