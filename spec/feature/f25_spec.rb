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
      it 'func{💎.meta_orm}' do
        expect(💎.meta_orm).to eq(::Ruuuby::MetaData::RuuubyORM::SchemaORM)
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
  end # end: {functionality}

  context 'audits', :audits do
    context 'feature(f25) passes audits (tests not relating to observed functionality)' do
      context 'funcs provided are' do
        it 'defined in correct location' do
          expect_∃static⨍(:api, 💎)
          expect_∃static⨍(:orm, 💎)
          expect_∃static⨍(:meta_orm, 💎)
          expect_∃static⨍(:paths, 💎)
          expect_∃static⨍(:engine, 💎)

          expect_∃static⨍(:info, 💎)
          expect_∃static⨍(:debug, 💎)

          expect_∃static⨍(:💎, ::Kernel)
        end
      end
    end # end: {feature(f25) passes audits (tests not relating to observed functionality)}
  end # end: {audits}
end
