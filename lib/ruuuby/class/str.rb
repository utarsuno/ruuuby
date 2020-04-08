# coding: utf-8

# `Ruuuby` modifications to c(`String`)
module ::Ruuuby

  # (not-final-design): attributes that are to be included/extended an absolute maximum of once per Class & Runtime
  module Feature

    # attributes that are to be included, not extended
    module Includable

      # defines the operations needed to support Feature(`f08`) that are applied to Class(`String`)
      module StringF08

        # @return [Boolean] true, if this `String` is of length 1 and the character is uppercase
        def upcase?
          case(self.𝔠)
          when 1
            return self.₀.match?(::String.syntax_char_uppercase)
          when 0
            return false
          else
            #return self.🐫?
            return self.🐫? || 🐍⬆?
          end
        end

        # @return [Boolean] true, if this `String` is of length 1 and the character is lowercase
        def downcase?
          case(self.𝔠)
          when 1
            return self.₀.match?(::String.syntax_char_lowercase)
          when 0
            return false
          else
            return self.🐍?
          end
        end

        # auto-define additional aliases for Class(`String`)
        #
        # @param [Class] kclass
        #
        # @return [Class] `String`
        def self.included(kclass)
          kclass.⨍_add_aliases(:downcase, [:⬇️, :⬇, :🔡])
          kclass.⨍_add_aliases(:downcase!, [:⬇️!, :⬇!, :🔡!])
          kclass.⨍_add_aliases(:upcase, [:⬆️, :⬆, :🔠])
          kclass.⨍_add_aliases(:upcase!, [:⬆️!, :⬆!, :🔠!])

          kclass.⨍_add_aliases(:reverse, [:↩️, :↩])
          kclass.⨍_add_aliases(:reverse!, [:↩️!, :↩!])
        end

        # @param [String]         stop_at
        # @param [Integer, Float] num_matches (default: 1), use value{-1} or{∞} to have no limit on matches
        #
        # @raise [WrongParamType, RuntimeError] thrown when arg(terminating_pattern) was not found in self
        #
        # @return [String] self, with all content (leading up to arg{terminating_pattern}) removed
        def remove_until(stop_at, num_matches=1)
          🛑str❓(:stop_at, stop_at, :'!∅')
          🛑 ArgumentError.🆕("| c{String}-> m{remove_until} got arg(num_matches){#{num_matches.to_s}} which ∉ [Integer, Float] |") unless (num_matches.int? || num_matches.flt?)
          return '' if self == stop_at
          🛑 RuntimeError.🆕("| c{String}-> m{remove_until} got arg(stop_at){#{stop_at}} which is not contained in self{#{self}} |") if (self.∅? || self.∌?(stop_at))
          🛑 ArgumentError.🆕("| c{String}-> m{remove_until} got arg(stop_at){#{stop_at}}-len{#{stop_at.𝔠.to_s}} which is longer than self{#{self}} of len{#{self.𝔠.to_s}} |") if stop_at.𝔠 > self.𝔠
          if num_matches == -1 || num_matches == ::Float::INFINITY
            return self[(self.rindex(stop_at)+stop_at.𝔠)..self.𝔠₋]
          elsif num_matches == 1
            return self[(self.index(stop_at)+stop_at.𝔠)..self.𝔠₋]
          else
            num_matched = 0
            position    = 0
            len_pattern = stop_at.length
            while position <= (self.length - len_pattern)
              curr = self[position...(position+len_pattern)]
              if curr == stop_at
                num_matched += 1
                if num_matched >= num_matches
                  return self[(position+len_pattern)...(self.length)]
                end
              end
              position += 1
            end
            🛑 ArgumentError.🆕("| c{String}-> c{remove_until} got arg(num_matches) and self{#{self}} does not have{#{num_matches.to_s}} instances of{#{stop_at}} |")
          end
        end

        # @param [String]         stop_at
        # @param [Integer, Float] num_matches (default: 1), use value{-1} or{∞} to have no limit on matches
        #
        # @raise [WrongParamType, RuntimeError]
        #
        # @return [String] self, with all content (leading up to arg{stop_at}) removed, searched from reversed order and then returned back in original order
        def ♻️⟵(stop_at, num_matches=1)
          🛑str❓(:stop_at, stop_at, :'!∅')
          self.↩.remove_until(stop_at.reverse, num_matches).↩
        end

        # @param [String]
        #
        # @raise [WrongParamType, RuntimeError] thrown when arg(terminating_pattern) was not found in self
        #
        # @return [String] self, with all content (leading up to arg{terminating_pattern}) removed
        def remove_until_last(stop_at) ; self.remove_until(stop_at, -1) ; end

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
          delta        = 0
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

      # defines the operations needed to support Feature(`f24`) that are applied to Class(`String`)
      module StringF24
        # @return [Boolean] true, if this String's content's syntax match camel-case
        def 🐫? ; self.match?(::String.syntax_case_camel) ; end

        # @return [Boolean] true, if this String's content's syntax match camel-case-lower
        def 🐫⬇? ; self.match?(::String.syntax_case_lower_camel) ; end

        # @return [Boolean] true, if this String's content's syntax match snake-case-upper
        def 🐍⬆? ; self.match?(::String.syntax_case_upper_snake) ; end

        # @return [Boolean] true, if this String's content's syntax match snake-case
        def 🐍? ; self.match?(::String.syntax_case_snake) ; end

        # @raise [RuntimeError]
        #
        # @return [String]
        def to_🐍
          if self.🐫? || self.🐫⬇?
            chars = ''
            self.each_char do |c|
              if c.⬆️?
                if chars.∅?
                  chars << "#{c.⬇}"
                else
                  chars << "_#{c.⬇}"
                end
              else
                chars << c
              end
            end
            chars
          else
            🛑 RuntimeError.🆕("| c{String}-> m{to_🐍} got self(#{self}) which is not in syntax-format{🐫} or{🐫⬇} |")
          end
        end

        # @raise [RuntimeError]
        #
        # @return [String]
        def to_🐫
          if self.🐍⬆?
            self._to_🐫(:🐍⬆?)
          elsif self.🐍?
            self._to_🐫(:🐍?)
          else
            🛑 RuntimeError.🆕("| c{String}-> m{to_🐫} got self(#{self}) which is not in syntax-format{🐍} or {🐍⬆} |")
          end
        end

        # auto-define additional aliases for Class(`String`)
        #
        # @param [Class] kclass
        #
        # @return [Class] `String`
        def self.included(kclass)
          kclass.⨍_add_aliases(:🐍⬆?, [:🐍⬆️?, :🐍🔠?])
          kclass.⨍_add_aliases(:🐫⬇?, [:🐫⬇️?, :🐫🔡?])
        end

        🙈

        # @param [Symbol] mode
        #
        # @return [String]
        def _to_🐫(mode)
          chars = ''
          mark  = true
          if mode == :🐍⬆?
            self.each_char do |c|
              if c == '_'
                mark = true
              elsif mark
                chars << c
                mark = false
              else
                chars << c.⬇
              end
            end
          elsif mode == :🐍?
            self.each_char do |c|
              if c == '_'
                mark = true
              elsif mark
                mark = false
                chars << c.⬆
              else
                chars << c
              end
            end
          else
            raise "INVALID MODE PROVIDED{#{mode.to_s}}"
          end
          chars
        end
      end # end: {f24}
    end # end: {Includable}
  end # end: {Feature}
