# encoding: UTF-8

# -------------------------------------------- ⚠️ --------------------------------------------

# mathematics related code
module ::Math

  # geometry related code
  module Geometry

    # ●
    class Circle < PlaneFigure

      def initialize(radius)
        @radius    = radius
        @num_sides = ::Float::INFINITY
        super()
      end

      undef_method :sum_of_interior_angles

      def sum_of_interior_angles; ::ThetaAngle.new_degree(360); end

    end

  end

end

# -------------------------------------------- ⚠️ --------------------------------------------
