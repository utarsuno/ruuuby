# encoding: UTF-8

RSpec.describe 'f17' do

  context 'audits', :audits do

    context 'feature(f17) passes audits (tests not relating to observed functionality)' do
      it 'module is defined in correct location' do
        expect_∃module(:MainF17, ::Ruuuby::Feature::Extendable)
        expect_∃module(:MathAliases, ::Ruuuby::Feature::Extendable::MainF17)
        expect_∃module(:FloatAliases, ::Ruuuby::Feature::Extendable::MainF17)
        expect_∃module(:Trigonometry, ::Ruuuby::Feature::Extendable::MainF17)
      end
      context 'funcs provided are defined in correct location' do
        it 'for m{FloatAliases}' do
          expect_∃⨍(:∞, ::Ruuuby::Feature::Extendable::MainF17::FloatAliases)
          expect_∃⨍(:¿, ::Ruuuby::Feature::Extendable::MainF17::FloatAliases)
          expect_∃⨍(:∞ℂ, ::Ruuuby::Feature::Extendable::MainF17::FloatAliases)
          expect_∃⨍(:φ, ::Ruuuby::Feature::Extendable::MainF17::FloatAliases)
          expect_∃⨍(:γ, ::Ruuuby::Feature::Extendable::MainF17::FloatAliases)
        end
        it 'for m{MathAliases}' do
          expect_∃⨍(:√, ::Ruuuby::Feature::Extendable::MainF17::MathAliases)
          expect_∃⨍(:∛, ::Ruuuby::Feature::Extendable::MainF17::MathAliases)
          expect_∃⨍(:π, ::Ruuuby::Feature::Extendable::MainF17::MathAliases)
        end
        it 'for m{Trigonometry}' do
          expect_∃⨍(:∠ᶜ, ::Ruuuby::Feature::Extendable::MainF17::Trigonometry)
          expect_∃⨍(:∠°, ::Ruuuby::Feature::Extendable::MainF17::Trigonometry)
          expect_∃⨍(:sin, ::Ruuuby::Feature::Extendable::MainF17::Trigonometry)
          expect_∃⨍(:sin°, ::Ruuuby::Feature::Extendable::MainF17::Trigonometry)
          expect_∃⨍(:cos, ::Ruuuby::Feature::Extendable::MainF17::Trigonometry)
          expect_∃⨍(:cos°, ::Ruuuby::Feature::Extendable::MainF17::Trigonometry)
          expect_∃⨍(:tan, ::Ruuuby::Feature::Extendable::MainF17::Trigonometry)
          expect_∃⨍(:tan°, ::Ruuuby::Feature::Extendable::MainF17::Trigonometry)
        end
      end
    end

  end

end
