# coding: UTF-8

# add various aliases & functions to existing Class(+Set+)
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
  alias_method :⊂?, :subset?
  alias_method :⊆?, :proper_superset?

  def ⊄?(them); !(self.⊂(them)); end

  def ⊇?(them)
    🛑set❓(:them, them)
    them.⊆?(self)
  end

  def ⊃?(them)
    🛑set❓(:them, them)
    them.⊂?(self)
  end

  def ⊅?(them)
    🛑set❓(:them, them)
    them.⊄?(self)
  end

end
