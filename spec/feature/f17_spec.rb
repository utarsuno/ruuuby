# coding: UTF-8

RSpec.describe 'f17' do

  context 'functionality' do

    context 'trigonometry' do
      context 'math functions' do
        context 'func{sin}' do
          it 'provides needed values' do
            expect(sin(θ°(30))).to eq(0.5)
            expect(sin(θ°(90))).to eq(1)
            expect(sin(θ°(180))).to eq(0)
            expect(sin(θ°(270))).to eq(-1)
            expect(sin(θ°(360))).to eq(0)
          end
          it 'can be more accurate than Math.sin' do
            expect(::Math.sin(::Math::PI)).to_not eq(0)
            expect(::Math.sin(::Math::PI * 2.0)).to_not eq(0)
            expect(sin(θʳ(::Math::PI))).to eq(0)
            expect(sin(θʳ(::Math::PI * 2.0))).to eq(0)
          end
        end # end: {func{sin}}
        context 'func{cos}' do
          it 'provides needed values' do
            expect(cos((θ°(90)))).to eq(0)
            expect(cos((θ°(180)))).to eq(-1)
            expect(cos(θ°(270))).to eq(0)
            expect(cos((θ°(360)))).to eq(1)
          end
          it 'can be more accurate than Math.sin' do
            expect(::Math.cos(::Math::PI / 2)).to_not eq(0)
            expect(::Math.cos(::Math::PI * (3.0 / 2))).to_not eq(0)
            expect(cos(θʳ(::Math::PI / 2))).to eq(0)
            expect(cos(θʳ(::Math::PI * (3.0 / 2)))).to eq(0)
          end
        end # end: {func{cos}}
        context 'func{tan}' do
          it 'provides needed values' do
            expect((tan(θ°(0))).≈≈((sin(θ°(0))/cos(θ°(0))))).to eq(true)
            expect((tan(θ°(30))).≈≈((sin(θ°(30))/cos(θ°(30))))).to eq(true)
            expect((tan(θ°(45))).≈≈((sin(θ°(45))/cos(θ°(45))))).to eq(true)
            expect((tan(θ°(60))).≈≈((sin(θ°(60))/cos(θ°(60))))).to eq(true)
            #expect((tan(θ°(90))).≈≈((sin(θ°(90))/cos(θ°(90))))).to eq(true)
            expect((tan(θ°(120))).≈≈((sin(θ°(120))/cos(θ°(120))))).to eq(true)
            expect((tan(θ°(135))).≈≈((sin(θ°(135))/cos(θ°(135))))).to eq(true)
            expect((tan(θ°(150))).≈≈((sin(θ°(150))/cos(θ°(150))))).to eq(true)
            #expect((tan(θ°(180))).≈≈((sin(θ°(180))/cos(θ°(180))))).to eq(true)
            expect((tan(θ°(210))).≈≈((sin(θ°(210))/cos(θ°(210))))).to eq(true)
            expect((tan(θ°(225))).≈≈((sin(θ°(225))/cos(θ°(225))))).to eq(true)
            expect((tan(θ°(240))).≈≈((sin(θ°(240))/cos(θ°(240))))).to eq(true)
            #expect((tan(θ°(270))).≈≈((sin(θ°(270))/cos(θ°(270))))).to eq(true)
            expect((tan(θ°(300))).≈≈((sin(θ°(300))/cos(θ°(300))))).to eq(true)
            expect((tan(θ°(315))).≈≈((sin(θ°(315))/cos(θ°(315))))).to eq(true)
            expect((tan(θ°(330))).≈≈((sin(θ°(330))/cos(θ°(330))))).to eq(true)
            #expect((tan(θ°(360))).≈≈((sin(θ°(360))/cos(θ°(360))))).to eq(true)
          end
        end # end: {func{tan}}
      end # end: {math functions}
    end # end: {trigonometry}

    it 'funcs aliased immutable fractions, example{¼}' do
      expect(½).to eq(0.50)
      expect(⅓).to eq(1.0 / 3)
      expect(⅔).to eq(2.0 / 3)
      expect(¼).to eq(0.25)
      expect(¾).to eq(0.75)
      expect(⅕).to eq(0.20)
      expect(⅖).to eq(0.40)
      expect(⅗).to eq(0.60)
      expect(⅘).to eq(0.80)
      expect(⅙).to eq(1.0 / 6)
      expect(⅐).to eq(1.0 / 7)
      expect(⅛).to eq(1.0 / 8)
      expect(⅜).to eq(3.0 / 8)
      expect(⅝).to eq(5.0 / 8)
      expect(⅞).to eq(7.0 / 8)
      expect(⅑).to eq(1.0 /9)
      expect(⅒).to eq(0.10)
    end # end: {funcs aliased immutable fractions, example{¼}}
  end # end: {functionality}

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
          expect_∃⨍(:γ, ::Ruuuby::Feature::Extendable::MainF17::FloatAliases)

          expect_∃⨍(:½, ::Ruuuby::Feature::Extendable::MainF17::FloatAliases)
          expect_∃⨍(:⅓, ::Ruuuby::Feature::Extendable::MainF17::FloatAliases)
          expect_∃⨍(:⅔, ::Ruuuby::Feature::Extendable::MainF17::FloatAliases)
          expect_∃⨍(:¼, ::Ruuuby::Feature::Extendable::MainF17::FloatAliases)
          expect_∃⨍(:¾, ::Ruuuby::Feature::Extendable::MainF17::FloatAliases)
          expect_∃⨍(:⅕, ::Ruuuby::Feature::Extendable::MainF17::FloatAliases)
          expect_∃⨍(:⅖, ::Ruuuby::Feature::Extendable::MainF17::FloatAliases)
          expect_∃⨍(:⅗, ::Ruuuby::Feature::Extendable::MainF17::FloatAliases)
          expect_∃⨍(:⅘, ::Ruuuby::Feature::Extendable::MainF17::FloatAliases)
          expect_∃⨍(:⅙, ::Ruuuby::Feature::Extendable::MainF17::FloatAliases)
          expect_∃⨍(:⅐, ::Ruuuby::Feature::Extendable::MainF17::FloatAliases)
          expect_∃⨍(:⅛, ::Ruuuby::Feature::Extendable::MainF17::FloatAliases)
          expect_∃⨍(:⅜, ::Ruuuby::Feature::Extendable::MainF17::FloatAliases)
          expect_∃⨍(:⅝, ::Ruuuby::Feature::Extendable::MainF17::FloatAliases)
          expect_∃⨍(:⅞, ::Ruuuby::Feature::Extendable::MainF17::FloatAliases)
          expect_∃⨍(:⅑, ::Ruuuby::Feature::Extendable::MainF17::FloatAliases)
          expect_∃⨍(:⅒, ::Ruuuby::Feature::Extendable::MainF17::FloatAliases)
        end
        it 'for m{MathAliases}' do
          expect_∃⨍(:√, ::Ruuuby::Feature::Extendable::MainF17::MathAliases)
          expect_∃⨍(:∛, ::Ruuuby::Feature::Extendable::MainF17::MathAliases)
          expect_∃⨍(:π, ::Ruuuby::Feature::Extendable::MainF17::MathAliases)
        end
        it 'for m{Trigonometry}' do
          expect_∃⨍(:sin, ::Ruuuby::Feature::Extendable::MainF17::Trigonometry)
          expect_∃⨍(:cos, ::Ruuuby::Feature::Extendable::MainF17::Trigonometry)
          expect_∃⨍(:tan, ::Ruuuby::Feature::Extendable::MainF17::Trigonometry)
        end
      end
    end
  end # end: {audits}
end
