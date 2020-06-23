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

        #  ___  __        __  ___    __           __   __        __  ___           ___  __
        # |__  |__)  /\  /  `  |  | /  \ |\ |    /  ` /  \ |\ | /__`  |   /\  |\ |  |  /__`
        # |    |  \ /~~\ \__,  |  | \__/ | \|    \__, \__/ | \| .__/  |  /~~\ | \|  |  .__/
        #

        # @return [Float] +Float::ONE_HALF+
        def ½; ::Float::ONE_HALF; end

        # @return [Float] +Float::ONE_THIRD+
        def ⅓; ::Float::ONE_THIRD; end

        # @return [Float] +Float::TWO_THIRDS+
        def ⅔; ::Float::TWO_THIRDS; end

        # @return [Float] +Float::ONE_FOURTH+
        def ¼; ::Float::ONE_FOURTH; end

        # @return [Float] +Float::THREE_FOURTHS+
        def ¾; ::Float::THREE_FOURTHS; end

        # @return [Float] +Float::ONE_FIFTH+
        def ⅕; ::Float::ONE_FIFTH; end

        # @return [Float] +Float::TWO_FIFTHS+
        def ⅖; ::Float::TWO_FIFTHS; end

        # @return [Float] +Float::THREE_FIFTHS+
        def ⅗; ::Float::THREE_FIFTHS; end

        # @return [Float] +Float::FOUR_FIFTHS+
        def ⅘; ::Float::FOUR_FIFTHS; end

        # @return [Float] +Float::ONE_SIXTH+
        def ⅙; ::Float::ONE_SIXTH; end

        # @return [Float] +Float::ONE_SEVENTH+
        def ⅐; ::Float::ONE_SEVENTH; end

        # @return [Float] +Float::ONE_EIGHTH+
        def ⅛; ::Float::ONE_EIGHTH; end

        # @return [Float] +Float::THREE_EIGHTHS+
        def ⅜; ::Float::THREE_EIGHTHS; end

        # @return [Float] +Float::FIVE_EIGHTHS+
        def ⅝; ::Float::FIVE_EIGHTHS; end

        # @return [Float] +Float::SEVEN_EIGHTHS+
        def ⅞; ::Float::SEVEN_EIGHTHS; end

        # @return [Float] +Float::ONE_NINTH+
        def ⅑; ::Float::ONE_NINTH; end

        # @return [Float] +Float::ONE_TENTH+
        def ⅒; ::Float::ONE_TENTH; end

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

        # @param [Float, Int, ThetaAngle] arg
        #
        # @return [ThetaAngle]
        def θʳ(arg); ::ThetaAngle.new_radian(arg); end

        # @param [Float, Int, ThetaAngle] arg
        #
        # @return [ThetaAngle]
        def θᵍ(arg); ::ThetaAngle.new_gon(arg); end

        # @param [Float, Int, ThetaAngle] arg
        #
        # @return [ThetaAngle]
        def θ𝞽(arg); ::ThetaAngle.new_turn(arg); end

      end
    end
  end
end
