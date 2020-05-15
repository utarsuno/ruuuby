# coding: UTF-8

module ::Math
  module SetTheory

    class ImaginaryNumbers < ::Math::SetTheory::NumberSet
      include ::Ruuuby::Attribute::Includable::RuuubySingleton

      def initialize
        super(:𝕚, ::Math::SetTheory::NumberSet::AlephNumbers::ONE)
        @subset_of   = [:𝕌, :ℂ]
        @superset_of = []
      end

    end

  end
end
