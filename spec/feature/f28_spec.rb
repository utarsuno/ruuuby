# coding: UTF-8

RSpec.describe 'f28' do

  context 'functionality' do
    context 'golden ratio' do
      context 'has correct value' do
        it '𝚽 == Float::GOLDEN_RATIO' do
          expect(𝚽).to eq(::Float::GOLDEN_RATIO)
        end
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
        context '[due to rounding]:' do
          it '𝚽 ≈≈ 2 * sin(54°)' do
            expect(𝚽.≈≈(2.0 * sin°(54))).to eq(true)
          end
        end
        context 'misc equations to validate' do
          it 'pythageorem theorem w/ golden ratio' do
            expect(::Math.pythagoras_τ³?(1, √(𝚽), 𝚽)).to eq(true)
          end
        end
      end
    end # end: {golden ratio}
    context 'golden angle' do
      context 'has correct value' do
        it 'Ⴔ == π * (3 - √(5))' do
          expect(Ⴔ).to eq(θʳ(π * (3 - √(5))).°)
          expect(Ⴔ.ʳ).to eq(θʳ(π * (3 - √(5))))
        end
        it '360 / 𝚽 == 360 - Ⴔ' do
          expect(360.0 / 𝚽).to eq(360.0 - Ⴔ.to_f)
        end
        it 'Ⴔ == 360 / 𝚽^²' do
          expect(Ⴔ).to eq(360.0 / (𝚽^²))
        end
        it 'Ⴔ == 360 * (2 - 𝚽)' do
          expect(Ⴔ).to eq(360.0 * (2.0 - 𝚽))
        end
        context '[due to rounding]:' do
          it 'Ⴔ == 360 * (1 - (1 / 𝚽))' do
            expect(Ⴔ.≈≈(360.0 * (1.0 - (1.0 / 𝚽)))).to eq(true)
          end
        end
      end
    end # end: {golden angle}
  end # end: {functionality}

  context 'audits', :audits do
    context 'feature(f28) passes audits (tests not relating to observed functionality)' do
      context 'funcs provided are' do
        context 'defined in correct location' do
          it 'for module{MainF28}' do
            expect_∃const_w_type(:𝚽, ::Float, ::Kernel)
            expect_∃const_w_type(:Ⴔ, ::ThetaAngle, ::Kernel)
          end
        end
      end # end: {funcs provided are}

    end # end: {feature(f28) passes audits (tests not relating to observed functionality)}
  end

end
