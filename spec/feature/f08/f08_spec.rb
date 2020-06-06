# encoding: UTF-8

RSpec.describe 'f08' do
  context 'audit', :audit do
    context 'feature(f08) passes audits (tests not relating to observed functionality)' do
      it 'module is defined in correct location' do
        expect(🧬.∃ᵐ?(:StringF08, ::Ruuuby::Feature::Includable)).to eq(true)
      end
      context 'extra sanity checks: all Classes w/ Enumerable have needed funcs' do
        context 'func{∀τ²∈λ𝑓₍ᵢ،ᵢ₊₁₎}' do
          it 'exists in needed Classes' do
            expect_∃⨍(:∀τ²∈λ𝑓₍ᵢ،ᵢ₊₁₎, ::Array)
            expect_∃⨍(:∀τ²∈λ𝑓₍ᵢ،ᵢ₊₁₎, ::Set)
            expect_∃⨍(:∀τ²∈λ𝑓₍ᵢ،ᵢ₊₁₎, ::Range)
          end
        end
      end # end: {extra sanity checks: all Classes w/ Enumerable have needed funcs}
    end # end: {feature(f08) passes audits (tests not relating to observed functionality)}
  end # end: {audit}
end # end: {f08}
