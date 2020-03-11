# encoding: utf-8

# add various functions to existing class +Integer+
class ::Integer

  # @return [Boolean] false, all integers(+ℤ+) are considered not infinite
  alias_method :infinite?, :infinite?

  # @return [Boolean] true, all integers(+ℤ+) are considered finite
  alias_method :finite?, :finite?

  # @return [Boolean] false, there are no Ruby/Math integers(+ℤ+) representing infinity
  alias_method :∞?, :infinite?

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

  alias_method :preserved_reference_to_bitwise_or, :^

  # default operation{"Bitwise EXCLUSIVE OR"}; a check is added in to allow operations (w/ precedence) such as `5^²`
  #
  # @overload
  #
  # @param [Numeric|Symbol] them | if 🆔 matches a power (ex: ²), then essentially perform: Math.pow(self, them); otherwise default bitwise operation
  #
  # @return [Numeric] "The result may be an Integer, a Float, a Rational, or a complex number."
  def ^(them)
    pow_match = ::Numeric::MATH_OPERATIONS_POWERS.fetch(them.🆔, -1337)
    case(pow_match)
    when -1337
      self.preserved_reference_to_bitwise_or(them)
    when 0
      return 1
    when 1
      self
    else
      self ** pow_match
    end
  end

end
