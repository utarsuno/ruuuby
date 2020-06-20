# encoding: UTF-8

RSpec.describe 'f06' do

  context 'functionality' do

  end

  context 'audit', :audit do
    context 'feature(f06) passes audits (tests not relating to observed functionality)' do
      it 'module is defined in correct location' do
        expect_∃ᵐ(:ObjectF06, ::Ruuuby::Feature::Includable)
      end
      context 'funcs provided are defined in correct location' do
        context 'for' do
          it 'm{ObjectF06}' do
            expect_∃⨍(:θ?, ::Ruuuby::Feature::Includable::ObjectF06)

            expect_∃⨍(:🛑θ❓, ::Ruuuby::Feature::Includable::ObjectF06)
            expect_∃⨍(:🛑bool❓, ::Ruuuby::Feature::Includable::ObjectF06)
            expect_∃⨍(:🛑flt❓, ::Ruuuby::Feature::Includable::ObjectF06)
            expect_∃⨍(:🛑sym❓, ::Ruuuby::Feature::Includable::ObjectF06)
          end
        end
      end
    end
  end

end
