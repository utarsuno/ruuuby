
# add various functions to existing class +Rational+
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
  # @raise [RuntimeError]
  #
  # @return [Numeric, Symbol]
  def ^(n)
    if n.sym?
      if n.power?
        self ** n.pow_to_i
      elsif n == :∞
        if self == 1 || self == -1
          return ::Float::NAN
        elsif self == 0 || (self < 1 && self > 0) || (self > -1 && self < 0)
          return 0
        elsif self < 0
          return ::Float::INFINITY_COMPLEX
        else
          return ::Float::INFINITY
        end
      elsif n == :'-∞'
        if self == 1 || self == -1
          return ::Float::NAN
        elsif self == 0 || (self > -1 && self < 0)
          return ::Float::INFINITY_COMPLEX
        elsif self < 1 && self > 0
          return ::Float::INFINITY
        else
          return self ** Float::INFINITY_NEGATIVE
        end
      elsif n == :∞ℂ
        if self > 0
          return ::Float::NAN
        elsif self == 0
          return 0
        else
          return ::Float::NAN
        end
      else
        🛑 RuntimeError.🆕("| c{Rational}-> m{^} self(#{self.to_s}) received invalid exponential argument(#{n.to_s}) |")
      end
    else
      🛑 RuntimeError.🆕("| c{Rational}-> m{^} self(#{self.to_s}) received invalid exponential argument(#{n.to_s}) |")
    end
  end

end
