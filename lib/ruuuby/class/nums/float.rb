# coding: UTF-8

# add various aliases & functions to existing Class(+Float+)
class ::Float

  # @type [BigDecimal]
  CONST_OMEGA = BigDecimal('0.567143290409783872999968662210355549753815787186512508135131079223045793086684566693219446961752294557638')

  # @type [BigDecimal]
  E_POW_CONST_OMEGA = ::BigMath.exp(::Float::CONST_OMEGA, 42)

  # @type [Float]
  INFINITY_NEGATIVE = (-::Float::INFINITY).❄️

  # @type [Symbol]
  INFINITY_COMPLEX  = :∞ℂ

  alias_method :≈≈, :basically_equal?

  # @return [Boolean] false, `complex-infinity` is currently represented through a `Symbol`
  def ∞ℂ?; false; end

end
