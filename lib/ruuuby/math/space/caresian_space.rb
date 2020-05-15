# coding: UTF-8

# mathematics related
module ::Math

  # math related code that can be categorized under +Space+
  module Space

    # nodes consist of points that can form lines, geometrical shapes, etc
    class CartesianSpace < AbstractSpace
      def initialize(symbol, num_dimensions); super('cartesian', symbol, num_dimensions); end
    end

    # vector-space-1D
    class CartesianSpaceℝ¹ < CartesianSpace
      include ::Ruuuby::Attribute::Includable::RuuubySingleton

      def initialize; super(:ℝ¹, 1); end
    end

    # vector-space-2D
    class CartesianSpaceℝ² < CartesianSpace
      include ::Ruuuby::Attribute::Includable::RuuubySingleton

      def initialize; super(:ℝ², 2); end
    end

    # vector-space-3D
    class CartesianSpaceℝ³ < CartesianSpace
      include ::Ruuuby::Attribute::Includable::RuuubySingleton

      def initialize; super(:ℝ³, 3); end
    end

    # vector-space-4D
    class CartesianSpaceℝ⁴ < CartesianSpace
      include ::Ruuuby::Attribute::Includable::RuuubySingleton

      def initialize; super(:ℝ⁴, 4); end
    end

  end

end
