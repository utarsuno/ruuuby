# encoding: UTF-8

# add various aliases & functions to existing Module(+Math+)
module ::Math

  # @param [Integer, Float, Numeric] a (must be larger than b)
  # @param [Integer, Float, Numeric] b
  #
  # @return [Boolean] true, if: a² + b² == c²
  def self.τ²_in_golden_ratio?(a: ::Float::INFINITY, b: ::Float::INFINITY)
    🛑nums❓([a, b], :∈𝕌) unless a.θ? && b.θ?
    return (a / b) == ::Float::RATIO_GOLDEN
  end

  # @param [Integer, Float, Numeric] a (must be larger than b)
  # @param [Integer, Float, Numeric] b
  #
  # @return [Boolean] true, if: a² + b² == c²
  def self.τ²_in_super_golden_ratio?(a: ::Float::INFINITY, b: ::Float::INFINITY)
    🛑nums❓([a, b], :∈𝕌) unless a.θ? && b.θ?
    return (a % b) == ::Float::RATIO_GOLDEN_SUPER
  end

end

