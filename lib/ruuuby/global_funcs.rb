# coding: UTF-8

# `Ruuuby's` applied changes for the `main` object
module ::Ruuuby

  # (not-final-design): attributes that are to be included/extended an absolute maximum of once per Class & Runtime
  module Feature

    # attributes that are to be extended, not included
    module Extendable

      # defines the operations needed to support Feature(`f12`) that are applied to the `main` object
      module MainF12

        # @return [::File]
        def 📁; ::File; end

        # @return [::File]
        def 📂; ::File; end

        # @return [::Dir]
        def 🗄️; ::Dir ; end

      end

      # defines the operations needed to support Feature(`f12`) that are applied to the `main` object
      module MainF17

        # defines (onto the `main` object) funcs to provide aliases for math functions
        module MathAliases
          # Return the square-root of the provided argument.
          #
          # @param [Integer, Float, Numeric] n
          #
          # @return [Float, Numeric]
          def √(n) ; ::Math.sqrt(n) ; end

          # Return the cube-root of the provided argument.
          #
          # @param [Integer, Float, Numeric] n
          #
          # @return [Float, Numeric]
          def ∛(n) ; ::Math.cbrt(n) ; end

          # @return [Float]
          def π ; ::Math::PI ; end
        end

        # defines (onto the `main` object) funcs to provide aliases for float functions and constants
        module FloatAliases
          # @return [Float] Float::INFINITY
          def ∞ ; ::Float::INFINITY ; end

          # @return [Float] Float::NAN
          def ¿ ; ::Float::NAN ; end

          # @return [Symbol] 'complex-infinity'
          def ∞ℂ ; :∞ℂ ; end

          # @return [Float]
          def φ ; ::Float::GOLDEN_RATIO ; end

          # @return [Float]
          def γ ; ::Float::EULER_MASCHERONI_CONSTANT ; end
        end

        # defines (onto the `main` object) funcs to provide aliases for math functions relating to trigonometry
        module Trigonometry
          # @param [Float, Integer] n angle (in degrees)
          #
          # @return [Float] angle in radians
          def ∠ᶜ(n) ; ::Math::RATIO_DEGREES_TO_RADIAN * n ; end

          # @param [Float, Integer, String] n angle (in radians)
          #
          # @raise [RuntimeError] if arg(n) provided as c(`String`) but contents did not represent a radian expression
          #
          # @return [Float] angle in degrees
          def ∠°(n)
            if n.str?
              n.to_radian
            else
              ::Math::RATIO_RADIANS_TO_DEGREE * n
            end
          end

          # return the sin of the provided angle (in radians)
          #
          # @param [Integer, Float, Numeric] radian
          #
          # @return [Float, Numeric]
          def sin(radian) ; ::Math.sin(radian) ; end

          # return the sin of the provided angle (in degrees)
          #
          # @param [Integer, Float, Numeric] degrees
          #
          # @return [Float, Numeric]
          def sin°(degrees) ; ::Math.sin(∠ᶜ(degrees)) ; end

          # return the cos of the provided angle (in radians)
          #
          # @param [Integer, Float, Numeric] radian
          #
          # @return [Float, Numeric]
          def cos(radian) ; ::Math.cos(radian) ; end

          # return the cos of the provided angle (in degrees)
          #
          # @param [Integer, Float, Numeric] degrees
          #
          # @return [Float, Numeric]
          def cos°(degrees) ; ::Math.cos(∠ᶜ(degrees)) ; end

          # return the tan of the provided angle (in radians)
          #
          # @param [Integer, Float, Numeric] radian
          #
          # @return [Float, Numeric]
          def tan(radian) ; ::Math.tan(radian) ; end

          # return the tan of the provided angle (in degrees)
          #
          # @param [Integer, Float, Numeric] degrees
          #
          # @return [Float, Numeric]
          def tan°(degrees) ; ::Math.tan(∠ᶜ(degrees)) ; end

        end

      end

    end

  end

end

# ---------------------------------------------------------------------------------------------------------- | *f12* |
