# coding: UTF-8

# mathematics related code
module ::Math
  module SetTheory

    # includes all the +measuring-numbers+
    class RealNumbers < ::Math::SetTheory::NumberSet
      include ::Singleton

      #KNOWN_TRANSCENDENTALS = [::Math::PI.🆔, ::Math::E.🆔, ::Float::CONST_OMEGA.🆔]

      def initialize
        super(:ℝ, ::Math::SetTheory::NumberSet::AlephNumbers::ONE, {
            closed_under_addition: true,
            closed_under_multiplication: true,
            closed_under_subtraction: true,
            closed_under_division: true,
            dense: true,
            continuous: true
        })
        @subset_of   = [:𝕌, :ℂ]
        @superset_of = [:𝔹, :ℕ, :𝕎, :ℤ, :𝔸ᵣ, :𝔸, :ℚ, :𝕀]
      end

      # @return [Boolean]
      def _∋?(n)
        case(n)
        when Integer;           true
        when Float, BigDecimal; n.to_f.finite?
        when Complex;           n.imaginary == 0 && ℝ.∋?(n.real)
        when Rational;          ℝ.∋?(n.numerator) && ℝ.∋?(n.denominator)
        else;                   false
        end
      end
    end

  end
end
