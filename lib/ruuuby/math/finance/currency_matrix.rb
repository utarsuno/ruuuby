# encoding: UTF-8

using ::Math::Algebra::Tropical::ContextNumeric
using ::Math::Algebra::Tropical::ContextMatrix

# -------------------------------------------- ⚠️ --------------------------------------------

module ::Math

  module Finance

    # @note: temporary implementation
    #
    # ‣ w/ `n` currencies there exists `n² - n` exchange rates
    class CurrencyMatrix

      attr_reader :labels, :data, :cached_stats

      def initialize(labels, data, raw_ratios=true)
        🛑ary❓('labels', labels)
        🛑matrix❓('data', data)
        @labels = labels
        @data   = data
        @len    = data.num_rows
        🛑 ::ArgumentError.new("| c{CurrencyMatrix}-> m{initialize} requires matrix-arg(data){#{data.to_s}} to have equal # of rows and cols |") unless data.▣?
        🛑 ::ArgumentError.new("| c{CurrencyMatrix}-> m{initialize} requires matrix-arg(labels){#{data.to_s}} to match row/col length of the provided matrix-arg |") unless @len == @labels.length
        @cached_stats = {
            power_layers: [],
            power_layer_scores: [],
            num_trades: -1337,
            currencies_in_trade: [],
            karp_vals: [],
        }
        @normalized = !raw_ratios
      end

      # @return [Matrix] self (w/ each normalized via lnₑ)
      def η̂!
        if @normalized
          🛑 ::RuntimeError.new("| c{CurrencyMatrix}-> m{η̂!} may not be called when this instance is already normalized |")
        else
          @data.∀ₓᵢⱼ{|x,i,j| @data[i,j] = logₑ(@data[i,j])}
          @normalized = true
          self
        end
      end

      def algo_🌴_arbitrage
        self.calc_karps_algo_values
        self.calc_arbitrage_multipliers
        @cached_stats
      end

      # @return [Array]
      def calc_arbitrage_multipliers
        🛑 ::RuntimeError.new("| c{CurrencyMatrix}-> m{calc_arbitrage_multipliers} already has warm cache |") unless @cached_stats[:power_layers].empty?
        i        = 2
        best_val = 0.0
        while i <= @len
          _max      = ::Float::MIN
          _max_i    = -1337
          _layer    = []
          local_max = ::Float::MIN
          @data.⨂ⁿ(i).∀ₓᵢ↘ do |x,p|
            _x = x.round(6)
            if _x > _max
              _max   = _x
              _max_i = p
            end
            if x > local_max
              local_max = x
            end
            _layer << _x
          end
          @cached_stats[:power_layers]       << _layer
          @cached_stats[:power_layer_scores] << (local_max / i.to_f)
          _value = (_max / i.to_f).round(6)
          if _value > best_val
            best_val                   = _value
            @cached_stats[:num_trades] = i
          end
          i += 1
        end
        best_layer = @cached_stats[:power_layers][@cached_stats[:num_trades] - 2]
        layer_max  = best_layer.max
        best_layer.∀ₓᵢ do |val,_index|
          if val == layer_max
            @cached_stats[:currencies_in_trade] << @labels[_index]
          end
        end
        if @cached_stats[:currencies_in_trade].length != @cached_stats[:num_trades]
          raise "missing coverage: handle when num-trades{#{@cached_stats[:num_trades].to_s}} does not get matched fully w/ currency-in-trade{#{@cached_stats[:currencies_in_trade].length.to_s}}"
        end
        #@cached_stats[:power_layers][@cached_stats[:num_trades] - 2]
        best_layer
      end

      # karps algo will verify the best value but NOT which vertexes are involved to create that best value
      #
      # @return [Float, Integer, Numeric]
      def calc_karps_algo_values
        🛑 ::RuntimeError.new("| c{CurrencyMatrix}-> m{calc_karps_algo_values} already has warm cache |") unless @cached_stats[:karp_vals].empty?
        (0...@len).∀ do |i|
          @cached_stats[:karp_vals] << self.karps_algorithm(i)
        end
        @cached_stats[:karp_vals]
      end

      🙈

      # @param [Integer] target_vertex
      #
      # @return [Float]
      def karps_algorithm(target_vertex)
        identity_matrix                = ::Array.new(@len, ::Float::INFINITY_NEGATIVE)
        identity_matrix[target_vertex] = 0.0
        identity_matrix                = ::Matrix.column_vector(identity_matrix)
        vᵢ                             = @data.⨂(identity_matrix)
        results                        = [identity_matrix, vᵢ]
        index                          = 1
        while index < @len
          result_prev = vᵢ
          vᵢ          = @data.⨂(result_prev)
          results << vᵢ
          index += 1
        end
        _local_mins = []
        i = 0
        while i < @len
          k = 0
          _local_row = []
          while k < @len
            the_result = (results[@len][i,0] - results[k][i,0]) / ((@len - k).to_f)
            if the_result.nan?
              _local_row << 0.0
            else
              _local_row << the_result
            end
            k += 1
          end
          _local_mins << _local_row.min
          i += 1
        end
        _local_mins.max
      end

    end

  end

end

# -------------------------------------------- ⚠️ --------------------------------------------

#         __    __               __               __
#        /\ \__/\ \__         __/\ \             /\ \__  __
#    __  \ \ ,_\ \ ,_\  _ __ /\_\ \ \____  __  __\ \ ,_\/\_\    ___     ___     ____  __
#  /'__`\ \ \ \/\ \ \/ /\`'__\/\ \ \ '__`\/\ \/\ \\ \ \/\/\ \  / __`\ /' _ `\  /',__\/\_\
# /\ \L\.\_\ \ \_\ \ \_\ \ \/ \ \ \ \ \L\ \ \ \_\ \\ \ \_\ \ \/\ \L\ \/\ \/\ \/\__, `\/_/_
# \ \__/.\_\\ \__\\ \__\\ \_\  \ \_\ \_,__/\ \____/ \ \__\\ \_\ \____/\ \_\ \_\/\____/ /\_\
#  \/__/\/_/ \/__/ \/__/ \/_/   \/_/\/___/  \/___/   \/__/ \/_/\/___/  \/_/\/_/\/___/  \/_/
#
# | #    | source URL                                                                         |
# | ---- | ---------------------------------------------------------------------------------- |
# | 0x0  | https://commons.lib.jmu.edu/cgi/viewcontent.cgi?article=1303&context=honors201019  |
