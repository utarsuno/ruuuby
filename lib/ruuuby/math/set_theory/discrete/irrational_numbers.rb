# coding: UTF-8

# mathematics related code
module ::Math
  module SetTheory

    class IrrationalNumbers < ::Math::SetTheory::NumberSet
      include ::Singleton

      def initialize
        super(:𝕀, ::Math::SetTheory::NumberSet::AlephNumbers::ONE)
        @subset_of = [:𝕌, :ℂ, :ℝ]
      end
    end

  end
end
