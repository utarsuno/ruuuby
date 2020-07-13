# encoding: UTF-8

# mathematics related code
module ::Math
  module SetTheory

    class RealAlgebraicNumbers < ::Math::SetTheory::NumberSet
      include ::Singleton

      def initialize
        super(:𝔸ᵣ, ::Math::SetTheory::NumberSet::AlephNumbers::ZERO, {dense: true})
        @subset_of   = [:𝕌, :ℂ, :ℝ, :𝔸]
        @superset_of = [:𝔹, :ℕ, :𝕎, :ℤ, :ℚ]
      end

      # ⚠️, coverage missing
      #
      # @return [Boolean]
      def _∋?(n)
        case(n)
        when ::Integer
          true
        when ::Float
          if ℝ.∋?(n)
            if ℤ.∋?(n)
              true
            else
              nil
            end
          else
            false
          end
        when ::BigDecimal
          return false unless n.finite?
          return true if ℤ.∋?(n)
          nil
        when ::Complex
          n.imaginary == 0 && ℚ.∋?(n.real)
        when ::Rational
          (ℤ.∋?(n.numerator) && ℤ.∋?(n.denominator)) ? true : nil
        else
          false
        end
      end
    end

  end
end
