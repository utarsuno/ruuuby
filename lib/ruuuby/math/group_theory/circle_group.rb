# coding: UTF-8

module ::Math

  module GroupTheory

    # @see: https://en.wikipedia.org/wiki/Circle_group
    #
    # 𝕋 = { z ∈ ℂ : |z| = 1 }
    #
    # - "the `multiplicative group` of all `complex numbers` with absolute value 1"
    # - the `unit circle` in the `complex plane`
    class CircleGroup < ::Math::SetTheory::NumberSet
      include ::Ruuuby::Attribute::Includable::RuuubySingleton

      def initialize
        super(:𝕋, nil)
      end
    end

  end
end

# TODO: https://en.wikipedia.org/wiki/Complex_plane
# TODO: https://en.wikipedia.org/wiki/De_Moivre%27s_formula
