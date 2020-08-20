# coding: UTF-8

RSpec.describe 'f32_b10' do

  context 'feature{f32} functionality for behavior{b10}' do
    let(:fℤ²){::Math::NumberTheory::ℤ²}

    context 'ℤ²' do

      context 'func{gcd}' do
        context 'handles needed scenarios' do
          context 'cases: positive' do
            it 'same value as self' do
              (-9..9).∀ do |i|
                a = (🎲(i)).to_i + 1
                expect(fℤ².gcd(a, a)).to eq(a.abs)
              end
            end
            it 'paired w/ 0' do
              (-9..9).∀ do |i|
                a = (🎲(i)).to_i + 1
                expect(fℤ².gcd(a, 0)).to eq(a.abs)
                expect(fℤ².gcd(0, a)).to eq(a.abs)
              end
            end
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
            it 'passes associative law tests' do
              (1..42).∀ do |i|
                a = (🎲(i.to_i).to_i + 1)
                b = (🎲(i.to_i).to_i + 1)
                c = (🎲(i.to_i).to_i + 1)
                expect(fℤ².gcd(a, fℤ².gcd(b, c))).to eq(fℤ².gcd(a, fℤ².gcd(c, b)))
                expect(fℤ².gcd(fℤ².gcd(b, c), a)).to eq(fℤ².gcd(fℤ².gcd(c, b), a))

                expect(fℤ².gcd(b, fℤ².gcd(a, c))).to eq(fℤ².gcd(b, fℤ².gcd(c, a)))
                expect(fℤ².gcd(fℤ².gcd(a, c), b)).to eq(fℤ².gcd(fℤ².gcd(c, a), b))

                expect(fℤ².gcd(c, fℤ².gcd(b, a))).to eq(fℤ².gcd(c, fℤ².gcd(a, b)))
                expect(fℤ².gcd(fℤ².gcd(b, a), c)).to eq(fℤ².gcd(fℤ².gcd(a, b), c))
              end
            end
            context 'passes misc formulas' do
              it 'gcd(2ᵃ − 1, 2ᵇ − 1) = 2ᵍᶜᵈ⁽ᵃ,ᵇ⁾ − 1' do
                (1..9).∀ do |i|
                  a = (🎲(i.to_i).to_i + 1)
                  b = (🎲(i.to_i).to_i + 1)
                  expect(fℤ².gcd(2 ** a - 1, 2 ** b - 1)).to eq(2 ** (fℤ².gcd(a, b)) - 1)
                end
              end
            end
          end
          it 'cases: error' do
            expect{fℤ².gcd(18, 30.1)}.to raise_error(::ArgumentError)
            expect{fℤ².gcd(18.2, 30)}.to raise_error(::ArgumentError)
            expect{fℤ².gcd(nil, nil)}.to raise_error(::ArgumentError)
          end

        end

      end # end: {func{gcd}}

    end # end: {ℤ²}
  end

end
