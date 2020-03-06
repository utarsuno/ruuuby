
# add various functions to existing class +Float+
class ::Float

  # @return [Boolean] true, (if-valid) all floats can be represented as complex numbers (with imaginary component of 0)
  alias_method :ℂ?, :finite?

  # @return [Boolean] true, all floats are real numbers (unless non-finite)
  alias_method :ℝ?, :finite?

  # @return [Boolean] true, if there is no imaginary component and the real component is a natural number
  def ℕ?
    return false if ∞? || negative?
    self == 0 || ((self % 1) == 0)
  end

  # @return [Boolean] true, if this number's contents are equivalent to any number in the set of math-integers(ℤ)
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
