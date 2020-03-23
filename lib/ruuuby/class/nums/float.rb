
# add various functions to existing class +Float+
class ::Float

  # original source code referenced from:
  # @see https://floating-point-gui.de/errors/NearlyEqualsTest.java
  #
  # @param [Float] them
  #
  # @return [Boolean] true, if these numbers have a differences less than 0.00001
  def ≈≈(them) #epsilon=Float::EPSILON
    🛑num❓(:them, them)
    return true if self == them
    #the_epsilon = 0.00001
    #the_min_value = 1.17549435E-38

    abs_a = self.abs
    abs_b = them.abs
    diff  = (self - them).abs

    if self == 0 || them == 0 || (abs_a + abs_b < 1.17549435E-38)
      diff < (0.00001 * 1.17549435E-38)
    else
      if abs_a + abs_b <= Float::MAX
        (diff / (abs_a + abs_b)) < 0.00001
      else
        (diff / Float::MAX) < 0.00001
      end
    end
  end

  # @return [Boolean] true, (if-valid) all floats can be represented as complex numbers (with imaginary component of 0)
  alias_method :ℂ?, :finite?

  # @return [Boolean] true, all floats are real numbers(+ℝ+); unless non-finite
  alias_method :ℝ?, :finite?

  # @return [Boolean] true, the universal-set(+𝕌+) in this context only excludes (NaN, +∞, and -∞)
  alias_method :𝕌?, :finite?

  # @return [Boolean] true, if there is no imaginary component and the real component is a natural-number(+ℕ+)
  def ℕ?
    return false if ∞? || negative?
    self == 0 || ((self % 1) == 0)
  end

  # @return [Boolean] true, if this number's contents are equivalent to any number in the set of math-integers(+ℤ+)
  def ℤ?
    return false unless self.ℝ?
    self == 0 || ((self % 1) == 0)
  end

  # ⚠️, coverage missing beyond ℤ
  #
  # @return [Boolean|NilClass]
  def ℚ?
    return false unless self.ℝ?
    return true if self.ℤ?
    nil
  end

end
