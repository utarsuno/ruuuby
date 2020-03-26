# coding: utf-8

RSpec.describe Ruuuby do

  context 'C-extensions' do
    context 'defines needed globals' do
      context 'readonly_global{$PRM_MANY}' do
        it 'exists' do
          expect($PRM_MANY).to eq(:'*args')
        end
        it "can't be changed" do
          expect{$PRM_MANY = 5}.to raise_error(NameError)
        end
      end
    end
  end

  context 'defines a version number' do

    it 'has a version number' do
      expect(Ruuuby::VERSION.str?).to eq(true)
      expect(Ruuuby::VERSION.❄️?).to eq(true)
    end

    it 'with valid syntax' do
      expect(("v#{Ruuuby::VERSION}").match?(RuuubyRelease::Syntax::VERSION)).to eq(true)
    end

    # evaluating use-case necessity
    #it "which can't be changed" do
    #  expect{::Ruuuby::VERSION = '1.0.0'}.to raise_error(FrozenError)
    #end
  end

  context 'Ruuuby added as module' do
    it 'exists' do
      expect(∃module?(:Ruuuby)).to eq(true)
    end
    context 'and adds needed sub-modules & classes' do
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
