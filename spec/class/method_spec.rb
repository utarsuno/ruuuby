# coding: utf-8

RSpec.describe 'method.rb' do

  context 'extends class[Method]' do

    it 'has needed aliases' do
      RuuubyTestHelper::CONFIG_METHOD[:aliases].∀{|base_func, func_alias| expect(::Method.∃⨍?(func_alias)).to eq(true)}
    end

  end

end
