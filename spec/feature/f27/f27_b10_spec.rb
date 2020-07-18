# encoding: UTF-8

using ::ThetaAngle::ContextRuuuby
using ::ThetaAngle::ContextParamCheck

RSpec.describe 'f27_b10' do

  context 'functionality' do
    context 'extends class{Object}' do

      context 'by adding function{🛑θ❓}' do
        context 'handles needed input scenarios' do
          context 'cases: positive' do
            it 'w/ single param' do
              expect{🛑θ❓(:θ, θ°(360.0))}.to_not raise_error
              expect{🛑θ❓(:θ, θ°(360.0))}.to_not raise_error
            end
          end
          context 'cases: negative' do
            it 'w/ single param' do
              expect{🛑θ❓(:θ, nil)}.to raise_error(ArgumentError)
              expect{🛑θ❓(:θ, 360.0)}.to raise_error(ArgumentError)
            end
          end
        end
      end

      context 'function{θ?}' do
        context 'handles needed scenarios' do
          context 'cases: positive' do
            it 'w/ single param' do
              expect(θ°(0).θ?).to eq(true)
              expect(θᵍ(0).θ?).to eq(true)
              expect(θʳ(0).θ?).to eq(true)
              expect(θ𝞽(0).θ?).to eq(true)
            end
          end
          context 'cases: negative' do
            it 'w/ single param' do
              expect(0.θ?).to eq(false)
              expect(360.0.θ?).to eq(false)
              expect(Rational(::Math::PI, 2).θ?).to eq(false)
              expect(nil.θ?).to eq(false)
              expect(''.θ?).to eq(false)
            end
          end
        end
      end

    end
  end # end: {functionality}

  context 'audit', :audit do
    context 'static functions provided are' do
      context 'defined in correct location' do
        it 'for module{ContextStr}' do
          expect_∃ᵐ(:ContextParamCheck, ::ThetaAngle)
        end
      end
    end
  end # end: {audit}

  #  __   ___  __   ___  __   __                   __   ___
  # |__) |__  |__) |__  /  \ |__)  |\/|  /\  |\ | /  ` |__
  # |    |___ |  \ |    \__/ |  \  |  | /~~\ | \| \__, |___
  context 'performance', :performance do

    context 'function{🛑θ❓}: performs extremely quickly' do
      context 'for needed scenarios' do
        context 'cases: positive' do
          it 'w/ single param' do
            the_angle = θ°(360.0)
            expect{🛑θ❓(:θ, the_angle)}.to perform_extremely_quickly
          end
        end
      end
    end
  end # end: {performance}

end
