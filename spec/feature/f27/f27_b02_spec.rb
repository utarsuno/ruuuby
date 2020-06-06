# coding: UTF-8

RSpec.describe 'f27_b02' do

  context 'functionality' do
    context 'static functions / constructors' do
      context 'func{new_radian}' do
        context 'handles needed scenarios' do
          context 'cases: positive' do
            it 'w/ numerics' do
              expect_theta_angle(::ThetaAngle.new_radian(1337), :as_radian, 1337)
              expect_theta_angle(::ThetaAngle.new_radian(1337.0), :as_radian, 1337)
            end
            it 'w/ ThetaAngle' do
              expect_theta_angle(::ThetaAngle.new_radian(θʳ(1337.0)), :as_radian, 1337)
              expect_theta_angle(::ThetaAngle.new_radian(θ°(360)), :as_radian, π * 2)
              expect_theta_angle(::ThetaAngle.new_radian(θᵍ(400)), :as_radian, π * 2)
              expect_theta_angle(::ThetaAngle.new_radian(θ𝞽(1)), :as_radian, π * 2)
            end
          end
          context 'cases: negative' do
            it 'bad arg' do
              expect{θ𝞽(nil)}.to raise_error(ArgumentError)
              expect{::ThetaAngle.new_turn(nil)}.to raise_error(ArgumentError)
            end
          end
        end
      end # end: {func{new_radian}}
      context 'func{new_degree}' do
        context 'handles needed scenarios' do
          context 'cases: positive' do
            it 'w/ numerics' do
              expect_theta_angle(::ThetaAngle.new_degree(1337), :as_degree, 1337)
              expect_theta_angle(::ThetaAngle.new_degree(1337.0), :as_degree, 1337)
            end
            it 'w/ ThetaAngle' do
              expect_theta_angle(::ThetaAngle.new_degree(θʳ(π * 2)), :as_degree, 360)
              expect_theta_angle(::ThetaAngle.new_degree(θ°(360)), :as_degree, 360)
              expect_theta_angle(::ThetaAngle.new_degree(θᵍ(400)), :as_degree, 360)
              expect_theta_angle(::ThetaAngle.new_degree(θ𝞽(1)), :as_degree, 360)
            end
          end
          context 'cases: negative' do
            it 'bad arg' do
              expect{θ𝞽(nil)}.to raise_error(ArgumentError)
              expect{::ThetaAngle.new_turn(nil)}.to raise_error(ArgumentError)
            end
          end
        end
      end # end: {func{new_degree}}
      context 'func{new_gon}' do
        context 'handles needed scenarios' do
          context 'cases: positive' do
            it 'w/ numerics' do
              expect_theta_angle(::ThetaAngle.new_gon(1337), :as_gon, 1337)
              expect_theta_angle(::ThetaAngle.new_gon(1337.0), :as_gon, 1337)
            end
            it 'w/ ThetaAngle' do
              expect_theta_angle(::ThetaAngle.new_gon(θʳ(π * 2)), :as_gon, 400)
              expect_theta_angle(::ThetaAngle.new_gon(θ°(360)), :as_gon, 400)
              expect_theta_angle(::ThetaAngle.new_gon(θᵍ(400)), :as_gon, 400)
              expect_theta_angle(::ThetaAngle.new_gon(θ𝞽(1)), :as_gon, 400)
            end
          end
          context 'cases: negative' do
            it 'bad arg' do
              expect{θᵍ(nil)}.to raise_error(ArgumentError)
              expect{::ThetaAngle.new_gon(nil)}.to raise_error(ArgumentError)
            end
          end
        end
      end # end: {func{new_gon}}
      context 'func{new_turn}' do
        context 'handles needed scenarios' do
          context 'cases: positive' do
            it 'w/ numerics' do
              expect_theta_angle(::ThetaAngle.new_turn(1337), :as_turn, 1337)
              expect_theta_angle(::ThetaAngle.new_turn(1337.0), :as_turn, 1337)
            end
            it 'w/ ThetaAngle' do
              expect_theta_angle(::ThetaAngle.new_turn(θʳ(π * 2)), :as_turn, 1)
              expect_theta_angle(::ThetaAngle.new_turn(θ°(360)), :as_turn, 1)
              expect_theta_angle(::ThetaAngle.new_turn(θᵍ(400)), :as_turn, 1)
              expect_theta_angle(::ThetaAngle.new_turn(θ𝞽(1)), :as_turn, 1)
            end
          end
          context 'cases: negative' do
            it 'bad arg' do
              expect{θ𝞽(nil)}.to raise_error(ArgumentError)
              expect{::ThetaAngle.new_turn(nil)}.to raise_error(ArgumentError)
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
            expect(as_turns).to eq(θ𝞽(½) + θ𝞽(½))
          end
        end
      end

    end # end: {static functions / constructors}
  end # end: {functionality}

  context 'audit', :audit do
    context 'static functions provided are' do
      context 'defined in correct location' do
        it 'for module{Kernel}' do
          expect_∃⨍(:θ°, ::Kernel)
          expect_∃⨍(:θʳ, ::Kernel)
          expect_∃⨍(:θᵍ, ::Kernel)
          expect_∃⨍(:θ𝞽, ::Kernel)
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
