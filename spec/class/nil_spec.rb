# coding: utf-8

RSpec.describe 'nil' do

  context 'extends class[NilClass]' do

    it 'by creating needed aliases' do
      RuuubyTestHelper::CONFIG_NIL[:c].∀{ |func| expect(::String.∃func?(func)).to eq(true) }
      RuuubyTestHelper::CONFIG_NIL[:aliases].∀{ |aliased_func, base_func| expect(::String.∃func?(aliased_func)).to eq(true) }
      expect(::NilClass.∃func_alias?(:empty?, :∅?)).to eq(true)
    end

    context 'by adding function[empty?]' do
      it 'and returns correct value{true}' do
        expect(nil.empty?).to eq(true)
        expect(nil.∅?).to eq(true)
      end
      it 'without effecting NilClass instance' do
        expect(NilClass.respond_to?(:empty?)).to eq(false)
        expect(NilClass.respond_to?(:∅?)).to eq(false)
      end
    end
  end

  #  __   ___  __   ___  __   __                   __   ___
  # |__) |__  |__) |__  /  \ |__)  |\/|  /\  |\ | /  ` |__
  # |    |___ |  \ |    \__/ |  \  |  | /~~\ | \| \__, |___
  context 'performance', :'performance' do
    it 'func[empty?]: performs extremely quickly' do
      expect{nil.empty?}.to perform_extremely_quickly
      expect{nil.∅?}.to perform_extremely_quickly
    end
  end

end
