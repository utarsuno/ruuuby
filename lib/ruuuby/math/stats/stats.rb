# coding: UTF-8

# mathematics related code
module ::Math
  module Stats

    # ‣ notice: all data points share equal weight
    #
    # @param [*] vals
    #
    # @return [Float, Numeric] Σ(vals) / vals.length
    def self.arithmetic_mean(*vals)
      🛑 ArgumentError.new("| c{Math::Stats}-> m{arithmetic_mean} got no args |") if (vals.∅? || (!(vals.ary?)))
      🛑nums❓(vals, :∈𝕌)
      (vals.sum.to_f) / (vals.length.to_f)
    end

    # @see source solution credit: https://stackoverflow.com/questions/14859120/calculating-median-in-ruby
    #
    # @param [*] vals
    #
    # @return [Float, Numeric]
    def self.median(*vals)
      🛑 ArgumentError.new("| c{Math::Stats}-> m{arithmetic_mean} got no args |") if (vals.∅? || (!(vals.ary?)))
      🛑nums❓(vals, :∈𝕌)
      sorted = vals.sort
      len    = sorted.length
      (sorted[(len - 1) / 2] + sorted[len / 2]) / 2.0
    end

  end
end
