# coding: UTF-8

# add various aliases & functions to existing Class(+Numeric+)
class ::Numeric

  # ---------------------------------------------------------------------------------------------------------- | *f11* |

  # @return [Boolean] true, if this number is neither NaN or ±∞
  def ∞? ; self.infinite? != nil ; end

  # ---------------------------------------------------------------------------------------------------------- | *f16* |

  # @type [Symbol]
  EXPONENTIAL_INF          = :∞

  # @type [Symbol]
  EXPONENTIAL_NEGATIVE_INF = :'-∞'

  # | ------------------------------------------------------------------------------------------------------------------

  # @note: for any 2 transcendentals `a` & `b`, at least one of `a+b` and `a*b` must be transcendental
  #
  # @example:
  #  * (π)           is transcendental
  #  * (1 - π)       is transcendental
  #  * (π + (1 - π)) is not transcendental
  #
  # @return [Boolean]
  #def self.known_transcendental?(n); ::Math::SetTheory::RealNumbers::KNOWN_TRANSCENDENTALS.∋?(n.🆔); end

  # @return [Boolean]
  def self.known_real_algebraic?(n); ::Math::SetTheory::RealAlgebraicNumbers::KNOWN_REAL_ALGEBRAIC.∋?(n.🆔); end

  # @return [Boolean]
  def self.known_irrational?(n); ::Math::SetTheory::IrrationalNumbers::KNOWN_IRRATIONALS.∋?(n.🆔); end

end
