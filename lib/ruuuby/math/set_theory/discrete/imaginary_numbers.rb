# coding: UTF-8

# mathematics related code
module ::Math
  module SetTheory

    class ImaginaryNumbers < ::Math::SetTheory::NumberSet
      include ::Singleton

      def initialize
        super(:𝕚, ::Math::SetTheory::NumberSet::AlephNumbers::ONE)
        @subset_of   = [:𝕌, :ℂ]
        @superset_of = []
      end

    end

  end
end
