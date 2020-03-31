# encoding: utf-8

# add various functions to existing class +Integer+
class ::Integer

  # ---------------------------------------------------------------------------------------------------------- | *f11* |

  # @return [Boolean] false, there are no Ruby/Math integers(+ℤ+) representing infinity
  alias_method :∞?, :infinite?
  alias_method :♾️?, :infinite?
  alias_method :∞ℂ?, :infinite?
  alias_method :nan?, :infinite?
  alias_method :¿?, :infinite?

  # @return [Boolean] true, all *non-negative* integers(+ℤ+) are considered in the set of natural-numbers(+ℕ+)
  def ℕ? ; self >= 0; end

  # @return [Boolean] true, all integers are considered in the set of math-integers(+ℤ+)
  alias_method :ℤ?, :finite?

  # @return [Boolean] true, all integers(+ℤ+) can be represented as rational-numbers(+ℚ+)
  alias_method :ℚ?, :finite?

  # @return [Boolean] true, all integers(+ℤ+) can be represented as complex numbers (with imaginary component of 0)
  alias_method :ℂ?, :finite?

  # @return [Boolean] true, all integers(+ℤ+) are real-numbers(+ℝ+)
  alias_method :ℝ?, :finite?

  # @return [Boolean] true, the universal-set(+𝕌+) in this context only excludes (NaN, +∞, and -∞)
  alias_method :𝕌?, :finite?

  # | ------------------------------------------------------------------------------------------------------------------

end
