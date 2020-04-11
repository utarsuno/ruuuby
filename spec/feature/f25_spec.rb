# encoding: UTF-8

RSpec.describe 'f25' do

  context 'functionality' do

    it 'module(Kernel) adds func{💎}' do
      expect(💎).to eq(::Ruuuby::MetaData)
    end

    context 'aliases within{::Ruuuby::MetaData}' do
      it 'func{💎.api}' do
        expect(💎.api).to eq(::Ruuuby::MetaData::RuuubyAPI.instance)
      end
      it 'func{💎.orm}' do
        expect(💎.orm).to eq(::Ruuuby::MetaData::RuuubyORM.instance)
      end
      it 'func{💎.orm_meta}' do
        expect(💎.orm_meta).to eq(::Ruuuby::MetaData::RuuubyORM::SchemaORM)
      end
      it 'func{💎.paths}' do
        expect(💎.paths).to eq(::Ruuuby::MetaData::Paths)
      end
      it 'func{💎.engine}' do
        expect(💎.engine).to eq(::Ruuuby::MetaData::RuuubyEngine.instance)
      end
      it 'func{💎.cli}' do
        expect(💎.cli).to eq(::Ruuuby::Routine::CommandCLI)
      end
    end

  end

  context 'audits', :audits do

    context 'feature(f25) passes audits (tests not relating to observed functionality)' do
      context 'funcs provided are' do
        it 'defined in correct location' do
          the_instance_funcs = ::Ruuuby::MetaData.singleton_class.instance_methods(false)

          #
          expect(the_instance_funcs.∋?(:api)).to eq(true)
          expect(the_instance_funcs.∋?(:orm)).to eq(true)
          expect(the_instance_funcs.∋?(:orm_meta)).to eq(true)
          expect(the_instance_funcs.∋?(:paths)).to eq(true)
          expect(the_instance_funcs.∋?(:engine)).to eq(true)

          # logging
          expect(the_instance_funcs.∋?(:info)).to eq(true)
          expect(the_instance_funcs.∋?(:debug)).to eq(true)

          # kernel
          expect(::Kernel.instance_methods(false).∋?(:💎)).to eq(true)
        end
      end
    end

  end

end
