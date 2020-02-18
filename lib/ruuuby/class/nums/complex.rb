
# add various functions to existing class +Complex+
class ::Complex

  # @return [Boolean] true, if there is no imaginary component and the real component is a natural number
  def ℕ?
    return false unless self.imaginary == 0
    self.real.ℕ?
  end

  # @return [Boolean] true, if there is no imaginary component and the real component is a mathematical integer
  def ℤ?
    return false unless self.imaginary == 0
    self.real.ℤ?
  end

  # @return [Boolean] true, if there is no imaginary component and the real component can be represented as a rational number
  def ℚ?
    return false unless self.imaginary == 0
    self.real.ℚ?
  end

  # @return [Boolean] true, ℂ is notation for complex numbers so only false case is non-finite nums
  def ℂ?
    return false unless self.finite?
    true
  end

  # @overload
  #
  # @return [Boolean] false, ℝ is notation for real numbers (true if real component is real-number and imaginary component is zero)
  def ℝ?
    return false unless self.imaginary == 0
    self.real.ℝ?
  end
  
end
