# coding: utf-8

# `Ruuuby` modifications to c(`String`)
module ::Ruuuby

  # (not-final-design): attributes that are to be included/extended an absolute maximum of once per Class & Runtime
  module Feature

    # defines the operations needed to support Feature(`f08`) that are applied to Class(`String`)
    module F08String

      # @param [String]  start the text that this string start with
      #
      # @raise [WrongParamType]
      #
      # @return [String] the original string with the starting text added if at least partially missing prior
      def ensure_start!(start)
        🛑str❓(:start, start)
        return self if start.∅? || self.start_with?(start)
        return self >> start if self.∅?
        last_matched = ''
        delta      = 0
        while delta <= self.𝔠 && delta <= start.𝔠
          ending_of_start = start[(start.𝔠-1-delta)..(start.𝔠-1)]
          last_matched    = ending_of_start if self[0..delta] == ending_of_start
          delta          += 1
        end
        self >> (last_matched.∅? ? start : start[0..(start.𝔠-1-last_matched.𝔠)])
      end

      # @param [String] ending the text that this string should end with
      #
      # @raise [WrongParamType]
      #
      # @return [String] the original string with ending-string added if missing prior
      def ensure_ending!(ending)
        🛑str❓(:ending, ending)
        return self if ending.∅? || self.end_with?(ending)
        return self << ending if self.∅?
        last_matched = ''
        delta        = 0
        while delta <= self.𝔠 && delta <= ending.𝔠
          starting_of_end = ending[0..delta]
          last_matched    = starting_of_end if self[(self.𝔠-1-delta)..(self.𝔠-1)] == starting_of_end
          delta          += 1
        end
        self << (last_matched.∅? ? ending : ending[last_matched.𝔠..ending.𝔠-1])
      end

    end

    # defines the operations needed to support Feature(`f09`) that are applied to Class(`String`)
    module F09String
      # @param [String] them
      #
      # @raise [WrongParamType]
      #
      # @return [Boolean] true, if this string instance contains the provided str
      def ∋?(them) ; 🛑str❓(:them, them) ; self.include?(them) ; end

      # @param [String] them
      #
      # @raise [WrongParamType]
      #
      # @return [Boolean] true, if this string instance contains the provided str
      def ∌?(them) ; 🛑str❓(:them, them) ; not self.include?(them) ; end

      # @param [String|Array|Set] them
      #
      # @raise [WrongParamType]
      #
      # @return [Boolean] true, if this string instance is not contained in the provided str (or array/set)
      def ∉?(them) ; 🛑countable❓(:them, them) ; them.∌?(self) ; end

      # @param [String|Array|Set] them
      #
      # @raise [WrongParamType]
      #
      # @return [Boolean] true, if this string instance is contained in the provided str (or array/set)
      def ∈?(them) ; 🛑countable❓(:them, them) ; them.∋?(self) ; end
    end

    # defines the operations needed to support Feature(`f21`) that are applied to Class(`String`)
    module F21String

      # @return [Boolean] true, if this `String` is length 1 with a it's character being a digit (ascii value between 48 and 57)
      def digit? ; self.𝔠₁? && self.ord < 58 && self.ord > 47 ; end

      # @return [Boolean] true, if this `String` equals exactly some representation of infinity
      def ∞?
        case(self.length)
        when 1 ; self == '∞'
        when 2 ; %w(+∞ -∞ ♾️).include?(self)
        when 3 ; %w(+♾️ -♾️).include?(self)
        else   ; false
        end
      end

      # @return [Boolean] true, if this `String` can be converted into a number w/o raising any exception
      def to_num?
        self.to_num
        true
      rescue
        false
      end

      # @raise [WrongParamType]
      #
      # @return [Numeric]
      def to_num
        case(self.length)
        when 0
          self.🛑⨍_to_num
        when 1
          return self.to_i if self.digit?
          case(self)
          when '∞' ; return Float::INFINITY
          when 'π' ; return π
          when 'φ' ; return φ
          else     ; self.🛑⨍_to_num
          end
        when 2
          if self.∞?
            return self.₀?('-') ? -Float::INFINITY : Float::INFINITY
          end
          case(self.₀)
          when '.'
            if self.₁.digit? ; return Float(self)
            else             ; self.🛑⨍_to_num
            end
          when '+', '-'
            if self.₁.digit?   ; return Integer(self)
            elsif self.₁?('π') ; return (self.₀?('-')) ? (-π) : (π)
            elsif self.₁?('φ') ; return (self.₀?('-')) ? (-φ) : (φ)
            else               ; self.🛑⨍_to_num
            end
          else
            if self.₀.digit? && self.₁.digit? ; return Integer(self)
            else                              ; self.🛑⨍_to_num
            end
          end
        when 3
          if self.match?(String.syntax_len_3_as_flt)     ; return Float(self)
          elsif self.match?(String.syntax_len_3_as_int) ; return Integer(self)
          elsif self.match?(String.syntax_len_3_as_inf) ; return self.₀?('-') ? -Float::INFINITY : Float::INFINITY
          else                                          ; self.🛑⨍_to_num
          end
        else
          if self.match?(String.syntax_len_any_as_int) ; return Integer(self)
          elsif self.match?(String.syntax_len_any)     ; return Float(self)
          else                                         ; self.🛑⨍_to_num
          end
        end
        # negative-scenario length
        self.🛑⨍_to_num
      end

    end

  end

