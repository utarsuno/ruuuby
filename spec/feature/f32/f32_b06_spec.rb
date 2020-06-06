# coding: UTF-8

RSpec.describe 'f32_b06' do

  context 'feature{f32} functionality for behavior{b06}' do
    let(:f𝕎¹){::Math::NumberTheory::𝕎¹}

    context '𝕎¹' do

      context 'Sequence{seq_lucas}' do

        context 'handles needed scenarios' do
          context 'cases: positive' do
            it 'passes behavior test' do
              expect_positive_f32_sequence(f𝕎¹.seq_lucas, 10)
            end
            it 'verifies calculation formula' do
              n0 = 2
              n1 = 1
              f𝕎¹.seq_lucas.∀ₓᵢ(10) do |x, i|
                if i > 1
                  _n = n1
                  n1 += n0
                  n0 = _n
                  expect(n1).to eq(x)
                end
              end
            end
          end
          context 'cases: negative', :tech_debt do
            it 'func implementation' do
              #f𝕎¹.seq_lucas.A∀ₓ(10) {|scenario| expect{f𝕎¹.seq_lucas.∋?(scenario)}.to raise_error(NotImplementedError)}
              #the_sequence.A∀ₓ(max_index) {|scenario| expect(the_sequence.∋?(scenario)).to eq(false)}

              expect{expect_negative_f32_sequence(f𝕎¹.seq_lucas, 100)}.to raise_error(NotImplementedError)

            end
          end
          it 'cases: error' do
            expect_error_f32_sequence(f𝕎¹.seq_lucas)
          end
        end
      end # end: {Sequence{seq_lucas}}

    end # end: {𝕎¹}

  end

end
