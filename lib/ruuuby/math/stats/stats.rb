# coding: UTF-8

# mathematics related code
module ::Math
  module Stats

    # ‣ notice: all data points share equal weight
    #
    # @return [Float, Numeric] Σ(vals) / vals.length
    def self.arithmetic_mean(*vals)
      🛑 ArgumentError.new("| c{Math::Stats}-> m{arithmetic_mean} got no args |") if (vals.∅? || (!(vals.ary?)))
      🛑nums❓(vals)
      (vals.sum.to_f) / (vals.length.to_f)
    end

  end
end
