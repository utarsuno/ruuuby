# coding: UTF-8

module ::Math
  module SetTheory

    class NullSet < ::Math::SetTheory::NumberSet
      include ::Ruuuby::Attribute::Includable::RuuubySingleton

      def initialize
        super(:ℕ𝕌𝕃𝕃, ::Math::SetTheory::NumberSet::AlephNumbers::UNKNOWN_ℕ)
      end

      # @param [*] n
      #
      # @return [Boolean]
      def ∋?(n)
        if n.respond_to?(:∅?)
          n.∅?
        else
          false
        end
      end
    end

  end
end
