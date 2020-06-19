# coding: UTF-8

RSpec.describe 'f32_b05' do

  context 'feature{f32} functionality for behavior{b05}' do
    let(:f𝕎¹){::Math::NumberTheory::𝕎¹}

    context '𝕎¹' do

      context 'Sequence{seq_fibonacci}' do
        context 'handles needed scenarios' do
          context 'cases: positive' do
            it 'passes behavior test' do
              expect_positive_f32_sequence(f𝕎¹.seq_fibonacci, 10)
            end
            it 'verifies calculation formula' do
              prev = 1
              curr = 0
              f𝕎¹.seq_fibonacci.∀ₓᵢ(10) do |x,i|
                temp = prev + curr
                expect(curr).to eq(x)
                prev = curr
                curr = temp
              end
            end
          end
          it 'cases: negative' do
            expect_negative_f32_sequence(f𝕎¹.seq_fibonacci, 10)
          end
          it 'cases: error' do
            expect_error_f32_sequence(f𝕎¹.seq_fibonacci)
          end
        end

        context 'passes property verification tests' do
          it 'sum of fib up to `n` is equal to `fib(n+2)-1`' do
            total_sum = 4
            (4..42).∀ do |i|
              curr = f𝕎¹.seq_fibonacci[i]
              total_sum += curr
              expect(f𝕎¹.seq_fibonacci[i + 2] - 1).to eq(total_sum)
              expect(f𝕎¹.seq_fibonacci[i + 2] - 1).to eq(f𝕎¹.seq_fibonacci.nᵗʰ_sum(i))
            end
          end
          it 'products of squared fib up to `n` is equal to `fib(n) * fib(n+1)`' do
            total_sum = 6
            (4..8).∀ do |i|
              curr = f𝕎¹.seq_fibonacci[i]
              total_sum += curr ** 2
              expect(f𝕎¹.seq_fibonacci[i] * f𝕎¹.seq_fibonacci[i + 1]).to eq(total_sum)
              expect(total_sum).to eq(f𝕎¹.seq_fibonacci.nᵗʰ_squared_sum(i))
            end
          end
        end # end: {passes property verification tests}

      end # end: {Sequence{seq_fibonacci}}

    end # end: {𝕎¹}

  end

end
