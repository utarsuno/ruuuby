# encoding: utf-8

module ::Ruuuby
  module Feature
    module Includable
      module MethodF10
        def self.included(kclass)
          kclass.alias_method(:🏠, :source_location)
        end
      end
    end
  end
end

# add various aliases/functions to existing class +Method+
class ::Method
  # ---------------------------------------------------------------------------------------------------------- | *f10* |
  include ::Ruuuby::Feature::Includable::MethodF10
  # | ------------------------------------------------------------------------------------------------------------------
end
