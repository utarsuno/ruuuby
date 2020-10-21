# encoding: UTF-8

# mathematics related code
module ::Math

  module Expr

    # "each term is found by multiplying the previous term by a constant"
    class GeometricSequence < Sequence

      def initialize(max_cache_index, input_type)
        super(max_cache_index, input_type)
      end

    end

  end
end
