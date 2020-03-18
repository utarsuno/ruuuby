# coding: utf-8

RSpec.describe Ruuuby do

  context 'Ruuuby added as module' do
    it 'exists' do
      expect(∃module?(:Ruuuby)).to eq(true)
    end
    context 'and adds needed sub-modules & classes' do
      it 'module(Version) under module(::Ruuuby)' do
        expect(∃module?(:Version, ::Ruuuby)).to eq(true)
      end
      it 'module(ParamErr) under module(::Ruuuby)' do
        expect(∃module?(:ParamErr, ::Ruuuby)).to eq(true)
      end
      it 'module(VirtualTypes) under module(::Ruuuby)' do
        expect(∃module?(:VirtualTypes, ::Ruuuby)).to eq(true)
      end
      it 'class(WrongParamType) under module(::Ruuuby::ParamErr)' do
        expect(∃class?(:WrongParamType, ::Ruuuby::ParamErr)).to eq(true)
      end
    end
  end

#                   __          ___     __
#   /\     |  |    |  \    |     |     /__`
#  /~~\    \__/    |__/    |     |     .__/

  context 'audits', :'audits' do


  end

end
