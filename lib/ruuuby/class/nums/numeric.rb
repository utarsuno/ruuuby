# encoding: utf-8

# add various functions to existing module +Numeric+
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
  EXPONENTIAL_n9 = :⁻⁹

  # @type [Symbol]
  EXPONENTIAL_n8 = :⁻⁸

  # @type [Symbol]
  EXPONENTIAL_n7 = :⁻⁷

  # @type [Symbol]
  EXPONENTIAL_n6 = :⁻⁶

  # @type [Symbol]
  EXPONENTIAL_n5 = :⁻⁵

  # @type [Symbol]
  EXPONENTIAL_n4 = :⁻⁴

  # @type [Symbol]
  EXPONENTIAL_n3 = :⁻³

  # @type [Symbol]
  EXPONENTIAL_n2 = :⁻²

  # @type [Symbol]
  EXPONENTIAL_n1 = :⁻¹

  # @type [Symbol]
  EXPONENTIAL_0 = :⁰

  # @type [Symbol]
  EXPONENTIAL_1 = :¹

  # @type [Symbol]
  EXPONENTIAL_2 = :²

  # @type [Symbol]
  EXPONENTIAL_3 = :³

  # @type [Symbol]
  EXPONENTIAL_4 = :⁴

  # @type [Symbol]
  EXPONENTIAL_5 = :⁵

  # @type [Symbol]
  EXPONENTIAL_6 = :⁶

  # @type [Symbol]
  EXPONENTIAL_7 = :⁷

  # @type [Symbol]
  EXPONENTIAL_8 = :⁸

  # @type [Symbol]
  EXPONENTIAL_9 = :⁹

  # | ------------------------------------------------------------------------------------------------------------------

end
