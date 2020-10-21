# encoding: UTF-8

# mathematics related code
module ::Math
  module SetTheory

    class RationalNumbers < ::Math::SetTheory::NumberSet
      include ::Singleton

      # {
      #   closed_under_addition: true,
      #   closed_under_multiplication: true,
      #   closed_under_subtraction: true,
      #   closed_under_division: true,
      #   dense: true
      # }
      def initialize
        super(:ℚ, ::Math::SetTheory::NumberSet::AlephNumbers::ZERO)
        @subset_of   = [:𝕌, :𝔸ᵣ, :𝔸, :ℝ, :ℂ]
        @superset_of = [:𝔹, :ℕ, :𝕎, :ℤ]
      end

      # @return [Boolean, NilClass]
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
