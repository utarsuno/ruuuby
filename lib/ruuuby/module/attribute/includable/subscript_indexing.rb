# coding: UTF-8

# `Ruuuby` attribute: `SubscriptIndexing`
module ::Ruuuby

  # (not-final-design): attributes that are re-usable amongst Classes (across categories/natural-groupings)
  module Attribute

    # attributes that are to be included, not extended
    module Includable

      # provide functionality to access element by index denoted by `subscripts`
      module SubscriptIndexing

        # @return [*] element at index(0)
        def ₀ ; self[0] ; end

        # TODO: error check on index accessed (compared to length)
        # @return [Boolean] true, if element at index(0) equals arg(compare_to)
        def ₀?(compare_to) ; self[0] == compare_to ; end

        # @return [*] element at index(1)
        def ₁ ; self[1] ; end

        # TODO: error check on index accessed (compared to length)
        # @return [Boolean] true, if element at index(1) equals arg(compare_to)
        def ₁?(compare_to) ; self[1] == compare_to ; end

        # @return [*] element at index(2)
        def ₂ ; self[2] ; end

        # @return [*] element at index(3)
        def ₃ ; self[3] ; end

        # TODO: if/when usage beyond index 4 is needed, dynamically parse subscript number (w/o affecting any other features)

      end

    end

  end

end
