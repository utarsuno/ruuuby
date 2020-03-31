# coding: UTF-8

# add various aliases & functions to existing Class(+Symbol+)
class ::Symbol

  include ::Ruuuby::Attribute::Includable::SubscriptIndexing

  # ---------------------------------------------------------------------------------------------------------- | *f03* |
  alias_method :𝔠, :length

  include ::Ruuuby::Attribute::Includable::Cardinality
  # ---------------------------------------------------------------------------------------------------------- | *f10* |
  alias_method :⬇️, :downcase
  alias_method :⬇, :downcase
  alias_method :🔡, :downcase

  alias_method :⬆️, :upcase
  alias_method :⬆, :upcase
  alias_method :🔠, :upcase
  # ---------------------------------------------------------------------------------------------------------- | *f16* |

  # negative sign power is 8315, 0 is 8304, 1 is 185
  #
  # @type [Array]
  POWERS = [8304, 185, 178, 179, 8308, 8309, 8310, 8311, 8312, 8313].❄️

  # @return [Boolean] true, if this symbol represents a superscript power-exponent
  def power?
    as_str = self.to_s
    case(as_str.𝔠)
    when 1
      return ::Symbol::POWERS.∋?(as_str.ord)
    when 2
      return as_str.₀.ord == 8315 && ::Symbol::POWERS.∋?(as_str.₁.ord)
    else
      false
    end
  end

  # @raise [RuntimeError] raised if this `Symbol` is not a designated superscript power-exponent
  #
  # @return [Numeric]
  def pow_to_i
    as_str = self.to_s
    case(as_str.𝔠)
    when 1
      🛑 RuntimeError.🆕("| c{Symbol}-> m{pow_to_i} unable to convert self(#{as_str}) to an exponential power |") unless ::Symbol::POWERS.∋?(as_str.ord)
      return ::Symbol::POWERS.find_index(as_str.ord)
    when 2
      if as_str.₀.ord == 8315
        🛑 RuntimeError.🆕("| c{Symbol}-> m{pow_to_i} unable to convert self(#{as_str}) to an exponential power |") unless ::Symbol::POWERS.∋?(as_str.₁.ord)
        return -::Symbol::POWERS.find_index(as_str.₁.ord)
      else
        🛑 RuntimeError.🆕("| c{Symbol}-> m{pow_to_i} unable to convert self(#{as_str}) to an exponential power |")
      end
    else
      🛑 RuntimeError.🆕("| c{Symbol}-> m{pow_to_i} unable to convert self(#{as_str}) to an exponential power |")
    end
  end

  # | ------------------------------------------------------------------------------------------------------------------
end
