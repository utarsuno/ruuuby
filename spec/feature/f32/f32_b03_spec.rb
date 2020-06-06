# coding: UTF-8

RSpec.describe 'f32_b03' do

  context 'feature{f32} functionality for behavior{b03}' do
    let(:f𝕎¹){::Math::NumberTheory::𝕎¹}

    context '𝕎¹' do

      context 'Sequence{seq_pronic}' do
        context 'handles needed scenarios' do
          context 'cases: positive' do
            it 'passes behavior test' do
              expect_positive_f32_sequence(f𝕎¹.seq_pronic, 10)
            end
            it 'verifies calculation formula' do
              f𝕎¹.seq_square.∀ₓᵢ(10) do |x, i|
                expect((i * (i-1)) + i).to eq(x)
              end
            end
          end
          it 'cases: negative' do
            expect_negative_f32_sequence(f𝕎¹.seq_pronic, 10)
          end
          it 'cases: error' do
            expect_error_f32_sequence(f𝕎¹.seq_pronic)
          end
        end
      end # end: {Sequence{seq_pronic}}

    end # end: {𝕎¹}

  end

end
