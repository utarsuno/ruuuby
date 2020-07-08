# encoding: UTF-8

# add various aliases & functions to existing Class(+Set+)
class ::Set

  # ---------------------------------------------------------------------------------------------------------- | *f03* |
  alias_method :𝔠, :length
  # ---------------------------------------------------------------------------------------------------------- | *f04* |
  alias_method :∅?, :empty?
  # ---------------------------------------------------------------------------------------------------------- | *f09* |
  include ::Ruuuby::Attribute::Includable::Notation::SetMathematics
  # | ------------------------------------------------------------------------------------------------------------------

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
