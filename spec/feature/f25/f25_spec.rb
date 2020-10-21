# encoding: UTF-8

=begin
RSpec.describe 'f25' do

  context 'functionality' do
    it 'module(Kernel) adds func{💎}' do
      expect(💎).to eq(::Ruuuby::MetaData)
    end
    context 'aliases within{::Ruuuby::MetaData}' do

      it 'singletons preserve their object_id' do
        the_id_a = 💎.engine.api.🆔
        the_id_b = 💎.engine.orm.🆔
        the_id_c = 💎.engine.🆔

        expect(💎.engine.api.🆔).to eq(the_id_a)
        expect(the_id_a).to eq(💎.engine.api.🆔)
        expect(💎.engine.api.🆔).to eq(the_id_a)

        expect(💎.engine.orm.🆔).to eq(the_id_b)
        expect(the_id_b).to eq(💎.engine.orm.🆔)
        expect(💎.engine.orm.🆔).to eq(the_id_b)

        expect(💎.engine.🆔).to eq(the_id_c)
        expect(the_id_c).to eq(💎.engine.🆔)
        expect(💎.engine.🆔).to eq(the_id_c)
      end

      it 'func{💎.engine.api}' do
        expect(💎.engine.api.class).to eq(::Ruuuby::MetaData::RuuubyAPI)
      end
      it 'func{💎.engine}' do
        expect(💎.engine).to eq(::Ruuuby::MetaData::RuuubyEngine.instance)
      end
    end
  end # end: {functionality}

  context 'audit', :audit do
    context 'feature(f25) passes audits' do
      context 'funcs provided are' do
        it 'defined in correct location' do
          expect_∃⨍_static(:engine, 💎)

          expect_∃⨍_static(:info, 💎.engine)
          expect_∃⨍_static(:debug, 💎.engine)

          expect_∃⨍_static(:💎, ::Kernel)
        end
      end
    end # end: {feature(f25) passes audits}
  end # end: {audit}
end
=end
