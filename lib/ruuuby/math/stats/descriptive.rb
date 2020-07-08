# encoding: UTF-8

# mathematics related code
module ::Math

  module Stats

    # relatively focuses more on obtaining `inferences` for relationships between data
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
        🛑 ArgumentError.new("| c{Descriptive}-> m{percentage_error} requires a non-zero value for arg(actual) |") if actual.zero?
        ((actual - predicted.to_f) / actual).abs * 100.0
      end

      # @param [Float] predicted
      # @param [Float] actual
      #
      # @raise [ArgumentError]
      #
      # @return [Float]
      def self.relative_difference(predicted, actual)
        🛑flt❓(:predicted, predicted, :∈𝕌)
        🛑flt❓(:actual, actual, :∈𝕌)
        🛑 ArgumentError.new("| c{Descriptive}-> m{relative_difference} requires a non-zero value for arg(actual) |") if actual.zero?
        #((predicted - actual).abs / actual).abs * 100.0
        predicted == actual ? 0 : (100.0 * (((predicted - actual).abs) / ((predicted + actual) / 2.0)))
      end

      class << self
        alias_method :𝛿, :percentage_error
        alias_method :relative_change, :percentage_error
      end

    end

  end

end
