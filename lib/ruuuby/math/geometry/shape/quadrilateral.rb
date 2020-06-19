# coding: UTF-8

# -------------------------------------------- ⚠️ --------------------------------------------

# mathematics related code
module ::Math

  # geometry related code
  module Geometry

    # has `4 edges` and `4 vertices`
    class Quadrilateral < PlaneFigure

      def initialize
        @num_sides = 4
      end

      # @return [Integer, Float]
      def area; @length * @height; end

    end

    # ▬
    class Rectangle < Quadrilateral

      # @param [Integer, Float] length
      # @param [Integer, Float] height
      def initialize(length, height)
        @length = length
        @height = height
        super()
      end

      # @return [Array<ThetaAngle>]
      def interior_angles
        if @angles.nil?
          corner_angle = θ°(90)
          @angles      = [corner_angle, corner_angle, corner_angle, corner_angle]
        end
        @angles
      end

      # TODO: def func{golden?}
    end

    class Square < Rectangle

      # @param [Integer, Float] length
      def initialize(length)
        super(length, length)
      end

    end

  end

end

# -------------------------------------------- ⚠️ --------------------------------------------
