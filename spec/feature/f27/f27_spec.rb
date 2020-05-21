# coding: UTF-8

RSpec.describe 'f27' do

  context 'functionality' do
    context 'static functions' do
      context 'func{new_radian}' do
        it 'works' do
          angle = ::ThetaAngle.new_radian(1337.0)
          expect(angle.class).to eq(::ThetaAngle)
          expect(angle.real).to eq(1337.0)
          expect(angle.ʳ?).to eq(true)
          expect(angle.°?).to eq(false)
          expect(angle.ᵍ?).to eq(false)
          expect(angle.𝞽?).to eq(false)
        end
      end # end: {func{new_radian}}
      context 'func{new_degree}' do
        it 'works' do
          angle = ::ThetaAngle.new_degree(1337)
          expect(angle.class).to eq(::ThetaAngle)
          expect(angle.real).to eq(1337.0)
          expect(angle.°?).to eq(true)
          expect(angle.ʳ?).to eq(false)
          expect(angle.ᵍ?).to eq(false)
          expect(angle.𝞽?).to eq(false)
        end
      end # end: {func{new_degree}}
      context 'func{new_gon}' do
        it 'works' do
          angle = ::ThetaAngle.new_gon(1337)
          expect(angle.class).to eq(::ThetaAngle)
          expect(angle.real).to eq(1337.0)
          expect(angle.ᵍ?).to eq(true)
          expect(angle.ʳ?).to eq(false)
          expect(angle.°?).to eq(false)
          expect(angle.𝞽?).to eq(false)
        end
      end # end: {func{new_gon}}
      context 'func{new_turn}' do
        it 'works' do
          angle = ::ThetaAngle.new_turn(1337)
          expect(angle.class).to eq(::ThetaAngle)
          expect(angle.real).to eq(1337.0)
          expect(angle.𝞽?).to eq(true)
          expect(angle.ʳ?).to eq(false)
          expect(angle.°?).to eq(false)
          expect(angle.ᵍ?).to eq(false)
        end
      end # end: {func{new_turn}}
    end # end: {static functions}
  end # end: {functionality}

  context 'audits', :audits do
    context 'feature(f27) passes audits (tests not relating to observed functionality)' do
      it 'module is defined in correct location' do
        expect(🧬.∃ᶜ?(:ThetaAngle)).to eq(true)
        expect(🧬.∃ᵐ?(:MainF27, ::Ruuuby::Feature::Extendable)).to eq(true)
      end

      context 'funcs provided are' do
        context 'defined in correct location' do
          it 'for module{MainF27}' do
            expect_∃⨍(:θ°, ::Ruuuby::Feature::Extendable::MainF27)
            expect_∃⨍(:θʳ, ::Ruuuby::Feature::Extendable::MainF27)
            expect_∃⨍(:θᵍ, ::Ruuuby::Feature::Extendable::MainF27)
            expect_∃⨍(:θ𝞽, ::Ruuuby::Feature::Extendable::MainF27)
          end
          it 'for class{ThetaAngle}' do
            the_funcs = [:real, :repr, :as_radian, :as_degree, :as_gon, :as_turn, :+, :-, :/, :*, :==]
            the_funcs += [:<, :>, :<=, :>=, :<=>, :between?]
            the_funcs += [:angle?, :∠?, :to_f, :≈≈, :to_s]
            the_funcs += [:ʳ, :°, :ᵍ, :𝞽]
            the_funcs.∀{|func_name| expect_∃⨍(func_name, ::ThetaAngle)}
          end
        end
      end # end: {funcs provided are}
      context 'static functions provided are' do
        context 'defined in correct location' do
          it 'for class{ThetaAngle}' do
            the_funcs = [:new_radian, :new_degree, :new_gon, :new_turn]
            the_funcs.∀{|func_name| expect_∃static⨍(func_name, ::ThetaAngle)}
          end
        end
      end
    end # end: {feature(f27) passes audits (tests not relating to observed functionality)}
  end

end
