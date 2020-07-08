# coding: UTF-8

RSpec.describe 'f27_b09' do

  context 'functionality for {f27_b09}' do

    context 'math functions' do
      context 'func{abs}' do
        context 'handles needed scenarios' do
          context 'cases:' do
            it 'value provided is new ThetaAngle instance' do
              angle     = θ°(45)
              angle_id  = angle.🆔
              result    = angle.abs
              expect(angle.🆔).to eq(angle_id)
              expect(result.🆔).to_not eq(angle_id)
              expect(result.ⓣ).to eq(::ThetaAngle)
            end
            it 'positive data' do
              expect(θ°(405).abs.to_f).to eq(405.0)
              expect(θ°(45).abs.to_f).to eq(45.0)
              expect(θ°(0).abs.to_f).to eq(0.0)
            end
            it 'negative data' do
              expect(θ°(-405).abs.to_f).to eq(405.0)
              expect(θ°(-45).abs.to_f).to eq(45.0)
              expect(θ°(-0.1).abs.to_f).to eq(0.1)
            end
          end
        end
      end # end: {abs}
      context 'func{abs!}' do
        context 'handles needed scenarios' do
          context 'cases:' do
            it 'value provided is the same ThetaAngle instance' do
              angle     = θ°(45)
              angle_id  = angle.🆔
              angle.abs!
              expect(angle.🆔).to eq(angle_id)
              expect(angle.ⓣ).to eq(::ThetaAngle)
              expect(angle.real).to eq(45.0)
              result = angle.abs!
              expect(angle.🆔).to eq(angle_id)
              expect(result.🆔).to eq(angle_id)
              expect(result.real).to eq(45.0)
              expect(result.ⓣ).to eq(::ThetaAngle)
              expect(angle).to eq(result)
            end
            it 'positive data' do
              expect(θ°(370).abs!.to_f).to eq(370.0)
              expect(θʳ(π).abs!.to_f).to eq(π)
              expect(θ𝞽(0.75).abs!.to_f).to eq(0.75)
              expect(θᵍ(400).abs!.to_f).to eq(400.0)
            end
            it 'negative data' do
              expect(θ°(-370).abs!.to_f).to eq(370.0)
              expect(θʳ(-π).abs!.to_f).to eq(π)
              expect(θ𝞽(-0.75).abs!.to_f).to eq(0.75)
              expect(θᵍ(-400).abs!.to_f).to eq(400.0)
              expect(θ°(-0.1).abs!.to_f).to eq(0.1)
            end
          end
        end
      end # end: {abs!}
    end # end: {math functions}

    context 'math operations' do
      context 'addition' do
        context 'handles needed scenarios' do
          context 'cases: positive' do
            context 'forward direction' do
              it 'is allowed for frozen instances' do
                expect{(θ°(300).freeze) + 150.0}.to_not raise_error
              end
              context 'operation [+] vs [+=] vs [➕]' do
                it 'does not change value nor original object ID w/ [+]' do
                  angle_a    = θ°(300)
                  angle_a_id = angle_a.🆔
                  angle_b    = θ°(60)
                  angle_b_id = angle_b.🆔
                  angle_c    = angle_a + angle_b
                  angle_c_id = angle_c.🆔
                  expect(angle_a.real).to eq(300.0)
                  expect(angle_b.real).to eq(60.0)
                  expect(angle_c.real).to eq(360.0)
                  expect(angle_a.🆔).to eq(angle_a_id)
                  expect(angle_b.🆔).to eq(angle_b_id)
                  expect(angle_c.🆔).to eq(angle_c_id)
                  expect(angle_a_id).to_not eq(angle_b_id)
                  expect(angle_a_id).to_not eq(angle_c_id)
                  expect(angle_b_id).to_not eq(angle_c_id)
                end
                it 'changes value and does change original object ID w/ [+=]' do
                  angle    = θ°(300)
                  angle_id = angle.🆔
                  angle += 60
                  expect(angle.real).to eq(360)
                  expect(angle.to_s).to eq('360°θ')
                  expect(angle_id).to_not eq(angle.🆔)
                end
                it 'changes value but does not change original object ID w/ [➕]' do
                  angle    = θ°(300)
                  angle_id = angle.🆔
                  angle.➕(60)
                  expect(angle.real).to eq(360)
                  expect(angle.to_s).to eq('360°θ')
                  expect(angle_id).to eq(angle.🆔)
                end
              end # end: {just operation [+], not [+=]}
              it 'w/ degree-theta-angle' do
                angle = θ°(300)
                angle += θ°(60)
                expect(angle.real).to eq(360)
                expect(angle.to_s).to eq('360°θ')
              end
              it 'w/ radian-theta-angle' do
                angle = θ°(360)
                angle += θʳ(2.0 * π)
                expect(angle.real).to eq(720)
                expect(angle.to_s).to eq('720°θ')
              end
              it 'w/ gon-theta-angle' do
                angle = θ°(360)
                angle += θᵍ(400)
                expect(angle.real).to eq(720)
                expect(angle.to_s).to eq('720°θ')
              end
              it 'w/ turn-theta-angle' do
                angle = θ𝞽(0.5)
                angle += θ𝞽(1.5)
                expect(angle.real).to eq(2)
                expect(angle.to_s).to eq('2𝞽θ')
              end
            end
          end
          context 'cases: negative' do
            it 'forward direction' do
              angle = θ°(300)
              expect{angle + nil}.to raise_error(RuntimeError)
              expect{angle += nil}.to raise_error(RuntimeError)
            end
            it 'func{➕} not allowed on frozen instances' do
              expect{θ°(300).freeze.➕(0)}.to raise_error(RuntimeError)
            end
          end
        end # end: {handles needed scenarios}
      end # end: {addition}
      context 'subtraction' do
        context 'handles needed scenarios' do
          context 'cases: positive' do
            context 'forward direction' do
              it 'is allowed for frozen instances' do
                expect{(θ°(300).freeze) - 150.0}.to_not raise_error
              end
              context 'operation [-] vs [-=] vs [➖]' do
                it 'does not change value nor original object ID w/ [-]' do
                  angle_a    = θ°(360)
                  angle_a_id = angle_a.🆔
                  angle_b    = θ°(60)
                  angle_b_id = angle_b.🆔
                  angle_c    = angle_a - angle_b
                  angle_c_id = angle_c.🆔
                  expect(angle_a.real).to eq(360.0)
                  expect(angle_b.real).to eq(60.0)
                  expect(angle_c.real).to eq(300.0)
                  expect(angle_a.🆔).to eq(angle_a_id)
                  expect(angle_b.🆔).to eq(angle_b_id)
                  expect(angle_c.🆔).to eq(angle_c_id)
                  expect(angle_a_id).to_not eq(angle_b_id)
                  expect(angle_a_id).to_not eq(angle_c_id)
                  expect(angle_b_id).to_not eq(angle_c_id)
                end
                it 'changes value and does change original object ID w/ [-=]' do
                  angle    = θ°(360)
                  angle_id = angle.🆔
                  angle -= 60
                  expect(angle.real).to eq(300)
                  expect(angle.to_s).to eq('300°θ')
                  expect(angle_id).to_not eq(angle.🆔)
                end
                it 'changes value but does not change original object ID w/ [➖]' do
                  angle    = θ°(360)
                  angle_id = angle.🆔
                  angle.➖(60)
                  expect(angle.real).to eq(300)
                  expect(angle.to_s).to eq('300°θ')
                  expect(angle_id).to eq(angle.🆔)
                end
              end # end: {just operation [+], not [+=]}
              it 'w/ radian-theta-angle' do
                angle = θ°(360)
                angle -= θʳ(2.0 * π)
                expect(angle.real).to eq(0)
                expect(angle.to_s).to eq('0°θ')
              end
              it 'w/ gon-theta-angle' do
                angle = θ°(360)
                angle -= θᵍ(200)
                expect(angle.real).to eq(180)
                expect(angle.to_s).to eq('180°θ')
              end
              it 'w/ turn-theta-angle' do
                angle = θ𝞽(1.5)
                angle -= θ𝞽(0.5)
                expect(angle.real).to eq(1)
                expect(angle.to_s).to eq('1𝞽θ')
              end
            end
          end
          context 'cases: negative' do
            it 'forward direction' do
              expect{θ°(300) - nil}.to raise_error(RuntimeError)
              expect{θ°(300) - Object.new}.to raise_error(RuntimeError)
            end
            it 'func{➖} not allowed on frozen instances' do
              expect{θ°(300).freeze.➖(0)}.to raise_error(RuntimeError)
            end
          end
        end # end: {handles needed scenarios}
      end # end: {subtraction}
      context 'multiplication' do
        context 'handles needed scenarios' do
          context 'cases: positive' do
            context 'forward direction' do
              it 'is allowed for frozen instances' do
                expect{(θ°(300).freeze) * 150.0}.to_not raise_error
              end
              context 'operation [*] vs [*=] vs [✖️]' do
                it 'does not change value nor original object ID w/ [*]' do
                  angle_a    = θ°(180)
                  angle_a_id = angle_a.🆔
                  angle_b    = angle_a * 2
                  angle_b_id = angle_b.🆔
                  expect(angle_a.real).to eq(180.0)
                  expect(angle_b.real).to eq(360.0)
                  expect(angle_a.🆔).to eq(angle_a_id)
                  expect(angle_b.🆔).to eq(angle_b_id)
                  expect(angle_a_id).to_not eq(angle_b_id)
                end
                it 'changes value and does change original object ID w/ [+*]' do
                  angle    = θ°(180)
                  angle_id = angle.🆔
                  angle *= 2
                  expect(angle.real).to eq(360)
                  expect(angle.to_s).to eq('360°θ')
                  expect(angle_id).to_not eq(angle.🆔)
                end
                it 'changes value but does not change original object ID w/ [✖️]' do
                  angle    = θ°(180)
                  angle_id = angle.🆔
                  angle.✖️(2)
                  expect(angle.real).to eq(360)
                  expect(angle.to_s).to eq('360°θ')
                  expect(angle_id).to eq(angle.🆔)
                end
              end # end: {just operation [+], not [+=]}
              it 'w/ radian-theta-angle' do
                angle = θʳ(π)
                angle *= 2.0
                expect(angle.real).to eq(2.0 * π)
              end
              it 'w/ gon-theta-angle' do
                angle = θᵍ(200)
                angle *= 2.0
                expect(angle.real).to eq(400)
                expect(angle.to_s).to eq('400ᵍθ')
              end
              it 'w/ turn-theta-angle' do
                angle = θ𝞽(0.5)
                angle *= 2.0
                expect(angle.real).to eq(1)
                expect(angle.to_s).to eq('1𝞽θ')
              end
            end
          end
          context 'cases: negative' do
            it 'forward direction' do
              expect{θ°(300) * nil}.to raise_error(RuntimeError)
              expect{θ°(300) * Object.new}.to raise_error(RuntimeError)
            end
            it 'func{✖️} not allowed on frozen instances' do
              expect{θ°(300).freeze.✖️(0)}.to raise_error(RuntimeError)
            end
          end
        end # end: {handles needed scenarios}
      end # end: {multiplication}
      context 'division' do
        context 'handles needed scenarios' do
          context 'cases: positive' do
            context 'forward direction' do
              it 'is allowed for frozen instances' do
                expect{(θ°(300).freeze) / 150.0}.to_not raise_error
              end
              context 'operation [/] vs [/=] vs [➗]' do
                context 'data-types involved are as expected' do
                  it 'type{θ} / type{θ} --> type{Float}' do
                    angle_a = θ°(90)
                    angle_b = θ°(2)
                    result  = angle_a / angle_b
                    expect(result.ⓣ).to eq(Float)
                    expect(result).to eq(45.0)

                    result = θ°(360.0) / θʳ(2.0 * π)
                    expect(result).to eq(1.0)
                    expect(result.ⓣ).to eq(Float)
                  end
                  it 'type{θ} / type{Numeric} --> type{θ}' do
                    angle_a = θ°(90)
                    result  = angle_a / 2.0
                    expect(result.ⓣ).to eq(ThetaAngle)
                    expect(result).to eq(45.0)
                  end
                  it 'type{Numeric} / type{θ} --> type{θ}' do
                    angle_a = θ°(2)
                    result  = 90.0 / angle_a
                    expect(result.ⓣ).to eq(ThetaAngle)
                    expect(result).to eq(45.0)

                    result_2 = angle_a / 2.0
                    result_3 = result / 2.0
                    expect(result_2.ⓣ).to eq(ThetaAngle)
                    expect(result_3.ⓣ).to eq(ThetaAngle)

                    expect(angle_a.real).to eq(2.0)
                    expect(result.real).to eq(45.0)
                    expect(result_2.real).to eq(1.0)
                    expect(result_3.real).to eq(45.0 / 2.0)

                    angle_a = θ°(2)
                    result  = 90.0 / angle_a
                    expect(result.ⓣ).to eq(ThetaAngle)
                    angle_b = 450.0 / result
                    expect(angle_b.ⓣ).to eq(ThetaAngle)
                    expect(angle_b.real).to eq(10.0)
                    expect(result.real).to eq(45.0)

                    angle_c = θ°(100) / angle_b
                    expect(angle_c.ⓣ).to eq(Float)
                    expect(angle_c).to eq(10.0)
                  end
                end
                it 'does not change value nor original object ID w/ [/]' do
                  angle_a    = θ°(360)
                  angle_a_id = angle_a.🆔
                  angle_b    = angle_a / 2.0
                  angle_b_id = angle_b.🆔
                  expect(angle_a.real).to eq(360.0)
                  expect(angle_b.real).to eq(180.0)
                  expect(angle_a.🆔).to eq(angle_a_id)
                  expect(angle_b.🆔).to eq(angle_b_id)
                  expect(angle_a_id).to_not eq(angle_b_id)
                end
                it 'changes value and does change original object ID w/ [/=]' do
                  angle    = θ°(360)
                  angle_id = angle.🆔
                  angle /= 2.0
                  expect(angle.real).to eq(180)
                  expect(angle.to_s).to eq('180°θ')
                  expect(angle_id).to_not eq(angle.🆔)
                end
                it 'changes value but does not change original object ID w/ [➗]' do
                  angle    = θ°(360)
                  angle_id = angle.🆔
                  angle.➗(2.0)
                  expect(angle.real).to eq(180)
                  expect(angle.to_s).to eq('180°θ')
                  expect(angle_id).to eq(angle.🆔)
                end
              end # end: {just operation [+], not [+=]}
              it 'w/ radian-theta-angle' do
                angle = θʳ(2.0 * π)
                angle /= 2.0
                expect(angle.real).to eq(π)
              end
              it 'w/ gon-theta-angle' do
                angle = θᵍ(400)
                angle /= 2.0
                expect(angle.real).to eq(200)
                expect(angle.to_s).to eq('200ᵍθ')
              end
              it 'w/ turn-theta-angle' do
                angle = θ𝞽(1.0)
                angle /= 2.0
                expect(angle.real).to eq(0.5)
                expect(angle.to_s).to eq('0.5𝞽θ')
              end
            end
          end
          context 'cases: negative' do
            it 'forward direction' do
              angle = θ°(180)
              expect{angle / nil}.to raise_error(ArgumentError)
              expect{angle /= nil}.to raise_error(ArgumentError)
            end
            it 'func{➗} not allowed on frozen instances' do
              expect{θ°(300).freeze.➗(0)}.to raise_error(RuntimeError)
            end
          end
        end # end: {handles needed scenarios}
      end # end: {division}
      context 'modulo' do
        context 'handles needed scenarios' do
          context 'cases: positive' do
            it 'is allowed for frozen instances' do
              expect{(θ°(300).freeze) % 150.0}.to_not raise_error
            end
            context 'data-types involved are as expected' do
              it 'type{θ} % type{θ} --> type{Float}' do
                angle_a = θ°(12)
                angle_b = θ°(5)
                result  = angle_a % angle_b
                expect(result.ⓣ).to eq(Float)
                expect(result).to eq(2.0)
              end
              it 'type{θ} % type{Float} --> type{θ}' do
                angle_a = θ°(12)
                result  = angle_a % 5.0
                expect(result.ⓣ).to eq(ThetaAngle)
                expect(result).to eq(2.0)
              end
              it 'type{Float} % type{θ} --> type{θ}' do
                angle_a = θ°(5.0)
                result  = 12.0 % angle_a
                expect(result.ⓣ).to eq(ThetaAngle)
                expect(result).to eq(2.0)
              end
            end # end: {data-types involved are as expected}
            context 'object-id changes when needed only' do
              it 'does not change value nor original object ID w/ [%]' do
                angle_a    = θ°(360)
                angle_a_id = angle_a.🆔
                angle_b    = angle_a % 345.0
                angle_b_id = angle_b.🆔
                expect(angle_a.real).to eq(360.0)
                expect(angle_b.real).to eq(15.0)
                expect(angle_a.🆔).to eq(angle_a_id)
                expect(angle_b.🆔).to eq(angle_b_id)
                expect(angle_a_id).to_not eq(angle_b_id)
              end
              it 'changes value and does change original object ID w/ [%=]' do
                angle    = θ°(360)
                angle_id = angle.🆔
                angle %= 345.0
                expect(angle.real).to eq(15)
                expect(angle.to_s).to eq('15°θ')
                expect(angle_id).to_not eq(angle.🆔)
              end
              it 'changes value but does not change original object ID w/ [modulo!]' do
                angle    = θ°(360)
                angle_id = angle.🆔
                angle.modulo!(345.0)
                expect(angle.real).to eq(15)
                expect(angle.to_s).to eq('15°θ')
                expect(angle_id).to eq(angle.🆔)
              end
            end
          end
          context 'cases: negative' do
            it 'forward direction' do
              angle = θ°(180)
              expect{angle % nil}.to raise_error(RuntimeError)
              expect{angle %= nil}.to raise_error(RuntimeError)
            end
            it 'func{modulo!} not allowed on frozen instances' do
              expect{θ°(300).freeze.modulo!(0)}.to raise_error(RuntimeError)
            end
          end
        end # end: {handles needed scenarios}
      end # end: {modulo}
    end # end: {math operations}

  end

  context 'audits', :audit do
    context '{f27_b09}' do
      context 'class{ThetaAngle} is defined as needed' do
        it 'w/ needed funcs' do
          expect_∃⨍(:-, ::ThetaAngle)
          expect_∃⨍(:+, ::ThetaAngle)
          expect_∃⨍(:/, ::ThetaAngle)
          expect_∃⨍(:*, ::ThetaAngle)
          expect_∃⨍(:%, ::ThetaAngle)
          expect_∃⨍(:abs, ::ThetaAngle)
          expect_∃⨍(:abs!, ::ThetaAngle)
        end
      end
    end
  end # end: {audits}

end
