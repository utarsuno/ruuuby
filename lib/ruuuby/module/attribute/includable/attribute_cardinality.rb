# coding: UTF-8

# `Ruuuby` attribute: `Cardinality`
module ::Ruuuby

  # (not-final-design): attributes that are re-usable amongst Classes (across categories/natural-groupings)
  module Attribute

    # attributes that are to be included, not extended
    module Includable

      # provide additional functionality to check various `cardinality` lengths, via help with `subscripts`
      module Cardinality

        # @param [Integer] additional_delta
        #
        # @return [Integer] `self.cardinality - 1`
        def 𝔠₋(additional_delta=0)
          self.𝔠 - (1 + additional_delta)
        end

        # @return [Boolean] true, if self `cardinality` is `1`
        def 𝔠₁? ; self.𝔠 == 1 ; end

        # @return [Boolean] true, if self `cardinality` is `2`
        def 𝔠₂? ; self.𝔠 == 2 ; end

        # @return [Boolean] true, if self `cardinality` is `3`
        def 𝔠₃? ; self.𝔠 == 3 ; end

        # @return [Boolean] true, if self `cardinality` is `4`
        def 𝔠₄? ; self.𝔠 == 4 ; end

        # @return [Boolean] true, if self `cardinality` is `5`
        def 𝔠₅? ; self.𝔠 == 5 ; end

      end

    end

  end

end
