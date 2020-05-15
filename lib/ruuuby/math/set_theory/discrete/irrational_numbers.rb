# coding: UTF-8

module ::Math
  module SetTheory

    class IrrationalNumbers < ::Math::SetTheory::NumberSet
      include ::Ruuuby::Attribute::Includable::RuuubySingleton

      KNOWN_IRRATIONALS = [::Math::PI.🆔, ::Math::E.🆔, ::Float::GOLDEN_RATIO.🆔, ::Float::SUPER_GOLDEN_RATIO.🆔, ::Float::PLASTIC_RATIO.🆔]

      def initialize
        super(:𝕀, ::Math::SetTheory::NumberSet::AlephNumbers::ONE)
        @subset_of = [:𝕌, :ℂ, :ℝ]
      end
    end

  end
end
