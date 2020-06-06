# coding: UTF-8

RSpec.describe 'f27' do

  context 'audit', :audit do
    context 'feature(f27) passes audits (tests not relating to observed functionality)' do
      it 'module is defined in correct location' do
        expect(🧬.∃ᶜ?(:ThetaAngle)).to eq(true)
      end

      context 'funcs provided are' do
        context 'defined in correct location' do
          it 'for class{ThetaAngle}' do
            the_funcs = [:real, :repr, :as_radian, :as_degree, :as_gon, :as_turn, :+, :-, :/, :*, :==]
            the_funcs += [:<, :>, :<=, :>=, :<=>, :between?]
            the_funcs += [:angle?, :∠?, :to_f, :≈≈, :to_s]
            the_funcs += [:ʳ, :°, :ᵍ, :𝞽]
            the_funcs.∀{|func_name| expect_∃⨍(func_name, ::ThetaAngle)}
          end
        end
      end # end: {funcs provided are}
    end # end: {feature(f27) passes audits (tests not relating to observed functionality)}
  end

end
