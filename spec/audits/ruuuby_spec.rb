# coding: UTF-8

RSpec.describe Ruuuby do

  context 'ruuuby audits', :audit do

    context 'defines needed Feature modules' do
      it 'with needed sub-modules' do
        expect(🧬.∃ᵐ?(:Feature, ::Ruuuby)).to eq(true)
        expect(🧬.∃ᵐ?(:Extendable, ::Ruuuby::Feature)).to eq(true)
        expect(🧬.∃ᵐ?(:Includable, ::Ruuuby::Feature)).to eq(true)
      end
    end

    context 'defines a version number' do

      it 'has a version number' do
        expect(Ruuuby::VERSION.str?).to eq(true)
        expect(Ruuuby::VERSION.❄️?).to eq(true)
      end

    end

    context 'Ruuuby added as module' do
      it 'exists' do
        expect(🧬.∃ᵐ?(:Ruuuby)).to eq(true)
      end
      context 'and adds needed sub-modules & classes' do
        it 'module(ParamErr) under module(::Ruuuby)' do
          expect(🧬.∃ᵐ?(:ParamErr, ::Ruuuby)).to eq(true)
        end
        it 'class(WrongParamType) under module(::Ruuuby::ParamErr)' do
          expect(🧬.∃ᶜ?(:WrongParamType, ::Ruuuby::ParamErr)).to eq(true)
        end
      end
    end

  end # end: audit

end
