# coding: UTF-8

RSpec.describe 'f28' do

  context 'functionality' do

    context 'relating equations' do
      it 'pythagorean theorem w/ golden ratio' do
        expect(::Math::Trig::ℕ³.pythagorean?(a: 3, b: 4, c: 5)).to eq(true)
      end
    end

    context 'hybrid tests', :integration do
      context 'dual behavior groups for{f28}' do

        it '{b00, b02}' do
          expect((-1.0) ** (1.0 / (π * 1i))).to eq(℮)
        end

        it '{b00, b03}' do
          expect(π).to eq(5 * acos(𝚽 / 2))
        end

        it '{b02, b11}' do
          expect(℮ ** (1i * Ⴔ.ʳ)).to eq(cos(Ⴔ) + 1i * sin(Ⴔ))
        end

      end # end: {dual behavior groups for{f28}}
    end # end: {hybrid tests}

  end # end: {functionality}

end
