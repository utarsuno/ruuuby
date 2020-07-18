# encoding: UTF-8

RSpec.describe 'f08' do
  context 'audit', :audit do
    context 'feature(f08) passes audits' do
      it 'module is defined in correct location' do
        expect_∃ᵐ(:StringF08, ::Ruuuby::Feature::Includable)
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
    end # end: {feature(f08) passes audits}
  end # end: {audit}
end # end: {f08}
