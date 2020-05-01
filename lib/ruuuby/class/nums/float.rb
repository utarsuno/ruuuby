# coding: utf-8

# add various aliases & functions to existing Class(+Float+)
#
# == Documentation Variables
# [RF] all/any possible
class ::Float

  # @type [Float]
  INFINITY_NEGATIVE = (-::Float::INFINITY).❄️

  # @type [Symbol]
  INFINITY_COMPLEX  = :∞ℂ

  # original source code referenced from:
  # @see https://floating-point-gui.de/errors/NearlyEqualsTest.java
  #
  # @param [Float] them
  #
  # @raise [WrongParamType]
  #
  # @return [Boolean] true, if these numbers have a differences less than{::Float::RELATIVE_ERROR}
  def ≈≈(them)
    🛑num❓(:them, them)
    return true if self == them

    abs_a = self.abs
    abs_b = them.abs
    diff  = (self - them).abs

    if self == 0 || them == 0 || (abs_a + abs_b < ::Float::MIN_NORMAL)
      diff < ::Float::SMALLEST_RELATIVE_ERROR
    else
      if abs_a + abs_b <= Float::MAX
        (diff / (abs_a + abs_b)) < ::Float::RELATIVE_ERROR
      else
        (diff / Float::MAX) < ::Float::RELATIVE_ERROR
      end
    end
  end

  # @return [Boolean] false, `complex-infinity` is currently represented through a `Symbol`
  def ∞ℂ?; false; end

  alias_method :¿?, :nan?

  # all floats can be represented as:
  #
  #   - complex-numbers(+ℂ+)   (with imaginary component of 0)
  #   - real-numbers(+ℝ+)      (unless non-finite)
  #   - universal-numbers(+𝕌+) (unless non-finite)
  #
  ⨍_add_aliases(:finite?, [:ℂ?, :ℝ?, :𝕌?])

  # @return [Boolean] true, if there is no imaginary component and the real component is a natural-number(+ℕ+)
  def ℕ?; (!(∞? || negative?)) && (self == 0 || ((self % 1) == 0)); end

  # @return [Boolean] true, if this number's contents are equivalent to any number in the set of math-integers(+ℤ+)
  def ℤ?; self.ℝ? && (self == 0 || ((self % 1) == 0)); end

  # @return [Boolean] true, if this +Float+ instance is π
  def π?; self.🆔 == ::Math::PI.🆔; end

  # ⚠️, coverage missing beyond ℤ
  #
  # @return [Boolean, NilClass]
  def ℚ?
    if self.ℝ?
      if self.ℤ?
        true
      else
        if self.π?
          true
        else
          nil
        end
      end
    else
      false
    end
  end

end
