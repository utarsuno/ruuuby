# encoding: UTF-8

RSpec.describe 'f32_b08' do

  context 'feature{f32} functionality for behavior{b08}' do
    let(:f𝕎¹){::Math::NumberTheory::𝕎¹}

    context '𝕎¹' do

      context 'Sequence{seq_triangle}' do
        context 'handles needed scenarios' do
          context 'cases: positive' do
            it 'passes behavior test' do
              expect_positive_f32_sequence(f𝕎¹.seq_hexagonal, 10)
            end
            it 'verifies calculation formula' do
              f𝕎¹.seq_hexagonal.∀ₓᵢ(10){|x,i| expect((2 * (i * i)) - i).to eq(x)}
            end
          end
          context 'cases: negative', :tech_debt do
            it 'todo' do
              expect{expect_negative_f32_sequence(f𝕎¹.seq_lucas, 100)}.to raise_error(NotImplementedError)
              #expect_negative_f32_sequence(f𝕎¹.seq_hexagonal, 10)
            end
          end
          it 'cases: error' do
            expect_error_f32_sequence(f𝕎¹.seq_hexagonal)
          end
        end
      end # end: {Sequence{seq_triangle}}

    end # end: {𝕎¹}

  end

end
