# coding: utf-8

RSpec.describe 'README.md' do

  #                   __          ___     __
  #   /\     |  |    |  \    |     |     /__`
  #  /~~\    \__/    |__/    |     |     .__/

  context 'audits', :'audits' do

    context 'README.md examples' do
      it 'works as described' do
        expect(√(25) == 5).to eq(true)

        expect(5^²).to eq(5 * 5)

        expect(-5^⁴).to eq(-5 * -5 * -5 * -5)

        expect('b'.∈? 'abc').to eq(true)
        expect('abc'.∌? 'd').to eq(true)
        expect('d'.∈? 'abc').to eq(false)

        data = {hello: 'world', ye: 'ee'}
        expect([data.🔑?(:hello), data.🔑?(:non_existing_key)]).to eq([true, false])
        expect([data.∃🔑?(:hello), data.∃🔑?(:non_existing_key)]).to eq([true, false])

        elements_a = [1, 'a', 2, nil, [], 2]
        elements_b = [nil, 2, 2, 'a', 1, []]
        expect(elements_a.≈≈ elements_b).to eq(true)
        expect(elements_a == elements_b).to eq(false)

        expect([-5.ℕ?, 7.0.ℤ?, Complex(Float::NAN).ℝ?, Rational(2, 3).ℚ?]).to eq([false, true, false, true])

        expect([1, 2, 3].⊕ [3, 4]).to eq([1, 4, 2])

        expect([2, 3, 4].∖ [1, 2, 3]).to eq([4])
      end

      it 'alternative version works too' do
        expect(√(25) == 5.0).to eq(true)
        expect(√(25.0) == 5).to eq(true)
        expect(√(25.0) == 5.0).to eq(true)

        data = {hello: 'world', ye: 'ee'}
        expect([data.🗝?(:hello), data.🗝?(:non_existing_key)]).to eq([true, false])
        expect([data.∃🗝?(:hello), data.∃🗝?(:non_existing_key)]).to eq([true, false])

        result_a = [1, 2, 3].⊕ [3, 4]
        expect(result_a).to eq([1, 4, 2])

        result_b = [2, 3, 4].∖ [1, 2, 3]
        expect(result_b).to eq([4])
      end

    end

  end

end
