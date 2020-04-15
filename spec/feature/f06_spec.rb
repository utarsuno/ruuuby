# encoding: UTF-8

RSpec.describe 'f06' do

  context 'audits', :audits do

    context 'feature(f06) passes audits (tests not relating to observed functionality)' do
      it 'module is defined in correct location' do
        expect_∃module(:ObjectF06, ::Ruuuby::Feature::Includable)
      end
      context 'funcs provided are defined in correct location' do
        it 'for m{ObjectF06}' do
          expect_∃⨍(:🛑bool❓, ::Ruuuby::Feature::Includable::ObjectF06)
          expect_∃⨍(:🛑int❓, ::Ruuuby::Feature::Includable::ObjectF06)
          expect_∃⨍(:🛑ℤ❓, ::Ruuuby::Feature::Includable::ObjectF06)
          expect_∃⨍(:🛑𝕌❓, ::Ruuuby::Feature::Includable::ObjectF06)
          expect_∃⨍(:🛑flt❓, ::Ruuuby::Feature::Includable::ObjectF06)
          expect_∃⨍(:🛑num❓, ::Ruuuby::Feature::Includable::ObjectF06)
          expect_∃⨍(:🛑ary❓, ::Ruuuby::Feature::Includable::ObjectF06)
          expect_∃⨍(:🛑str❓, ::Ruuuby::Feature::Includable::ObjectF06)
          expect_∃⨍(:🛑sym❓, ::Ruuuby::Feature::Includable::ObjectF06)
          expect_∃⨍(:🛑stry❓, ::Ruuuby::Feature::Includable::ObjectF06)
          expect_∃⨍(:🛑countable❓, ::Ruuuby::Feature::Includable::ObjectF06)
        end
      end
    end

  end

end
