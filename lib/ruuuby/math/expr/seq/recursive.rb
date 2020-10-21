# encoding: UTF-8

# mathematics related code
module ::Math

  module Expr

    # "each term is dependent on the values of the previous N terms"
    class RecursiveSequence < Sequence

      def initialize(max_cache_index, input_type)
        super(max_cache_index, input_type)
      end

    end

  end

end
