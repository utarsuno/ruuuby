# -*- encoding : utf-8 -*-

RSpec.describe 1337 do
  context 'extends class[Object]' do
    context 'by adding function[int?]' do
      it 'exists' do
        expect_func_in_class(::Object, :int?)
      end
      it 'a newly created generic object responds to it' do
        expect_response_to(Object.new, :int?)
      end
      it 'without effecting Integer instance' do
        expect(Integer.int?).to eq(false)
      end
      context 'handles needed input scenarios' do
        it 'returns correct value{true}' do
          [-1337, -1, 0, 1, 1337].⨍{|n| expect(n.int?).to eq(true)}
        end
        it 'returns correct value{false}' do
          [nil, '', '1337', {}, []].⨍{|n| expect(n.int?).to eq(false)}
        end
      end
    end
  end

  #  __   ___  __   ___  __   __                   __   ___
  # |__) |__  |__) |__  /  \ |__)  |\/|  /\  |\ | /  ` |__
  # |    |___ |  \ |    \__/ |  \  |  | /~~\ | \| \__, |___
  context 'performance', :'performance' do
    context 'func[int?]: performs extremely quickly' do
      it 'for cases: true' do
        expect{5.int?}.to perform_extremely_quickly
      end
      it 'for cases: false' do
        expect{'0'.int?}.to perform_extremely_quickly
      end
    end
  end

end
