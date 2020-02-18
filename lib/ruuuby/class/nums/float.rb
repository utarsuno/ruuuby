
# add various functions to existing class +Float+
class ::Float

  # @return [Boolean] true, if there is no imaginary component and the real component is a natural number
  def ℕ?
    return false if (!self.finite? || self.negative?)
    self == 0 || ((self % 1) == 0)
  end

  # @return [Boolean] true, if this number's contents are equivalent to any number in the set of math-integers(ℤ)
  def ℤ?
    return false unless self.finite?
    self == 0 || ((self % 1) == 0)
  end

  # ⚠️, coverage missing beyond ℤ
  #
  # @return [Boolean|NilClass]
  def ℚ?
    return false unless self.finite?
    return true if self.ℤ?
    nil
  end

  # @return [Boolean] true, (if-valid) all floats can be represented as complex numbers (with imaginary component of 0)
  def ℂ?
    return false unless self.finite?
    true
  end

  # @return [Boolean] true, all floats are real numbers (unless non-finite)
  def ℝ?
    return false unless self.finite?
    true
  end

end
