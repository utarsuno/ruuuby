# coding: utf-8

RSpec.describe 'hsh' do

  context 'extends class[Hash]' do
    it 'by creating needed aliases' do
      expect(::Hash.∃func_alias?(:key?, :🔑?)).to eq(true)
      expect(::Hash.∃func_alias?(:key?, :∃🔑?)).to eq(true)
      expect({}.class.∃func_alias?(:key?, :🔑?)).to eq(true)
      expect({}.class.∃func_alias?(:key?, :∃🔑?)).to eq(true)
    end
  end

end
