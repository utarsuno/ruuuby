
# add various functions to existing class +Float+
class ::Float

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

  # @param [Numeric|Symbol] them | if 🆔 matches a power (ex: ²), then essentially perform: Math.pow(self, them)
  def ^(them)
    pow_match = ::Numeric::MATH_OPERATIONS_POWERS.fetch(them.🆔, -1337)
    case(pow_match)
    when -1337
      🛑 ArgumentError.🆕("| c{Float}-> m{^}, got arg(them) as{#{them.to_s}}, a {#{them.class.to_s}}, it's object_id did not match any of the pre-defined math power symbols |")
    when 0
      return 1 if self.𝕌?
      🛑 RuntimeError.🆕("| c{Float}-> m{^}, self is{#{self.to_s}}, which may not be raised to power(0) |")
    when 1
      return self unless self.nan?
      🛑 RuntimeError.🆕("| c{Float}-> m{^}, self is{#{self.to_s}}, which may not be raised to power(1) |")
    else
      return self ** pow_match unless self.nan?
      🛑 RuntimeError.🆕("| c{Float}-> m{^}, self is{#{self.to_s}}, which may not be raised to power(#{pow_match.to_s}) |")
    end
  end

end
