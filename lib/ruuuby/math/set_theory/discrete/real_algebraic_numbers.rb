# coding: UTF-8

# mathematics related code
module ::Math
  module SetTheory

    class RealAlgebraicNumbers < ::Math::SetTheory::NumberSet
      include ::Ruuuby::Attribute::Includable::RuuubySingleton

      KNOWN_REAL_ALGEBRAIC = [::Float::CONST_PYTHAGORAS.🆔, ::Float::RATIO_GOLDEN.🆔]

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
        when Integer
          true
        when Float
          if ℝ.∋?(n)
            if ℤ.∋?(n)
              true
            else
              if ::Numeric.known_transcendental?(n)
                false
              else
                if ::Numeric.known_real_algebraic?(n)
                  return true
                else
                  nil
                end
              end
            end
          else
            false
          end
        when BigDecimal
          return false unless n.finite?
          return true if ℤ.∋?(n)
          nil
        when Complex
          n.imaginary == 0 && ℚ.∋?(n.real)
        when Rational
          (ℤ.∋?(n.numerator) && ℤ.∋?(n.denominator)) ? true : nil
        else
          false
        end
      end
    end

  end
end
