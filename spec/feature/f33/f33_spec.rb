# coding: UTF-8

RSpec.describe 'f33' do

  context 'feature{f33} functionality' do
    let(:f𝕎²){::Math::Combinatorics::𝕎²}

    context 'func{n_choose_k}' do

      context 'handles needed scenarios' do
        context 'cases: positive' do
          # TODO: check for over-flow values
          it 'works for larger values too' do
            expect(::Math::Combinatorics.n_choose_k(100, 94)).to eq(::Math::Combinatorics.n_choose_k(100, 6))
            expect(::Math::Combinatorics.n_choose_k(100, 95)).to eq(::Math::Combinatorics.n_choose_k(100, 5))
            expect(::Math::Combinatorics.n_choose_k(100, 96)).to eq(::Math::Combinatorics.n_choose_k(100, 4))
          end
          it 'first 7 rows of Pascal\'s triangle' do
            expect(::Math::Combinatorics.n_choose_k(0, 0)).to eq(1)

            expect(::Math::Combinatorics.n_choose_k(1, 0)).to eq(1)
            expect(::Math::Combinatorics.n_choose_k(1, 1)).to eq(1)

            expect(::Math::Combinatorics.n_choose_k(2, 0)).to eq(1)
            expect(::Math::Combinatorics.n_choose_k(2, 1)).to eq(2)
            expect(::Math::Combinatorics.n_choose_k(2, 2)).to eq(1)

            expect(::Math::Combinatorics.n_choose_k(3, 0)).to eq(1)
            expect(::Math::Combinatorics.n_choose_k(3, 1)).to eq(3)
            expect(::Math::Combinatorics.n_choose_k(3, 2)).to eq(3)
            expect(::Math::Combinatorics.n_choose_k(3, 3)).to eq(1)

            expect(::Math::Combinatorics.n_choose_k(4, 0)).to eq(1)
            expect(::Math::Combinatorics.n_choose_k(4, 1)).to eq(4)
            expect(::Math::Combinatorics.n_choose_k(4, 2)).to eq(6)
            expect(::Math::Combinatorics.n_choose_k(4, 3)).to eq(4)
            expect(::Math::Combinatorics.n_choose_k(4, 4)).to eq(1)

            expect(::Math::Combinatorics.n_choose_k(5, 0)).to eq(1)
            expect(::Math::Combinatorics.n_choose_k(5, 1)).to eq(5)
            expect(::Math::Combinatorics.n_choose_k(5, 2)).to eq(10)
            expect(::Math::Combinatorics.n_choose_k(5, 3)).to eq(10)
            expect(::Math::Combinatorics.n_choose_k(5, 4)).to eq(5)
            expect(::Math::Combinatorics.n_choose_k(5, 5)).to eq(1)

            expect(::Math::Combinatorics.n_choose_k(6, 0)).to eq(1)
            expect(::Math::Combinatorics.n_choose_k(6, 1)).to eq(6)
            expect(::Math::Combinatorics.n_choose_k(6, 2)).to eq(15)
            expect(::Math::Combinatorics.n_choose_k(6, 3)).to eq(20)
            expect(::Math::Combinatorics.n_choose_k(6, 4)).to eq(15)
            expect(::Math::Combinatorics.n_choose_k(6, 5)).to eq(6)
            expect(::Math::Combinatorics.n_choose_k(6, 6)).to eq(1)

            expect(::Math::Combinatorics.n_choose_k(7, 0)).to eq(1)
            expect(::Math::Combinatorics.n_choose_k(7, 1)).to eq(7)
            expect(::Math::Combinatorics.n_choose_k(7, 2)).to eq(21)
            expect(::Math::Combinatorics.n_choose_k(7, 3)).to eq(35)
            expect(::Math::Combinatorics.n_choose_k(7, 4)).to eq(35)
            expect(::Math::Combinatorics.n_choose_k(7, 5)).to eq(21)
            expect(::Math::Combinatorics.n_choose_k(7, 6)).to eq(7)
            expect(::Math::Combinatorics.n_choose_k(7, 7)).to eq(1)
          end
        end
        context 'cases: error' do
          it 'w/ k > n' do
            expect{::Math::Combinatorics.n_choose_k(1, 2)}.to raise_error(ArgumentError)
          end
          it 'for bad arg-type' do
            expect{::Math::Combinatorics.n_choose_k(1, nil)}.to raise_error(ArgumentError)
            expect{::Math::Combinatorics.n_choose_k(nil, 1)}.to raise_error(ArgumentError)
            expect{::Math::Combinatorics.n_choose_k([], nil)}.to raise_error(ArgumentError)
          end
        end
      end

    end

  end

end
