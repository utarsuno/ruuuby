# coding: UTF-8

module ::Math
  module SetTheory

    class IrrationalNumbers < ::Math::SetTheory::NumberSet
      include ::Ruuuby::Attribute::Includable::RuuubySingleton

      KNOWN_IRRATIONALS = [::Math::PI.🆔, ::Math::E.🆔, ::Float::RATIO_GOLDEN.🆔, ::Float::RATIO_GOLDEN_SUPER.🆔, ::Float::RATIO_PLASTIC.🆔]

      def initialize
        super(:𝕀, ::Math::SetTheory::NumberSet::AlephNumbers::ONE)
        @subset_of = [:𝕌, :ℂ, :ℝ]
      end
    end

  end
end
