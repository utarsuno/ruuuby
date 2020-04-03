# coding: UTF-8

# `Ruuuby` attribute: `Notation`: `SetMathematics`
module ::Ruuuby

  # (not-final-design): attributes that are re-usable amongst Classes (across categories/natural-groupings)
  module Attribute

    # attributes that are to be included, not extended
    module Includable

      # any shareable functionality regarding usage of some set of notation for a given domain
      module Notation

        # provide additional functionality to a few specific math-operations (via specific notation/symbols) which can easily be shared across a few Classes
        module SetMathematics

          # ensure the instance of `Class` that is currently including Module(`SetMathematics`) will define the aliases{`∀`, `∋?`}
          #
          # @param [Class] kclass
          #
          # @return [Class] kclass
          def self.included(kclass)
            kclass.alias_method(:∀, :each)
            kclass.alias_method(:∋?, :include?)
          end

        end

      end

    end

  end

end
