# coding: UTF-8

RSpec.describe 'f27_b08' do

  context 'functionality for {f27_b08}' do
    context 'unary operators' do

      context 'func{-@}' do
        it 'handles needed scenarios' do
          expect(-θ°(-45)).to eq(θ°(315))

          expect(-θ°(-405)).to eq(θ°(315))

          expect((-θᵍ(-50)).real).to eq(θᵍ(350).real)
          expect((-θᵍ(350)).real).to eq(θᵍ(-50).real)

          expect((-θ°(315)).real).to eq(θ°(-45).real)
          expect((-θ°(-45)).real).to eq(θ°(315).real)

          expect((-θᵍ(-50))).to eq(θ°(315))
          expect((-θ𝞽(-(1.0 / 8.0)))).to eq(θ°(315))
          expect((-θʳ(::Math::PI / -4.0))).to eq(θ°(315))
        end
      end # end: {func{-@}}

      context 'func{+@}' do
        context 'handles needed scenarios' do
          it 'w/ regular data' do
            expect(+θᵍ(-50)).to eq(θ°(-45))
            expect(+θ𝞽(1.0 / 8.0)).to eq(θ°(45))
            expect(+θ°(45)).to eq(+θ°(45))
          end
        end
      end # end: {func{+@}}

      context 'func{!}' do
        context 'handles needed scenarios' do
          context 'cases: positive' do
            it 'normal scenarios' do
              expect(!θ°(45)).to eq(-45.0)
              expect(!θ𝞽(0.9)).to eq(-0.9)
              expect(!θ𝞽(0.25)).to eq(-0.25)
              expect(!θʳ(1337)).to eq(-1337.0)
              expect(!θᵍ(1337)).to eq(-1337.0)
            end
            it 'w/ repeated invocations' do
              angle    = θ°(45)
              angle_id = angle.🆔
              expect(angle.real).to eq(45.0)
              angle    = !angle
              expect(angle.real).to eq(-45.0)
              expect(angle.🆔).to eq(angle_id)
              angle    = !angle
              expect(angle.real).to eq(45.0)
              expect(angle.🆔).to eq(angle_id)
              angle    = !angle
              expect(angle.real).to eq(-45.0)
              expect(angle.🆔).to eq(angle_id)
            end
          end
        end
      end # end: {func{!}}

      context 'func{~}' do
        context 'handles needed scenarios' do
          context 'cases: positive' do
            it 'normal scenarios' do
              expect((~θ°(45)).to_f).to eq(225.0)
              expect((~θ𝞽(0.9)).to_f).to eq(0.4)
              expect((~θ𝞽(0.25)).to_f).to eq(0.75)
              expect((~θʳ(::Math::PI)).to_f).to eq(2.0 * ::Math::PI)
              expect((~θᵍ(110.0)).to_f).to eq(310.0)
              expect((~θ°(405)).to_f).to eq(225.0)
              expect((~θ°(225)).to_f).to eq(45.0)
            end
            it 'w/ repeated invocations' do
              angle    = θ𝞽(0.9)
              angle_id = angle.🆔
              expect(angle.real).to eq(0.9)
              angle    = ~angle
              expect(angle.real).to eq(0.4)
              expect(angle.🆔).to eq(angle_id)
              angle    = ~angle
              expect(angle.real).to eq(0.9)
              expect(angle.🆔).to eq(angle_id)
              angle    = ~angle
              expect(angle.real).to eq(0.4)
              expect(angle.🆔).to eq(angle_id)
            end
          end
        end
      end # end: {func{~}}

    end # end: {unary operators}

  end

  context 'audits', :audit do
    context '{f27_b08}' do
      context 'class{ThetaAngle} is defined as needed' do
        it 'w/ needed funcs' do
          expect_∃⨍(:!, ::ThetaAngle)
          expect_∃⨍(:~, ::ThetaAngle)
        end
      end
    end
  end # end: {audits}

end
