# utf-8

using ::ThetaAngle::ContextRuuuby
using ::Object::ContextSuperscripts

RSpec.describe 'README.md' do

  context 'integration', :integration do
    context 'README.md examples' do

      it 'works as described' do
        expect(𝚽).to eq(1 + (𝚽^⁻¹))
        expect(𝚽).to eq(2 * sin(θ°(54)))
        expect(π).to eq(5 * acos(𝚽 / 2))
        expect(θ°(360)).to eq(θʳ(π/2) * 4)
        expect(√(√(-1337.0^⁴))).to eq(1337)

        expect('b'.∈? 'abc').to eq(true)
        expect('abc'.∌? 'd').to eq(true)
        expect('d'.∈? 'abc').to eq(false)

        data = {haaallo: 'wooorld', ye: 'ee'}
        expect([data.∃🔑?(:haaallo), data.∃🔑?(:👁️👅👁️)]).to eq([true, false])

        expect(['snake_case'.🐍?, 'AHHH_CAPITALS'.🐍⬆?, 'UpperCaseCamel'.🐫?, 'lowerCaseCamel'.🐫⬇?]).to eq([true, true, true, true])

        expect([1, 'a', 2, nil, [], 2].≈≈([nil, 2, 2, 'a', 1, []])).to eq(true)
        expect([1, 'a', 2, nil, [], 2] == [nil, 2, 2, 'a', 1, []]).to eq(false)

        expect([ℕ.∋?(-5), 𝕎.∋?(0.0), ℤ.∋?(7.0), ℝ.∋?(∞), ℝ.∋?(3i), ℚ.∋?(2/3r)]).to eq([false, true, true, false, false, true])

        if 💎.engine.stats_ext['F06_B08'] == true
          expect(::Matrix[[1,1,1],[2,2,2]].ᵀ).to eq(::Matrix[[1,2],[1,2],[1,2]])
        end

        expect([1, 2, 3].⨁ [3, 4]).to eq([1, 4, 2])

        expect([2, 3, 4].∖ [1, 2, 3]).to eq([4])
      end

      it 'alternative version works too' do
        expect(𝚽).to eq(1 + Rational(1, 𝚽))

        result_a = [1, 2, 3].⨁ [3, 4]
        expect(result_a).to eq([1, 4, 2])

        result_b = [2, 3, 4].∖ [1, 2, 3]
        expect(result_b).to eq([4])
      end

      it 'deprecated examples still work' do
        expect(𝚽).to eq((θ°(360) - Ⴔ) / Ⴔ)

        expect(θ°(180)).to eq(θ𝞽(0.5))
        expect(θᵍ(200)).to eq(θʳ(π))

        expect(√(1787569)).to eq(1337)
        expect(√(25) == 5).to eq(true)
        expect(5^²).to eq(5 * 5)
        expect(-5^⁴).to eq(-5 * -5 * -5 * -5)
        expect(√(25) == 5.0).to eq(true)
        expect(√(25.0) == 5).to eq(true)
        expect(√(25.0) == 5.0).to eq(true)

        elements_a = [1, 'a', 2, nil, [], 2]
        elements_b = [nil, 2, 2, 'a', 1, []]
        expect(elements_a.≈≈ elements_b).to eq(true)
        expect(elements_a == elements_b).to eq(false)

        expect([ℕ.∋?(-5), ℤ.∋?(7.0), ℝ.∋?(∞), ℚ.∋?(Rational(2, 3))]).to eq([false, true, false, true])
      end
    end
  end

  context 'precision-loss', :tech_debt do
    it 'need to fix precision in following examples' do
      expect(((θ𝞽(1) - Ⴔ) / Ⴔ)).to_not eq(𝚽)
      # 1.6180339887498951
      # vs
      # 1.618033988749895
    end
  end

end
