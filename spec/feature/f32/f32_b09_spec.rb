# encoding: UTF-8

RSpec.describe 'f32_b09' do

  context 'feature{f32} functionality for behavior{b09}' do
    let(:fℤ³){::Math::NumberTheory::ℤ³}

    context '𝕎³' do

      context 'func{congruent?}' do
        context 'handles needed scenarios' do
          context 'cases: positive' do
            it 'regular data' do
              expect(fℤ³.congruent?(0, 0, 1)).to eq(true)
              expect(fℤ³.congruent?(0, 0, -1)).to eq(true)
              expect(fℤ³.congruent?(0, 1, 1)).to eq(true)
              expect(fℤ³.congruent?(1, 0, -1)).to eq(true)
              expect(fℤ³.congruent?(-1, 0, 1)).to eq(true)
              expect(fℤ³.congruent?(0, -1, -1)).to eq(true)

              expect(fℤ³.congruent?(100, 20, 20)).to eq(true)
              expect(fℤ³.congruent?(100, 20, 10)).to eq(true)
              expect(fℤ³.congruent?(100, 20, 5)).to eq(true)
            end
            context 'congruence properties check out' do
              it '[reflexivity]' do
                expect(fℤ³.congruent?(1337, 1337, 37)).to eq(true)
                expect(fℤ³.congruent?(15, 15, 37)).to eq(true)
                expect(fℤ³.congruent?(1, 1, 37)).to eq(true)
                expect(fℤ³.congruent?(0, 0, 37)).to eq(true)
                expect(fℤ³.congruent?(-15, -15, 37)).to eq(true)
                expect(fℤ³.congruent?(-1, -1, 37)).to eq(true)
                expect(fℤ³.congruent?(1337, 1337, -37)).to eq(true)
                expect(fℤ³.congruent?(-15, -15, -37)).to eq(true)
                expect(fℤ³.congruent?(15, 15, -37)).to eq(true)
              end
              it '[symmetry]' do
                expect(fℤ³.congruent?(1337, 446, 99)).to eq(true)
                expect(fℤ³.congruent?(446, 446, 99)).to eq(true)
                expect(fℤ³.congruent?(-1337, -446, 99)).to eq(true)
                expect(fℤ³.congruent?(-446, -1337, 99)).to eq(true)
                expect(fℤ³.congruent?(1337, 446, -99)).to eq(true)
                expect(fℤ³.congruent?(446, 1337, -99)).to eq(true)
              end
              it '[transitivity]' do
                expect(fℤ³.congruent?(1337, 446, 99)).to eq(true)
                expect(fℤ³.congruent?(1337, 149, 99)).to eq(true)
                expect(fℤ³.congruent?(1337, 50, 99)).to eq(true)

                expect(fℤ³.congruent?(446, 149, 99)).to eq(true)
                expect(fℤ³.congruent?(446, 50, 99)).to eq(true)

                expect(fℤ³.congruent?(149, 50, 99)).to eq(true)
              end
            end
          end
          it 'cases: negative'do
            expect(fℤ³.congruent?(100, 20, 6)).to eq(false)
            expect(fℤ³.congruent?(8, 4, 16)).to eq(false)
          end
          it 'cases: error' do
            expect{fℤ³.congruent?(0, 0, 0)}.to raise_error(::Ruuuby::DescriptiveStandardError)
          end
        end
      end # end: {Sequence{seq_triangle}}

    end # end: {𝕎³}
  end

end
