# coding: UTF-8

using ::ThetaAngle::ContextStrParsing

module ::Ruuuby
  module Feature
    module Extendable
      module MainF28

        # @return [Float]
        def π; ::Math::PI; end

        # @return [Float]
        def ℮; ::Math::E; end

        # the `limiting` difference between the `harmonic series` and the `natural logarithm`
        #
        # @return [Float]
        def γ; ::Float::CONST_EULER_MASCHERONI; end

        # @return [Float] Float::INFINITY
        def ∞; ::Float::INFINITY; end

        # the only real solution to: x³ = x + 1
        #
        # @return [Float]
        def ρ; ::Float::RATIO_PLASTIC; end

        # a∶b = (2a+b)∶a  ≡ δ
        # a∶b = (2+b/a)∶1 ≡ δ
        #
        # δ = 2 + 1/δ
        #
        # @return [Float]
        def δ; ::Float::RATIO_SILVER; end

        # a full rotation around the circle, base representation in turns(+θ𝞽+)
        #
        # @type [ThetaAngle]
        def 𝞽; ::Math::ANGLE_TAU; end

        #          __   __
        #  |\/| | /__` /  `
        #  |  | | .__/ \__,

        # @return [Symbol] 'complex-infinity'
        def ∞ℂ; ::Float::INFINITY_COMPLEX; end

        # -------------------------------------------------------------------------------------------------------- | *f27* |

        # @param [Float, Int, ThetaAngle, String] arg
        #
        # @return [ThetaAngle]
        def θ°(arg)
          if arg.str?
            ::ThetaAngle.new_degree(arg.°)
          else
            ::ThetaAngle.new_degree(arg)
          end
        end

        # @param [Float, Int, ThetaAngle, String] arg
        #
        # @return [ThetaAngle]
        def θʳ(arg)
          if arg.str?
            ::ThetaAngle.new_radian(arg.ʳ)
          else
            ::ThetaAngle.new_radian(arg)
          end
        end

        # @param [Float, Int, ThetaAngle, String] arg
        #
        # @return [ThetaAngle]
        def θᵍ(arg)
          if arg.str?
            ::ThetaAngle.new_gon(arg.ᵍ)
          else
            ::ThetaAngle.new_gon(arg)
          end
        end

        # @param [Float, Int, ThetaAngle, String] arg
        #
        # @return [ThetaAngle]
        def θ𝞽(arg)
          if arg.str?
            ::ThetaAngle.new_turn(arg.𝞽)
          else
            ::ThetaAngle.new_turn(arg)
          end
        end

      end
    end
  end
end
