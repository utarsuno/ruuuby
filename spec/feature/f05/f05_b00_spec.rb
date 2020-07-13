# coding: UTF-8

RSpec.describe 'f05_b00' do

  context 'functionality' do
    context 'extends class{Array}' do
      context 'by adding func{>>}' do
        context 'handling needed scenarios' do
          context 'cases: positive' do
            it 'preserving object_id' do
              a = [1337, 'a']
              b = a.🆔
              a >> []
              expect(a).to eq([[], 1337, 'a'])
              expect(a.🆔).to eq(b)
              a >> nil
              expect(a).to eq([nil, [], 1337, 'a'])
              expect(a.🆔).to eq(b)
            end
            it 'w/ regular data' do
              expect([] >> 1337).to eq([1337])
              expect([] >> []).to eq([[]])
              expect([] >> [[]]).to eq([[[]]])
              expect([] >> {}).to eq([{}])
              expect([] >> nil).to eq([nil])
              expect([1337, 1337] >> 1337).to eq([1337, 1337, 1337])
              expect([1, 2, 3] >> 1337).to eq([1337, 1, 2, 3])
              expect([1, 2, 3] >> nil).to eq([nil, 1, 2, 3])
              expect([1, 2, 3] >> [1, 2]).to eq([[1, 2], 1, 2, 3])
            end
          end
          it 'cases: error' do
            a = [1, 'a'].❄️
            a.❄️
            expect{a >> 'test'}.to raise_error(::FrozenError)
          end
        end
      end # end: {func{>>}}
    end
  end

  context 'audit', :audit do
    context '{f05_b00} passes audits' do
      context 'needed funcs are defined in expected location' do
        it 'for c{Array}' do
          expect_∃⨍(:>>, ::Array)
        end
      end
    end
  end # end: {audit}

  #  __   ___  __   ___  __   __                   __   ___
  # |__) |__  |__) |__  /  \ |__)  |\/|  /\  |\ | /  ` |__
  # |    |___ |  \ |    \__/ |  \  |  | /~~\ | \| \__, |___
  context 'performance', :performance do

    context 'functionality performs within needed benchmarks' do
      it 'func{>>}' do
        expect{[1, 2, 3] >> [2, 3, 4]}.to perform_quickly
      end
    end

  end

end
