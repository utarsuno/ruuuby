# coding: UTF-8

module ::Ruuuby
  module Feature
    module Extendable
      module MainF28

        # @return [Float]
        def π; ::Math::PI; end

        # @return [Float]
        def ℮; ::Math::E; end

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

        # a full rotation around the circle, base representation in turns(+θτ+)
        #
        # @type [ThetaAngle]
        def τ; ::Math::ANGLE_TAU; end

        # a∶b = (a+b)∶a
        # a∶b = (1+b/a)∶1
        #
        # the only positive solution to: x² = x + 1
        #
        # @type [Float]
        ::Kernel.const_set(:𝚽, ::Float::RATIO_GOLDEN)

        # the only real solution to: x³ = x² + 1
        #
        # @type [Float]
        ::Kernel.const_set(:Ψ, ::Float::RATIO_GOLDEN_SUPER)

        # @type [Float]
        ::Kernel.const_set(:Ω, ::Float::CONST_OMEGA)

        # let `a+b = circumference of a circle`, (a+b)/a = a/b; (a->longer_arc, b->smaller_arc)
        #
        # @type [ThetaAngle]
        ::Kernel.const_set(:Ⴔ, ::Math::ANGLE_GOLDEN)

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

      end
    end
  end
end
