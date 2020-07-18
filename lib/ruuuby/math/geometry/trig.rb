# encoding: UTF-8

using ::ThetaAngle::ContextParamCheck

# mathematics related code
module ::Math

  # +Trigonometry+
  #  - very specific sub-section within +Geometry+
  #  - relations between sides & angles on triangles (trigonometric ratios)
  #  - any other angle related functions
  module Trig

    def acos(n); ::Math.acos(n); end

    alias_method :cot², :cot2
    alias_method :cos², :cos2
    alias_method :sin², :sin2
    alias_method :tan², :tan2
    alias_method :sec², :sec2
    alias_method :csc², :csc2

    # equations within +Trig+ that require 3-inputs (w/ each ∈ ℕ)
    module ℕ³

      # @param [Integer, Float, Numeric] a
      # @param [Integer, Float, Numeric] b
      # @param [Integer, Float, Numeric] c
      #
      # @return [Boolean] true, if: a² + b² == c²
      def self.pythagorean?(a: 0, b: 0, c: 0)
        if a.θ? && b.θ? && c.θ?
          return ((a + b + c).° == 180.0)
        else
          🛑nums❓([a, b, c], :∈𝕌)
          return (((a ** 2) + (b ** 2)) == (c ** 2))
        end
      end

    end

  end

end
