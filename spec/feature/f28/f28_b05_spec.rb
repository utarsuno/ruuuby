# coding: UTF-8

RSpec.describe 'f28_b05' do
  context 'functionality' do
    context 'silver ratio' do
      context 'has correct value' do
        it 'δ = 1 + √2' do
          expect(δ).to eq(1 + √(2))
        end
        context 'w/ trig funcs' do
          it 'sinʳ(⅛π)' do
            expect((sin(θʳ(π * ⅛))).≈≈((√(1.0 - (1.0 / δ))) / 2.0)).to eq(true)
          end
          it 'cosʳ(⅛π)' do
            expect((cos(θʳ(π * ⅛))).≈≈((√(1.0 + δ)) / 2.0)).to eq(true)
          end
          it 'tanʳ(⅛π)' do
            expect((tan(θʳ(π * ⅜))).≈≈(δ)).to eq(true)
          end
          it 'cotʳ(⅛π)' do
            expect((cot(θʳ(π * ⅛))).≈≈(δ)).to eq(true)
          end
        end
      end
    end
  end
end
