# coding: UTF-8

# mathematics related code
module ::Math
  module SetTheory

    # also called: +counting-numbers+
    class WholeNumbers < ::Math::SetTheory::NumberSet
      include ::Singleton
      def initialize
        super(:𝕎, ::Math::SetTheory::NumberSet::AlephNumbers::ZERO, {
            closed_under_addition: true,
            closed_under_multiplication: true,
            closed_under_subtraction: true
        })
        @subset_of   = [:𝕌, :𝔸ᵣ, :𝔸, :ℝ, :ℂ, :ℚ, :ℤ, :𝕎]
        @superset_of = [:𝔹, :ℕ]
      end

      # @return [Boolean]
      def _∋?(n)
        if n.zero?
          true
        else
          case(n)
          when Integer
            n > 0
          when Float
            (!(n.∞? || n.negative?)) && (n.zero? || ((n % 1) == 0))
          when BigDecimal
            case n.sign
            when BigDecimal::SIGN_NaN, BigDecimal::SIGN_POSITIVE_INFINITE, BigDecimal::SIGN_NEGATIVE_INFINITE, BigDecimal::SIGN_NEGATIVE_FINITE
              false
            when BigDecimal::SIGN_POSITIVE_ZERO, BigDecimal::SIGN_NEGATIVE_ZERO
              true
            else
              n.smells_like_int?
            end
          when Rational
            𝕎.∋?(n.numerator) && 𝕎.∋?(n.denominator)
          when Complex
            n.imaginary == 0 && 𝕎.∋?(n.real)
          else
            false
          end
        end
      end
    end

  end
end
