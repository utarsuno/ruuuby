# coding: UTF-8

RSpec.describe 'f28' do

  context 'functionality' do

    context 'relating equations' do
      context 'Euler\'s identity' do
        it 'evaluates correctly' do
          expect((℮ ** (1i * π)) + 1.0).to eq(0)
        end
      end
      context 'Euler\'s formula' do
        it 'evaluates correctly' do
          #expect(℮ ** (1 * π)).to eq(cos(θʳ(1)) + 1i * sin(θʳ(1)))
          # ≅
          # congruent to
          # equivalence of geometric shapes and size
        end
      end
      it 'pythagorean theorem w/ golden ratio' do
        expect(::Math.τ³_is_pythagorean?(a: 1, b: √(𝚽), c: 𝚽)).to eq(true)
        expect(::Math.τ³_is_pythagorean?(a: 3, b: 4, c: 5)).to eq(true)
      end
    end
  end # end: {functionality}

  context 'audits', :audits do
    context 'feature(f28) passes audits (tests not relating to observed functionality)' do
      context 'funcs provided are' do
        context 'defined in correct location' do
          it 'for module{MainF28}' do
            expect_∃const_w_type(:𝚽, ::Float, ::Kernel)
            expect_∃const_w_type(:Ψ, ::Float, ::Kernel)
            expect_∃const_w_type(:Ⴔ, ::ThetaAngle, ::Kernel)
            expect(::Kernel.∃⨍?(:τ)).to eq(true)
            expect(::Kernel.∃⨍?(:ρ)).to eq(true)
            expect(::Kernel.∃⨍?(:δ)).to eq(true)
          end
          context 'constants have correct configurations' do
            it '𝚽 == Float::GOLDEN_RATIO' do
              expect(𝚽).to eq(::Float::GOLDEN_RATIO)
              expect(𝚽.❄️?).to eq(true)
            end
          end
        end
      end # end: {funcs provided are}

    end # end: {feature(f28) passes audits (tests not relating to observed functionality)}
  end

end
