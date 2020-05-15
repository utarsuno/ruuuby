# coding: UTF-8

module ::Math
  module SetTheory

    class ComplexNumbers < ::Math::SetTheory::NumberSet
      include ::Ruuuby::Attribute::Includable::RuuubySingleton

      def initialize
        super(:ℂ, ::Math::SetTheory::NumberSet::AlephNumbers::ONE, {
            closed_under_addition: true,
            closed_under_multiplication: true,
            closed_under_subtraction: true,
            closed_under_division: true,
            dense: true,
            continuous: true,
            algebraically_closed: true
        })
        @superset_of = [:𝕀, :𝔸ᵣ, :𝔸, :ℚ, :ℤ, :𝕎, :ℕ, :𝔹, :ℝ]
        @subset_of   = [:𝕌]
      end

      # @return [Boolean]
      def _∋?(n)
        case(n)
        when Integer
          true
          #when Float
          #if ℝ.∋?(n)
          #  if ℤ.∋?(n)
          #    return true
          #  else
          #    if 𝕀.∋?(n)
          #      return false
          #    else
          #      return nil
          #    end
          #  end
          #else
          #  return false
          #end
        when BigDecimal, Complex, Float
          n.finite?
          #return false unless n.finite?
          #return true if ℤ.∋?(n)
          #nil
          #when Complex
          #  n.imaginary == 0 && ℚ.∋?(n.real)
        when Rational
          ℂ.∋?(n.numerator) && ℂ.∋?(n.denominator)
          #if ℤ.∋?(n.numerator) && ℤ.∋?(n.denominator)
          #  true
          #else
          #  nil
          #end
        else
          false
        end
      end
    end

  end
end
