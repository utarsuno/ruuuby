# encoding: UTF-8

RSpec.describe 'f16' do

  context 'audits', :audits do

    context 'feature(16) passes audits (tests not relating to observed functionality)' do
      it 'module is defined in correct location' do
        expect_∃module(:ObjectF16, ::Ruuuby::Feature::Includable)
      end
      context 'funcs provided are defined in correct location' do
        it 'for m{ObjectF16}' do
          expect_∃⨍(:⁻⁹, ::Ruuuby::Feature::Includable::ObjectF16)
          expect_∃⨍(:⁻⁸, ::Ruuuby::Feature::Includable::ObjectF16)
          expect_∃⨍(:⁻⁷, ::Ruuuby::Feature::Includable::ObjectF16)
          expect_∃⨍(:⁻⁶, ::Ruuuby::Feature::Includable::ObjectF16)
          expect_∃⨍(:⁻⁵, ::Ruuuby::Feature::Includable::ObjectF16)
          expect_∃⨍(:⁻⁴, ::Ruuuby::Feature::Includable::ObjectF16)
          expect_∃⨍(:⁻³, ::Ruuuby::Feature::Includable::ObjectF16)
          expect_∃⨍(:⁻², ::Ruuuby::Feature::Includable::ObjectF16)
          expect_∃⨍(:⁻¹, ::Ruuuby::Feature::Includable::ObjectF16)
          expect_∃⨍(:⁰, ::Ruuuby::Feature::Includable::ObjectF16)
          expect_∃⨍(:⁹, ::Ruuuby::Feature::Includable::ObjectF16)
          expect_∃⨍(:⁸, ::Ruuuby::Feature::Includable::ObjectF16)
          expect_∃⨍(:⁷, ::Ruuuby::Feature::Includable::ObjectF16)
          expect_∃⨍(:⁶, ::Ruuuby::Feature::Includable::ObjectF16)
          expect_∃⨍(:⁵, ::Ruuuby::Feature::Includable::ObjectF16)
          expect_∃⨍(:⁴, ::Ruuuby::Feature::Includable::ObjectF16)
          expect_∃⨍(:³, ::Ruuuby::Feature::Includable::ObjectF16)
          expect_∃⨍(:², ::Ruuuby::Feature::Includable::ObjectF16)
          expect_∃⨍(:¹, ::Ruuuby::Feature::Includable::ObjectF16)
        end
      end
    end

  end

end
