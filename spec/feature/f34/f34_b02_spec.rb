# coding: UTF-8

RSpec.describe 'f34_b02' do

  context 'feature{f34} behavior{b02} functionality' do
    let(:geo){::Math::Geometry}

    context 'class{Triangle}' do

      context 'adds func{◣?}' do
        context 'handling needed scenarios' do
          it 'cases: positive' do
            expect(geo::Triangle.new(3, 4, 5).◣?).to eq(true)
          end
          it 'cases: negative' do
            expect(geo::Triangle.new_equilateral(1).◣?).to eq(false)
          end
        end
      end

      context 'adds func{golden?}' do
        context 'handling needed scenarios' do
          it 'cases: positive' do
            side_length = 2 * (Math.sqrt(5) + 1)
            side_base   = 4
            scenario    = geo::Triangle.new(side_length, side_length, side_base)
            expect(scenario.golden?).to eq(true)
          end
          it 'cases: negative' do
            expect(geo::Triangle.new(3, 4, 5).golden?).to eq(false)
          end
        end
      end

    end

  end

  context 'hybrid test', :integration do
    let(:geo){::Math::Geometry}

    context '{f28_b00, f34_b02}' do

      it 'Kepler triangle' do
        expect(::Math::Trig::ℕ³.pythagorean?(a: 1, b: √(𝚽), c: 𝚽)).to eq(true)
        triangle = geo::Triangle.new(1, √(𝚽), 𝚽)
        expect(triangle.◣?).to eq(true)
        expect(triangle.scalene?).to eq(true)
        expect(triangle.isosceles?).to eq(false)
        expect(triangle.perimeter).to eq(𝚽 + 1 + √(𝚽))
        expect(triangle.obtuse?).to eq(false)
        expect(triangle.equiangular?).to eq(false)
        expect(triangle.equilateral?).to eq(false)
        expect(triangle.acute?).to eq(false)

        #2 * (Math::PI / (Math.sin(θ°(72).ʳ)))
      end

    end

  end

end
