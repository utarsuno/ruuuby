# coding: UTF-8

module ::Math
  module SetTheory

    # also called: +counting-numbers+
    class NaturalNumbers < ::Math::SetTheory::NumberSet
      include ::Ruuuby::Attribute::Includable::RuuubySingleton

      def initialize
        super(:ℕ, ::Math::SetTheory::NumberSet::AlephNumbers::ZERO, {
            closed_under_addition: true,
            closed_under_multiplication: true
        })
        @subset_of = [:𝕌, :𝔸ᵣ, :𝔸, :ℝ, :ℂ, :ℚ, :ℤ, :𝕎]
      end

      # @return [Boolean] true
      def _∋?(n)
        if n.zero?
          false
        else
          case(n)
          when Integer
            n > 0
          when Float
            ((!(n.∞? || n.negative?)) && (n.positive? && n.smells_like_int?))
          when BigDecimal
            case(n.sign)
            when BigDecimal::SIGN_NaN, BigDecimal::SIGN_POSITIVE_INFINITE, BigDecimal::SIGN_NEGATIVE_INFINITE, BigDecimal::SIGN_NEGATIVE_FINITE, BigDecimal::SIGN_POSITIVE_ZERO, BigDecimal::SIGN_NEGATIVE_ZERO
              false
            else
              n.smells_like_int?
            end
          when Complex
            n.imaginary == 0 && ℕ.∋?(n.real)
          when Rational
            ℕ.∋?(n.numerator) && ℕ.∋?(n.denominator)
          else
            false
          end
        end
      end
    end

  end
end
