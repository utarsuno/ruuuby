# encoding: UTF-8

RSpec.describe 'f28_b01' do
  context 'functionality' do
    context 'super golden ratio' do
      context 'has correct value' do
        it 'Ψ == (1 + (∛((29 + 3 * √(93)) / 2) + (∛((29 - 3 * √(93)) / 2)))) / 3' do
          # TODO: test the values generated from these equations, they may have higher precision now
          expect(::Float::RATIO_GOLDEN_SUPER.≈≈((1.0 + (∛((29.0+3.0*√(93))/2.0) + (∛((29.0-3.0*√(93))/2.0)))) / 3.0)).to eq(true)
        end
        it 'Ψ³ = Ψ² + 1' do
          # TODO: test the values generated from these equations, they may have higher precision now
          expect((::Float::RATIO_GOLDEN_SUPER ** 3).≈≈((::Float::RATIO_GOLDEN_SUPER ** 2) + 1.0)).to eq(true)

          # TODO: test w/ the custom ^ power function
          # # ^ TODO: compare the precision difference
        end
      end
    end # end: {super golden ratio}
  end
end
