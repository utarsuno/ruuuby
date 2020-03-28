# coding: utf-8

RSpec.describe 'class/sym.rb' do

  context 'extends class[Symbol]' do

    it 'by creating needed aliases' do
      expect_added_method_aliases(::Symbol, cΔ_Symbol)
    end

  end

end
