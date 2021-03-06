# encoding: UTF-8

# mathematics related code
module ::Math
  module SetTheory

    class BooleanNumbers < ::Math::SetTheory::NumberSet
      include ::Singleton

      def initialize
        super(:𝔹, 2)
        @subset_of = [:𝕌, :𝔸ᵣ, :𝔸, :ℝ, :ℂ, :ℚ, :ℤ, :𝕎]
      end

      # @param [Numeric] n
      #
      # @return [Boolean] true, if this number is equivalent to 0 or 1 (all numbers in the boolean-domain{+𝔹+})
      def _∋?(n); n.zero? || n.one?; end
    end

  end
end

