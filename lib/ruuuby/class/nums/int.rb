
# add various functions to existing class +Integer+
class ::Integer
  # @return [Boolean] true, all non-negative integers are considered in the set of natural-numbers(ℕ)
  def ℕ? ; self >= 0; end

  # @return [Boolean] true, all integers are considered in the set of math-integers(ℤ)
  def ℤ? ; true ; end

  # @return [Boolean] true, all integers can be represented as rational numbers
  def ℚ? ; true ; end

  # @return [Boolean] true, all integers can be represented as complex numbers (with imaginary component of 0)
  def ℂ? ; true ; end

  # @return [Boolean] true, all integers are real numbers
  def ℝ? ; true ; end
end
