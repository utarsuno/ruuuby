# encoding: UTF-8

# | flag                            | bitwise position | decimal value (as single flag enabled) |
# | -----------------------------: | :--------------- | :-----------------------------------: |
# | TS_FLAG_CONTAINS_VALUE_ZERO    | 0                | 1                                     |
# | TS_FLAG_CONTAINS_NO_NEGATIVES  | 1                | 2                                     |
# | TS_FLAG_IS_NORMALIZED          | 2                | 4                                     |
# | TS_FLAG_IS_LEN_EVEN            | 3                | 8                                     |
# | TS_FLAG_IS_STRICTLY_INCREASING | 4                | 16                                    |
# | TS_FLAG_IS_STRICTLY_DECREASING | 5                | 32                                    |
# | TS_FLAG_IS_ALL_SAME            | 6                | 64                                    |

#==Documentation
# {MSE}  | scale-dependent; can't be used to compare accuracy across time series w/ different scales |
# {MAPE} | not scale-dependent; can't be used when percentages don't make sense                      |
# {MASE} | independent of scale and usable on all scales                                             |
#
# LEADING    | leading -> anticipates future
# LAGGING    | lagging -> validate upcoming trend
# MOMENTUM   | help identify momentum (attribute w/ relation to time)
# VOLATILITY | measure delta of price movement
# VOLUME     |
#
# LAGGING | simple_moving_average, moving_average_convergence_divergence(MACD) | bollinger_bands, average_true_range, standard_deviation | volume_rate_of_change
# LEADING | parabolic_stop_and_reverse(parabolic SAR) | stochastic_oscillator, commodity_channel_index(CCI), relative_strength_index(RSI) | chaikin_oscillator, on_balance_volume(OBV)
#
class ::TimeSeriesData

  alias_method :sum², :sum_squared
  alias_method :σ, :std_dev
  alias_method :σ², :variance
  alias_method :μ, :mean
  alias_method :x̃, :median
  alias_method :q2, :median
  alias_method :ρ, :pearson_correlation_coefficient
  alias_method :λ, :scale_by_addition
  alias_method :Λ, :scale_by_multiplication
  alias_method :η̂?, :normalized?
  alias_method :η̂!, :normalize!
  alias_method :nᵗʰ_percent_rank, :nth_percent_rank
  alias_method :♻️, :free_memory

  # @type [Ruuuby::BitwiseFlag]
  BITWISE_FLAGS = ::Ruuuby::BitwiseFlag.new(%w(has_zero? has_negative? normalized? even? strictly_increasing? strictly_decreasing? all_same?))

  # @param [TimeSeriesData] data
  #
  # @raise [ArgumentError]
  #
  # @return [Float]
  def correlation_with(data)
    🛑 ::ArgumentError.new("| c{TimeSeriesData}-> m{R} requires arg(data) of type{TimeSeriesData} but received{#{data.Ⓣ}} |") unless data.is_a?(::TimeSeriesData)
    🛑 ::ArgumentError.new("| c{TimeSeriesData}-> m{R} requires arg(data) to match self-len{#{self.len.to_s}} but received{#{data.len.to_s}}") unless data.len == self.len
    numerator_xy = 0
    (0...self.len).∀{|index| numerator_xy += data[index] * self[index]}
    numerator    = (self.len * numerator_xy) - (data.sum * self.sum)
    denominator  = ::Math.sqrt(self.len * data.sum_of_squares - data.sum²) * ::Math.sqrt(self.len * self.sum_of_squares - self.sum²)
    numerator / denominator
  end

  # helps show relation between the `dependent variable` and 1 or more `independent variables`
  #
  # @param [TimeSeriesData] data
  #
  # @raise [ArgumentError]
  #
  # @return [Float]
  def R²(data); self.correlation_with(data) ** 2; end

  # TODO: un-sorted data not covered atm, `wip`
  # TODO: in future, offer score between 0-1.0 once there are a significant amount of attributes to track
  #
  # @return [Boolean]
  def healthy?
    self.outliers_lower.∅? && self.outliers_upper.∅? && !self.all_same?
  end

  # @return [Array]
  def outliers_lower
    outliers = []
    boundary = self.boundary_outliers_min
    (0...self.len).∀{|index| outliers << self[index] if self[index] < boundary}
    outliers
  end

  # @return [Array]
  def outliers_upper
    outliers = []
    boundary = self.boundary_outliers_max
    (0...self.len).∀{|index| outliers << self[index] if self[index] > boundary}
    outliers
  end

  alias_method :R, :correlation_with
  alias_method :r_squared, :R²

  alias_method :Q₁, :q1
  alias_method :Q₂, :median
  alias_method :Q₃, :q3

end

# TODO: https://en.wikipedia.org/wiki/Generalized_mean
# https://www.statsdirect.com/help/basics/p_values.htm
# https://www.researchgate.net/post/What_is_the_relationship_between_R-squared_and_p-value_in_a_regression

# TODO: gradient descent
# TODO: https://en.wikipedia.org/wiki/Quantile
