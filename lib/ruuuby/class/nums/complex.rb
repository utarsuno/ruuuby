# coding: UTF-8

# `Ruuuby` modifications to existing class{+Complex+}
class ::Complex

  # @return [Boolean]
  def one?; self == 1; end

  # @return [Boolean]
  def smells_like_int?; self.imaginary.zero? && self.real.smells_like_int?; end

  # @return [Boolean]
  def gaussian_integer?; ℤ.∋?(self.imaginary) && ℤ.∋?(self.real); end

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
