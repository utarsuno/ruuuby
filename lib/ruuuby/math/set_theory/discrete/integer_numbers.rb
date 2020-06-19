# coding: UTF-8

# mathematics related code
module ::Math
  module SetTheory

    class IntegerNumbers < ::Math::SetTheory::NumberSet
      include ::Singleton

      def initialize
        super(:ℤ, ::Math::SetTheory::NumberSet::AlephNumbers::ZERO, {
            closed_under_addition: true,
            closed_under_multiplication: true,
            closed_under_subtraction: true
        })
        @subset_of   = [:𝕌, :𝔸ᵣ, :𝔸, :ℝ, :ℂ, :ℚ]
        @superset_of = [:𝔹, :ℕ, :𝕎]
      end

      # @return [Boolean] true, if this number is equivalent to 0 or 1 {all numbers in the boolean-domain(+𝔹+)}
      def ∋?(n)
        case(n)
        when Integer
          true
        when Float
          (!(n.∞?)) && (n.zero? || ((n % 1) == 0))
        when BigDecimal
          case n.sign
          when BigDecimal::SIGN_NaN, BigDecimal::SIGN_POSITIVE_INFINITE, BigDecimal::SIGN_NEGATIVE_INFINITE
            false
          when BigDecimal::SIGN_POSITIVE_ZERO, BigDecimal::SIGN_NEGATIVE_ZERO, BigDecimal::SIGN_NEGATIVE_FINITE
            true
          else
            n.smells_like_int?
          end
        when Complex
          n.imaginary == 0 && ℤ.∋?(n.real)
          #  n.imaginary == 0 && ℕ.∋?(n.real)
        when Rational
          n.finite? && (n.fdiv(1) % 1 == 0)
        else
          false
        end
      end
    end

  end
end
