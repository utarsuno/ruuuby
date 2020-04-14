# encoding: utf-8

# add various aliases & functions to existing Class(+Numeric+)
class ::Numeric

  # ---------------------------------------------------------------------------------------------------------- | *f11* |

  # @return [Boolean] true, if this number is neither NaN or ±∞
  def ∞? ; self.infinite? != nil ; end
  alias_method :♾️?, :∞?

  # @return [Boolean] true, if this number is equivalent to 0 or 1 {all numbers in the boolean-domain(+𝔹+)}
  def 𝔹? ; self == 0 || self == 1 ; end

  # @return [Boolean] true, the universal-set(+𝕌+) in this context only excludes (NaN, +∞, and -∞)
  alias_method :𝕌?, :finite?

  # ---------------------------------------------------------------------------------------------------------- | *f16* |

  # @type [Symbol]
  EXPONENTIAL_INF          = :∞

  # @type [Symbol]
  EXPONENTIAL_NEGATIVE_INF = :'-∞'

  # | ------------------------------------------------------------------------------------------------------------------

end
