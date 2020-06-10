# coding: UTF-8

RSpec.describe 'f32_b10' do

  context 'feature{f32} functionality for behavior{b10}' do
    let(:fℤ²){::Math::NumberTheory::ℤ²}

    context 'ℤ²' do

      context 'func{gcd}' do
        context 'handles needed scenarios' do
          context 'cases: positive' do
            it 'regular data' do
              expect(fℤ².gcd(15, 14)).to eq(1)

              expect(fℤ².gcd(1233, 5556)).to eq(3)
              expect(fℤ².gcd(5556, 1233)).to eq(3)

              expect(fℤ².gcd(270, 192)).to eq(6)
              expect(fℤ².gcd(192, 270)).to eq(6)

              expect(fℤ².gcd(12, 20)).to eq(4)
              expect(fℤ².gcd(20, 12)).to eq(4)

              expect(fℤ².gcd(18, 30)).to eq(6)
              expect(fℤ².gcd(30, 18)).to eq(6)
            end
            it 'handles negatives' do
              expect(fℤ².gcd(18, -30)).to eq(6)
              expect(fℤ².gcd(-18, 30)).to eq(6)
              expect(fℤ².gcd(-18, -30)).to eq(6)
            end
          end
          it 'cases: error' do
            expect{fℤ².gcd(18, 30.1)}.to raise_error(ArgumentError)
            expect{fℤ².gcd(18.2, 30)}.to raise_error(ArgumentError)
            expect{fℤ².gcd(nil, nil)}.to raise_error(ArgumentError)
          end

        end

      end # end: {func{gcd}}

    end # end: {ℤ²}
  end

end
