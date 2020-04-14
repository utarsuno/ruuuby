# coding: utf-8

RSpec.describe 'class/sym.rb' do

  context 'extends class[Symbol]' do

    it 'by creating needed aliases' do
      expect_added_method_aliases(::Symbol, cΔ_Symbol)
    end

    context 'adds needed functions' do
    end
  end

  #  __   ___  __   ___  __   __                   __   ___
  # |__) |__  |__) |__  /  \ |__)  |\/|  /\  |\ | /  ` |__
  # |    |___ |  \ |    \__/ |  \  |  | /~~\ | \| \__, |___
  context 'performance', :performance do
    context 'funcs extremely quickly' do
    end
  end

end
