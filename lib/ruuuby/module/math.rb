# encoding: UTF-8

# add various aliases & functions to existing module +Math+
module ::Math

  # @param [Integer|Float|Numeric] value_a
  # @param [Integer|Float|Numeric] value_b
  #
  # @return [Float] relative difference of the provided args, order does not matter
  def self.relative_Δ(value_a, value_b)
    🛑num❓(:value_a, value_a)
    🛑num❓(:value_b, value_b)
    🛑 ArgumentError.new("m{Math}-> f{relative_Δ} received arg{value_a} which has value{#{value_a.to_s}} not in (𝕌)") unless value_a.𝕌?
    🛑 ArgumentError.new("m{Math}-> f{relative_Δ} received arg{value_b} which has value{#{value_b.to_s}} not in (𝕌)") unless value_b.𝕌?
    return 0 if value_a == 0 && value_b == 0
    numerator   = (value_a - value_b).abs
    denominator = (value_a + value_b) / 2.0
    100.0 * (numerator / denominator)
  end

end

=begin
  # @param [Integer|Float|Numeric] value_new
  # @param [Integer|Float|Numeric] value_old
  #
  # @return [Float] relative change of the provided args, order does matter
  #def self.relative_change(n_new, n_old)
  #  100.0 * ((n_new - n_old) / n_old)
  #end
=end
