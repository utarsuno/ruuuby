# coding: utf-8

RSpec.describe Ruuuby do

  context 'Ruuuby added as module' do
    it 'exists' do
      expect(∃module?(:Ruuuby)).to eq(true)
    end
    context 'and adds needed sub-modules & classes' do
      it 'module(VERSION) under module(::Ruuuby' do
        expect(∃module?(:VERSION, ::Ruuuby)).to eq(true)
      end
      it 'module(Err) under module(::Ruuuby)' do
        expect(∃module?(:ParamErr, ::Ruuuby)).to eq(true)
      end
      it 'class(WrongParamType) under module(::Ruuuby::ParamErr)' do
        expect(∃class?(:WrongParamType, ::Ruuuby::ParamErr)).to eq(true)
      end
    end
  end

#                   __          ___     __
#   /\     |  |    |  \    |     |     /__`
#  /~~\    \__/    |__/    |     |     .__/

  context 'audits', :'audits' do

    context 'README.md examples' do
      it 'works as described' do
        expect(√(25) == 5).to eq(true)

        expect('b'.∈? 'abc').to eq(true)
        expect('abc'.∌? 'd').to eq(true)
        expect('d'.∈? 'abc').to eq(false)

        data = {hello: 'world', ye: 'ee'}
        expect([data.🔑?(:hello), data.🔑?(:non_existing_key)]).to eq([true, false])

        expect([1, '1', 2, nil, [], 2].≈ [nil, 2, 2, '1', 1, []]).to eq(true)

        expect([-5.ℕ?, 7.0.ℤ?, Complex(Float::NAN).ℝ?, Rational(2, 3).ℚ?]).to eq([false, true, false, true])

        expect([1, 2, 3].⊕ [3, 4]).to eq([1, 4, 2])

        expect([2, 3, 4].∖ [1, 2, 3]).to eq([4])
      end
    end
  end

end
