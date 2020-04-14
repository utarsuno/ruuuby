
# add various aliases & functions to existing Class(+Rational+)
class ::Rational

  # @return [Boolean] true, if finite and numerator and denominator pass
  def ℕ? ; self.numerator.ℕ? && self.denominator.ℕ? ; end

  # @return [Boolean] true, if finite and numerator and denominator pass
  def ℤ? ; self.finite? && (self.fdiv(1) % 1 == 0) ; end

  # ⚠️, coverage missing beyond ℤ
  #
  # @return [Boolean|NilClass] true, if finite and numerator and denominator pass
  def ℚ?
    return true if self.numerator.ℤ? && self.denominator.ℤ?
    nil
  end

  # @return [Boolean] true, if finite and numerator and denominator pass
  def ℂ? ; self.numerator.ℂ? && self.denominator.ℂ? ; end

  # @return [Boolean] true, if finite and numerator and denominator pass
  def ℝ? ; self.numerator.ℚ? && self.denominator.ℚ? ; end

  # `Ruuuby` implementation before switching to `C-extensions`: (`f98`)
  #
  # @param [Symbol]
  #
  # @raise [ArgumentError]
  #
  # @return [Numeric, Symbol, Float, Complex, Rational]
  def ^(n)
    evaluated = n.sym?(:∈superscripts)
    if evaluated.int?
      if self != 0
        return self ** evaluated
      else
        if evaluated == 0
          return ::Float::NAN
        else
          return self ** evaluated
        end
      end
    elsif evaluated.flt?
      if evaluated == ::Float::INFINITY
        if self == 1 || self == -1
          return ::Float::NAN
        elsif self == 0 || (self < 1 && self > 0) || (self > -1 && self < 0)
          return 0
        elsif self < 0
          return ::Float::INFINITY_COMPLEX
        else
          return ::Float::INFINITY
        end
      else
        if self == 1 || self == -1
          return ::Float::NAN
        elsif self == 0 || (self > -1 && self < 0)
          return ::Float::INFINITY_COMPLEX
        elsif self < 1 && self > 0
          return ::Float::INFINITY
        else
          return self ** Float::INFINITY_NEGATIVE
        end
      end
    elsif evaluated == :∞ℂ
      if self > 0
        return ::Float::NAN
      elsif self == 0
        return 0
      else
        return ::Float::NAN
      end
    else
      🛑 ArgumentError.🆕("| c{Rational}-> m{^} self(#{self.to_s}) received invalid exponential argument(#{n.to_s}) |")
    end
  end

end
