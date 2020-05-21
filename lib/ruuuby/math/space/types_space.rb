# coding: UTF-8

# mathematics related
module ::Math

  # math related code that can be categorized under +Space+
  module Space

    class TypesSpace < AbstractSpace
      def initialize(symbol, num_dimensions); super('types', symbol, num_dimensions); end
    end

    class TypesSpaceⓣ¹ < TypesSpace
      def initialize; super(:ⓣ¹, 1); end
    end

    class TypesSpaceⓣⁿ < TypesSpace
      def initialize; super(:ⓣⁿ, nil); end
    end

  end

end
