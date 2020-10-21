# encoding: UTF-8

# -------------------------------------------- ⚠️ --------------------------------------------

# mathematics related code
module ::Math

  # geometry related code
  module Geometry

    # ▲
    class Triangle < PlaneFigure

      attr_accessor :angle_a, :angle_b, :angle_c
      attr_reader :side_a, :side_b, :side_c

      # @return [Math::Geometry::Triangle]
      def self.new_equilateral(side_length); ::Math::Geometry::Triangle.new(side_length, side_length, side_length); end

      def golden?
        if self.isosceles?
          if @side_a == @side_b
            @side_a / @side_c == ::Float::RATIO_GOLDEN
          else
            @side_a / @side_b == ::Float::RATIO_GOLDEN
          end
        else
          false
        end
      end

      # @return [Boolean] true, if this triangle has `3` sides equal in length
      def equilateral?; @side_a == @side_b && @side_b == @side_c; end

      # @return [Boolean] true, if this triangle has `3` sides equal in length
      def equiangular?; @angle_a == @angle_b && @angle_b == @angle_c; end

      # @return [Boolean] true, if this triangle has `2` sides equal in length
      def isosceles?; !self.equilateral? && (@side_a == @side_b || @side_b == @side_c || @side_a == @side_c); end

      # @return [Boolean] true, if this triangle has no sides equal in length
      def scalene?; @side_a != @side_b && @side_b != @side_c && @side_a != @side_c; end

      # @return [Boolean] ‣ if `a² + b² > c²`, then the triangle is `acute`
      def acute?
        a²_b² = (@side_a ** 2) + (@side_c ** 2)
        c²    = @side_c ** 2
        if a²_b² < c²
          true
        else
          if @angle_a.° + @angle_b.° + @angle_c.° == 180.0
            return @angle_a.⦟? && @angle_b.⦟? && @angle_c.⦟?
          else
            return false
          end
        end
      end

      # @return [Boolean] ‣ if `a² + b² < c²`, then the triangle is `obtuse`
      def obtuse?
        a²_b² = (@side_a ** 2) + (@side_b ** 2)
        c²    = @side_c ** 2
        if a²_b² > c²
          true
        else
          if @angle_a.° + @angle_b.° + @angle_c.° == 180.0
            return @angle_a.⦦? || @angle_b.⦦? || @angle_c.⦦?
          else
            return false
          end
        end
      end

      # @return [Boolean] ‣ if `a² + b² = c²`, then the triangle is `right`
      def ◣?
        a²_b² = (@side_a ** 2) + (@side_c ** 2)
        c²    = @side_c ** 2
        if a²_b² == c²
          true
        else
          angle_a = @angle_a.°
          angle_b = @angle_b.°
          angle_c = @angle_c.°
          if angle_a + angle_b + angle_c == 180.0
            return (angle_a == 90.0 || angle_b == 90.0 || angle_c == 90.0)
          else
            return false
          end
        end
      end

      # `angle_A` is opposite of `side_a`
      # `angle_B` is opposite of `side_b`
      # `angle_C` is opposite of `side_c`
      #
      # law of sines: `a/sin(A)` = `b/sin(B)` = `c/sin(C)`
      def initialize(side_a, side_b, side_c)
        @side_a    = side_a
        @side_b    = side_b
        @side_c    = side_c
        @num_sides = 3
        if @side_a == @side_b && @side_a == @side_c
          @longest_val = @side_a
          @angle_a         = ::ThetaAngle.new_degree(60)
          @angle_b         = ::ThetaAngle.new_degree(60)
          @angle_c         = ::ThetaAngle.new_degree(60)
        else
          @longest_val = [@side_a, @side_b, @side_c].max
          @angle_a         = ::ThetaAngle.new_radian(::Math.acos(( ((@side_b ** 2) + (@side_c ** 2) - (@side_a ** 2)) / (2.0 * @side_b * @side_c) )))
          @angle_b         = ::ThetaAngle.new_radian(::Math.acos(( ((@side_c ** 2) + (@side_a ** 2) - (@side_b ** 2)) / (2.0 * @side_c * @side_a) )))
          #@angle_c        = θʳ(::Math.acos(( ((@side_a ** 2) + (@side_b ** 2) + (@side_c ** 2)) / (2.0 * @side_a * @side_b) )))
          @angle_c         = ::ThetaAngle.new_degree(180.0) - (@angle_a + @angle_b)
          #@angle_c        = θʳ(::Math.acos(((@side_a ** 2 + @side_b ** 2 + @side_c ** 2) / (2.0 * @side_a * @side_b))))
        end
        super()
      end

      def perimeter
        if self.equilateral?
          @longest_val * 3
        else
          @side_a + @side_b + @side_c
        end
      end

      def height
        if self.scalene?
          # either
          #@side_b * ::Math.asin(@angle_c)
          @side_c * ::Math.sin(@angle_b)
        end
      end

      def area
        if self.equiangular?
          (::Math.sqrt(3.0) / 4.0) * (@side_a ** 2)
        elsif self.scalene?
          (@side_a + @side_b + @side_c) / 2.0
        else
          1337
        end
      end

    end

  end
end

# TODO: https://mathworld.wolfram.com/Cevian.html
# TODO: https://mathworld.wolfram.com/TriangleMedian.html

# -------------------------------------------- ⚠️ --------------------------------------------
