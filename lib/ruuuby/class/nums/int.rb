# coding: UTF-8

# `Ruuuby` aliases & function additions to existing Class{+Integer+}
class ::Integer

  # @return [Boolean]
  def one?; self == 1; end

  # @return [Boolean]
  def smells_like_int?; true; end

  # ---------------------------------------------------------------------------------------------------------- | *f11* |

  # ∀ x ∈ Rℤ --> x ∈ ℤ
  #
  # ∴ ⨍(`infinite?`) will always return `false`
  alias_method :∞?, :infinite?
  alias_method :∞ℂ?, :infinite?
  alias_method :nan?, :infinite?

  # | ------------------------------------------------------------------------------------------------------------------

end
