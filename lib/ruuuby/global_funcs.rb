# coding: UTF-8

# `Ruuuby's` applied changes for the `main` object
module ::Ruuuby

  # (not-final-design): attributes that are to be included/extended an absolute maximum of once per Class & Runtime
  module Feature

    # attributes that are to be extended, not included
    module Extendable

      # defines the operations needed to support Feature(`f10`) that are applied to the `main` object
      module MainF10

        # @return [::Kernel]
        def 🌽; ::Kernel; end

      end # end: {MainF10}

      # defines the operations needed to support Feature(`f12`) that are applied to the `main` object
      module MainF12

        # @return [::File]
        def 📁; ::File; end

        # @return [::File]
        def 📂; ::File; end

        # @return [::Dir]
        def 🗄️; ::Dir; end

      end # end: {MainF12}

      # defines the operations needed to support Feature(`f12`) that are applied to the `main` object
      module MainF17

        #module NumberFields
          # @return [Object] placeholder
        #  def ℝⁿ; ::Math::VECTOR_SPACE_ALL_N_TUPLES; end

          # @return [Object] placeholder
        #  def ℝ¹; ::Math::VECTOR_SPACE_1D; end

          # @return [Object] placeholder
        #  def ℝ²; ::Math::VECTOR_SPACE_2D; end

          # @return [Object] placeholder
        #  def ℝ³; ::Math::VECTOR_SPACE_3D; end

          # @return [Object] placeholder
        #  def ℝ⁴; ::Math::VECTOR_SPACE_4D; end
        #end

        # defines (onto the `main` object) funcs to provide aliases for math functions
        module MathAliases

          # @param [Numeric, Float, Complex] component_real
          # @param [Numeric, Float, Complex] component_complex (default: 0)
          #
          # @return [Complex]
          def ℂ(component_real, component_complex=0); Complex(component_real, component_complex); end

          # @param [Numeric, Float, Complex] numerator
          # @param [Numeric, Float, Complex] denominator
          #
          # @return [Rational]
          def ℚ(numerator, denominator); Rational(numerator, denominator); end

          # @return [Float] the base ℮ logarithm of +n+
          def logₑ(n); ::Math.log(n); end

          # @param [Numeric, Float, Complex] n
          #
          # | domain    | (0, ∞)  |
          # | co-domain | (-∞, ∞) |
          #
          # @return [Float] the base 2 logarithm of +n+
          def log₂(n); ::Math.log2(n); end

          # @param [Numeric, Float, Complex] n
          #
          # | domain    | (0, ∞)  |
          # | co-domain | (-∞, ∞) |
          #
          # @return [Float] the base 10 logarithm of +n+
          def log₁₀(n); ::Math.log10(n); end

          # @return [Float]
          def ℮; ::Math::E; end

          # Return the square-root of the provided argument.
          #
          # @param [Integer, Float, Numeric] n
          #
          # @return [Float, Numeric]
          def √(n); ::Math.sqrt(n); end

          # Return the cube-root of the provided argument.
          #
          # @param [Integer, Float, Numeric] n
          #
          # @return [Float, Numeric]
          def ∛(n); ::Math.cbrt(n); end

          # @return [Float]
          def π; ::Math::PI; end

        end # end: {MathAliases}

        # defines (onto the `main` object) funcs to provide aliases for float functions and constants
        module FloatAliases

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

          # @return [Float] Float::INFINITY
          def ∞; ::Float::INFINITY; end

          # @return [Float] Float::NAN
          def ¿; ::Float::NAN; end

          # @return [Symbol] 'complex-infinity'
          def ∞ℂ; :∞ℂ; end

          # @return [Float]
          def γ; ::Float::EULER_MASCHERONI_CONSTANT; end

        end # end: {FloatAliases}

        # defines (onto the `main` object) funcs to provide aliases for math functions relating to trigonometry
        module Trigonometry

          def cot(θ); 🛑θ❓(:θ, θ); ::Math.cot(θ); end

          def csc(θ); 🛑θ❓(:θ, θ); ::Math.csc(θ); end

          # @param [ThetaAngle] θ
          def sec(θ); 🛑θ❓(:θ, θ); ::Math.sec(θ); end

          # return the sin of the provided angle
          #
          # | domain    | (-∞, ∞) |
          # | co-domain | [-1, 1] |
          #
          # @param [ThetaAngle] θ
          #
          # @return [Float, Numeric]
          def sin(θ); 🛑θ❓(:θ, θ); ::Math.sin(θ.ʳ); end

          def sin²(θ); 🛑θ❓(:θ, θ); ::Math.sin_squared(θ); end

          def cos²(θ); 🛑θ❓(:θ, θ); ::Math.cos_squared(θ); end

          # return the Arcsine (inverse function) of the provided angle
          #
          # | domain    | [-1, ∞) |
          # | co-domain | [-1, 1] |
          #
          # @param [ThetaAngle] θ
          #
          # @return [Float, Numeric]
          def arcsin(θ); 🛑θ❓(:θ, θ); ::Math.asin(θ.ʳ); end

          # return the cos of the provided angle
          #
          # | domain    | (-1, 1) |
          # | co-domain | [0, π]  |
          #
          # @param [ThetaAngle] θ
          #
          # @return [Float, Numeric]
          def cos(θ); 🛑θ❓(:θ, θ); ::Math.cos(θ.ʳ); end

          # return the Arccosine (inverse function) of the provided angle
          #
          # | domain    | (-∞, ∞) |
          # | co-domain | [-1, 1] |
          #
          # @param [ThetaAngle] θ
          #
          # @return [Float, Numeric]
          def arccos(θ); 🛑θ❓(:θ, θ); ::Math.acos(θ.ʳ); end

          # return the tan of the provided angle (in radians)
          #
          # | domain    | (-∞, ∞) |
          # | co-domain | (-∞, ∞) |
          #
          # @param [ThetaAngle] θ
          #
          # @return [Float, Numeric]
          def tan(θ); 🛑θ❓(:θ, θ); ::Math.tan(θ.ʳ); end

          # return the arc-sin (inverse function) of the provided angle
          #
          # | domain    | (-∞, ∞) |
          # | co-domain | [-1, 1] |
          #
          # @param [ThetaAngle] θ
          #
          # @return [Float, Numeric]
          def arctan(θ); 🛑θ❓(:θ, θ); ::Math.atan(θ.ʳ); end

          # utility function
          #
          # @param [Integer, Float, Numeric] degrees
          #
          # @return [Float, Numeric]
          def sin°(degrees); sin(θ°(degrees)); end

          # utility function
          #
          # @param [Integer, Float, Numeric] degrees
          #
          # @return [Float, Numeric]
          def cos°(degrees); cos(θ°(degrees)); end

          # utility function
          #
          # @param [Integer, Float, Numeric] degrees
          #
          # @return [Float, Numeric]
          def tan°(degrees); tan(θ°(degrees)); end

          # utility function
          #
          # @param [Integer, Float, Numeric] degrees
          #
          # @return [Float, Numeric]
          def cot°(degrees); ::Math.cot(θ°(degrees)); end

          # utility function
          #
          # @param [Integer, Float, Numeric] degrees
          #
          # @return [Float, Numeric]
          def csc°(degrees); ::Math.csc(θ°(degrees)); end

          # utility function
          #
          # @param [Integer, Float, Numeric] degrees
          #
          # @return [Float, Numeric]
          def sec°(degrees); ::Math.sec(θ°(degrees)); end

        end # end: {Trigonometry}
      end # end: {MainF17}

      # defines the operations needed to support Feature(`f26`) that are applied to the `main` object
      module MainF26
        # @return [::Date]
        def 📅; ::Date; end

        # @return [::Time]
        def 🕒; ::Time; end

        # @return [::DateTime]
        def 📅🕒; ::DateTime; end
      end # end: {MainF26}

      # defines the operations needed to support Feature(`f27`) that are applied to the `main` object
      module MainF27
        # @param [Float, Int] arg
        #
        # @return [ThetaAngle]
        def θ°(arg); ::ThetaAngle.new_degree(arg); end

        # @param [Float, Int] arg
        #
        # @return [ThetaAngle]
        def θʳ(arg); ::ThetaAngle.new_radian(arg); end

        # @param [Float, Int] arg
        #
        # @return [ThetaAngle]
        def θᵍ(arg); ::ThetaAngle.new_gon(arg); end

        # @param [Float, Int] arg
        #
        # @return [ThetaAngle]
        def θ𝞽(arg); ::ThetaAngle.new_turn(arg); end
      end # end: {MainF27}
    end # end: {Extendable}
  end # end: {Feature}
end # end: {Ruuuby}

# ---------------------------------------------------------------------------------------------------------- | *f12* |
