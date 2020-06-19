# coding: UTF-8

# mathematics related code
module ::Math

  module Stats

    module TimeSeries

      # @example
      #
      #  ‣ trade-off between `num-samples` and the `weight` attached to the most recent data point can tuned w/:
      #    ‣ let T = target weight % for most recent data point
      #    ‣ let C = smoothing_constant (usually 2.0)
      #    ‣ `(C / T) - 1` == `num-samples`
      #      ‣ `(2 / 0.05) - 1 == 39.0` | 39 sample points w/ a 5% weight to the most recent data point
      #      ‣ `(2 / 0.20) - 1 == 9.0`  | 9 sample points w/ a 20% weight to the most recent data point
      #      ‣ `(2 / 0.40) - 1 == 4.0`  | 4 sample points w/ a 40% weight to the most recent data point
      #
      # @param [Array]   data
      # @param [Integer] n
      # @param [Float]   smoothing_constant
      #
      # @raise [ArgumentError]
      #
      # @return [Array]
      def self.exponential_moving_average(data, n, smoothing_constant=2.0)
        if data.∅? || !data.ary? || !n.int?(:∈ℕ)
          🛑 ArgumentError.new("| m{Math::Stats::TimeSeries}-> m{exponential_moving_average} got bad args {#{n.to_s},#{n.class.to_s}}, data-class-was{#{data.class.to_s}} |")
        elsif n + 1 > data.length || n <= 1
          🛑 ArgumentError.new("| m{Math::Stats::TimeSeries}-> m{exponential_moving_average} got bad args, n{#{n.to_s}} is (<= 1) or longer than (len-1):{#{(data.length-1).to_s}} provided |")
        else
          len_data = data.length
          ema_prev = ::Math::Stats.arithmetic_mean(*(data[0, n]))
          ema_data = [ema_prev]
          k_const  = smoothing_constant / (n + 1.0)
          index    = n
          while index < len_data
            # data[index] --> current node
            ema_today = k_const * (data[index] - ema_prev) + ema_prev
            ema_prev  = ema_today
            ema_data << ema_today
            index += 1
          end
          ema_data
        end
      end

    end

  end

end
