# coding: UTF-8

RSpec.describe 'f10' do

  context 'functionality' do
    context '{b04}' do
      context 'adds func{√}' do
        context 'handles needed scenarios' do
          context 'cases: positive' do
            it 'equals (Math.sqrt)' do
              expect(√(25)).to eq(Math.sqrt(25))
            end
            it 'w/ regular numerics' do
              expect(√(1)).to eq(1.0)
              expect(√(1.0)).to eq(1.0)
              expect(√(25)).to eq(5.0)
              expect(√(Rational(25, 1))).to eq(5.0)
              expect(√(Complex(25))).to eq(5.0)
            end
            it 'w/ with numerics represented by strings' do
              expect(√('2.0')).to eq(√(2.0))
              expect(√('𝚽')).to eq(√(𝚽))
              expect(√('1337')).to eq(√(1337))
            end
          end
          it 'cases: error' do
            expect{√(nil)}.to raise_error(ArgumentError)
          end
        end
      end # end: {adds func{√}}

      context 'adds func{∛}' do
        it 'equals (Math.cbrt)' do
          expect(∛(25)).to eq(Math.cbrt(25))
        end
      end # end: {adds func{∛}}
    end
  end

  context 'audit', :audit do
    context 'feature(f10) passes audits (tests not relating to observed functionality)' do
      context 'funcs provided are defined in correct location' do
        it 'for{b02}' do
          expect_∃⨍(:🆕, ::Class)
        end
        it 'for{b04}' do
          expect_∃⨍(:√, ::Kernel)
          expect_∃⨍(:∛, ::Kernel)
        end
        it 'for{b05}' do
          expect_∃⨍(:logₑ, ::Kernel)
          expect_∃⨍(:log₂, ::Kernel)
          expect_∃⨍(:log₁₀, ::Kernel)
        end
        it 'for c{Range}' do
          expect_∃⨍(:∀, ::Range)
        end
      end
    end
  end

end
