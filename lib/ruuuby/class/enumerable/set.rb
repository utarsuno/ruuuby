# encoding: utf-8

# add various functions to existing class +Set+
class ::Set

  # ---------------------------------------------------------------------------------------------------------- | *f03* |
  alias_method :𝔠, :length
  # ---------------------------------------------------------------------------------------------------------- | *f04* |
  alias_method :∅?, :empty?
  # ---------------------------------------------------------------------------------------------------------- | *f09* |
  include ::Ruuuby::Attribute::Includable::Notation::SetMathematics
  # | ------------------------------------------------------------------------------------------------------------------

  # removes all elements for this set that have func{∅?} and respond true
  #
  # @return [Set] this same set instance, potentially with modifications
  def remove_empty!
    return self if self.∅?
    self.keep_if{|x| !x.respond_to?(:∅?) || !x.∅?}
    self
  end

  alias_method :♻️∅!, :remove_empty!
end
