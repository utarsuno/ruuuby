# coding: utf-8

RSpec.describe 'nil' do

  context 'extends class[NilClass]' do

    context 'by adding function{empty?}' do
      it 'and returns correct value{true}' do
        expect(nil.empty?).to eq(true)
        expect(nil.∅?).to eq(true)
      end
      it 'without effecting class-instance{NilClass}' do
        expect(NilClass.respond_to?(:empty?)).to eq(false)
        expect(NilClass.respond_to?(:∅?)).to eq(false)
      end
    end
  end

  #  __   ___  __   ___  __   __                   __   ___
  # |__) |__  |__) |__  /  \ |__)  |\/|  /\  |\ | /  ` |__
  # |    |___ |  \ |    \__/ |  \  |  | /~~\ | \| \__, |___
  context 'performance', :performance do

    context 'the following perform extremely quickly' do
      it 'func{empty?}' do
        expect{nil.empty?}.to perform_extremely_quickly
        expect{nil.∅?}.to perform_extremely_quickly
      end
    end

  end

end
