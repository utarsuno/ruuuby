# coding: UTF-8

RSpec.describe 'f27_b05' do

  context 'functionality' do
    context 'static functions / constructors' do
      let(:scenarios_zero_rad){['0', '0.0', '0.0ʳ', '0.0 ʳ', '0.0radians', '0.0 radians', '0.0rad', '0.0 rad', '0.0urad', '0.0 urad', '0.0mrad', '0.0 mrad']}
      let(:scenarios_zero_dgr){['0', '0.0', '0.0°', '0.0 °', '0.0degrees', '0.0 degrees', '0.0dgr', '0.0 dgr', "0.0'", "0.0 '", "0.0''", "0.0 ''"]}
      let(:scenarios_zero_gon){['0', '0.0', '0.0ᵍ', '0.0 ᵍ', '0.0gons', '0.0 gons', '0.0gon', '0.0 gon']}
      let(:scenarios_zero_trn){['0', '0.0', '0.0turns', '0.0 turns', '0.0trn', '0.0 trn']}

      let(:scenarios_rad){['60', '60ʳ', '60 ʳ', '60rad', '60 rad', '60radians', '60 radians']}
      let(:scenarios_rad_decimals){['60.1337', '60.1337ʳ', '60.1337 ʳ', '60.1337rad', '60.1337 rad', '60.1337radians', '60.1337 radians']}
      let(:scenarios_rad_mrad){['60mrad', '60 mrad']}
      let(:scenarios_rad_urad){['60urad', '60 urad']}
      let(:scenarios_rad_mrad_decimals){['60.1337mrad', '60.1337 mrad']}
      let(:scenarios_rad_urad_decimals){['60.1337urad', '60.1337 urad']}
      let(:scenarios_dgr){['60', '60°', '60 °', '60dgr', '60 dgr', '60degrees', '60 degrees']}
      let(:scenarios_dgr_arc_minute){["60'", "60 '", "60arc-minutes", "60 arc-minutes"]}
      let(:scenarios_dgr_arc_second){["60''", "60 ''", "60arc-seconds", "60 arc-seconds"]}
      let(:scenarios_dgr_decimals){['60.1337', '60.1337°', '60.1337 °', '60.1337dgr', '60.1337 dgr', '60.1337degrees', '60.1337 degrees']}
      let(:scenarios_dgr_arc_minute_decimals){["60.1337'", "60.1337 '", "60.1337arc-minutes", "60.1337 arc-minutes"]}
      let(:scenarios_dgr_arc_second_decimals){["60.1337''", "60.1337 ''", "60.1337arc-seconds", "60.1337 arc-seconds"]}

      let(:scenarios_gon){['60', '60ᵍ', '60 ᵍ', '60gon', '60 gon', '60gons', '60 gons']}
      let(:scenarios_gon_decimals){['60.1337', '60.1337ᵍ', '60.1337 ᵍ', '60.1337gon', '60.1337 gon', '60.1337gons', '60.1337 gons']}
      let(:scenarios_trn){['60', '60.0', '60trn', '60 trn', '60turns', '60 turns']}
      let(:scenarios_trn_decimals){['60.1337', '60.1337', '60.1337trn', '60.1337 trn', '60.1337turns', '60.1337 turns']}

      let(:scenarios_symbolic){%w(S 1.5S 2S S/4 4S/4 4S/4.5)}
      let(:scenarios_symbolic_values_pie){[π, 1.5 * π, 2.0 * π, π / 4.0, π, 4.0 * π / 4.5]}
      let(:scenarios_symbolic_values_golden_ratio){[𝚽, 1.5 * 𝚽, 2.0 * 𝚽, 𝚽 / 4.0, 𝚽, 4.0 * 𝚽 / 4.5]}

      # TODO: polar-form conversions
      #
      # ∠
      # VALUE rb_dbl_complex_new_polar_pi(double abs, double ang);

      context 'func{new_radian}' do
        context 'handles needed scenarios' do
          context 'cases: positive' do
            context 'w/ str' do
              it 'w/ zero' do
                scenarios_zero_rad.∀ do |scenario|
                  expect_theta_angle_rad(θʳ(scenario), 0)
                  expect_theta_angle_rad(θʳ("-#{scenario}"), 0)
                end
              end
              it 'w/ regular data' do
                scenarios_rad.∀ₓᵢ do |scenario, index|
                  expect_theta_angle_rad(θʳ(scenario), 60)
                  expect_theta_angle_rad(θʳ("-#{scenario}"), -60)
                end
                scenarios_rad_mrad.∀ₓᵢ do |scenario, index|
                  expect_theta_angle_rad(θʳ(scenario),  60 / 1000.0)
                  expect_theta_angle_rad(θʳ("-#{scenario}"),  -60 / 1000.0)
                end
                scenarios_rad_urad.∀ₓᵢ do |scenario, index|
                  expect_theta_angle_rad(θʳ(scenario),  60.0 / 10000.0)
                  expect_theta_angle_rad(θʳ("-#{scenario}"),  -60.0 / 10000.0)
                end
              end
              it 'w/ decimals' do
                scenarios_rad_decimals.∀ do |scenario|
                  expect_theta_angle_rad(θʳ(scenario),  60.1337)
                  expect_theta_angle_rad(θʳ("-#{scenario}"),  -60.1337)
                end
                scenarios_rad_mrad_decimals.∀ do |scenario|
                  expect_theta_angle_rad(θʳ(scenario),  60.1337 / 1000.0)
                  expect_theta_angle_rad(θʳ("-#{scenario}"),  -60.1337 / 1000.0)
                end
                scenarios_rad_urad_decimals.∀ do |scenario|
                  expect_theta_angle_rad(θʳ(scenario),  60.1337 / 10000.0)
                  expect_theta_angle_rad(θʳ("-#{scenario}"),  -60.1337 / 10000.0)
                end
              end
              context 'w/ symbolic vals' do
                it 'π' do
                  scenarios_symbolic.∀ₓᵢ do |scenario, i|
                    expect_theta_angle_rad(θʳ(scenario.gsub('S', 'π')),  scenarios_symbolic_values_pie[i])
                    expect_theta_angle_rad(θʳ("-#{scenario.gsub('S', 'π')}"),  -1.0 * scenarios_symbolic_values_pie[i])
                  end
                end
                it '𝚽' do
                  scenarios_symbolic.∀ₓᵢ{|scenario, i| expect_theta_angle_rad(θʳ(scenario.gsub('S', '𝚽')),  scenarios_symbolic_values_golden_ratio[i])}
                end
              end # end: {w/ symbolic vals}
            end
          end # end: {cases: positive}
          context 'cases: negative' do
            context 'w/ bad str' do
              it 'w/o numerical content' do
                expect{θʳ('ʳ')}.to raise_error(::RuntimeError)
                expect{θʳ('dgr')}.to raise_error(::RuntimeError)
                expect{θʳ('degrees')}.to raise_error(::RuntimeError)
                expect{θʳ(' dgr')}.to raise_error(::RuntimeError)
                expect{θʳ(' degrees')}.to raise_error(::RuntimeError)
              end
              it 'w/ empty content' do
                expect{θʳ('')}.to raise_error(::RuntimeError)
                expect{θʳ(' ')}.to raise_error(::RuntimeError)
                expect{θʳ('-')}.to raise_error(::RuntimeError)
              end
              it 'w/ nearly good data' do
                expect{θʳ(' 60')}.to raise_error(::RuntimeError)
                expect{θʳ('60ʳʳ')}.to raise_error(::RuntimeError)
                expect{θʳ('ʳ60 ʳ')}.to raise_error(::RuntimeError)
                expect{θʳ('.60ʳθ')}.to raise_error(::RuntimeError)
                expect{θʳ('.60 ʳθ')}.to raise_error(::RuntimeError)
                expect{θʳ('60 rads')}.to raise_error(::RuntimeError)
                expect{θʳ('60 radian')}.to raise_error(::RuntimeError)
              end
            end
          end # end: {cases: negative}
        end
      end # end: {func{new_radian}}

      context 'func{new_degree}' do
        context 'handles needed scenarios' do
          context 'cases: positive' do
            context 'w/ str' do
              context 'w/ positive vals' do
                it 'w/ zero' do
                  scenarios_zero_dgr.∀ do |scenario|
                    expect_theta_angle_dgr(θ°(scenario), 0)
                    expect_theta_angle_dgr(θ°("-#{scenario}"),  0)
                  end
                end
                it 'w/ regular data' do
                  scenarios_dgr.∀ do |scenario|
                    expect_theta_angle_dgr(θ°(scenario), 60)
                    expect_theta_angle_dgr(θ°("-#{scenario}"),  -60)
                  end
                  scenarios_dgr_arc_minute.∀ do |scenario|
                    expect_theta_angle_dgr(θ°(scenario), 1)
                    expect_theta_angle_dgr(θ°("-#{scenario}"),  -1)
                  end
                  scenarios_dgr_arc_second.∀ do |scenario|
                    expect_theta_angle_dgr(θ°(scenario), 1.0 / 60.0)
                    expect_theta_angle_dgr(θ°("-#{scenario}"), -1.0 / 60.0)
                  end
                end
                it 'w/ multi-parted value' do
                  expect_theta_angle_dgr(θ°("60'60''"),  1 + 1 / 60.0)
                  expect_theta_angle_dgr(θ°("60°60''"), 60 + 1 / 60.0)

                  expect_theta_angle_dgr(θ°("60' 60''"),  1 + 1 / 60.0)
                  expect_theta_angle_dgr(θ°("60° 60''"),  60 + 1 / 60.0)

                  expect_theta_angle_dgr(θ°("60°60'60''"),  60 + 1 + 1 / 60.0)
                  expect_theta_angle_dgr(θ°("60°60' 60''"),  60 + 1 + 1 / 60.0)
                  expect_theta_angle_dgr(θ°("60° 60'60''"),  60 + 1 + 1 / 60.0)
                  expect_theta_angle_dgr(θ°("60° 60' 60''"),  60 + 1 + 1 / 60.0)
                end
                context 'w/ symbolic vals' do
                  it 'π' do
                    scenarios_symbolic.∀ₓᵢ do |scenario, i|
                      expect_theta_angle_dgr(θ°(scenario.gsub('S', 'π')),  scenarios_symbolic_values_pie[i])
                      expect_theta_angle_dgr(θ°("-#{scenario.gsub('S', 'π')}"),  -1.0 * scenarios_symbolic_values_pie[i])
                    end
                  end
                  it '𝚽' do
                    scenarios_symbolic.∀ₓᵢ do |scenario, i|
                      expect_theta_angle_dgr(θ°(scenario.gsub('S', '𝚽')),  scenarios_symbolic_values_golden_ratio[i])
                      expect_theta_angle_dgr(θ°("-#{scenario.gsub('S', '𝚽')}"),  -1.0 * scenarios_symbolic_values_golden_ratio[i])
                    end
                    scenarios_symbolic.∀ₓᵢ{|scenario, i| expect_theta_angle_dgr(θ°(scenario.gsub('S', '𝚽')),  scenarios_symbolic_values_golden_ratio[i])}
                  end
                end # end: {w/ symbolic vals}
              end
              context 'w/ decimals' do
                it 'singular data pieces' do
                  scenarios_dgr_decimals.∀ do |scenario|
                    expect_theta_angle_dgr(θ°(scenario), 60.1337)
                    expect_theta_angle_dgr(θ°("-#{scenario}"),  -60.1337)
                  end
                  scenarios_dgr_arc_minute_decimals.∀ do |scenario|
                    expect_theta_angle_dgr(θ°(scenario), 60.1337 / 60.0)
                    expect_theta_angle_dgr(θ°("-#{scenario}"),  -60.1337 / 60.0)
                  end
                  scenarios_dgr_arc_second_decimals.∀ do |scenario|
                    expect_theta_angle_dgr(θ°(scenario), (60.1337 / 60.0) / 60.0)
                    expect_theta_angle_dgr(θ°("-#{scenario}"), (-60.1337 / 60.0) / 60.0)
                  end
                end
                it 'multi-part' do
                  expect_theta_angle_dgr(θ°("60.1337°60'"),  60.1337 + 1)
                  expect_theta_angle_dgr(θ°("60.1337° 60''"),  60.1337 + 1 / 60.0)

                  expect_theta_angle_dgr(θ°("60.1337'60.1337''"), 60.1337 / 60 + (60.1337 / 60) / 60.0)
                  expect_theta_angle_dgr(θ°("60.1337°60.1337''"),  60.1337 + (60.1337 / 60) / 60.0)

                  expect_theta_angle_dgr(θ°("60.1337' 60.1337''"),  (60.1337 / 60) + (60.1337 / 60) / 60.0)
                  expect_theta_angle_dgr(θ°("60.1337° 60.1337''"), 60.1337 + (60.1337 / 60) / 60.0)

                  expect_theta_angle_dgr(θ°("60.1337°60.1337'60.1337''"), 60.1337 + (60.1337 / 60) + (60.1337 / 60) / 60.0)
                  expect_theta_angle_dgr(θ°("60.1337°60.1337' 60.1337''"),  60.1337 + (60.1337 / 60) + (60.1337 / 60) / 60.0)
                  expect_theta_angle_dgr(θ°("60.1337° 60.1337'60.1337''"),  60.1337 + (60.1337 / 60) + (60.1337 / 60) / 60.0)
                  expect_theta_angle_dgr(θ°("60.1337° 60.1337' 60.1337''"),  60.1337 + (60.1337 / 60) + (60.1337 / 60) / 60.0)
                end
              end
            end
          end
          context 'cases: negative' do
            context 'w/ bad str' do
              it 'w/o numerical content' do
                expect{θ°('°')}.to raise_error(::RuntimeError)
                expect{θ°('dgr')}.to raise_error(::RuntimeError)
                expect{θ°('degrees')}.to raise_error(::RuntimeError)
                expect{θ°(' dgr')}.to raise_error(::RuntimeError)
                expect{θ°(' degrees')}.to raise_error(::RuntimeError)
              end
              it 'w/ empty content' do
                expect{θ°('')}.to raise_error(::RuntimeError)
                expect{θ°(' ')}.to raise_error(::RuntimeError)
                expect{θ°('-')}.to raise_error(::RuntimeError)
              end
              it 'w/ nearly good data' do
                expect{θ°(' 60')}.to raise_error(::RuntimeError)
                expect{θ°('60°°')}.to raise_error(::RuntimeError)
                expect{θ°('°60 °')}.to raise_error(::RuntimeError)
                expect{θ°('.60°θ')}.to raise_error(::RuntimeError)
                expect{θ°('.60 °θ')}.to raise_error(::RuntimeError)
                expect{θ°('60 dgrs')}.to raise_error(::RuntimeError)
                expect{θ°('60 degree')}.to raise_error(::RuntimeError)
              end
            end
          end # end: {cases: negative}
        end
      end # end: {func{new_degree}}

      context 'func{new_gon}' do
        context 'handles needed scenarios' do
          context 'cases: positive' do
            context 'w/ str' do
              context 'w/ positive vals' do
                it 'w/ zero' do
                  scenarios_zero_gon.∀ do |scenario|
                    expect_theta_angle_gon(θᵍ(scenario), 0)
                    expect_theta_angle_gon(θᵍ("-#{scenario}"), 0)
                  end
                end
                it 'w/ regular data' do
                  scenarios_gon.∀ do |scenario|
                    expect_theta_angle_gon(θᵍ(scenario), 60)
                    expect_theta_angle_gon(θᵍ("-#{scenario}"), -60)
                  end
                end
                it 'w/ decimal data' do
                  scenarios_gon_decimals.∀ do |scenario|
                    expect_theta_angle_gon(θᵍ(scenario), 60.1337)
                    expect_theta_angle_gon(θᵍ("-#{scenario}"), -60.1337)
                  end
                end
                context 'w/ symbolic vals' do
                  it 'π' do
                    scenarios_symbolic.∀ₓᵢ do |scenario, i|
                      expect_theta_angle_gon(θᵍ(scenario.gsub('S', 'π')),  scenarios_symbolic_values_pie[i])
                      expect_theta_angle_gon(θᵍ("-#{scenario.gsub('S', 'π')}"),  -1.0 * scenarios_symbolic_values_pie[i])
                    end
                  end
                  it '𝚽' do
                    scenarios_symbolic.∀ₓᵢ{|scenario, i| expect_theta_angle_gon(θᵍ(scenario.gsub('S', '𝚽')),  scenarios_symbolic_values_golden_ratio[i])}
                  end
                end # end: {w/ symbolic vals}
              end
            end
          end # end: {cases: positive}
          context 'cases: negative' do
            context 'w/ bad str' do
              it 'w/o numerical content' do
                expect{θᵍ('ᵍ')}.to raise_error(::RuntimeError)
                expect{θᵍ('gon')}.to raise_error(::RuntimeError)
                expect{θᵍ('gons')}.to raise_error(::RuntimeError)
                expect{θᵍ(' gon')}.to raise_error(::RuntimeError)
                expect{θᵍ(' gons')}.to raise_error(::RuntimeError)
              end
              it 'w/ empty content' do
                expect{θᵍ('')}.to raise_error(::RuntimeError)
                expect{θᵍ(' ')}.to raise_error(::RuntimeError)
                expect{θᵍ('-')}.to raise_error(::RuntimeError)
              end
              it 'w/ nearly good data' do
                expect{θᵍ(' 60')}.to raise_error(::RuntimeError)
                expect{θᵍ('60ᵍᵍ')}.to raise_error(::RuntimeError)
                expect{θᵍ('ᵍ60 ᵍ')}.to raise_error(::RuntimeError)
                expect{θᵍ('.60ᵍθ')}.to raise_error(::RuntimeError)
                expect{θᵍ('.60 ᵍθ')}.to raise_error(::RuntimeError)
                expect{θᵍ('60 gonsᵍ')}.to raise_error(::RuntimeError)
                expect{θᵍ('60 ᵍ gon')}.to raise_error(::RuntimeError)
              end
            end
          end # end: {cases: negative}
        end
      end # end: {func{new_gon}}

      context 'func{new_turn}' do
        context 'handles needed scenarios' do
          context 'cases: positive' do
            context 'w/ str' do
              context 'w/ positive vals' do
                it 'w/ zero' do
                  scenarios_zero_trn.∀ do |scenario|
                    expect_theta_angle_trn(θ𝞽(scenario), 0)
                    expect_theta_angle_trn(θ𝞽("-#{scenario}"), 0)
                  end
                end
                it 'w/ regular data' do
                  scenarios_trn.∀ do |scenario|
                    expect_theta_angle_trn(θ𝞽(scenario),  60)
                    expect_theta_angle_trn(θ𝞽("-#{scenario}"), -60)
                  end
                end
                it 'w/ decimal data' do
                  scenarios_trn_decimals.∀ do |scenario|
                    expect_theta_angle_trn(θ𝞽(scenario), 60.1337)
                    expect_theta_angle_trn(θ𝞽("-#{scenario}"), -60.1337)
                  end
                end
                context 'w/ symbolic vals' do
                  it 'π' do
                    scenarios_symbolic.∀ₓᵢ do |scenario, i|
                      expect_theta_angle_trn(θ𝞽(scenario.gsub('S', 'π')),  scenarios_symbolic_values_pie[i])
                      expect_theta_angle_trn(θ𝞽("-#{scenario.gsub('S', 'π')}"),  -1.0 * scenarios_symbolic_values_pie[i])
                    end
                  end
                  it '𝚽' do
                    scenarios_symbolic.∀ₓᵢ{|scenario, i| expect_theta_angle_trn(θ𝞽(scenario.gsub('S', '𝚽')),  scenarios_symbolic_values_golden_ratio[i])}
                  end
                end # end: {w/ symbolic vals}
              end
            end
          end # end: {cases: positive}
          context 'cases: negative' do
            context 'w/ bad str' do
              it 'w/o numerical content' do
                expect{θ𝞽('ᵍ')}.to raise_error(::RuntimeError)
                expect{θ𝞽('gon')}.to raise_error(::RuntimeError)
                expect{θ𝞽('gons')}.to raise_error(::RuntimeError)
                expect{θ𝞽(' gon')}.to raise_error(::RuntimeError)
                expect{θ𝞽(' gons')}.to raise_error(::RuntimeError)
              end
              it 'w/ empty content' do
                expect{θ𝞽('')}.to raise_error(::RuntimeError)
                expect{θ𝞽(' ')}.to raise_error(::RuntimeError)
                expect{θ𝞽('-')}.to raise_error(::RuntimeError)
              end
              it 'w/ nearly good data' do
                expect{θ𝞽(' 60')}.to raise_error(::RuntimeError)
                expect{θ𝞽('60𝞽𝞽')}.to raise_error(::RuntimeError)
                expect{θ𝞽('𝞽60 𝞽')}.to raise_error(::RuntimeError)
                expect{θ𝞽('.60𝞽θ')}.to raise_error(::RuntimeError)
                expect{θ𝞽('.60 𝞽θ')}.to raise_error(::RuntimeError)
                expect{θ𝞽('60 turns𝞽')}.to raise_error(::RuntimeError)
                expect{θ𝞽('60 turn')}.to raise_error(::RuntimeError)
              end
            end
          end # end: {cases: negative}
        end
      end # end: {func{new_turn}}

    end # end: {static functions / constructors}
  end # end: {functionality}

  context 'audit', :audit do
    context 'static functions provided are' do
      context 'defined in correct location' do
        it 'for module{ContextStrParsing}' do
          expect_∃ᵐ(:ContextStrParsing, ::ThetaAngle)
        end
      end
    end
  end # end: {audit}

end
