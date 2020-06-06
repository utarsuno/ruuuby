# coding: UTF-8

::Range.alias_method :∀, :each
# ---------------------------------------------------------------------------------------------------------- | *f03* |
::Proc.alias_method :𝔠, :arity
# ---------------------------------------------------------------------------------------------------------- | *f04* |
::NilClass.alias_method :∅?, :empty?
# ---------------------------------------------------------------------------------------------------------- | *f10* |
::Class.alias_method :🆕, :new

module ::Kernel

  # ------------------------------------------------------------------------------------------------ | *b04* | *f10* |

  # Return the square-root of the provided argument.
  #
  # @param [Integer, Float, Numeric, Rational, Complex, String] n
  #
  # @return [Float, Numeric]
  def √(n)
    if n.str? && n.to_num?
      ::Math.square_root(n.to_num.to_f)
    else
      🛑num❓(:n, n)
      ::Math.square_root(n.to_f)
    end
  end

  # Return the cube-root of the provided argument.
  #
  # @param [Integer, Float, Numeric, Rational, Complex, String] n
  #
  # @return [Float, Numeric]
  def ∛(n)
    if n.str? && n.to_num?
      ::Math.cubic_root(n.to_num.to_f)
    else
      🛑num❓(:n, n)
      ::Math.cubic_root(n.to_f)
    end
  end

  # ------------------------------------------------------------------------------------------------ | *b05* | *f10* |

  # @return [Float] the base ℮ logarithm of +n+
  def logₑ(n); ::Math.log_e(n); end

  # @param [Numeric, Float, Complex] n
  #
  # | domain    | (0, ∞)  |
  # | co-domain | (-∞, ∞) |
  #
  # @return [Float] the base 2 logarithm of +n+
  def log₂(n); ::Math.log2(n); end

  # @param [Numeric, Float, Complex] n
  #
  # | domain    | (0, ∞)  |
  # | co-domain | (-∞, ∞) |
  #
  # @return [Float] the base 10 logarithm of +n+
  def log₁₀(n); ::Math.log10(n); end

  # -------------------------------------------------------------------------------------------------------- | *f27* |

  # @param [Float, Int, ThetaAngle] arg
  #
  # @return [ThetaAngle]
  def θ°(arg); ::ThetaAngle.new_degree(arg); end

  # @param [Float, Int, ThetaAngle] arg
  #
  # @return [ThetaAngle]
  def θʳ(arg); ::ThetaAngle.new_radian(arg); end

  # @param [Float, Int, ThetaAngle] arg
  #
  # @return [ThetaAngle]
  def θᵍ(arg); ::ThetaAngle.new_gon(arg); end

  # @param [Float, Int, ThetaAngle] arg
  #
  # @return [ThetaAngle]
  def θ𝞽(arg); ::ThetaAngle.new_turn(arg); end

  # -------------------------------------------------------------------------------------------------------- | *f28* |

  # ‣ `a+b` is to `a` as `a` is to `b`
  # ‣ `a/b` is `linearly proportional` `(a+b)/a`
  #
  # ‣ a∶b = (a+b)∶a
  # ‣ a∶b = (1+b/a)∶1
  #
  # ‣ 𝚽 = ((1 + √5) / 2)
  # ‣ 𝚽 = (1 + (1 / 𝚽))
  #
  # ‣ the only positive solution to: x² = x + 1
  #
  # @type [Float]
  𝚽 = ::Float::RATIO_GOLDEN

  # ‣ the only real solution to: x³ = x² + 1
  #
  # @type [Float]
  Ψ = ::Float::RATIO_GOLDEN_SUPER

  # @type [Float]
  Ω = ::Float::CONST_OMEGA

  # ‣ let `a+b = circumference of a circle`, (a+b)/a = a/b; (a->longer_arc, b->smaller_arc)
  #
  # @type [ThetaAngle]
  Ⴔ = ::Math::ANGLE_GOLDEN

  # -----------------------------------------------------------------------------------------------------------------
end

# TODO: temporary code & design

f10_configs = ENV['RUUUBY_F10_CONFIGS']
f12_configs = ENV['RUUUBY_F12_CONFIGS']
f26_configs = ENV['RUUUBY_F26_CONFIGS']

if f10_configs.str?
  if f10_configs.include?('b02')
    module ::Kernel
      private
      # @return [::Kernel]
      def 🌽; ::Kernel; end
    end
  end
  if f10_configs.include?('b03')
    ::Method.alias_method :🏠, :source_location
  end
end

if f12_configs.str?
  if f12_configs.include?('b00')
    module ::Kernel
      private
      # @return [::File]
      def 📁; ::File; end
      # @return [::Dir]
      def 🗄️; ::Dir; end
    end
  end
end

if f26_configs.str?
  if f26_configs.include?('b00')
    module ::Kernel
      private
      # @return [::Date]
      def 📅; ::Date; end
      # @return [::Time]
      def 🕒; ::Time; end
      # @return [::DateTime]
      def 📅🕒; ::DateTime; end
    end
  end
end

# --------------------------------------------------------------------------------------------------------------------
