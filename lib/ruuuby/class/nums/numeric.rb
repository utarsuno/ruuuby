# encoding: UTF-8

# add various aliases & functions to existing Class(+Numeric+)
class ::Numeric

  # ---------------------------------------------------------------------------------------------------------- | *f10* |

  # @return [Boolean] true, if this number is neither NaN or ±∞
  def ∞? ; self.infinite? != nil ; end

  # | ------------------------------------------------------------------------------------------------------------------

  # @note: for any 2 transcendentals `a` & `b`, at least one of `a+b` and `a*b` must be transcendental
  #
  # @example:
  #  * (π)           is transcendental
  #  * (1 - π)       is transcendental
  #  * (π + (1 - π)) is not transcendental

end
