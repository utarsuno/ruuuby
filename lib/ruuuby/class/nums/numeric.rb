# encoding: utf-8

# add various functions to existing module +Numeric+ (and explicitly create aliases to play nice with IDEs)
class ::Numeric

  # @return [Boolean] true, if this number is neither NaN or ±∞
  def ∞? ; self.infinite? != nil ; end
end
