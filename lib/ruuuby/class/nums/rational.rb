
# add various functions to existing class +Rational+
class ::Rational

  # @return [Boolean] true, if finite and numerator and denominator pass
  def ℕ?
    return false unless self.finite?
    self.numerator.ℕ? && self.denominator.ℕ?
  end

  # @return [Boolean] true, if finite and numerator and denominator pass
  def ℤ?
    return false unless self.finite?
    (self.fdiv(1) % 1 == 0)
  end

  # ⚠️, coverage missing beyond ℤ
  #
  # @return [Boolean] true, if finite and numerator and denominator pass
  def ℚ?
    return false unless self.finite?
    return true if self.numerator.ℤ? && self.denominator.ℤ?
    nil
  end

  # @return [Boolean] true, if finite and numerator and denominator pass
  def ℂ?
    return false unless self.finite?
    self.numerator.ℂ? && self.denominator.ℂ?
  end

  # @return [Boolean] true, if finite and numerator and denominator pass
  def ℝ?
    return false unless self.finite?
    return true if (self.numerator.ℤ? && self.denominator.ℤ?)
    self.numerator.ℚ? && self.denominator.ℚ?
  end

end
