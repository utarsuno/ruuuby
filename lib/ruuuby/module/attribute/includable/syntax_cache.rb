# coding: UTF-8

# `Ruuuby` attribute: `SyntaxCache`
module ::Ruuuby

  # (not-final-design): attributes that are re-usable amongst Classes (across categories/natural-groupings)
  module Attribute

    # attributes that are to be included, not extended
    module Includable

      # provide functionality to automatically apply the Class-attribute: `SyntaxCache`
      module SyntaxCache

        def self.included(kclass)
          kclass.extend(::Ruuuby::Attribute::Extendable::SyntaxCache)
          kclass.cache_warmup(kclass)
        end

      end

    end

  end

end
