# encoding: UTF-8

RSpec.describe 'f32' do
  let(:fℕ²){::Math::NumberTheory::ℕ²}
  let(:f𝕎¹){::Math::NumberTheory::𝕎¹}
  let(:fℤ²){::Math::NumberTheory::ℤ²}
  let(:⨍){::Math::NumberTheory}
  let(:data_scenarios_semiprimes){[4, 6, 9, 10, 14, 15, 21, 22, 25, 26, 33, 34, 35, 38, 39, 46, 49, 51, 55, 57, 58, 62, 65, 69, 74, 77, 82, 85, 86, 87, 91, 93, 94, 95, 106, 111]}

  context 'feature{f32} functionality' do

    context 'hybrid tests', :integration do

      context 'funcs provided by feature{f98}' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            data_scenarios_semiprimes.∀{|scenario| expect(⨍.semiprime?(scenario)).to eq(true)}
          end
          it 'cases: negative' do
            (1..112).∀ do |index|
              unless data_scenarios_semiprimes.∋?(index)
                expect(⨍.semiprime?(index)).to eq(false)
              end
            end
          end
        end
      end

      context 'dual behavior groups for{f32}' do
        context '{b05, b10}' do
          it 'gcd(fib(n), fib(n+1)) = 1, ∀ n ≥ 1' do
            (0..42).∀ do |i|
              random_index = 🎲.𝔦𝔦(1, 42)
              prev         = f𝕎¹.seq_fibonacci[random_index]
              curr         = f𝕎¹.seq_fibonacci[random_index + 1]
              expect(fℕ².coprime?(prev, curr)).to eq(true)
            end
          end
        end # end: {b05, b10}
        context '{b05, b06}' do
          it 'lucas(n) = fib(n−1) + fib(n+1), ∀ n > 1' do
            (0..42).∀ do |i|
              random_index = 🎲.𝔦𝔦(1, 42)
              lucas_curr   = f𝕎¹.seq_lucas[random_index]
              fib_minus     = f𝕎¹.seq_fibonacci[random_index - 1]
              fib_plus      = f𝕎¹.seq_fibonacci[random_index + 1]
              expect(lucas_curr).to eq(fib_minus + fib_plus)
            end
          end
          it 'fib(2n) = lucas(n) * fib(n), ∀ n > 1' do
            (0..25).∀ do |i|
              random_index = 🎲.𝔦𝔦(1, 25)
              curr_lucas   = f𝕎¹.seq_lucas[random_index]
              curr_fib      = f𝕎¹.seq_fibonacci[random_index]
              fib_2n        = f𝕎¹.seq_fibonacci[random_index * 2]
              expect(fib_2n).to eq(curr_lucas * curr_fib)
            end
          end
        end # end: {b05, b06}
      end # end: {dual behavior groups for{f32}}

    end # end: {hybrid tests}

  end

end
