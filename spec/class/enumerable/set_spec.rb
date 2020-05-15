# coding: UTF-8

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

    context 'adds function{remove_empty!}' do
      context 'works for needed scenarios:' do
        it 'positive' do
          set_a = Set[1, [], 3, nil]
          set_a.remove_empty!
          expect(set_a).to eq(Set[1, 3])
          expect((Set[]).remove_empty!).to eq(Set[])
          expect((Set[nil, '', [], {}, Set[]]).remove_empty!).to eq(Set[])
        end
        it 'preserving object-id' do
          set_a = Set[1, [], 3, nil]
          a_id  = set_a.🆔
          set_a.remove_empty!
          expect(set_a.🆔).to eq(a_id)
        end
      end
    end

  end

  #  __   ___  __   ___  __   __                   __   ___
  # |__) |__  |__) |__  /  \ |__)  |\/|  /\  |\ | /  ` |__
  # |    |___ |  \ |    \__/ |  \  |  | /~~\ | \| \__, |___
  context 'performance', :performance do
    it 'func[remove_empty!]: performs very quickly' do
      expect{Set[1, [], 3, nil].remove_empty!}.to perform_very_quickly
    end
  end

end

