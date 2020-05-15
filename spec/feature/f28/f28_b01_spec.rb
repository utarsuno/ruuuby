# coding: UTF-8

RSpec.describe 'f28' do
  context 'functionality' do
    context 'super golden ratio' do
      context 'has correct value' do
        it 'Ψ == (1 + (∛((29 + 3 * √(93)) / 2) + (∛((29 - 3 * √(93)) / 2)))) / 3' do
          expect(Ψ.≈≈((1.0 + (∛((29.0+3.0*√(93))/2.0) + (∛((29.0-3.0*√(93))/2.0)))) / 3.0)).to eq(true)
        end
        it 'Ψ³ = Ψ² + 1' do
          expect((Ψ ** 3).≈≈((Ψ ** 2) + 1.0)).to eq(true)
        end
      end
    end # end: {super golden ratio}
  end
end
