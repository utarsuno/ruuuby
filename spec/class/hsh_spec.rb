# -*- encoding : utf-8 -*-

RSpec.describe 'hsh' do
  context 'extends class[Object]' do
    context 'by adding function[hsh?]' do
      it 'exists' do
        expect_func_in_class(::Object, :hsh?)
      end
      it 'a newly created generic object responds to it' do
        expect_response_to(Object.new, :hsh?)
      end
      it 'without effecting Integer instance' do
        expect(Hash.hsh?).to eq(false)
      end
      context 'handles needed input scenarios' do
        it 'returns correct value{true}' do
          [{}, {'a' => 5}, {a: {}}, {nil: nil}, {[] => nil}].⨍{|h|expect(h.hsh?).to eq(true)}
        end
        it 'returns correct value{false}' do
          [nil, '', '{}', [], [{}], 1337].⨍{|h|expect(h.hsh?).to eq(false)}
        end
      end
    end
  end
  #  __   ___  __   ___  __   __                   __   ___
  # |__) |__  |__) |__  /  \ |__)  |\/|  /\  |\ | /  ` |__
  # |    |___ |  \ |    \__/ |  \  |  | /~~\ | \| \__, |___
  context 'performance', :'performance' do
    context 'func[empty?]: performs extremely quickly' do
      it 'for cases: true' do
        expect{{}.hsh?}.to perform_extremely_quickly
      end
      it 'for cases: false' do
        expect{5.hsh?}.to perform_extremely_quickly
      end
    end
  end
end
