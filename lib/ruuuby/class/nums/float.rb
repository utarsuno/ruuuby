# coding: UTF-8

# add various aliases & functions to existing Class(+Float+)
class ::Float

  # @type [Float]
  INFINITY_NEGATIVE = (-::Float::INFINITY).❄️

  # @type [Symbol]
  INFINITY_COMPLEX  = :∞ℂ

  alias_method :≈≈, :basically_equal?

  # @return [Boolean] false, `complex-infinity` is currently represented through a `Symbol`
  def ∞ℂ?; false; end

  alias_method :¿?, :nan?

  # @return [Boolean]
  def one?; self == 1; end

  # @return [Boolean]
  def smells_like_int?; !(self.has_decimals?); end

end
