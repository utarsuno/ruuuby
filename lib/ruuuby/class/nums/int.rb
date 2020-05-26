# coding: UTF-8

# add various aliases & functions to existing Class(+Integer+)
class ::Integer

  # @return [Boolean]
  def one?; self == 1; end

  # @return [Boolean]
  def smells_like_int?; true; end

  # ---------------------------------------------------------------------------------------------------------- | *f11* |

  # ∀ x ∈ Rℤ --> x ∈ ℤ
  #
  # ∴ ⨍(`infinite?`) will always return `false`
  ⨍_add_aliases(:infinite?, [:∞?, :∞ℂ?, :nan?])

  # | ------------------------------------------------------------------------------------------------------------------

end
