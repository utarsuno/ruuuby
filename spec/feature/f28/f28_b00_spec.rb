# coding: UTF-8

RSpec.describe 'f28_b00' do
  context 'functionality' do
    context 'golden ratio' do
      context 'has correct value' do
        it '𝚽 == √𝚽 * √𝚽' do
          expect(𝚽).to eq(√(𝚽) * √(𝚽))
        end
        it '𝚽 == √((5+√(5))/(5-√(5)))' do
          expect(𝚽).to eq(√((5+√(5))/(5-√(5))))
        end
        it '𝚽 == (1 + √(5)) / 2.0' do
          expect(𝚽).to eq((1 + √(5)) / 2.0)
        end
        it '0 == 𝚽^² - 𝚽 - 1' do
          expect((𝚽^²) - 𝚽 - 1.0).to eq(0)
        end
        it '𝚽^² == 𝚽 + 1' do
          expect(𝚽^²).to eq(𝚽 + 1)
        end
        it '𝚽 = 1 + 1/𝚽' do
          expect(𝚽).to eq(1 + Rational(1, 𝚽))
          expect(𝚽).to eq(1 + (𝚽^⁻¹))
        end
        context 'trig related functions' do
          it '𝚽 = 2 * sin(54°)' do
            expect(𝚽).to eq(2 * sin(θ°(54)))
          end
          it '𝚽 = 1 + 2 * sin(18°)' do
            expect(𝚽).to eq(1.0 + 2.0 * sin(θ°(18)))
          end
          it '𝚽 = ½ * csc(18°)' do
            expect(𝚽).to eq(0.5 * csc(θ°(18)))
          end
        end
      end
    end # end: {golden ratio}
  end
end
