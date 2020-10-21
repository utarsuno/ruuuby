# encoding: UTF-8

# ### Rationals
#
#  * `0/0` means `⟶0 / ⟶0` where `⟶0` means `approaching to 0`
#  * `⟶∞` and `∞` are equivalent notation
#  * `⟶0` and `0` are not equivalent notation
#    * ex: the ONLY answer for (`5/0`) is `division by zero not defined`
#    * ex: `0/0` is `not defined`
#    * ex: `⟶0 / ⟶0` is `indeterminate`
#
# `Ruuuby` modifications to existing class{+Rational+}
class ::Rational

  # @return [Boolean]
  def one?; self == 1; end

  # @see https://en.wikipedia.org/wiki/Unit_fraction
  #
  # @note [Q: a set of all the unit-rationals would be considered 'closed_under_subtraction'?]
  # @note (1.0 / x) * (1.0 / y) == (1.0 / (x * y))
  #
  # @return [Boolean]
  def μ?; self.numerator.one? && ℕ.∋?(self.denominator); end

  # @return [Boolean]
  def smells_like_int?; self.finite? && (self.fdiv(1) % 1 == 0); end

  # `Ruuuby` implementation before switching to `C-extensions`: (`f98`)
  #
  # @param [Symbol]
  #
  # @raise [ArgumentError]
  #
  # @return [Numeric, Symbol, Float, Complex, Rational]
  def ^(n)
    evaluated = n.sym?(:'∈^')
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
      🛑 ArgumentError.new("| c{Rational}-> m{^} self(#{self.to_s}) received invalid exponential argument(#{n.to_s}) |")
    end
  end

end

# TODO: https://en.wikipedia.org/wiki/Irreducible_fraction
