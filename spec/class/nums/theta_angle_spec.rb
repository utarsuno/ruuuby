# coding: UTF-8

RSpec.describe 'theta_angle' do

  context 'creates class[ThetaAngle]' do
    let(:as_degrees){θ°(360)}
    let(:as_radians){θʳ(π * 2)}
    let(:as_gons){θᵍ(400)}
    let(:as_turns){θ𝞽(1)}

    context 'class exists w/ constructor' do
      context 'handling needed scenarios' do
        context 'cases: positive' do
          it 'w/ correct class' do
            expect(as_degrees.class).to eq(::ThetaAngle)
            expect(as_radians.class).to eq(::ThetaAngle)
            expect(as_gons.class).to eq(::ThetaAngle)
            expect(as_turns.class).to eq(::ThetaAngle)
          end
          it 'w/ different object-IDs' do
            expect(as_degrees.🆔).to_not eq(as_radians.🆔)
            expect(as_degrees.🆔).to_not eq(as_gons.🆔)
            expect(as_degrees.🆔).to_not eq(as_turns.🆔)
            expect(as_radians.🆔).to_not eq(as_gons.🆔)
            expect(as_radians.🆔).to_not eq(as_turns.🆔)
            expect(as_gons.🆔).to_not eq(as_turns.🆔)
          end
          it 'w/ working equal comparisons' do
            expect(as_degrees).to eq(θ°(300) + θ°(60))
            expect(as_radians).to eq(θʳ(π) + θʳ(π))
            expect(as_gons).to eq(θᵍ(300) + θᵍ(100.0))
            expect(as_turns).to eq(θ𝞽(½) + θ𝞽(½))
          end
        end
        context 'cases: negative' do
          it 'bad arg' do
            expect{θ°(nil)}.to raise_error(ArgumentError)
          end
        end
      end
    end # end: {class exists w/ constructor}
    context 'w/ needed funcs' do
      context 'func{==}' do
        context 'handles needed scenarios' do
          context 'cases: positive' do
            context 'DGR to' do
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
            expect((-θ𝞽(-(⅛)))).to eq(θ°(315))
            expect((-θʳ(::Math::PI / -4.0))).to eq(θ°(315))
          end
        end
        context 'func{+@}' do
          context 'handles needed scenarios' do
            it 'w/ regular data' do
              expect(+θᵍ(-50)).to eq(θ°(-45))
              expect(+θ𝞽(1.0 / 8.0)).to eq(θ°(45))
              expect(+θ°(45)).to eq(+θ°(45))
            end
          end
        end
      end # end: {unary operators}
      context 'math functions' do
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
        context 'func{abs}' do
          context 'handles needed scenarios' do
            context 'cases:' do
              it 'value provided is new ThetaAngle instance' do
                angle     = θ°(45)
                angle_id  = angle.🆔
                result    = angle.abs
                expect(angle.🆔).to eq(angle_id)
                expect(result.🆔).to_not eq(angle_id)
                expect(result.class).to eq(::ThetaAngle)
              end
              it 'positive data' do
                expect(θ°(45).abs.to_f).to eq(45.0)
                expect(θ°(0).abs.to_f).to eq(0.0)
              end
              it 'negative data' do
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
                expect(angle.class).to eq(::ThetaAngle)
                expect(angle.real).to eq(45.0)
                result = angle.abs!
                expect(angle.🆔).to eq(angle_id)
                expect(result.🆔).to eq(angle_id)
                expect(result.real).to eq(45.0)
                expect(result.class).to eq(::ThetaAngle)
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
        context 'vocab based funcs' do
          context 'func{complementary_with?}' do

            context 'math properties' do
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

            context 'handles needed scenarios' do
              it 'cases: positive' do
                expect(θ°(45).complementary_with?(θ𝞽(1.0 / 8.0))).to eq(true)
                expect(θᵍ(50).complementary_with?(θ𝞽(1.0 / 8.0))).to eq(true)
                expect(θᵍ(50).complementary_with?(θ°(45))).to eq(true)
                expect(θ𝞽(1.0 / 8.0).complementary_with?(θᵍ(50))).to eq(true)
                expect(θ𝞽(1.0 / 8.0).complementary_with?(θ°(45))).to eq(true)
                expect(θʳ(θ°(45).ʳ.to_f).complementary_with?(θ°(45))).to eq(true)
              end
              it 'cases: negative' do
                expect(θ°(46).complementary_with?(θ𝞽(1.0 / 8.0))).to eq(false)
                expect(θᵍ(51).complementary_with?(θ𝞽(1.0 / 8.0))).to eq(false)
              end
            end
          end # end: {func{complementary_with?}}
          context 'func{supplementary_with?}' do
            context 'handles needed scenarios' do
              it 'cases: positive' do
                expect(θ°(90).supplementary_with?(θ𝞽(¼))).to eq(true)
                expect(θᵍ(100).supplementary_with?(θ𝞽(¼))).to eq(true)
                expect(θᵍ(100).supplementary_with?(θ°(90))).to eq(true)
                expect(θ𝞽(¼).supplementary_with?(θᵍ(100))).to eq(true)
                expect(θ𝞽(¼).supplementary_with?(θ°(90))).to eq(true)
                expect(θ𝞽(¼).supplementary_with?(θ𝞽(¼))).to eq(true)
                expect(θʳ(θ°(90).ʳ.to_f).supplementary_with?(θ°(90))).to eq(true)
              end
              it 'cases: negative' do
                expect(θ°(46).supplementary_with?(θ𝞽(1.0 / 8.0))).to eq(false)
                expect(θᵍ(51).supplementary_with?(θ𝞽(1.0 / 8.0))).to eq(false)
              end
            end
          end # end: {func{supplementary_with?}}
          context 'func{explementary_with?}' do
            context 'handles needed scenarios' do
              it 'cases: positive' do
                expect(θ°(180).explementary_with?(θ𝞽(½))).to eq(true)
                expect(θᵍ(200).explementary_with?(θ𝞽(½))).to eq(true)
                expect(θᵍ(200).explementary_with?(θ°(180))).to eq(true)
                expect(θ𝞽(½).explementary_with?(θᵍ(200))).to eq(true)
                expect(θ𝞽(½).explementary_with?(θ𝞽(½))).to eq(true)
                expect(θʳ(θ°(180).ʳ.to_f).explementary_with?(θ°(180))).to eq(true)
              end
              it 'cases: negative' do
                expect(θ°(46).explementary_with?(θ𝞽(1.0 / 8.0))).to eq(false)
                expect(θᵍ(51).explementary_with?(θ𝞽(1.0 / 8.0))).to eq(false)
              end
            end
          end # end: {func{explementary_with?}}
        end # end: {vocab based funcs}
        context 'func{windings}' do
          context 'handles needed scenarios' do
            it 'cases: positive direction' do
              expect(θ°(0).windings).to eq(0)
              expect(θ°(1).windings).to eq(0)
              expect(θ°(359).windings).to eq(0)
              expect(θ°(360).windings).to eq(1)
              expect(θ°(361).windings).to eq(1)
              expect(θ°(719).windings).to eq(1)
              expect(θ°(720).windings).to eq(2)
              expect(θ°(721).windings).to eq(2)
              expect(θ𝞽(2.25).windings).to eq(2)
              expect(θᵍ(1337).windings).to eq(3)
              expect(θʳ(π * 3).windings).to eq(1)
              expect(θ°(0.0).windings).to eq(0)
              expect(θ°(90).windings).to eq(0)
              expect(θ°((360 * 5) + 90).windings).to eq(5)
              expect(θʳ(π * 5).windings).to eq(2)
              expect(θᵍ(900).windings).to eq(2)
              expect(θ𝞽(4.6).windings).to eq(4)
            end
            it 'cases: negative direction' do
              expect(θ°(0).windings).to eq(0)
              expect(θ°(-1).windings).to eq(0)
              expect(θ°(-359).windings).to eq(0)
              expect(θ°(-360).windings).to eq(-1)
              expect(θ°(-361).windings).to eq(-1)
              expect(θ°(-719).windings).to eq(-1)
              expect(θ°(-720).windings).to eq(-2)
              expect(θ°(-721).windings).to eq(-2)
              expect(θ𝞽(-2.25).windings).to eq(-2)
              expect(θᵍ(-1337).windings).to eq(-3)
              expect(θʳ(π * -3).windings).to eq(-1)
              expect(θ°(-2).windings).to eq(0)
              expect(θ°(-90).windings).to eq(0)
              expect(θ°((-360 * 5) - 90).windings).to eq(-5)
              expect(θʳ(π * -5).windings).to eq(-2)
              expect(θᵍ(-900).windings).to eq(-2)
              expect(θ𝞽(-4.6).windings).to eq(-4)
            end
          end
        end # end: {func{windings}}
        context 'normalization' do
          context 'func{normal?}' do
            it 'has alias{η̂?}' do
              expect(::ThetaAngle.∃⨍_alias?(:normal?, :η̂?)).to eq(true)
            end
            context 'handles needed scenarios' do
              it 'cases: positive' do
                [-360, -359, -100, -1, 0, 1, 100, 359, 360.0].∀{|scenario| expect(θ°(scenario).normal?).to eq(true)}
                [-1, -0.99, -0.01, 0, 0.01, 0.5, 0.99, 1].∀{|scenario| expect(θ𝞽(scenario).normal?).to eq(true)}
                [-400, -399.0, -100, -1, 0, 1, 1.5, 399, 400].∀{|scenario| expect(θᵍ(scenario).normal?).to eq(true)}
                [-2.0 * π, (2.0 * π) * 0.99, -0.1, 0, 0.1, (2.0 * π) * 0.99, 2.0 * π].∀{|scenario| expect(θʳ(scenario).normal?).to eq(true)}
              end
              it 'cases: negative' do
                [-10000, -361, 361, 10000].∀{|scenario| expect(θ°(scenario).normal?).to eq(false)}
                [-10000, -1.01, 1.01, 10000].∀{|scenario| expect(θ𝞽(scenario).normal?).to eq(false)}
                [-10000, -401, 401, 10000].∀{|scenario| expect(θᵍ(scenario).normal?).to eq(false)}
                [-10000, (-2.0 * π) - 0.1, (2.0 * π) + 0.1, 10000].∀{|scenario| expect(θʳ(scenario).normal?).to eq(false)}
              end
            end
          end # end: {normal?}
          context 'func{normalize}' do
            it 'has alias{η̂}' do
              expect(::ThetaAngle.∃⨍_alias?(:normalize, :η̂)).to eq(true)
            end
            context 'handles needed scenarios' do
              it 'generates new object (with new object_id)' do
                angle    = θ°(370)
                angle_id = angle.🆔
                angle2   = angle.normalize
                expect(angle.real).to eq(370.0)
                expect(angle2.real).to eq(10)
                expect(angle.repr).to eq(:as_degree)
                expect(angle_id).to eq(angle.🆔)
                expect(angle_id).to_not eq(angle2.🆔)
                expect(angle.class).to eq(::ThetaAngle)
                expect(angle2.class).to eq(::ThetaAngle)
              end
            end
          end # end: {func{normalize!}}
          context 'func{normalize!}' do
            it 'has alias{η̂!}' do
              expect(::ThetaAngle.∃⨍_alias?(:normalize!, :η̂!)).to eq(true)
            end
            context 'cases: positive' do
              it 'keeps object_id' do
                angle    = θ°(370)
                angle_id = angle.🆔
                angle2   = angle.normalize!
                expect(angle.real).to eq(10.0)
                expect(angle.repr).to eq(:as_degree)
                expect(angle_id).to eq(angle.🆔)
                expect(angle_id).to eq(angle2.🆔)
                expect(angle.class).to eq(::ThetaAngle)
                expect(angle2.class).to eq(::ThetaAngle)
              end
              it 'θ°' do
                [0, -1.1, 1.1, -359, 359, -360, 360].∀{|scenario| expect(θ°(scenario).normalize!).to eq(scenario)}

                expect(θ°(390).normalize!).to eq(30)
                expect(θ°(2560).normalize!).to eq(40)
                expect(θ°(-30).normalize!).to eq(-30)
                expect(θ°(-400).normalize!).to eq(-40)
              end
              it 'θᵍ' do
                [0, -1.1, 1.1, -399, 399, -400, 400].∀{|scenario| expect(θᵍ(scenario).normalize!).to eq(scenario)}

                expect(θᵍ(444).normalize!).to eq(44)
                expect(θᵍ(15337).normalize!).to eq(137)
                expect(θᵍ(-401).normalize!).to eq(-1)
                expect(θᵍ(-900).normalize!).to eq(-100)
              end
              it 'θ𝞽' do
                [0, -0.1, 0.1, -1.0, 0.1].∀{|scenario| expect(θ𝞽(scenario).normalize!).to eq(scenario)}

                expect(θ𝞽(-2.0).normalize!.to_f).to eq(-0.0)
                expect(θ𝞽(-9.5).normalize!.to_f).to eq(-0.5)
                expect(θ𝞽(3.0).normalize!.to_f).to eq(0.0)
                expect(θ𝞽(9.5).normalize!.to_f).to eq(0.5)
              end
              it 'θʳ' do
                [0, -0.1, 0.1, -2.0 * π, 2.0 * π].∀{|scenario| expect(θʳ(scenario).normalize!).to eq(scenario)}

                expect(θʳ(-2.0 * π).normalize!).to eq(-2.0 * π)
                expect(θʳ(2.0 * π).normalize!).to eq(2.0 * π)
                expect(θʳ(-3.0 * π).normalize!).to eq(-1.0 * π)
                expect(θʳ(5.0 * π).normalize!).to eq(1.0 * π)
              end
            end
          end # end: {func{normalize!}}
        end # end: {normalization}
        context 'comparison funcs' do
          context 'func{<}' do
            context 'handles needed scenarios' do
              it 'cases: positive' do
                expect(θ°(0) < θ°(1)).to eq(true)
                expect(θ°(1) < θ°(10)).to eq(true)
                expect(θ°(0) < θ°(359)).to eq(true)
                expect(θ°(359) < θᵍ(400)).to eq(true)
                expect(θ°(359) < θʳ(2.0 * π)).to eq(true)
                expect(θ°(359) < θ𝞽(1)).to eq(true)
              end
              it 'cases: negative' do
                expect(θ°(0) < θ°(0)).to eq(false)
                expect(θ°(1) < θ°(0)).to eq(false)
                expect(θ°(10) < θ°(1)).to eq(false)
                expect(θ°(359) < θ°(0)).to eq(false)
                expect(θᵍ(400) < θ°(359)).to eq(false)
                expect(θʳ(2.0 * π) < θ°(359)).to eq(false)
                expect(θ𝞽(1) < θ°(359)).to eq(false)
              end
              it 'cases: error' do
                expect{θ°(1) < 10}.to raise_error(ArgumentError)
                expect{θ°(1) < nil}.to raise_error(ArgumentError)
              end
            end
          end # end: {func{<}}
          context 'func{<=}' do
            context 'handles needed scenarios' do
              it 'cases: positive' do
                expect(θ°(0) <= θ°(1)).to eq(true)
                expect(θ°(1) <= θ°(1)).to eq(true)
                expect(θ°(0) <= θ°(0)).to eq(true)
                expect(θ°(1) <= θ°(10)).to eq(true)
                expect(θ°(0) <= θ°(359)).to eq(true)
                expect(θ°(123) <= θ°(450)).to eq(true)
                expect(θ°(359) <= θ°(359)).to eq(true)
                expect(θ°(359) <= θᵍ(400)).to eq(true)
                expect(θ°(359) <= θʳ(2.0 * π)).to eq(true)
                expect(θ°(359) <= θ𝞽(1)).to eq(true)
                expect(θ°(360) <= θᵍ(400)).to eq(true)
                expect(θ°(360) <= θʳ(2.0 * π)).to eq(true)
                expect(θ°(360) <= θ𝞽(1)).to eq(true)
              end
              it 'cases: negative' do
                expect(θ°(1) <= θ°(0)).to eq(false)
                expect(θ°(10) <= θ°(1)).to eq(false)
                expect(θ°(359) <= θ°(0)).to eq(false)
                expect(θᵍ(400) <= θ°(359)).to eq(false)
                expect(θʳ(2.0 * π) <= θ°(359)).to eq(false)
                expect(θ𝞽(1) <= θ°(359)).to eq(false)
                expect(θ°(361) <= θᵍ(400)).to eq(false)
                expect(θ°(361) <= θʳ(2.0 * π)).to eq(false)
                expect(θ°(361) <= θ𝞽(1)).to eq(false)
              end
              it 'cases: error' do
                expect{θ°(1) <= nil}.to raise_error(ArgumentError)
              end
            end
          end # end: {func{<=}}
          context 'func{>}' do
            context 'handles needed scenarios' do
              it 'cases: positive' do
                expect(θ°(1) > θ°(0)).to eq(true)
                expect(θ°(10) > θ°(1)).to eq(true)
                expect(θ°(359) > θ°(0)).to eq(true)
                expect(θ°(360) > θᵍ(399)).to eq(true)
                expect(θ°(360) > θʳ(1.9 * π)).to eq(true)
                expect(θ°(360) > θ𝞽(0.99)).to eq(true)
              end
              it 'cases: negative' do
                expect(θ°(0) > θ°(1)).to eq(false)
                expect(θ°(1) > θ°(10)).to eq(false)
                expect(θ°(0) > θ°(359)).to eq(false)
                expect(θᵍ(399) > θ°(360)).to eq(false)
                expect(θʳ(1.9 * π) > θ°(360)).to eq(false)
                expect(θ𝞽(0.99) > θ°(360)).to eq(false)
              end
              it 'cases: error' do
                expect{θ°(1) > nil}.to raise_error(ArgumentError)
              end
            end
          end # end: {func{>}}
          context 'func{>=}' do
            context 'handles needed scenarios' do
              it 'cases: positive' do
                expect(θ°(1) >= θ°(0)).to eq(true)
                expect(θ°(0) >= θ°(0)).to eq(true)
                expect(θ°(1) >= θ°(1)).to eq(true)
                expect(θ°(10) >= θ°(1)).to eq(true)
                expect(θ°(10) >= θ°(10)).to eq(true)
                expect(θ°(359) >= θ°(0)).to eq(true)
                expect(θ°(359) >= θ°(123)).to eq(true)
                expect(θ°(359) >= θ°(359)).to eq(true)
                expect(θ°(360) >= θᵍ(399)).to eq(true)
                expect(θ°(360) >= θʳ(1.9 * π)).to eq(true)
                expect(θ°(360) >= θ𝞽(0.99)).to eq(true)
                expect(θ°(360) >= θᵍ(400)).to eq(true)
                expect(θ°(360) >= θʳ(2.0 * π)).to eq(true)
                expect(θ°(360) >= θ𝞽(1.0)).to eq(true)
                expect(θ°(361) >= θᵍ(400)).to eq(true)
                expect(θ°(361) >= θʳ(2.0 * π)).to eq(true)
                expect(θ°(361) >= θ𝞽(1.0)).to eq(true)
              end
              it 'cases: negative' do
                expect(θ°(0) >= θ°(1)).to eq(false)
                expect(θ°(1) >= θ°(10)).to eq(false)
                expect(θ°(0) >= θ°(359)).to eq(false)
                expect(θ°(359) >= θᵍ(400)).to eq(false)
                expect(θ°(359) >= θʳ(2.0 * π)).to eq(false)
                expect(θ°(359) >= θ𝞽(1.0)).to eq(false)
              end
              it 'cases: error' do
                expect{θ°(1) >= nil}.to raise_error(ArgumentError)
              end
            end
          end # end: {func{>=}}
          context 'func{<=>}' do
            context 'handles needed scenarios' do
              it 'cases: positive' do
                expect(θ°(1) <=> θ°(0)).to eq(1)
                expect(θ°(10) <=> θ°(1)).to eq(1)
                expect(θ°(359) <=> θ°(0)).to eq(1)
                expect(θ°(359) <=> θ°(123)).to eq(1)
                expect(θ°(360) <=> θᵍ(399)).to eq(1)
                expect(θ°(360) <=> θʳ(1.9 * π)).to eq(1)
                expect(θ°(360) <=> θ𝞽(0.99)).to eq(1)
                expect(θ°(361) <=> θᵍ(400)).to eq(1)
                expect(θ°(361) <=> θʳ(2.0 * π)).to eq(1)
                expect(θ°(361) <=> θ𝞽(1.0)).to eq(1)
              end
              it 'cases: equal' do
                expect(θ°(0) <=> θ°(0)).to eq(0)
                expect(θ°(1) <=> θ°(1)).to eq(0)
                expect(θ°(359) <=> θ°(359)).to eq(0)
                expect(θ°(10) <=> θ°(10)).to eq(0)
                expect(θ°(360) <=> θᵍ(400)).to eq(0)
                expect(θ°(360) <=> θʳ(2.0 * π)).to eq(0)
                expect(θ°(360) <=> θ𝞽(1.0)).to eq(0)
              end
              it 'cases: negative' do
                expect(θᵍ(399) <=> θᵍ(400)).to eq(-1)
                expect(θ°(0) <=> θ°(1)).to eq(-1)
                expect(θ°(1) <=> θ°(10)).to eq(-1)
                expect(θ°(0) <=> θ°(359)).to eq(-1)
                expect(θ°(359) <=> θᵍ(400)).to eq(-1)
                expect(θ°(359) <=> θʳ(2.0 * π)).to eq(-1)
                expect(θ°(359) <=> θ𝞽(1.0)).to eq(-1)
              end
              it 'cases: nil' do
                expect(θ°(359) <=> nil).to eq(nil)
                expect(θ°(359) <=> 'asd').to eq(nil)
                expect(θ°(359) <=> :asd).to eq(nil)
              end
            end
          end # end: {func{<=>}}
        end # end: {comparison funcs}
        context 'func{∠?(:acute)}' do
          context 'handles needed scenarios' do
            it 'cases: positive' do
              [0, 45, 89].∀ {|scenario| expect((θ°(scenario).∠?(:acute))).to eq(true)}
              [0, π * ¼, (π * ½) * 0.95].∀ {|scenario| expect((θʳ(scenario).∠?(:acute))).to eq(true)}
              [0, 50, 99].∀ {|scenario| expect(θᵍ(scenario).∠?(:acute)).to eq(true)}
              [0, 0.1, 0.24, 0.2499].∀ {|scenario| expect(θ𝞽(scenario).∠?(:acute)).to eq(true)}
            end
            it 'cases: negative' do
              [-10, 90, 182, 361].∀ {|scenario| expect(θ°(scenario).∠?(:acute)).to eq(false)}
              [-π * ¼, π * ½, π, 2.0 * π, 2.0 * π + ¼].∀ {|scenario| expect(θʳ(scenario).∠?(:acute)).to eq(false)}
              [-10, 100, 101, 182, 361].∀ {|scenario| expect(θᵍ(scenario).∠?(:acute)).to eq(false)}
              [-0.1, ¼, 0.26].∀ {|scenario| expect(θ𝞽(scenario).∠?(:acute)).to eq(false)}
            end
          end # end: {handles needed scenarios}
        end # end: {func{∠?(:acute)}}
        context 'func{obtuse_angle?}' do
          context 'handles needed scenarios' do
            it 'cases: positive' do
              [91, 100, 145, 179].∀ {|scenario| expect((θ°(scenario).∠?(:obtuse))).to eq(true)}
              [π - ¼, (π * ½) * 1.25].∀ {|scenario| expect((θʳ(scenario).∠?(:obtuse))).to eq(true)}
              [101, 150, 199].∀ {|scenario| expect(θᵍ(scenario).∠?(:obtuse)).to eq(true)}
              [0.26, 0.35, 0.49].∀ {|scenario| expect(θ𝞽(scenario).∠?(:obtuse)).to eq(true)}
            end
            it 'cases: negative' do
              [-10, 0, 89, 90, 180, 181, 361].∀ {|scenario| expect(θ°(scenario).∠?(:obtuse)).to eq(false)}
              [-π * ¼, π * ½, π, 2.0 * π, 2.0 * π + ¼].∀ {|scenario| expect(θʳ(scenario).∠?(:obtuse)).to eq(false)}
              [-10, 0, 99, 100, 200, 201].∀ {|scenario| expect(θᵍ(scenario).∠?(:obtuse)).to eq(false)}
              [-0.1, 0, ½, 0.51].∀ {|scenario| expect(θ𝞽(scenario).∠?(:obtuse)).to eq(false)}
            end
          end # end: {handles needed scenarios}
        end # end: {func{obtuse_angle?}}
        context 'func{oblique_angle?}' do
          context 'handles needed scenarios' do
            it 'cases: positive' do
              [181, 200, 300, 359, 361].∀ {|scenario| expect((θ°(scenario).∠?(:oblique))).to eq(true)}
              [π + ¼, 2.0 * π - ¼].∀ {|scenario| expect((θʳ(scenario).∠?(:oblique))).to eq(true)}
              [201, 299, 399, 401].∀ {|scenario| expect(θᵍ(scenario).∠?(:oblique)).to eq(true)}
              [0.51, 0.76, 0.99, 1.01].∀ {|scenario| expect(θ𝞽(scenario).∠?(:oblique)).to eq(true)}
            end
            it 'cases: negative' do
              expect(θ°(90).∠?(:oblique)).to eq(false)
              expect(θ°((360 * 5) + 90).∠?(:oblique)).to eq(false)
              expect(θʳ(π * ½).∠?(:oblique)).to eq(false)
              expect(θᵍ(100).∠?(:oblique)).to eq(false)
              expect(θ𝞽(¼).∠?(:oblique)).to eq(false)
            end
          end # end: {handles needed scenarios}
        end # end: {func{oblique_angle?}}
        context 'func{sextant_angle?}' do
          context 'handles needed scenarios' do
            it 'cases: positive' do
              expect(θ°(60).∠?(:sextant)).to eq(true)
              # TODO: need to increase precision (utilize flags) to get around precision errors for the alt angle types
            end
            it 'cases: negative' do
              [-10, 0, 89, 90, 179, 180, 360, 361].∀ {|scenario| expect(θ°(scenario).∠?(:sextant)).to eq(false)}
              [π - ¼, 2.0 * π + ¼, π, 2.0 * π].∀ {|scenario| expect(θʳ(scenario).∠?(:sextant)).to eq(false)}
              [-10, 0, 199, 200, 400, 401].∀ {|scenario| expect(θᵍ(scenario).∠?(:sextant)).to eq(false)}
              [-0.1, 0, 0.49, ½, 1].∀ {|scenario| expect(θ𝞽(scenario).∠?(:sextant)).to eq(false)}
            end
          end # end: {handles needed scenarios}
        end # end: {func{sextant_angle?}}
        context 'func{reflex_angle?}' do
          context 'handles needed scenarios' do
            it 'cases: positive' do
              [181, 200, 300, 359].∀ {|scenario| expect((θ°(scenario).∠?(:reflex))).to eq(true)}
              [π + ¼, 2.0 * π - ¼].∀ {|scenario| expect((θʳ(scenario).∠?(:reflex))).to eq(true)}
              [201, 300, 399].∀ {|scenario| expect(θᵍ(scenario).∠?(:reflex)).to eq(true)}
              [0.51, 0.75, 0.99].∀ {|scenario| expect(θ𝞽(scenario).∠?(:reflex)).to eq(true)}
            end
            it 'cases: negative' do
              [-10, 0, 89, 90, 179, 180, 360, 361].∀ {|scenario| expect(θ°(scenario).∠?(:reflex)).to eq(false)}
              [π - ¼, 2.0 * π + ¼, π, 2.0 * π].∀ {|scenario| expect(θʳ(scenario).∠?(:reflex)).to eq(false)}
              [-10, 0, 199, 200, 400, 401].∀ {|scenario| expect(θᵍ(scenario).∠?(:reflex)).to eq(false)}
              [-0.1, 0, 0.49, ½, 1].∀ {|scenario| expect(θ𝞽(scenario).∠?(:reflex)).to eq(false)}
            end
          end # end: {handles needed scenarios}
        end # end: {func{reflex_angle?}}
        context 'func{zero_angle?}' do
          context 'handles needed scenarios' do
            it 'cases: positive' do
              expect(θ°(0).∠?(:zero)).to eq(true)
              expect(θʳ(0).∠?(:zero)).to eq(true)
              expect(θᵍ(0).∠?(:zero)).to eq(true)
              expect(θ𝞽(0).∠?(:zero)).to eq(true)
            end
            it 'cases: negative' do
              [-10, 89, 91, 182, 361].∀ {|scenario| expect(θ°(scenario).∠?(:zero)).to eq(false)}
              [-π * ¼, 1, π * ½ + 1, π, 2.0 * π, 2.0 * π + ¼].∀ {|scenario| expect(θʳ(scenario).∠?(:zero)).to eq(false)}
              [-10, 99, 101, 182, 361].∀ {|scenario| expect(θᵍ(scenario).∠?(:zero)).to eq(false)}
              [-0.1, 0.24, 0.26, 0.49, 0.51, 1].∀ {|scenario| expect(θ𝞽(scenario).∠?(:zero)).to eq(false)}
            end
          end # end: {handles needed scenarios}
        end # end: {func{right_angle?}}
        context 'func{right_angle?}' do
          context 'handles needed scenarios' do
            it 'cases: positive' do
              expect(θ°(90).∠?(:right)).to eq(true)
              expect(θʳ(π * ½).∠?(:right)).to eq(true)
              expect(θᵍ(100).∠?(:right)).to eq(true)
              expect(θ𝞽(¼).∠?(:right)).to eq(true)
            end
            it 'cases: negative' do
              [-10, 0, 89, 91, 182, 361].∀ {|scenario| expect(θ°(scenario).∠?(:right)).to eq(false)}
              [-π * ¼, 0, 1, π * ½ + 1, π, 2.0 * π, 2.0 * π + ¼].∀ {|scenario| expect(θʳ(scenario).∠?(:right)).to eq(false)}
              [-10, 0, 99, 101, 182, 361].∀ {|scenario| expect(θᵍ(scenario).∠?(:right)).to eq(false)}
              [-0.1, 0, 0.24, 0.26, 0.49, 0.51, 1].∀ {|scenario| expect(θ𝞽(scenario).∠?(:right)).to eq(false)}
            end
          end # end: {handles needed scenarios}
        end # end: {func{right_angle?}}
        context 'func{straight_angle?}' do
          context 'handles needed scenarios' do
            it 'cases: positive' do
              expect(θ°(180).∠?(:straight)).to eq(true)
              expect(θʳ(π).∠?(:straight)).to eq(true)
              expect(θᵍ(200).∠?(:straight)).to eq(true)
              expect(θ𝞽(½).∠?(:straight)).to eq(true)
            end
            it 'cases: negative' do
              [-10, 0, 89, 91, 182, 259, 299, 361, 360.1337, 1337].∀ {|scenario| expect(θ°(scenario).∠?(:straight)).to eq(false)}
              [-π * ¼, 0, 1, π * ½ + 1, 2.0 * π + ¼].∀ {|scenario| expect(θʳ(scenario).∠?(:straight)).to eq(false)}
              [-10, 0, 99, 101, 182, 361, 399, 359, 401, 1337].∀ {|scenario| expect(θᵍ(scenario).∠?(:straight)).to eq(false)}
              [-0.1, 0, 0.24, ¼, 0.26, 0.49, 0.51, 1].∀ {|scenario| expect(θ𝞽(scenario).∠?(:straight)).to eq(false)}
            end
          end # end: {handles needed scenarios}
        end # end: {func{straight_angle?}}
        context 'func{perigon_angle?}' do
          context 'handles needed scenarios' do
            it 'cases: positive' do
              expect(θ°(360).∠?(:perigon)).to eq(true)
              expect(θʳ(π * 2.0).∠?(:perigon)).to eq(true)
              expect(θᵍ(400).∠?(:perigon)).to eq(true)
              expect(θ𝞽(1).∠?(:perigon)).to eq(true)
            end
            it 'cases: negative' do
              [-10, 0, 89, 91, 182, 259, 299, 361, 360.1337, 1337].∀ {|scenario| expect(θ°(scenario).∠?(:perigon)).to eq(false)}
              [-π * ¼, 0, 1, π * ½ + 1, π, 2.0 * π + ¼].∀ {|scenario| expect(θʳ(scenario).∠?(:perigon)).to eq(false)}
              [-10, 0, 99, 101, 182, 361, 399, 359, 401, 1337].∀ {|scenario| expect(θᵍ(scenario).∠?(:perigon)).to eq(false)}
              [-0.1, 0, ½, 1.5, 1337, 0.99, 1.01].∀ {|scenario| expect(θᵍ(scenario).∠?(:perigon)).to eq(false)}
            end
          end # end: {handles needed scenarios}
        end # end: {func{perigon_angle?}}
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
                      expect(result.class).to eq(Float)
                      expect(result).to eq(45.0)

                      result = θ°(360.0) / θʳ(2.0 * π)
                      expect(result).to eq(1.0)
                      expect(result.class).to eq(Float)
                    end
                    it 'type{θ} / type{Numeric} --> type{θ}' do
                      angle_a = θ°(90)
                      result  = angle_a / 2.0
                      expect(result.class).to eq(ThetaAngle)
                      expect(result).to eq(45.0)
                    end
                    it 'type{Numeric} / type{θ} --> type{θ}' do
                      angle_a = θ°(2)
                      result  = 90.0 / angle_a
                      expect(result.class).to eq(ThetaAngle)
                      expect(result).to eq(45.0)

                      result_2 = angle_a / 2.0
                      result_3 = result / 2.0
                      expect(result_2.class).to eq(ThetaAngle)
                      expect(result_3.class).to eq(ThetaAngle)

                      expect(angle_a.real).to eq(2.0)
                      expect(result.real).to eq(45.0)
                      expect(result_2.real).to eq(1.0)
                      expect(result_3.real).to eq(45.0 / 2.0)

                      angle_a = θ°(2)
                      result  = 90.0 / angle_a
                      expect(result.class).to eq(ThetaAngle)
                      angle_b = 450.0 / result
                      expect(angle_b.class).to eq(ThetaAngle)
                      expect(angle_b.real).to eq(10.0)
                      expect(result.real).to eq(45.0)

                      angle_c = θ°(100) / angle_b
                      expect(angle_c.class).to eq(Float)
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
                  expect(result.class).to eq(Float)
                  expect(result).to eq(2.0)
                end
                it 'type{θ} % type{Float} --> type{θ}' do
                  angle_a = θ°(12)
                  result  = angle_a % 5.0
                  expect(result.class).to eq(ThetaAngle)
                  expect(result).to eq(2.0)
                end
                it 'type{Float} % type{θ} --> type{θ}' do
                  angle_a = θ°(5.0)
                  result  = 12.0 % angle_a
                  expect(result.class).to eq(ThetaAngle)
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
      context 'func{to_a}' do
        context 'handles needed scenarios' do
          it 'cases: all' do
            expect(θ°(1337.1337).to_a).to eq([1337.1337, :as_degree])
            expect(θʳ(1337.1337).to_a).to eq([1337.1337, :as_radian])
            expect(θᵍ(1337.1337).to_a).to eq([1337.1337, :as_gon])
            expect(θ𝞽(1337.1337).to_a).to eq([1337.1337, :as_turn])
          end
        end # end: {handles needed scenarios}
      end # end: {func{to_a}}
      context 'func{to_s}' do
        context 'handles needed scenarios' do
          it 'cases: all' do
            expect(θ°(1337.1337).to_s).to eq('1337.1337°θ')
            expect(θʳ(1337.1337).to_s).to eq('1337.1337ʳθ')
            expect(θᵍ(1337.1337).to_s).to eq('1337.1337ᵍθ')
            expect(θ𝞽(1337.1337).to_s).to eq('1337.1337𝞽θ')
          end
        end # end: {handles needed scenarios}
      end # end: {func{to_s}}
      context 'func{repr}' do
        context 'handles needed scenarios' do
          it 'cases: all' do
            expect(θ°(1337.1337).repr).to eq(:as_degree)
            expect(θʳ(1337.1337).repr).to eq(:as_radian)
            expect(θᵍ(1337.1337).repr).to eq(:as_gon)
            expect(θ𝞽(1337.1337).repr).to eq(:as_turn)
          end
        end # end: {handles needed scenarios}
      end # end: {func{repr}}
    end # end: {w/ needed funcs}
  end # end: {creates class[ThetaAngle]}
end # end: {theta_angle}
