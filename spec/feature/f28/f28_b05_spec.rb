# encoding: UTF-8

using ::ThetaAngle::ContextRuuuby

RSpec.describe 'f28_b05' do
  context 'silver ratio', :integration do
    context 'has correct value' do
      it 'δ = 1 + √2' do
        expect(::Float::RATIO_SILVER).to eq(1 + √(2))
      end
      context 'w/ trig funcs' do
        it 'sinʳ(⅛π)' do
          expect((sin(θʳ(π / 8.0))).≈≈((√(1.0 - (1.0 / ::Float::RATIO_SILVER))) / 2.0)).to eq(true)
        end
        it 'cosʳ(⅛π)' do
          expect((cos(θʳ(π / 8.0))).≈≈((√(1.0 + ::Float::RATIO_SILVER)) / 2.0)).to eq(true)
        end
        it 'tanʳ(⅛π)' do
          expect((tan(θʳ(π * 3.0/8))).≈≈(::Float::RATIO_SILVER)).to eq(true)
        end
        it 'cotʳ(⅛π)' do
          expect((cot(θʳ(π / 8.0))).≈≈(::Float::RATIO_SILVER)).to eq(true)
        end
      end
    end
  end
end
