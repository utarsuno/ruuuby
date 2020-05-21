# coding: UTF-8

RSpec.describe 'f00_b00' do

  context 'functionality{f00_b00}' do

    context 'by adding function{η̂!}' do
      context 'handles needed scenarios' do
        context 'cases: positive' do
          it 'empty data' do
            the_ary    = []
            the_ary_id = the_ary.🆔
            the_ary.η̂!(:∈ℕ)
            expect(the_ary).to eq([])
            expect(the_ary.🆔).to eq(the_ary_id)
          end
          it 'with numeric data' do
            the_ary    = [1, 2, 3, 1337]
            the_ary_id = the_ary.🆔
            the_ary.η̂!(:∈ℕ)
            expect(the_ary).to eq([1, 2, 3, 1337])
            expect(the_ary.🆔).to eq(the_ary_id)
          end
          it 'with string (numeric-like) data' do
            the_ary    = [1, 2, 3, 1337, '1', '2', '3', '1337']
            the_ary_id = the_ary.🆔
            the_ary.η̂!(:∈ℕ𝕊)
            expect(the_ary).to eq([1, 2, 3, 1337, 1, 2, 3, 1337])
            expect(the_ary.🆔).to eq(the_ary_id)
          end
        end
        context 'cases: error' do
          it 'with numeric data (outside of ℕ)' do
            expect{[-1337, -1, 0, 1, 1337].η̂!(:∈ℕ)}.to raise_error(RuntimeError)
          end
          it 'with string data (outside of ℕ)' do
            expect{['-1337', 1337].η̂!(:∈ℕ)}.to raise_error(ArgumentError)
          end
        end
      end
    end

  end

end
