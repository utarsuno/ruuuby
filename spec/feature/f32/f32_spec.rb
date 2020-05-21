# coding: UTF-8

RSpec.describe 'f32_db' do
  let(:fℕ¹){::Math::NumberTheory::ℕ¹}
  let(:fℕ²){::Math::NumberTheory::ℕ²}

  context 'feature{f32} functionality' do

    context 'ℕ¹' do

      context 'func{get_prime_factors}' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            expect(fℕ¹.get_prime_factors(100)).to eq([[2, 2], [5, 2]])
            expect(fℕ¹.get_prime_factors(76)).to eq([[2, 2], [19, 1]])
            expect(fℕ¹.get_prime_factors(50)).to eq([[2, 1], [5, 2]])
            expect(fℕ¹.get_prime_factors(48)).to eq([[2, 4], [3, 1]])
            expect(fℕ¹.get_prime_factors(36)).to eq([[2, 2], [3, 2]])
            expect(fℕ¹.get_prime_factors(20)).to eq([[2, 2], [5, 1]])
            expect(fℕ¹.get_prime_factors(10)).to eq([[2, 1], [5, 1]])
          end
          it 'cases: error' do
            expect{fℕ¹.get_prime_factors(10.1)}.to raise_error(ArgumentError)
            expect{fℕ¹.get_prime_factors(-1)}.to raise_error(ArgumentError)
            expect{fℕ¹.get_prime_factors(0)}.to raise_error(ArgumentError)
            expect{fℕ¹.get_prime_factors(nil)}.to raise_error(ArgumentError)
          end
        end
      end # end: {func{get_prime_factors}}

      context 'func{get_divisors}' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            expect(fℕ¹.get_divisors(64)).to eq([1, 2, 4, 8, 16, 32, 64])
            expect(fℕ¹.get_divisors(53)).to eq([1, 53])
            expect(fℕ¹.get_divisors(45)).to eq([1, 3, 5, 9, 15, 45])
            expect(fℕ¹.get_divisors(10)).to eq([1, 2, 5, 10])
            expect(fℕ¹.get_divisors(4)).to eq([1, 2, 4])
            expect(fℕ¹.get_divisors(3)).to eq([1, 3])
            expect(fℕ¹.get_divisors(2)).to eq([1, 2])
            expect(fℕ¹.get_divisors(1)).to eq([1])
          end
          it 'cases: error' do
            expect{fℕ¹.get_divisors(10.1)}.to raise_error(ArgumentError)
            expect{fℕ¹.get_divisors(-1)}.to raise_error(ArgumentError)
            expect{fℕ¹.get_divisors(0)}.to raise_error(ArgumentError)
            expect{fℕ¹.get_divisors(nil)}.to raise_error(ArgumentError)
          end
        end
      end # end: {func{get_divisors}}

      context 'func{get_proper_divisors}' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            expect(fℕ¹.get_proper_divisors(64)).to eq([1, 2, 4, 8, 16, 32])
            expect(fℕ¹.get_proper_divisors(53)).to eq([1])
            expect(fℕ¹.get_proper_divisors(45)).to eq([1, 3, 5, 9, 15])
            expect(fℕ¹.get_proper_divisors(10)).to eq([1, 2, 5])
            expect(fℕ¹.get_proper_divisors(4)).to eq([1, 2])
            expect(fℕ¹.get_proper_divisors(3)).to eq([1])
            expect(fℕ¹.get_proper_divisors(2)).to eq([1])
            expect(fℕ¹.get_proper_divisors(1)).to eq([])
          end
          it 'cases: error' do
            expect{fℕ¹.get_proper_divisors(10.1)}.to raise_error(ArgumentError)
            expect{fℕ¹.get_proper_divisors(-1)}.to raise_error(ArgumentError)
            expect{fℕ¹.get_proper_divisors(0)}.to raise_error(ArgumentError)
            expect{fℕ¹.get_proper_divisors(nil)}.to raise_error(ArgumentError)
          end
        end
      end # end: {func{get_proper_divisors}}

      context 'func{get_proper_divisors}' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            expect(fℕ¹.perfect_number?(6)).to eq(true)
            expect(fℕ¹.perfect_number?(28)).to eq(true)
            expect(fℕ¹.perfect_number?(496)).to eq(true)
            expect(fℕ¹.perfect_number?(8128)).to eq(true)
            expect(fℕ¹.perfect_number?(33550336)).to eq(true)
          end
          it 'cases: negative' do
            expect(fℕ¹.perfect_number?(2)).to eq(false)
            expect(fℕ¹.perfect_number?(3)).to eq(false)
            expect(fℕ¹.perfect_number?(4)).to eq(false)
            expect(fℕ¹.perfect_number?(5)).to eq(false)
            expect(fℕ¹.perfect_number?(7)).to eq(false)
            expect(fℕ¹.perfect_number?(8)).to eq(false)
            expect(fℕ¹.perfect_number?(9)).to eq(false)
          end
          it 'cases: error' do
            expect{fℕ¹.perfect_number?(10.1)}.to raise_error(ArgumentError)
            expect{fℕ¹.perfect_number?(-1)}.to raise_error(ArgumentError)
            expect{fℕ¹.perfect_number?(0)}.to raise_error(ArgumentError)
            expect{fℕ¹.perfect_number?(nil)}.to raise_error(ArgumentError)
          end
        end
      end # end: {func{get_proper_divisors}}

    end # end: {ℕ¹}

    context 'ℕ²' do

      context 'func{gcd}' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            expect(fℕ².gcd(1233, 5556)).to eq(3)
            expect(fℕ².gcd(5556, 1233)).to eq(3)

            expect(fℕ².gcd(270, 192)).to eq(6)
            expect(fℕ².gcd(192, 270)).to eq(6)

            expect(fℕ².gcd(12, 20)).to eq(4)
            expect(fℕ².gcd(20, 12)).to eq(4)

            expect(fℕ².gcd(18, 30)).to eq(6)
            expect(fℕ².gcd(30, 18)).to eq(6)
          end
          it 'cases: error' do
            expect{fℕ².gcd(18, 30.1)}.to raise_error(ArgumentError)
            expect{fℕ².gcd(18.2, 30)}.to raise_error(ArgumentError)
            expect{fℕ².gcd(-18, 30)}.to raise_error(ArgumentError)
            expect{fℕ².gcd(nil, nil)}.to raise_error(ArgumentError)
          end
        end
      end # end: {func{gcd}}

      context 'func{coprime?}' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            expect(fℕ².coprime?(14, 15)).to eq(true)
            expect(fℕ².coprime?(15, 14)).to eq(true)
          end
          it 'cases: negative' do
            expect(fℕ².coprime?(8, 4)).to eq(false)
            expect(fℕ².coprime?(4, 8)).to eq(false)
          end
          it 'cases: error' do
            expect{fℕ².coprime?(18, 30.1)}.to raise_error(ArgumentError)
            expect{fℕ².coprime?(18.2, 30)}.to raise_error(ArgumentError)
            expect{fℕ².coprime?(-18, 30)}.to raise_error(ArgumentError)
            expect{fℕ².coprime?(nil, nil)}.to raise_error(ArgumentError)
          end
        end
      end # end: {func{coprime?}}

    end # end: {ℕ²}

  end

end
