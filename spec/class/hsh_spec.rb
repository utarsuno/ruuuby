# coding: utf-8

RSpec.describe 'hsh' do

  context 'extends class[Hash]' do
    it 'by creating needed aliases' do
      expect_func_alias(::Hash, :key?, :🔑?)
      expect_func_alias(::Hash, :key?, :∃🔑?)
    end
  end

end
