# encoding: utf-8

# add various functions to existing class +Integer+
class ::Integer
  alias_method :finite?, :finite?

  # @return [Boolean] true, all non-negative integers are considered in the set of natural-numbers(ℕ)
  def ℕ? ; self >= 0; end

  # @return [Boolean] true, all integers are considered in the set of math-integers(ℤ)
  alias_method :ℤ?, :finite?

  # @return [Boolean] true, all integers can be represented as rational numbers
  alias_method :ℚ?, :finite?

  # @return [Boolean] true, all integers can be represented as complex numbers (with imaginary component of 0)
  alias_method :ℂ?, :finite?

  # @return [Boolean] true, all integers are real numbers
  alias_method :ℝ?, :finite?
end
