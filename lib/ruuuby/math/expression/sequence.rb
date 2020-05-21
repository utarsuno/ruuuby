# coding: UTF-8

module ::Math

  module Expression

    # a math function w/ domain being a subset/set of natural-numbers
    class Sequence < MathFunc

      def initialize(*args)
        @all_args = args
        @context  = nil
      end

    end

    # "the difference between one term and the next is a constant"
    class ArithmeticSequence < Sequence

      # TODO: add gauss formula here (work w/ any arithmetic series, not just {1, 2, 3...n})

    end

    # "each term is found by multiplying the previous term by a constant"
    class GeometricSequence < Sequence
    end

  end

end

