# coding: UTF-8

# add various aliases & functions to existing Module(+Math+)
module ::Math

  # @param [Integer, Float, Numeric] value_a
  # @param [Integer, Float, Numeric] value_b
  #
  # @return [Float] relative difference of the provided args, order does not matter
  def self.relative_Δ(a: ::Float::INFINITY, b: ::Float::INFINITY)
    🛑nums❓([a, b], :∈𝕌)
    if a == 0 && b == 0
      return 0
    else
      return (100.0 * (((a - b).abs) / ((a + b) / 2.0)))
    end
  end

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

=begin
  # @param [Integer, Float, Numeric] value_new
  # @param [Integer, Float, Numeric] value_old
  #
  # @return [Float] relative change of the provided args, order does matter
  #def self.relative_change(n_new, n_old)
  #  100.0 * ((n_new - n_old) / n_old)
  #end
=end
