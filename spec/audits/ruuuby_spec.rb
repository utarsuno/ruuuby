# coding: UTF-8

RSpec.describe Ruuuby do

  context 'ruuuby audits', :audit do

    context 'defines needed Feature modules' do
      it 'with needed sub-modules' do
        expect_∃ᵐ(:Feature, ::Ruuuby)
        expect_∃ᵐ(:Extendable, ::Ruuuby::Feature)
        expect_∃ᵐ(:Includable, ::Ruuuby::Feature)
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
        expect_∃ᴹ(:Ruuuby)
      end
      context 'and adds needed sub-modules & classes' do
        it 'module(ParamErr) under module(::Ruuuby)' do
          expect_∃ᵐ(:ParamErr, ::Ruuuby)
        end
        it 'class(WrongParamType) under module(::Ruuuby::ParamErr)' do
          expect_∃ᶜ(:WrongParamType, ::Ruuuby::ParamErr)
        end
      end
    end

  end # end: audit

end
