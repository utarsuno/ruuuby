# encoding: UTF-8

RSpec.describe 'f25' do

  context 'functionality' do
    it 'module(Kernel) adds func{💎}' do
      expect(💎).to eq(::Ruuuby::MetaData)
    end
    context 'aliases within{::Ruuuby::MetaData}' do

      it 'singletons preserve their object_id' do
        the_id_a = 💎.api.🆔
        the_id_b = 💎.orm.🆔
        the_id_c = 💎.engine.🆔

        expect(💎.api.🆔).to eq(the_id_a)
        expect(the_id_a).to eq(💎.api.🆔)
        expect(💎.api.🆔).to eq(the_id_a)

        expect(💎.orm.🆔).to eq(the_id_b)
        expect(the_id_b).to eq(💎.orm.🆔)
        expect(💎.orm.🆔).to eq(the_id_b)

        expect(💎.engine.🆔).to eq(the_id_c)
        expect(the_id_c).to eq(💎.engine.🆔)
        expect(💎.engine.🆔).to eq(the_id_c)
      end

      it 'func{💎.api}' do
        expect(💎.api).to eq(::Ruuuby::MetaData::RuuubyAPI.ℹ)
      end
      it 'func{💎.orm}' do
        expect(💎.orm).to eq(::Ruuuby::MetaData::RuuubyORM.ℹ)
      end
      it 'func{💎.engine}' do
        expect(💎.engine).to eq(::Ruuuby::MetaData::RuuubyEngine.ℹ)
      end
      it 'func{💎.cli}' do
        expect(💎.cli).to eq(::Ruuuby::Routine::CommandCLI)
      end
    end
  end # end: {functionality}

  context 'audit', :audit do
    context 'feature(f25) passes audits (tests not relating to observed functionality)' do
      context 'funcs provided are' do
        it 'defined in correct location' do
          expect_∃static⨍(:api, 💎)
          expect_∃static⨍(:orm, 💎)
          expect_∃static⨍(:engine, 💎)

          expect_∃static⨍(:info, 💎)
          expect_∃static⨍(:debug, 💎)

          expect_∃static⨍(:💎, ::Kernel)
        end
      end
    end # end: {feature(f25) passes audits (tests not relating to observed functionality)}
  end # end: {audit}
end
