# coding: UTF-8

RSpec.describe 'f28' do

  context 'functionality' do

    context 'relating equations' do
      it 'pythagorean theorem w/ golden ratio' do
        expect(::Math.τ³_is_pythagorean?(a: 1, b: √(𝚽), c: 𝚽)).to eq(true)
        expect(::Math.τ³_is_pythagorean?(a: 3, b: 4, c: 5)).to eq(true)
      end
    end

    context 'hybrid tests' do

      context 'behaviors{f28_b02, f28_b11}' do

        #it "Euler's Formula works w/ golden angle" do
          # TODO: RangeError: can't convert 0+1i into Float | {ThetaAngle needs to support Complex-Plane-Representation}
          #  expect(℮ ** (1i * Ⴔ)).to eq(cos(θʳ(Ⴔ)) + 1i * sin(θʳ(Ⴔ)))
        #end

      end

    end

  end # end: {functionality}

end
