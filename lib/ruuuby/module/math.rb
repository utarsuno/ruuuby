# coding: UTF-8

# add various aliases & functions to existing Module(+Math+)
module ::Math

  # @param [Integer, Float, Numeric] value_a
  # @param [Integer, Float, Numeric] value_b
  #
  # @return [Float] relative difference of the provided args, order does not matter
  def self.relative_Δ(a: ::Float::INFINITY, b: ::Float::INFINITY)
    🛑num❓($PRM_MANY, [a, b], :∈𝕌)
    if a == 0 && b == 0
      return 0
    else
      return (100.0 * (((a - b).abs) / ((a + b) / 2.0)))
    end
  end

  # @note:
  #  * if `a² + b² = c²`, then the triangle is `right`
  #  * if `a² + b² > c²`, then the triangle is `acute`
  #  * if `a² + b² < c²`, then the triangle is `obtuse`
  #
  # @param [Integer, Float, Numeric] a
  # @param [Integer, Float, Numeric] b
  # @param [Integer, Float, Numeric] c
  #
  # @return [Boolean] true, if: a² + b² == c²
  def self.τ³_is_pythagorean?(a: ::Float::INFINITY, b: ::Float::INFINITY, c: ::Float::INFINITY)
    if a.θ? && b.θ? && c.θ?
      return ((a + b + c).° == 180.0)
    else
      🛑num❓($PRM_MANY, [a, b, c], :∈𝕌)
      return (((a ** 2) + (b ** 2)) == (c ** 2))
    end
  end

  # @param [Integer, Float, Numeric] a (must be larger than b)
  # @param [Integer, Float, Numeric] b
  #
  # @return [Boolean] true, if: a² + b² == c²
  def self.τ²_in_golden_ratio?(a: ::Float::INFINITY, b: ::Float::INFINITY)
    🛑num❓($PRM_MANY, [a, b], :∈𝕌) unless a.θ? && b.θ?
    return (a / b) == ::Float::GOLDEN_RATIO
  end

  # @param [Integer, Float, Numeric] a (must be larger than b)
  # @param [Integer, Float, Numeric] b
  #
  # @return [Boolean] true, if: a² + b² == c²
  def self.τ²_in_super_golden_ratio?(a: ::Float::INFINITY, b: ::Float::INFINITY)
    🛑num❓($PRM_MANY, [a, b], :∈𝕌) unless a.θ? && b.θ?
    return (a % b) == Ψ
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
