# encoding: UTF-8

using ::ThetaAngle::ContextRuuuby
using ::ThetaAngle::ContextParamCheck

RSpec.describe 'module/math.rb' do

  context 'extends module{Math}' do

    context 'by adding needed functions & aliases' do

      context 'module{Math::Ratio}' do

        context 'func{golden?}' do
          context 'handles needed scenarios' do
            context 'cases: positive' do
              it 'w/ regular data' do
                expect(::Math::Ratio.golden?(a: 1 + √(5), b: 2)).to eq(true)
              end
              it 'w/ ThetaAngles' do
                expect(::Math::Ratio.golden?(a: θ°(360.0).° - Ⴔ.°, b: Ⴔ.°)).to eq(true)
              end
            end
            context 'cases: negative' do
              it 'bad params' do
                expect{::Math::Ratio.golden?(1, 2, 3)}.to raise_error(ArgumentError)
                expect{::Math::Ratio.golden?(a: 1, b: 2, c: nil)}.to raise_error(ArgumentError)
                expect{::Math::Ratio.golden?(1, a: 1, b: 2)}.to raise_error(ArgumentError)
              end
              it 'not τ² golden-ratio tuples' do
                expect(::Math::Ratio.golden?(a: 1, b: 2)).to eq(false)
                expect(::Math::Ratio.golden?(a: 1, b: 2.0)).to eq(false)
              end
            end
          end
        end # end: {func{golden?}}

      end # end: {module{Math::Ratio}}

      context 'func{pythagorean??}' do
        context 'handles needed scenarios' do
          context 'cases: positive' do
            it 'w/ ints & floats' do
              expect(::Math::Trig::ℕ³.pythagorean?(a: 3, b: 4, c: 5)).to eq(true)
              expect(::Math::Trig::ℕ³.pythagorean?(a: 3.0, b: 4.0, c: 5.0)).to eq(true)
              expect(::Math::Trig::ℕ³.pythagorean?(a: 3.0, b: 4, c: 5)).to eq(true)
            end
            it 'w/ theta angles' do
              expect(::Math::Trig::ℕ³.pythagorean?(a: θ°(30), b: θ°(60), c: θ°(90))).to eq(true)
            end
          end
          context 'cases: negative' do
            it 'bad params' do
              expect{::Math::Trig::ℕ³.pythagorean?(1, 2, 3)}.to raise_error(ArgumentError)
              expect{::Math::Trig::ℕ³.pythagorean?(a: 1, b: 2, c: nil)}.to raise_error(ArgumentError)
              expect{::Math::Trig::ℕ³.pythagorean?(1, a: 1, b: 2, c: 3)}.to raise_error(ArgumentError)
            end
            it 'not pythagoras_τ³ tuples' do
              expect(::Math::Trig::ℕ³.pythagorean?(a: 1, b: 2, c: 3)).to eq(false)
            end
          end
        end
      end # end: {func{pythagorean?}}

    end
  end
end
