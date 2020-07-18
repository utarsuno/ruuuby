# encoding: UTF-8

using ::ThetaAngle::ContextRuuuby

RSpec.describe 'theta_angle' do

  context 'creates class[ThetaAngle]' do

    context 'w/ needed funcs' do
      context 'func{==}' do
        context 'handles needed scenarios' do
          context 'cases: positive' do
            context 'θ° to' do
              it 'ints/floats' do
                expect(θ°(300)).to eq(300)
                expect(θ°(300)).to eq(300.0)
                expect(θ°(300.0)).to eq(300)
                expect(θ°(300.0)).to eq(300.0)
              end
              it 'θ°' do
                expect(θ°(300)).to eq(θ°(300))
                expect(θ°(300)).to eq(300)
                expect(θ°(300)).to eq(300.0)
                expect(θ°(300.0)).to eq(300)
              end
              it 'θʳ' do
                expect(θ°(360)).to eq(θʳ(2.0 * π))
              end
              it 'θᵍ' do
                expect(θ°(360)).to eq(θᵍ(400))
              end
              it 'θ𝞽' do
                expect(θ°(360)).to eq(θ𝞽(1))
              end
            end # end: {θ° to}
            context 'θʳ to' do
              it 'θʳ' do
                expect(θʳ(2.0 * π)).to eq(θʳ(2.0 * π))
                expect(θʳ(2.0 * π)).to eq(2.0 * π)
              end
              it 'θ°' do
                expect(θʳ(2.0 * π)).to eq(θ°(360))
              end
              it 'θᵍ' do
                expect(θʳ(2.0 * π)).to eq(θᵍ(400))
              end
              it 'θ𝞽' do
                expect(θʳ(2.0 * π)).to eq(θ𝞽(1))
              end
            end # end: {θʳ to}
            context 'θᵍ to' do
              it 'θᵍ' do
                expect(θᵍ(400)).to eq(θᵍ(400))
                expect(θᵍ(400)).to eq(400)
                expect(θᵍ(400)).to eq(400.0)
                expect(θᵍ(400.0)).to eq(400.0)
              end
              it 'θʳ' do
                expect(θᵍ(400)).to eq(θʳ(2.0 * π))
              end
              it 'θ°' do
                expect(θᵍ(400)).to eq(θ°(360))
              end
              it 'θ𝞽' do
                expect(θᵍ(400)).to eq(θ𝞽(1))
              end
            end # end: {θᵍ to}
            context 'θ𝞽 to' do
              it 'θ𝞽' do
                expect(θ𝞽(1)).to eq(θ𝞽(1))
                expect(θ𝞽(1)).to eq(1.0)
                expect(θ𝞽(1.0)).to eq(1)
              end
              it 'θᵍ' do
                expect(θ𝞽(1)).to eq(θᵍ(400))
              end
              it 'θʳ' do
                expect(θ𝞽(1)).to eq(θʳ(2.0 * π))
              end
              it 'θ°' do
                expect(θ𝞽(1)).to eq(θ°(360))
              end
            end # end: {θ𝞽 to}
          end # end: {cases: positive}
        end # end: {handles needed scenarios}
      end # end: {func{==}}
      context 'func{to_s}' do
        context 'handles needed scenarios' do
          it 'cases: all' do
            expect(θ°(1337.1337).to_s).to eq('1337.1337°θ')
            expect(θʳ(1337.1337).to_s).to eq('1337.1337ʳθ')
            expect(θ𝞽(1337.1337).to_s).to eq('1337.1337𝞽θ')
            expect(θᵍ(1337.1337).to_s).to eq('1337.1337ᵍθ')
          end
        end # end: {handles needed scenarios}
      end # end: {func{to_s}}
      context 'func{repr}' do
        context 'handles needed scenarios' do
          it 'cases: all' do
            expect(θʳ(1337.1337).repr).to eq(3)
            expect(θ°(1337.1337).repr).to eq(4)
            expect(θ𝞽(1337.1337).repr).to eq(5)
            expect(θᵍ(1337.1337).repr).to eq(6)
          end
        end # end: {handles needed scenarios}
      end # end: {func{repr}}
    end # end: {w/ needed funcs}
  end # end: {creates class[ThetaAngle]}
end # end: {theta_angle}
