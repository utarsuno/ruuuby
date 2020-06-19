# coding: UTF-8

# mathematics related code
module ::Math
  module SetTheory

    class AlgebraicNumbers < ::Math::SetTheory::NumberSet
      include ::Singleton

      def initialize
        super(:𝔸, ::Math::SetTheory::NumberSet::AlephNumbers::ZERO)
        @subset_of   = [:𝕌, :ℂ]
        @superset_of = [:𝔹, :ℕ, :𝕎, :ℤ, :ℚ, :𝔸ᵣ]
      end

      # ⚠️, coverage missing
      #
      # @return [Boolean]
      def _∋?(n)
        case(n)
        when Integer
          true
        when Float
          𝔸ᵣ.∋?(n)
        when BigDecimal
          𝔸ᵣ.∋?(n.to_f)
        when Complex, Rational
          𝔸ᵣ.∋?(n)
        else
          false
        end
      end
    end

  end
end
