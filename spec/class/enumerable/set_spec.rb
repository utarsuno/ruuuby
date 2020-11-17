# encoding: UTF-8

RSpec.describe 'set' do

  context 'extends class[Set]' do

    context 'set operations' do
      context 'func{⊂}' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            a = Set[2, 4, 6]
            b = Set[2, 4, 6, 8]
            expect(a.⊂?(b)).to eq(true)
          end
          it 'cases: negative' do
            a = Set[2, 4, 6]
            b = Set[2, 4, 6, 8]
            expect(b.⊂?(a)).to eq(false)
          end
        end
      end
    end

  end

end
