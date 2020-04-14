
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

  # `Ruuuby` implementation before switching to `C-extensions`: (`f98`)
  #
  # @param [Symbol]
  #
  # @raise [ArgumentError]
  # @raise [NotImplementedError] when raising a `Complex` to symbolic inf
  #
  # @return [Numeric, Float, Complex, Rational]
  def ^(n)
    evaluated = n.sym?(:∈superscripts)
    if evaluated.int?
      self ** evaluated
    elsif evaluated.flt?
      🛑 NotImplementedError.🆕("| c{Rational}-> m{^} self(#{self.to_s}) received invalid exponential argument(#{n.to_s}) |")
    else
      🛑 ArgumentError.🆕("| c{Rational}-> m{^} self(#{self.to_s}) received invalid exponential argument(#{n.to_s}) |")
    end
  end

end
