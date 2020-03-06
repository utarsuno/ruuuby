
# add various functions to existing class +Rational+
class ::Rational

  # @return [Boolean] true, if finite and numerator and denominator pass
  def ℕ? ; self.numerator.ℕ? && self.denominator.ℕ? ; end

  # @return [Boolean] true, if finite and numerator and denominator pass
  def ℤ?
    return false unless self.finite?
    (self.fdiv(1) % 1 == 0)
  end

  # ⚠️, coverage missing beyond ℤ
  #
  # @return [Boolean|NilClass] true, if finite and numerator and denominator pass
  def ℚ?
    return true if self.numerator.ℤ? && self.denominator.ℤ?
    nil
  end

  # @return [Boolean] true, if finite and numerator and denominator pass
  def ℂ? ; self.numerator.ℂ? && self.denominator.ℂ? ; end

  # @return [Boolean] true, if finite and numerator and denominator pass
  def ℝ? ; self.numerator.ℚ? && self.denominator.ℚ? ; end

end
