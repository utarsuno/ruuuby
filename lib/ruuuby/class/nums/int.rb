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
  ⨍_add_aliases(:infinite?, [:∞?, :♾️?, :∞ℂ?, :nan?, :¿?])

  # | ------------------------------------------------------------------------------------------------------------------

  # @example
  #   prime factors of 76 are: 2² x 19¹
  #   a = 76.get_prime_factors
  #   a == [[2, 2], [19, 1]]
  #
  # @return [Array]
  def get_prime_factors; Prime.prime_division(self); end

end
