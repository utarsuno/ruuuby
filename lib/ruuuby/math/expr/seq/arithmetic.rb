# coding: UTF-8

# mathematics related code
module ::Math

  module Expr

    # "the difference between one term and the next is a constant"
    class ArithmeticSequence < Sequence
      # TODO: add gauss formula here (work w/ any arithmetic series, not just {1, 2, 3...n})

      def initialize(max_cache_index, input_type)
        super(max_cache_index, input_type)
      end

    end

  end
end
