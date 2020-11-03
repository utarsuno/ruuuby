# encoding: UTF-8

# =====================================================================================================================
#               __                                  ___          ___                __
#              /\ \__  __                          /\_ \       /'___\              /\ \__
#   ___   _____\ \ ,_\/\_\    ___     ___      __  \//\ \     /\ \__/   __     __  \ \ ,_\  __  __  _ __    __    ____
#  / __`\/\ '__`\ \ \/\/\ \  / __`\ /' _ `\  /'__`\  \ \ \    \ \ ,__\/'__`\ /'__`\ \ \ \/ /\ \/\ \/\`'__\/'__`\ /',__\
# /\ \L\ \ \ \L\ \ \ \_\ \ \/\ \L\ \/\ \/\ \/\ \L\.\_ \_\ \_   \ \ \_/\  __//\ \L\.\_\ \ \_\ \ \_\ \ \ \//\  __//\__, `\
# \ \____/\ \ ,__/\ \__\\ \_\ \____/\ \_\ \_\ \__/.\_\/\____\   \ \_\\ \____\ \__/.\_\\ \__\\ \____/\ \_\\ \____\/\____/
#  \/___/  \ \ \/  \/__/ \/_/\/___/  \/_/\/_/\/__/\/_/\/____/    \/_/ \/____/\/__/\/_/ \/__/ \/___/  \/_/ \/____/\/___/
#           \ \_\
#            \/_/
# =====================================================================================================================

if 💎.engine.stats_ext['F10_B04']
  ::Method.alias_method :🏠, :source_location
end

if 💎.engine.stats_ext['F12_B00']
  class ::Object

    # @return [Date]
    def 📁; ::File; end

    # @return [Dir]
    def 🗄️; ::Dir; end

  end
end

if 💎.engine.stats_ext['F26_B00']
  class ::Object

    # @return [Date]
    def 📅; ::Date; end

    # @return [::Time]
    def 🕒; ::Time; end

    # @return [::DateTime]
    def 📅🕒; ::DateTime; end
  end
end

if 💎.engine.stats_ext['F28_B09']
  class ::Object

    # @return [Float] +Float::ONE_HALF+
    def ½; ::Float::ONE_HALF; end

    # @return [Float] +Float::ONE_THIRD+
    def ⅓; ::Float::ONE_THIRD; end

    # @return [Float] +Float::TWO_THIRDS+
    def ⅔; ::Float::TWO_THIRDS; end

    # @return [Float] +Float::ONE_FOURTH+
    def ¼; ::Float::ONE_FOURTH; end

    # @return [Float] +Float::THREE_FOURTHS+
    def ¾; ::Float::THREE_FOURTHS; end

    # @return [Float] +Float::ONE_FIFTH+
    def ⅕; ::Float::ONE_FIFTH; end

    # @return [Float] +Float::TWO_FIFTHS+
    def ⅖; ::Float::TWO_FIFTHS; end

    # @return [Float] +Float::THREE_FIFTHS+
    def ⅗; ::Float::THREE_FIFTHS; end

    # @return [Float] +Float::FOUR_FIFTHS+
    def ⅘; ::Float::FOUR_FIFTHS; end

    # @return [Float] +Float::ONE_SIXTH+
    def ⅙; ::Float::ONE_SIXTH; end

    # @return [Float] +Float::ONE_SEVENTH+
    def ⅐; ::Float::ONE_SEVENTH; end

    # @return [Float] +Float::ONE_EIGHTH+
    def ⅛; ::Float::ONE_EIGHTH; end

    # @return [Float] +Float::THREE_EIGHTHS+
    def ⅜; ::Float::THREE_EIGHTHS; end

    # @return [Float] +Float::FIVE_EIGHTHS+
    def ⅝; ::Float::FIVE_EIGHTHS; end

    # @return [Float] +Float::SEVEN_EIGHTHS+
    def ⅞; ::Float::SEVEN_EIGHTHS; end

    # @return [Float] +Float::ONE_NINTH+
    def ⅑; ::Float::ONE_NINTH; end

    # @return [Float] +Float::ONE_TENTH+
    def ⅒; ::Float::ONE_TENTH; end

  end

  ::Math::Space::SymbolicNumbersSpace::MAPPING.merge!(
      {
          ½: ::Float::ONE_HALF,
          ⅓: ::Float::ONE_THIRD,
          ⅔: ::Float::TWO_THIRDS,
          ¼: ::Float::ONE_FOURTH,
          ¾: ::Float::THREE_FOURTHS,
          ⅕: ::Float::ONE_FIFTH,
          ⅖: ::Float::TWO_FIFTHS,
          ⅗: ::Float::THREE_FIFTHS,
          ⅘: ::Float::FOUR_FIFTHS,
          ⅙: ::Float::ONE_SIXTH,
          ⅐: ::Float::ONE_SEVENTH,
          ⅛: ::Float::ONE_EIGHTH,
          ⅜: ::Float::THREE_EIGHTHS,
          ⅝: ::Float::FIVE_EIGHTHS,
          ⅞: ::Float::SEVEN_EIGHTHS,
          ⅑: ::Float::ONE_NINTH,
          ⅒: ::Float::ONE_TENTH,
      }
  )
end

# =====================================================================================================================
#                                                __         ___                __
#                             __                /\ \      /'___\              /\ \__
#  _ __    __     __   __  __/\_\  _ __    __   \_\ \    /\ \__/   __     __  \ \ ,_\  __  __  _ __    __    ____
# /\`'__\/'__`\ /'__`\/\ \/\ \/\ \/\`'__\/'__`\ /'_` \   \ \ ,__\/'__`\ /'__`\ \ \ \/ /\ \/\ \/\`'__\/'__`\ /',__\
# \ \ \//\  __//\ \L\ \ \ \_\ \ \ \ \ \//\  __//\ \L\ \   \ \ \_/\  __//\ \L\.\_\ \ \_\ \ \_\ \ \ \//\  __//\__, `\
#  \ \_\\ \____\ \___, \ \____/\ \_\ \_\\ \____\ \___,_\   \ \_\\ \____\ \__/.\_\\ \__\\ \____/\ \_\\ \____\/\____/
#   \/_/ \/____/\/___/\ \/___/  \/_/\/_/ \/____/\/__,_ /    \/_/ \/____/\/__/\/_/ \/__/ \/___/  \/_/ \/____/\/___/
#                    \ \_\
#                     \/_/
# =====================================================================================================================

::Range.alias_method :∀, :each
# ---------------------------------------------------------------------------------------------------------- | *f03* |
::Proc.alias_method :𝔠, :arity
# ---------------------------------------------------------------------------------------------------------- | *f04* |
::NilClass.alias_method :∅?, :empty?

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
  def logₑ(n)
    if n < 0 && n == (Ω ** -1)
      ::BigMath.exp(-Ω, 42)
    else
      ::Math.log_e(n.to_f)
    end
  end

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

  # ‣ let `a+b = circumference of a circle`, (a+b)/a = a/b; (a->longer_arc, b->smaller_arc)
  #
  # @type [ThetaAngle]
  Ⴔ = ::Math::ANGLE_GOLDEN

  # @return [Float]
  def π; ::Math::PI; end

  # @return [Float]
  def ℮; ::Math::E; end

  # @return [Float] Float::INFINITY
  def ∞; ::Float::INFINITY; end

  #          __   __
  #  |\/| | /__` /  `
  #  |  | | .__/ \__,

  # @return [Symbol] 'complex-infinity'
  def ∞ℂ; ::Float::INFINITY_COMPLEX; end

  # -----------------------------------------------------------------------------------------------------------------
end
