# coding: UTF-8

# `Ruuuby` attribute: `RuuubySingleton`
module ::Ruuuby
  # (not-final-design): attributes that are re-usable amongst Classes (across categories/natural-groupings)
  module Attribute
    # attributes that are to be included, not extended
    module Includable
      # wrapper over existing `Singleton`
      module RuuubySingleton

        # ensure the instance of `Class` that is currently including Module(`RuuubySingleton`) will include the regular Module(`Singleton`) as well as extend the Module(`RuuubySingleton`)
        #
        # @param [Class] kclass
        #
        # @return [Class] kclass
        def self.included(kclass)
          kclass.include(::Singleton)
          kclass.extend(::Ruuuby::Attribute::Extendable::RuuubySingleton)
        end

      end # end: {RuuubySingleton}
    end # end: {Includable}
  end # end: {Attribute}
end # end: {Ruuuby}
