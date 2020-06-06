# coding: UTF-8

RSpec.describe 'f32_b07' do

  context 'feature{f32} functionality for behavior{b07}' do
    let(:f𝕎¹){::Math::NumberTheory::𝕎¹}

    context '𝕎¹' do

      context 'Sequence{seq_triangle}' do
        context 'handles needed scenarios' do
          context 'cases: positive' do
            it 'passes behavior test' do
              expect_positive_f32_sequence(f𝕎¹.seq_triangle, 10)
            end
            it 'verifies calculation formula' do
              f𝕎¹.seq_triangle.∀ₓᵢ(10){|x,i| expect((i * (i + 1)) / 2.0).to eq(x)}
            end
          end
          it 'cases: negative' do
            expect_negative_f32_sequence(f𝕎¹.seq_triangle, 10)
          end
          it 'cases: error' do
            expect_error_f32_sequence(f𝕎¹.seq_triangle)
          end
        end
      end # end: {Sequence{seq_triangle}}

    end # end: {𝕎¹}

  end

end
