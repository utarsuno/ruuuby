
# add various functions to existing class +Float+
class ::Float

  # @type [Float]
  INFINITY_NEGATIVE       = (-::Float::INFINITY).❄️

  # @type [Symbol]
  INFINITY_COMPLEX        = :∞ℂ

  # @type [Float]
  MIN_NORMAL              = (1.17549435E-38).❄️

  # @type [Float]
  RELATIVE_ERROR          = (0.00001).❄️

  # @type [Float]
  SMALLEST_RELATIVE_ERROR = (::Float::RELATIVE_ERROR * ::Float::MIN_NORMAL).❄️

  # original source code referenced from:
  # @see https://floating-point-gui.de/errors/NearlyEqualsTest.java
  #
  # @param [Float] them
  #
  # @raise [WrongParamType]
  #
  # @return [Boolean] true, if these numbers have a differences less than{::Float::RELATIVE_ERROR}
  def ≈≈(them)
    🛑num❓(:them, them)
    return true if self == them

    abs_a = self.abs
    abs_b = them.abs
    diff  = (self - them).abs

    if self == 0 || them == 0 || (abs_a + abs_b < ::Float::MIN_NORMAL)
      diff < ::Float::SMALLEST_RELATIVE_ERROR
    else
      if abs_a + abs_b <= Float::MAX
        (diff / (abs_a + abs_b)) < ::Float::RELATIVE_ERROR
      else
        (diff / Float::MAX) < ::Float::RELATIVE_ERROR
      end
    end
  end

  # @return [Boolean] false, `complex-infinity` is currently represented through a `Symbol`
  def ∞ℂ? ; false ; end

  alias_method :¿?, :nan?

  # @return [Boolean] true, (if-valid) all floats can be represented as complex numbers (with imaginary component of 0)
  alias_method :ℂ?, :finite?

  # @return [Boolean] true, all floats are real numbers(+ℝ+); unless non-finite
  alias_method :ℝ?, :finite?

  # @return [Boolean] true, the universal-set(+𝕌+) in this context only excludes (NaN, +∞, and -∞)
  alias_method :𝕌?, :finite?

  # @return [Boolean] true, if there is no imaginary component and the real component is a natural-number(+ℕ+)
  def ℕ? ; (!(∞? || negative?)) && (self == 0 || ((self % 1) == 0)) ; end

  # @return [Boolean] true, if this number's contents are equivalent to any number in the set of math-integers(+ℤ+)
  def ℤ? ; self.ℝ? && (self == 0 || ((self % 1) == 0)) ; end

  # ⚠️, coverage missing beyond ℤ
  #
  # @return [Boolean|NilClass]
  def ℚ?
    return false unless self.ℝ?
    return true if self.ℤ?
    nil
  end

end