end # end: {Ruuuby}

# add various aliases & functions to existing Class(+String+)
class ::String

  # common expressions or any sub-components needed for creating them (ex: for `Regular Expressions`)
  module Syntax

    # @type [String]
    CHAR_UPPERCASE = ::Regexp::Syntax::CHAR_UPPER

    # @type [String]
    CHAR_LOWERCASE = ::Regexp::Syntax::CHAR_LOWER

    # expression referenced from: https://stackoverflow.com/questions/1128305/regex-for-pascalcased-words-aka-camelcased-with-leading-uppercase-letter
    #
    # @type [String]
    CASE_CAMEL     = '[A-Z]([A-Z0-9]*[a-z][a-z0-9]*[A-Z]|[a-z0-9]*[A-Z][A-Z0-9]*[a-z])[A-Za-z0-9]*'.❄️

    # expression referenced from: https://stackoverflow.com/questions/1128305/regex-for-pascalcased-words-aka-camelcased-with-leading-uppercase-letter
    #
    # @type [String]
    CASE_LOWER_CAMEL = '[a-z]+((\d)|([A-Z0-9][a-z0-9]+))*([A-Z])?'.❄️

    # @type [String]
    CASE_UPPER_SNAKE = '[A-Z]([A-Z0-9]*(_[A-Z0-9]+)?)*'.❄️

    # @type [String]
    CASE_SNAKE       = '[a-z]([a-z0-9]*(_[a-z0-9]+)?)*'.❄️

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

  alias_method :♻️⟶, :remove_until
  alias_method :♻️⟶∞, :remove_until_last

  # ---------------------------------------------------------------------------------------------------------- | *f09* |
  include ::Ruuuby::Feature::Includable::StringF09
  # ---------------------------------------------------------------------------------------------------------- | *f21* |
  alias_method :🛑⨍_to_num, :err_to_num

  include ::Ruuuby::Feature::Includable::StringF21
  # ---------------------------------------------------------------------------------------------------------- | *f24* |
  include ::Ruuuby::Feature::Includable::StringF24
  # ---------------------------------------------------------------------------------------------------------- | *f04* |
  alias_method :∅?, :empty?
  # | ------------------------------------------------------------------------------------------------------------------

  ⨍_add_aliases(:upcase?, [:⬆️?, :⬆?, :🔠?])
  ⨍_add_aliases(:downcase?, [:⬇️?, :⬇?, :🔡?])

end
