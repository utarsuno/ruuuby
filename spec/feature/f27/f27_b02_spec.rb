# coding: UTF-8

RSpec.describe 'f27_b02' do

  context 'functionality' do
    context 'static functions / constructors' do

      context 'func{new_radian}' do
        context 'handles needed scenarios' do
          context 'cases: positive' do
            it 'w/ numerics' do
              expect_theta_angle(::ThetaAngle.new_radian(1337), 3, 1337)
              expect_theta_angle(::ThetaAngle.new_radian(1337.0), 3, 1337)
            end
            it 'w/ ThetaAngle' do
              expect_theta_angle(::ThetaAngle.new_radian(θʳ(1337.0)), 3, 1337)
              expect_theta_angle(::ThetaAngle.new_radian(θ°(360)), 3, π * 2)
              expect_theta_angle(::ThetaAngle.new_radian(θᵍ(400)), 3, π * 2)
              expect_theta_angle(::ThetaAngle.new_radian(θ𝞽(1)), 3, π * 2)
            end
          end
          context 'cases: negative' do
            it 'bad arg' do
              expect{θʳ(nil)}.to raise_error(::ArgumentError)
              expect{::ThetaAngle.new_radian(nil)}.to raise_error(::ArgumentError)
            end
          end
        end
      end # end: {func{new_radian}}
      context 'func{new_degree}' do
        context 'handles needed scenarios' do
          context 'cases: positive' do
            it 'w/ numerics' do
              expect_theta_angle(::ThetaAngle.new_degree(1337), 4, 1337)
              expect_theta_angle(::ThetaAngle.new_degree(1337.0), 4, 1337)
            end
            it 'w/ ThetaAngle' do
              expect_theta_angle(::ThetaAngle.new_degree(θʳ(π * 2)), 4, 360)
              expect_theta_angle(::ThetaAngle.new_degree(θ°(360)), 4, 360)
              expect_theta_angle(::ThetaAngle.new_degree(θᵍ(400)), 4, 360)
              expect_theta_angle(::ThetaAngle.new_degree(θ𝞽(1)), 4, 360)
            end
          end
          context 'cases: negative' do
            it 'bad arg' do
              expect{θ𝞽(nil)}.to raise_error(::ArgumentError)
              expect{::ThetaAngle.new_turn(nil)}.to raise_error(::ArgumentError)
            end
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
          end
        end
      end # end: {func{new_degree}}

      context 'func{new_gon}' do
        context 'handles needed scenarios' do
          context 'cases: positive' do
            it 'w/ numerics' do
              expect_theta_angle(::ThetaAngle.new_gon(1337), 6, 1337)
              expect_theta_angle(::ThetaAngle.new_gon(1337.0), 6, 1337)
            end
            it 'w/ ThetaAngle' do
              expect_theta_angle(::ThetaAngle.new_gon(θʳ(π * 2)), 6, 400)
              expect_theta_angle(::ThetaAngle.new_gon(θ°(360)), 6, 400)
              expect_theta_angle(::ThetaAngle.new_gon(θᵍ(400)), 6, 400)
              expect_theta_angle(::ThetaAngle.new_gon(θ𝞽(1)), 6, 400)
            end
          end
          context 'cases: negative' do
            it 'bad arg' do
              expect{θᵍ(nil)}.to raise_error(::ArgumentError)
              expect{::ThetaAngle.new_gon(nil)}.to raise_error(::ArgumentError)
            end
          end
        end
      end # end: {func{new_gon}}
      context 'func{new_turn}' do
        context 'handles needed scenarios' do
          context 'cases: positive' do
            it 'w/ numerics' do
              expect_theta_angle(::ThetaAngle.new_turn(1337), 5, 1337)
              expect_theta_angle(::ThetaAngle.new_turn(1337.0), 5, 1337)
            end
            it 'w/ ThetaAngle' do
              expect_theta_angle(::ThetaAngle.new_turn(θʳ(π * 2)), 5, 1)
              expect_theta_angle(::ThetaAngle.new_turn(θ°(360)), 5, 1)
              expect_theta_angle(::ThetaAngle.new_turn(θᵍ(400)), 5, 1)
              expect_theta_angle(::ThetaAngle.new_turn(θ𝞽(1)), 5, 1)
            end
          end
          context 'cases: negative' do
            it 'bad arg' do
              expect{θ𝞽(nil)}.to raise_error(::ArgumentError)
              expect{::ThetaAngle.new_turn(nil)}.to raise_error(::ArgumentError)
            end
          end
        end
      end # end: {func{new_turn}}

      context 'other constructor checks' do
        context 'each representation received a unique object' do
          it 'w/ correct class' do
            expect(as_degrees.ⓣ).to eq(::ThetaAngle)
            expect(as_radians.ⓣ).to eq(::ThetaAngle)
            expect(as_gons.ⓣ).to eq(::ThetaAngle)
            expect(as_turns.ⓣ).to eq(::ThetaAngle)
          end
          context 'unique instance checks' do
            it 'w/ different object-IDs' do
              expect(as_degrees.🆔).to_not eq(as_radians.🆔)
              expect(as_degrees.🆔).to_not eq(as_gons.🆔)
              expect(as_degrees.🆔).to_not eq(as_turns.🆔)
              expect(as_radians.🆔).to_not eq(as_gons.🆔)
              expect(as_radians.🆔).to_not eq(as_turns.🆔)
              expect(as_gons.🆔).to_not eq(as_turns.🆔)
            end
            it 'same param arg still generates new instance' do
              expect(θ°(360).🆔).to_not eq(θ°(360).🆔)
              expect(θʳ(360).🆔).to_not eq(θʳ(360).🆔)
              expect(θᵍ(360).🆔).to_not eq(θᵍ(360).🆔)
              expect(θ𝞽(360).🆔).to_not eq(θ𝞽(360).🆔)
            end
          end
          it 'w/ working equal comparisons' do
            expect(as_degrees).to eq(θ°(300) + θ°(60))
            expect(as_radians).to eq(θʳ(π) + θʳ(π))
            expect(as_gons).to eq(θᵍ(300) + θᵍ(100.0))
            expect(as_turns).to eq(θ𝞽(0.5) + θ𝞽(0.5))
          end
        end
      end

    end # end: {static functions / constructors}
  end # end: {functionality}

  context 'audit', :audit do
    context 'static functions provided are' do
      context 'defined in correct location' do
        it 'for module{Kernel}' do
          expect_∃⨍(:θ°, ::Ruuuby::Feature::Extendable::MainF28)
          expect_∃⨍(:θʳ, ::Ruuuby::Feature::Extendable::MainF28)
          expect_∃⨍(:θᵍ, ::Ruuuby::Feature::Extendable::MainF28)
          expect_∃⨍(:θ𝞽, ::Ruuuby::Feature::Extendable::MainF28)
        end
        it 'for class{ThetaAngle}' do
          expect_∃static⨍(:new_radian, ::ThetaAngle)
          expect_∃static⨍(:new_degree, ::ThetaAngle)
          expect_∃static⨍(:new_gon, ::ThetaAngle)
          expect_∃static⨍(:new_turn, ::ThetaAngle)
        end
      end
    end
  end # end: {audit}

end
