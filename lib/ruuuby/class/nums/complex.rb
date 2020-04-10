
# add various functions to existing class +Complex+
class ::Complex

  # @return [Boolean] true, if there is no imaginary-component and the real-component is a natural-number(+ℕ+)
  def ℕ? ; self.imaginary == 0 && self.real.ℕ? ; end

  # @return [Boolean] true, if there is no imaginary-component and the real-component is a mathematical-integer(+ℤ+)
  def ℤ? ; self.imaginary == 0 && self.real.ℤ? ; end

  # @return [Boolean] true, if there is no imaginary-component and the real-component can be represented as a rational-number(+ℚ+)
  def ℚ? ; self.imaginary == 0 && self.real.ℚ? ; end

  # @return [Boolean] false, (+ℝ+) is notation for real-numbers (true if real component is real-number and imaginary-component is zero)
  def ℝ? ; self.imaginary == 0 && self.real.ℝ? ; end

  # all complex-numbers can be represented as:
  #
  #   - complex-numbers(+ℂ+)   (unless non-finite)
  #   - universal-numbers(+𝕌+) (unless non-finite)
  #
  ⨍_add_aliases(:finite?, [:ℂ?, :𝕌?])

  def ^(n)
    if n.sym?
      if n.power?
        self ** n.pow_to_i
      end
    end
  end

end
