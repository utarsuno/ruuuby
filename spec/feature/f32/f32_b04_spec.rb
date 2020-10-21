# encoding: UTF-8

RSpec.describe 'f32_b04' do

  context 'feature{f32} functionality for behavior{b03}' do
    let(:f𝕎¹){::Math::NumberTheory::𝕎¹}

    context '𝕎¹' do

      context 'Sequence{seq_square}' do
        context 'handles needed scenarios' do
          context 'cases: positive' do
            it 'passes behavior test' do
              expect_positive_f32_sequence(f𝕎¹.seq_square, 10)
            end
            it 'verifies calculation formula' do
              f𝕎¹.seq_square.∀ₓᵢ(10){|x,i| expect(i * i).to eq(x)}
            end
          end
          it 'cases: negative' do
            expect_negative_f32_sequence(f𝕎¹.seq_square, 10)
          end
          it 'cases: error' do
            expect_error_f32_sequence(f𝕎¹.seq_square)
          end
        end
      end # end: {Sequence{seq_square}}

    end # end: {𝕎¹}

  end

end
