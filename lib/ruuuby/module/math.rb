# coding: UTF-8

# add various aliases & functions to existing Module(+Math+)
module ::Math

  # @param [Integer, Float, Numeric] value_a
  # @param [Integer, Float, Numeric] value_b
  #
  # @return [Float] relative difference of the provided args, order does not matter
  def self.relative_Δ(value_a, value_b)
    🛑𝕌❓($PRM_MANY, [value_a, value_b])
    return 0 if value_a == 0 && value_b == 0
    numerator   = (value_a - value_b).abs
    denominator = (value_a + value_b) / 2.0
    100.0 * (numerator / denominator)
  end

  # TODO: add unit tests
  #
  # @param [Integer, Float, Numeric] num_a
  # @param [Integer, Float, Numeric] num_b
  # @param [Integer, Float, Numeric] num_c
  #
  # @return [Boolean] true, if: a² + b² == c²
  def self.pythagoras_τ³?(num_a, num_b, num_c)
    🛑𝕌❓($PRM_MANY, [num_a, num_b, num_c])
    return (((num_a ** 2) + (num_b ** 2)) == (num_c ** 2))
  end

  # @type [Object] placeholder
  VECTOR_SPACE_ALL_N_TUPLES = Object.🆕

  # @type [Object] placeholder
  VECTOR_SPACE_1D           = Object.🆕

  # @type [Object] placeholder
  VECTOR_SPACE_2D           = Object.🆕

  # @type [Object] placeholder
  VECTOR_SPACE_3D           = Object.🆕

  # @type [Object] placeholder
  VECTOR_SPACE_4D           = Object.🆕
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
