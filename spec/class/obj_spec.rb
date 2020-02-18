# coding: utf-8

RSpec.describe 'Object' do

  context 'creates Ruuuby aliases' do
    it '🆔 --> object_id' do
      expect_response_to(::Object, :🆔)
      leet = 1337
      expect(leet.object_id == leet.🆔).to eq(true)
    end
    it '❄️ --> freeze' do
      expect_response_to(::Object, :❄️)
      leet = [999999, 'a']
      expect(leet.frozen?).to eq(false)
      leet.❄️
      expect(leet.frozen?).to eq(true)
    end
    it '❄️? --> frozen?' do
      expect_response_to(::Object, :❄️?)
      leet = [999999, 'a']
      expect(leet.❄️?).to eq(false)
      leet.freeze
      expect(leet.❄️?).to eq(true)
    end
  end

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

end
