# encoding: utf-8

# add various functions to existing module +Numeric+ (and explicitly create aliases to play nice with IDEs)
class ::Numeric

  # @return [Boolean] true, if this number is neither NaN or ±∞
  def ∞? ; self.infinite? != nil ; end

  # @return [Boolean] true, if this number is equivalent to 0 or 1
  def 𝔹? ; self == 0 || self == 1 ; end

  # @return [Boolean] true, the universal-set(𝕌) in this context only excludes (NaN, +∞, and -∞)
  alias_method :𝕌?, :finite?
end
