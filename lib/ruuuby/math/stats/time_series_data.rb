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
# LEADING | parabolic_stop_and_reverse(parabolic SAR) | stochastic_oascillator, commodity_channel_index(CCI), relative_strength_index(RSI) | chaikin_oscillator, on_balance_volume(OBV)
#
class ::TimeSeriesData

  alias_method :σ, :std_dev
  alias_method :σ², :variance
  alias_method :μ, :mean
  alias_method :x̃, :median
  alias_method :ρ, :pearson_correlation_coefficient
  alias_method :λ, :scale_by_addition
  alias_method :Λ, :scale_by_multiplication
  alias_method :η̂?, :normalized?
  alias_method :η̂!, :normalize!

  # @type [Ruuuby::BitwiseFlag]
  BITWISE_FLAGS = ::Ruuuby::BitwiseFlag.new(%w(has_zero? has_negative? normalized? even? strictly_increasing? strictly_decreasing? all_same?))

end
