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

        # defines (onto the `main` object) funcs to provide aliases for math functions
        module MathAliases

          # @return [Float] the base ℮ logarithm of +n+
          def logₑ(n); ::Math.log_e(n); end

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

          # Return the square-root of the provided argument.
          #
          # @param [Integer, Float, Numeric, String] n
          #
          # @return [Float, Numeric]
          def √(n)
            if n.str? && n.to_num?
              ::Math.square_root(n.to_num.to_f)
            else
              🛑num❓(:n, n)
              ::Math.square_root(n.to_f)
            end
          end

          # Return the cube-root of the provided argument.
          #
          # @param [Integer, Float, Numeric] n
          #
          # @return [Float, Numeric]
          def ∛(n)
            if n.str? && n.to_num?
              ::Math.cubic_root(n.to_num.to_f)
            else
              🛑num❓(:n, n)
              ::Math.cubic_root(n.to_f)
            end
          end

        end # end: {MathAliases}

        # defines (onto the `main` object) funcs to provide aliases for math functions relating to trigonometry
        module Trigonometry

          def cot(θ); 🛑θ❓(:θ, θ); ::Math.cott(θ); end

          def csc(θ); 🛑θ❓(:θ, θ); ::Math.cscc(θ); end

          # @param [ThetaAngle] θ
          def sec(θ); 🛑θ❓(:θ, θ); ::Math.secc(θ); end

          # return the sin of the provided angle
          #
          # | domain    | (-∞, ∞) |
          # | co-domain | [-1, 1] |
          #
          # @param [ThetaAngle] θ
          #
          # @return [Float, Integer, Numeric]
          def sin(θ); 🛑θ❓(:θ, θ); ::Math.sinn(θ); end

          # return the Arcsine (inverse function) of the provided angle
          #
          # | domain    | [-1, ∞) |
          # | co-domain | [-1, 1] |
          #
          # @param [ThetaAngle] θ
          #
          # @return [Float, Numeric]
          def arcsin(θ); 🛑θ❓(:θ, θ); ::Math.asin(θ.ʳ); end

          def csc²(θ); 🛑θ❓(:θ, θ); ::Math.csc_squared(θ); end

          def sin²(θ); 🛑θ❓(:θ, θ); ::Math.sin_squared(θ); end

          def cos²(θ); 🛑θ❓(:θ, θ); ::Math.cos_squared(θ); end

          def cot²(θ); 🛑θ❓(:θ, θ); ::Math.cot_squared(θ); end

          def sec²(θ); 🛑θ❓(:θ, θ); ::Math.sec_squared(θ); end

          def tan²(θ); 🛑θ❓(:θ, θ); ::Math.tan_squared(θ); end

          # return the cos of the provided angle
          #
          # | domain    | (-1, 1) |
          # | co-domain | [0, π]  |
          #
          # @param [ThetaAngle] θ
          #
          # @return [Float, Numeric]
          def cos(θ); 🛑θ❓(:θ, θ); ::Math.coss(θ); end
          #def cos(θ); 🛑θ❓(:θ, θ); ::Math.cos(θ.ʳ); end

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
          def tan(θ); 🛑θ❓(:θ, θ); ::Math.tann(θ); end

          # return the arc-sin (inverse function) of the provided angle
          #
          # | domain    | (-∞, ∞) |
          # | co-domain | [-1, 1] |
          #
          # @param [ThetaAngle] θ
          #
          # @return [Float, Numeric]
          def arctan(θ); 🛑θ❓(:θ, θ); ::Math.atan(θ.ʳ); end

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

        # @param [Float, Int, ThetaAngle] arg
        #
        # @return [ThetaAngle]
        def θ°(arg)
          if arg.θ?
            ::ThetaAngle.new_degree(arg.𝞽)
          else
            ::ThetaAngle.new_degree(arg)
          end
        end

        # @param [Float, Int, ThetaAngle] arg
        #
        # @return [ThetaAngle]
        def θʳ(arg)
          if arg.θ?
            ::ThetaAngle.new_radian(arg.𝞽)
          else
            ::ThetaAngle.new_radian(arg)
          end
        end

        # @param [Float, Int, ThetaAngle] arg
        #
        # @return [ThetaAngle]
        def θᵍ(arg)
          if arg.θ?
            ::ThetaAngle.new_gon(arg.𝞽)
          else
            ::ThetaAngle.new_gon(arg)
          end
        end

        # @param [Float, Int, ThetaAngle] arg
        #
        # @return [ThetaAngle]
        def θ𝞽(arg)
          if arg.θ?
            ::ThetaAngle.new_turn(arg.𝞽)
          else
            ::ThetaAngle.new_turn(arg)
          end
        end

      end # end: {MainF27}
    end # end: {Extendable}
  end # end: {Feature}
end # end: {Ruuuby}

# ---------------------------------------------------------------------------------------------------------- | *f12* |
