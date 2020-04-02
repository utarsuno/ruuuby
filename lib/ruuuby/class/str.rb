# coding: utf-8

# `Ruuuby` modifications to c(`String`)
module ::Ruuuby

  # (not-final-design): attributes that are to be included/extended an absolute maximum of once per Class & Runtime
  module Feature

    # attributes that are to be included, not extended
    module Includable

      # defines the operations needed to support Feature(`f08`) that are applied to Class(`String`)
      module StringF08

        # @param [String]
        #
        # @raise [WrongParamType, RuntimeError] thrown when arg(terminating_pattern) was not found in self
        #
        # @return [String] self, with all content leading up to the first matched arg(terminating_pattern)
        def ♻️until!(terminating_pattern)
          🛑str❓(:terminating_pattern, terminating_pattern, :'!∅')
          return '' if self == terminating_pattern
          if self.∅? || self.∌?(terminating_pattern)
            🛑 RuntimeError.🆕("| c{String}-> m{♻️until!} got arg(terminating_pattern){#{terminating_pattern}} which is not contained in self{#{self}} |")
          end
          🛑 ArgumentError.🆕("| c{String}-> m{♻️until!} got arg(terminating_pattern){#{terminating_pattern}}-len{#{terminating_pattern.𝔠.to_s}} which is longer than self{#{self}} of len{#{self.𝔠.to_s}} |") if terminating_pattern.𝔠 > self.𝔠
          self[(self.index(terminating_pattern)+terminating_pattern.𝔠)..self.𝔠₋]
        end

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
      module StringF09
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
      module StringF21

        # @return [Boolean] true, if this `String` is length 1 with a it's character being a digit (ascii value between 48 and 57)
        def digit? ; self.𝔠₁? && self.ord < 58 && self.ord > 47 ; end

        # TODO: temporary design
        #
        # @raise [RuntimeError] if this `String` is not expressing a radian expression
        #
        # @return [Float]
        def to_radian
          if self.match?(::String.syntax_trigonometric_angle)
            parts = self.split('π').remove_empty!
            if parts.length == 0
              180.0
            elsif parts.length == 1
              if parts[0].∋?('/')
                180.0 / (parts[0].split('/')[-1].to_i)
              else
                180.0 * parts[0].to_i
              end
            else
              multiplier = parts[0].to_i
              if parts[1].∋?('/')
                (180.0 * multiplier) / (parts[1].split('/')[-1].to_i)
              else
                (180.0 * multiplier) * parts[1].to_i
              end
            end
          else
            return 0 if self == '0'
            🛑 RuntimeError.🆕("| c{String}-> m{to_radian} self{#{self}} is not a radian expression |")
          end
        end

        # @return [Boolean] true, if this `String` equals exactly some representation of infinity
        def ∞?
          case(self.length)
          when 1 ; self == '∞'
          when 2 ; ::String::Syntax::SQL_LEN_2_INF.∋?(self)
          when 3 ; ::String::Syntax::SQL_LEN_3_INF.∋?(self)
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
        # @return [Numeric, Symbol]
        def to_num
          case(self.length)
          when 0
            self.🛑⨍_to_num
          when 1
            return self.to_i if self.digit?
            case(self)
            when '∞' ; return ::Float::INFINITY
            when 'π' ; return ::Math::PI
            when 'φ' ; return ::Float::GOLDEN_RATIO
            else     ; self.🛑⨍_to_num
            end
          when 2
            if self.∞?
              return ::Float::INFINITY_COMPLEX if self == '∞ℂ'
              return self.₀?('-') ? -Float::INFINITY : Float::INFINITY
            end
            case(self.₀)
            when '.'
              if self.₁.digit? ; return Float(self)
              else             ; self.🛑⨍_to_num
              end
            when '+', '-'
              if self.₁.digit?   ; return Integer(self)
              elsif self.₁?('π') ; return (self.₀?('-')) ? (-::Math::PI) : (::Math::PI)
              elsif self.₁?('φ') ; return (self.₀?('-')) ? (-::Float::GOLDEN_RATIO) : (::Float::GOLDEN_RATIO)
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

    # @type [String]
    TRIGONOMETRIC_ANGLE = '(\d+)?π(/\d+)?'.❄️

    # @type [Array]
    SQL_LEN_2_INF = %w(+∞ -∞ ♾️ ∞ℂ).❄️

    # @type [Array]
    SQL_LEN_3_INF = %w(+♾️ -♾️).❄️

    ❄️
  end

  include ::Ruuuby::Attribute::Includable::SubscriptIndexing

  include ::Ruuuby::Attribute::Includable::SyntaxCache
  # ---------------------------------------------------------------------------------------------------------- | *f03* |
  include ::Ruuuby::Attribute::Includable::Cardinality
  # ---------------------------------------------------------------------------------------------------------- | *f08* |
  include ::Ruuuby::Feature::Includable::StringF08
  # ---------------------------------------------------------------------------------------------------------- | *f09* |
  include ::Ruuuby::Feature::Includable::StringF09
  # ---------------------------------------------------------------------------------------------------------- | *f21* |
  alias_method :🛑⨍_to_num, :err_to_num

  include ::Ruuuby::Feature::Includable::StringF21
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

  alias_method :↩️, :reverse
  alias_method :↩️!, :reverse!
  alias_method :↩, :reverse
  alias_method :↩!, :reverse!

end
