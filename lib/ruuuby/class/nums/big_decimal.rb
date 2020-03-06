
# note: due to this file, ruby_class_mods.c will auto-load ruby's 'bigdecimal'

# add various functions to existing class +BigDecimal+
class BigDecimal

  # @return [Boolean] true, if this number falls in the set of natural-numbers(ℕ)
  def ℕ?
    case self.sign
    when BigDecimal::SIGN_NaN, BigDecimal::SIGN_POSITIVE_INFINITE, BigDecimal::SIGN_NEGATIVE_INFINITE, BigDecimal::SIGN_NEGATIVE_FINITE
      return false
    when BigDecimal::SIGN_POSITIVE_ZERO, BigDecimal::SIGN_NEGATIVE_ZERO
      return true
    else
      return (self % 1) == 0
    end
  end

  # @return [Boolean] true, if this number's contents are equivalent to any number in the set of math-integers(ℤ)
  def ℤ?
    case self.sign
    when BigDecimal::SIGN_NaN, BigDecimal::SIGN_POSITIVE_INFINITE, BigDecimal::SIGN_NEGATIVE_INFINITE
      return false
    when BigDecimal::SIGN_POSITIVE_ZERO, BigDecimal::SIGN_NEGATIVE_ZERO
      return true
    else
      return (self % 1) == 0
    end
  end

  # ⚠️, coverage missing beyond ℤ
  #
  # @return [Boolean|NilClass] true, if this big decimal is finite and in ℤ, beyond that is wip
  def ℚ?
    return false unless self.finite?
    return true if self.ℤ?
    nil
  end

  # @return [Boolean] true, (if-valid) big decimals can be represented as complex numbers (with imaginary component of 0)
  alias_method :ℂ?, :finite?

  # @return [Boolean] true, if this big decimal is a real number
  alias_method :ℝ?, :finite?

end
