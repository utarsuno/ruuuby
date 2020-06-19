# coding: UTF-8

# -------------------------------------------- ⚠️ --------------------------------------------

# mathematics related code
module ::Math

  # geometry related code
  module Geometry

    class PlaneFigure < Shape

      attr_reader :num_sides

      # volume
      # diameter
      # num_sides
      # interior angles

      def initialize
        super()
      end

      # @return [ThetaAngle]
      def sum_of_interior_angles; θ°(180.0 * (@num_sides - 2)); end

    end

  end
end

# -------------------------------------------- ⚠️ --------------------------------------------
