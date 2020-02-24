# coding: utf-8

RSpec.describe Ruuuby do

  context 'Ruuuby added as module' do
    it 'exists' do
      expect(∃module?(:Ruuuby)).to eq(true)
    end
    context 'and adds needed sub-modules & classes' do
      it 'module(VERSION) under module(::Ruuuby' do
        expect(∃module?(:VERSION, ::Ruuuby)).to eq(true)
      end
      it 'module(Err) under module(::Ruuuby)' do
        expect(∃module?(:Err, ::Ruuuby)).to eq(true)
      end
      it 'class(WrongParamType) under module(::Ruuuby::Err)' do
        expect(∃class?(:WrongParamType, ::Ruuuby::Err)).to eq(true)
      end
    end
  end
end
