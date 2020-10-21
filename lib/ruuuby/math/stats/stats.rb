# encoding: UTF-8

# mathematics related code
module ::Math
  module Stats

    # ‣ notice: all data points share equal weight
    #   ‣ thus it does NOT take into account the `evenness` of the data
    #
    # @param [*] vals
    #
    # @return [Float, Numeric] Σ(vals) / vals.length
    def self.arithmetic_mean(*vals)
      🛑ary❓('vals', vals, :∉∅)
      🛑nums❓(vals, :∈𝕌)
      (vals.sum.to_f) / (vals.length.to_f)
    end

    # @see source solution credit: https://stackoverflow.com/questions/14859120/calculating-median-in-ruby
    #
    # @param [*] vals
    #
    # @return [Float, Numeric]
    def self.median(*vals)
      🛑ary❓('vals', vals, :∉∅)
      🛑nums❓(vals, :∈𝕌)
      sorted = vals.sort
      len    = sorted.length
      (sorted[(len - 1) / 2] + sorted[len / 2]) / 2.0
    end

    class << self
      alias_method :μ, :arithmetic_mean
      alias_method :x̃, :median
    end

  end
end
