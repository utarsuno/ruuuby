# encoding: UTF-8

# -------------------------------------------- ⚠️ --------------------------------------------

=begin

# mathematics related code
module ::Math

  # math related code that can be categorized under +Space+
  module Space

    class TupleSpace < AbstractSpace
      def initialize(symbol, num_dimensions); super('tuple', symbol, num_dimensions); end
    end

    class TupleSpace𝕿¹ < TupleSpace
      def initialize; super(:𝕿¹, 1); end
    end

    class TupleSpace𝕿² < TupleSpace
      def initialize; super(:𝕿², 2); end
    end

    class TupleSpace𝕿³ < TupleSpace
      def initialize; super(:𝕿³, 3); end
    end

  end
end

=end

# -------------------------------------------- ⚠️ --------------------------------------------
