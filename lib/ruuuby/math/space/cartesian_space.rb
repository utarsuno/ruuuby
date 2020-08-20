# encoding: UTF-8

# -------------------------------------------- ⚠️ --------------------------------------------

=begin

# mathematics related code
module ::Math
  # math related code that can be categorized under +Space+
  module Space

    # - nodes consist of points that can form lines, geometrical shapes, etc
    # - a space with a coordinate system (thus more structured than a +EuclideanSpace+)
    class CartesianSpace < AbstractSpace
      def initialize(symbol, num_dimensions); super('cartesian', symbol, num_dimensions); end
    end

    # vector-space-1D / CartesianSpaceℝ¹ / NumberLine
    class CartesianSpaceℝ¹ < CartesianSpace
      def initialize; super(:ℝ¹, 1); end
    end

    # vector-space-2D
    class CartesianSpaceℝ² < CartesianSpace
      def initialize; super(:ℝ², 2); end
    end

    # vector-space-3D
    class CartesianSpaceℝ³ < CartesianSpace
      def initialize; super(:ℝ³, 3); end
    end

    # vector-space-4D
    class CartesianSpaceℝ⁴ < CartesianSpace
      def initialize; super(:ℝ⁴, 4); end
    end

  end
end

=end

# -------------------------------------------- ⚠️ --------------------------------------------