end

# add various aliases & functions to existing Class(+String+)
class ::String

  # common expressions or any sub-components needed for creating them (ex: for `Regular Expressions`)
  module Syntax

    # ordinals:
    # | char | ord  |
    # | ---- | ---- |
    # | +    | 43   |
    # | -    | 45   |
    # | .    | 46   |
    # | 0    | 48   |
    # | 1    | 49   |
    # | 8    | 56   |
    # | 9    | 57   |

    # @type [String]
    LEN_3_AS_INT   = '(\d\d\d)|([+-]\d\d)'.❄️

    # @type [String]
    LEN_3_AS_FLT   = '([+-]\.\d)|(\d\.\d)|(\.\d\d)|(\de\d)'.❄️

    # @type [String]
    LEN_3_AS_INF   = '[+-]♾️'.❄️

    # @type [String]
    LEN_ANY_AS_INT = '[+-]?\d+'.❄️

    # expression referenced from: https://mentalized.net/journal/2011/04/14/ruby-how-to-check-if-a-string-is-numeric/
    #
    # @type [String]
    LEN_ANY        = '[+-]?\d+?((\.\d+e?\d*)|(e\d+))?'.❄️

    #DIRECT_REPRESENTATIONS = ['π', 'φ', '∞'].❄️
    #REPRESENTATIONS        = '[+-]?(π|φ|∞|♾️)'.❄️
    #POSITIVE_INFINITIES    = %w(+∞ -∞ ♾️).❄️
    #INFINITIES             = %w(∞ ♾️).❄️

    ❄️
  end

end

# add various functions to existing class +String+
class ::String

  include ::Ruuuby::Attribute::Includable::SubscriptIndexing

  include ::Ruuuby::Attribute::Includable::SyntaxCache
  # ---------------------------------------------------------------------------------------------------------- | *f03* |
  include ::Ruuuby::Attribute::Includable::Cardinality
  # ---------------------------------------------------------------------------------------------------------- | *f08* |
  include ::Ruuuby::Feature::F08String
  # ---------------------------------------------------------------------------------------------------------- | *f09* |
  include ::Ruuuby::Feature::F09String
  # ---------------------------------------------------------------------------------------------------------- | *f21* |
  alias_method :🛑⨍_to_num, :err_to_num
  include ::Ruuuby::Feature::F21String
  # ---------------------------------------------------------------------------------------------------------- | *f03* |
  alias_method :𝔠, :length
  # ---------------------------------------------------------------------------------------------------------- | *f04* |
  alias_method :∅?, :empty?
  # ---------------------------------------------------------------------------------------------------------- | *f05* |
  alias_method :>>, :>>
  # ---------------------------------------------------------------------------------------------------------- | *f10* |
  alias_method :⬇️, :downcase
  alias_method :⬇️!, :downcase!
  alias_method :⬇, :downcase
  alias_method :⬇!, :downcase!
  alias_method :🔡, :downcase
  alias_method :🔡!, :downcase!

  alias_method :⬆️, :upcase
  alias_method :⬆️!, :upcase!
  alias_method :⬆, :upcase
  alias_method :⬆!, :upcase!
  alias_method :🔠, :upcase
  alias_method :🔠!, :upcase!
  # | ------------------------------------------------------------------------------------------------------------------

end
