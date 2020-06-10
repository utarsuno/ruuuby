# coding: UTF-8

RSpec.describe 'f32' do
  let(:fℕ²){::Math::NumberTheory::ℕ²}
  let(:f𝕎¹){::Math::NumberTheory::𝕎¹}
  let(:fℤ²){::Math::NumberTheory::ℤ²}

  context 'feature{f32} functionality' do

    context 'hybrid tests', :integration do

      context 'dual behavior groups for{f32}' do

        # gcd(fib(n), fib(n+1)) = 1, ∀ n ≥ 1
        it '{b05, b10}' do
          (0..42).∀ do |i|
            random_index = (🎲(i.to_i).to_i + 1)
            prev         = f𝕎¹.seq_fibonacci[random_index]
            curr         = f𝕎¹.seq_fibonacci[random_index + 1]
            expect(fℕ².coprime?(prev, curr)).to eq(true)
          end
        end # end: {b05, b10}

        context '{b05, b06}' do
          it 'lucas(n) = fib(n−1) + fib(n+1), ∀ n > 1' do
            (0..42).∀ do |i|
              random_index = (🎲(i.to_i).to_i + 1)
              lucas_curr = f𝕎¹.seq_lucas[random_index]
              fib_minus   = f𝕎¹.seq_fibonacci[random_index - 1]
              fib_plus    = f𝕎¹.seq_fibonacci[random_index + 1]
              expect(lucas_curr).to eq(fib_minus + fib_plus)
            end
          end
          it 'fib(2n) = lucas(n) * fib(n), ∀ n > 1' do
            (0..25).∀ do |i|
              random_index = (🎲(i.to_i).to_i + 1)
              curr_lucas = f𝕎¹.seq_lucas[random_index]
              curr_fib    = f𝕎¹.seq_fibonacci[random_index]
              fib_2n      = f𝕎¹.seq_fibonacci[random_index * 2]
              expect(fib_2n).to eq(curr_lucas * curr_fib)
            end
          end
        end

      end # end: {dual behavior groups for{f32}}

    end # end: {hybrid tests}

  end

end
