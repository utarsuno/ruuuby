# coding: utf-8

RSpec.describe 'hsh' do

  context 'extends class[Hash]' do
    it 'by creating needed aliases' do
      RuuubyTestHelper::CONFIG_HASH[:aliases].∀{|the_alias, the_func| expect(::Hash.∃⨍_alias?(the_func, the_alias)).to eq(true)}
    end
  end

end
