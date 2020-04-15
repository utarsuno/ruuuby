# coding: UTF-8

# `Ruuuby` attribute: `SyntaxCache`
module ::Ruuuby
  # (not-final-design): attributes that are re-usable amongst Classes (across categories/natural-groupings)
  module Attribute
    # attributes that are to be extended, not included
    module Extendable
      # provide functionality to automatically apply the Class-attribute: `SyntaxCache`
      module RuuubySingleton

        def instance ; @instance ||= new ; end

      end # end: {SyntaxCache}
    end # end: {Extendable}
  end # end: {Attribute}
end # end: {Ruuuby}
