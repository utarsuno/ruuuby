# encoding: UTF-8

# mathematics related code
module ::Math
  module SetTheory

    class UniversalSet < ::Math::SetTheory::NumberSet
      include ::Singleton

      def initialize
        super(:𝕌, ::Math::SetTheory::NumberSet::AlephNumbers::ONE)
        @superset_of = [:𝔹, :ℕ, :𝕎, :ℤ, :ℚ, :𝔸ᵣ, :𝕀, :ℝ, :𝔸, :ℂ]
      end

      # @return [Boolean]
      def _∋?(n); n.finite?; end
    end

  end
end
