# encoding: UTF-8

# mathematics related code
module ::Math

  module Stats

    # relatively focuses more on obtaining `inferences` for relationships between data
    #
    # | term          | description  | source  |
    # | ------------- | ------------ | ------- |
    # | `replication` | "the repetition of an experimental condition so that the variability associated with the phenomenon can be estimated" | 0x0 |
    module Descriptive

      # @param [Float] predicted
      # @param [Float] actual
      #
      # @raise [ArgumentError]
      #
      # @return [Float]
      def self.percentage_error(predicted, actual)
        🛑flt❓(:predicted, predicted, :∈𝕌)
        🛑flt❓(:actual, actual, :∈𝕌)
        🛑 ::ArgumentError.new("| m{Descriptive}-> m{percentage_error} requires a non-zero value for arg(actual) |") if actual.zero?
        ((actual - predicted.to_f) / actual).abs * 100.0
      end

      # @param [Float] predicted
      # @param [Float] actual
      #
      # @raise [ArgumentError]
      #
      # @return [Float]
      def self.relative_diff(predicted, actual)
        🛑flt❓(:predicted, predicted, :∈𝕌)
        🛑flt❓(:actual, actual, :∈𝕌)
        🛑 ::ArgumentError.new("| m{Descriptive}-> m{relative_diff} requires a non-zero value for arg(actual) |") if actual.zero?
        predicted == actual ? 0 : (100.0 * (((predicted - actual).abs) / ((predicted + actual) / 2.0)))
      end

      class << self
        alias_method :𝛿, :percentage_error
        #alias_method :relative_change, :percentage_error
      end

    end

  end

end

# resources
# 0x0) https://en.wikipedia.org/wiki/Replication_(statistics)
