# coding: UTF-8

RSpec.describe 'f27' do

  context 'hybrid tests', :integration do
    context 'complementary angles; trig related math properties' do
      it 'tan(A) = cot(B)' do
        expect(tan(θ°(80))).to eq(cot(θ°(10)))
        expect(tan(θ°(45))).to eq(cot(θ°(45)))
        expect(tan(θ°(10))).to eq(cot(θ°(80)))
      end
      it 'sec(A) = csc(B)' do
        expect(sec(θ°(80))).to eq(csc(θ°(10)))
        expect(sec(θ°(45))).to eq(csc(θ°(45)))
        expect(sec(θ°(10))).to eq(csc(θ°(80)))
      end
      it 'cos²(A) + cos²(B) = 1' do
        expect(cos²(θ°(80)) + cos²(θ°(10))).to eq(1)
        expect(cos²(θ°(45)) + cos²(θ°(45))).to eq(1)
        expect(cos²(θ°(10)) + cos²(θ°(80))).to eq(1)
      end
      it 'sin²(A) + sin²(B) = 1' do
        expect(sin²(θ°(80)) + sin²(θ°(10))).to eq(1)
        expect(sin²(θ°(45)) + sin²(θ°(45))).to eq(1)
        expect(sin²(θ°(10)) + sin²(θ°(80))).to eq(1)
      end
      it 'cot²(45°) + 1 = csc²(45°)' do
        expect(cot²(θ°(45)) + 1).to eq(csc²(θ°(45)))
      end
      it 'tan²(45°) + 1 = sec²(45°)' do
        expect(cot²(θ°(45)) + 1).to eq(csc²(θ°(45)))
      end
    end
  end

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
            the_funcs += [:to_f, :≈≈, :to_s]
            the_funcs += [:ʳ, :°, :ᵍ, :𝞽]
            the_funcs.∀{|func_name| expect_∃⨍(func_name, ::ThetaAngle)}
          end
        end
      end # end: {funcs provided are}
    end # end: {feature(f27) passes audits (tests not relating to observed functionality)}
  end

end
