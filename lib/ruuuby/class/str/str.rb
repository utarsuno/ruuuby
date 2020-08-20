# encoding: UTF-8

using ::String::ContextF24

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

        # @param [String]         stop_at
        # @param [Integer, Float] num_matches (default: 1), use value{-1} or{∞} to have no limit on matches
        #
        # @raise [ArgumentError, RuntimeError] thrown when arg(terminating_pattern) was not found in self
        #
        # @return [String] self, with all content (leading up to arg{terminating_pattern}) removed
        def remove_until(stop_at, num_matches=1)
          🛑str❓(:stop_at, stop_at, :∉∅)
          🛑int❓(:num_matches, num_matches)
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
                  return self[(position+len_pattern)...self.length]
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
        # @raise [ArgumentError, RuntimeError]
        #
        # @return [String] self, with all content (leading up to arg{stop_at}) removed, searched from reversed order and then returned back in original order
        def ♻️⟵(stop_at, num_matches=1)
          🛑str❓(:stop_at, stop_at, :∉∅)
          self.↩.♻️⟶(stop_at.reverse, num_matches).↩
        end

        # @param [String]
        #
        # @raise [ArgumentError, RuntimeError] thrown when arg(terminating_pattern) was not found in self
        #
        # @return [String] self, with all content (leading up to arg{terminating_pattern}) removed
        def remove_until_last(stop_at) ; self.remove_until(stop_at, -1) ; end

        # @param [String]  start the text that this string start with
        #
        # @raise [ArgumentError]
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
        # @raise [ArgumentError]
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
        # @raise [ArgumentError]
        #
        # @return [Boolean] true, if this string instance contains the provided str
        def ∋?(them); 🛑str❓(:them, them); self.include?(them); end

        # @param [String] them
        #
        # @raise [ArgumentError]
        #
        # @return [Boolean] true, if this string instance contains the provided str
        def ∌?(them); 🛑str❓(:them, them); not self.include?(them); end

        # @param [String, Array, Set] them
        #
        # @raise [ArgumentError]
        #
        # @return [Boolean] true, if this string instance is not contained in the provided str (or array/set)
        def ∉?(them)
          🛑 ArgumentError.new("| c{String}-> m{∉?} will only accept args of type{String, Array, Set}, not the provided type{#{them.Ⓣ}} from arg{#{them.to_s}} |") unless (them.str? || them.ary? || them.is_a?(Set))
          them.∌?(self)
        end

        # @param [String, Array, Set] them
        #
        # @raise [ArgumentError]
        #
        # @return [Boolean] true, if this string instance is contained in the provided str (or array/set)
        def ∈?(them)
          🛑 ArgumentError.new("| c{String}-> m{∈?} will only accept args of type{String, Array, Set}, not the provided type{#{them.Ⓣ}} from arg{#{them.to_s}} |") unless (them.str? || them.ary? || them.is_a?(Set))
          them.∋?(self)
        end
      end

      # defines the operations needed to support Feature(`f21`) that are applied to Class(`String`)
      module StringF21

        # @return [Boolean] true, if this `String` is length 1 with a it's character being a digit (ascii value between 48 and 57)
        def digit?; self.𝔠₁? && self.ord < 58 && self.ord > 47; end

        # @return [Boolean] true, if this `String` can be converted into a number w/o raising any exception
        def to_num?
          self.to_num
          true
        rescue
          false
        end

        # @raise [ArgumentError]
        #
        # @return [Numeric, Symbol, ThetaAngle]
        def to_num
          if 𝕊.∋?(self)
            return 𝕊.parse(self)
          end

          case(self.length)
          when 0
            🛑 ::Ruuuby::DescriptiveStandardError.🆕(self, "can't be parsed as a num")
          when 1
            if self.digit?
              return self.to_i
            else
              🛑 ::Ruuuby::DescriptiveStandardError.🆕(self, "can't be parsed as a num")
            end
          when 2
            case(self.₀)
            when '.'
              if self.₁.digit?
                return Float(self)
              else
                🛑 ::Ruuuby::DescriptiveStandardError.🆕(self, "can't be parsed as a num")
              end
            when '+', '-'
              if self.₁.digit?   ; return Integer(self)
              elsif self.₁?('π') ; return (self.₀?('-')) ? (-::Math::PI) : (::Math::PI)
              else               ;  🛑 ::Ruuuby::DescriptiveStandardError.🆕(self, "can't be parsed as a num")
              end
            else
              if self.₀.digit? && self.₁.digit? ; return Integer(self)
              else                              ; 🛑 ::Ruuuby::DescriptiveStandardError.🆕(self, "can't be parsed as a num")
              end
            end
          when 3
            if self.match?(String.syntax_len_3_as_flt)     ; return Float(self)
            elsif self.match?(String.syntax_len_3_as_int) ; return Integer(self)
            elsif self.downcase == 'nan'                  ; return Float::NAN
            else                                          ; 🛑 ::Ruuuby::DescriptiveStandardError.🆕(self, "can't be parsed as a num")
            end
          else
            if self.match?(String.syntax_len_any_as_int) ; return Integer(self)
            elsif self.match?(String.syntax_len_any)     ; return Float(self)
            else                                         ; 🛑 ::Ruuuby::DescriptiveStandardError.🆕(self, "can't be parsed as a num")
            end
          end
        end

      end
      # defines the operations needed to support Feature(`f24`) that are applied to Class(`String`)
      #module StringF24
      #end # end: {f24}

      # defines the operations needed to support Feature(`f26`) that are applied to Class(`String`)
      module StringF26

        # @return [Boolean] true, if the contents of this `String` are representative of an iso8601 formatted date and/or time
        def iso8601? ; self.length > 3 && self.match?(::String.syntax_iso8601_normalizable) ; end

        # @raise [RuntimeError] if this contents of this `String` are not representative of an iso8601 formatted date and/or time
        #
        # @return [String] a normalized representation of iso8601
        def as_iso8601
          🛑 RuntimeError.new("| c{String}-> m{as_iso8601} can't normalize self{#{self}} as it is not similar enough to iso8601 formatted data | (0x0) |") unless self.iso8601?
          data      = self.dup
          node_date = data[0...10]
          return self if node_date == self
          remainder = data[11...data.length]
          if remainder.length < 8
            🛑 RuntimeError.new("| c{String}-> m{as_iso8601} can't normalize self{#{self}} as it is not similar enough to iso8601 formatted data | (0x1) |")
          else
            node_time = remainder[0...8]
            return "#{node_date}T#{node_time}" if node_time == remainder
            remainder = remainder[8...remainder.length].strip
            if remainder.match?(::String.syntax_utc_offsets)
              case(remainder.length)
              when 3
                return "#{node_date}T#{node_time}#{remainder}:00"
              when 5
                return "#{node_date}T#{node_time}#{remainder[0...3]}:#{remainder[3...5]}"
              when 6
                return "#{node_date}T#{node_time}#{remainder}"
              else
                🛑 RuntimeError.new("| c{String}-> m{as_iso8601} can't normalize self{#{self}} as it is not similar enough to iso8601 formatted data | (0x2) |")
              end
            else
              🛑 RuntimeError.new("| c{String}-> m{as_iso8601} can't normalize self{#{self}} as it is not similar enough to iso8601 formatted data | (0x3) |")
            end
          end
        end

        # @raise [RuntimeError]
        #
        # @return [DateTime]
        def to_iso8601
          ::DateTime.iso8601(self.as_iso8601)
          #DateTime.strptime(self, '%FT%T%:z')
        end

      end
    end # end: {Includable}
  end # end: {Feature}
end # end: {Ruuuby}

# `Ruuuby` modifications to existing Class{+String+}
class ::String

  # common expressions or any sub-components needed for creating them (ex: for `Regular Expressions`)
  module Syntax

    # expression referenced from: https://www.regular-expressions.info/dates.html
    #
    # @type [String]
    TIME_YEAR             = '(19|20)\d\d'.❄️

    # expression referenced from: https://www.regular-expressions.info/dates.html
    #
    # @type [String]
    TIME_MONTH            = '(0[1-9]|1[012])'.❄️

    # expression referenced from: https://www.regular-expressions.info/dates.html
    #
    # @type [String]
    TIME_DAY              = '(0[1-9]|[12][0-9]|3[01])'.❄️

    # @type [String]
    TIME_HOUR_MIN         = '(([01]\d)|(2[0-3])):[0-5]\d'.❄️

    # @type [String]
    TIME_HOUR_MIN_SEC     = "#{TIME_HOUR_MIN}:[0-5]\\d".❄️

    # expression referenced from: https://www.regextester.com/99856
    #
    # @type [String]
    UTC_OFFSETS           = '(([+-]([01]\d|2[0-3])(:?[0-5]\d)?)|Z)'.❄️

    # expression referenced from: https://stackoverflow.com/questions/12756159/regex-and-iso8601-formatted-datetime
    #
    # @type [String]
    ISO8601               = "(#{TIME_YEAR})(-#{TIME_MONTH}(-#{TIME_DAY}(T#{TIME_HOUR_MIN_SEC}(#{UTC_OFFSETS})?)?)?)?".❄️

    # TODO: temporary-design, more flexibility could be added in
    #
    # @type [String]
    ISO8601_NORMALIZABLE  = "(#{TIME_YEAR})(-#{TIME_MONTH}(-#{TIME_DAY}((T| )#{TIME_HOUR_MIN_SEC}(( )?#{UTC_OFFSETS})?)?)?)?".❄️

    # @type [String]
    CHAR_UPPERCASE        = ::Regexp::Syntax::CHAR_UPPER

    # @type [String]
    CHAR_LOWERCASE        = ::Regexp::Syntax::CHAR_LOWER

    # expression referenced from: https://stackoverflow.com/questions/1128305/regex-for-pascalcased-words-aka-camelcased-with-leading-uppercase-letter
    #
    # @type [String]
    CASE_CAMEL            = '[A-Z]([A-Z0-9]*[a-z][a-z0-9]*[A-Z]|[a-z0-9]*[A-Z][A-Z0-9]*[a-z])[A-Za-z0-9]*'.❄️

    # expression referenced from: https://stackoverflow.com/questions/1128305/regex-for-pascalcased-words-aka-camelcased-with-leading-uppercase-letter
    #
    # @type [String]
    CASE_LOWER_CAMEL      = '[a-z]+((\d)|([A-Z0-9][a-z0-9]+))*([A-Z])?'.❄️

    # @type [String]
    CASE_UPPER_SNAKE      = '[A-Z]([A-Z0-9]*(_[A-Z0-9]+)?)*'.❄️

    # @type [String]
    CASE_SNAKE            = '[a-z]([a-z0-9]*(_[a-z0-9]+)?)*'.❄️

    # @type [String]
    LEN_3_AS_INT          = '(\d\d\d)|([+-]\d\d)'.❄️

    # @type [String]
    LEN_3_AS_FLT          = '([+-]\.\d)|(\d\.\d)|(\.\d\d)|(\de\d)'.❄️

    # @type [String]
    LEN_ANY_AS_INT        = '[+-]?\d+'.❄️

    # expression referenced from: https://mentalized.net/journal/2011/04/14/ruby-how-to-check-if-a-string-is-numeric/
    #
    # @type [String]
    LEN_ANY               = '[+-]?\d+?((\.\d+e?\d*)|(e\d+))?'.❄️

    ❄️
  end

  include ::Ruuuby::Attribute::Includable::SubscriptIndexing

  include ::Ruuuby::Attribute::Includable::SyntaxCache
  # ---------------------------------------------------------------------------------------------------------- | *f03* |
  include ::Ruuuby::Attribute::Includable::Cardinality
  # ---------------------------------------------------------------------------------------------------------- | *f08* |
  include ::Ruuuby::Feature::Includable::StringF08

  alias_method :⬇, :downcase
  alias_method :⬇!, :downcase!
  alias_method :⬆, :upcase
  alias_method :⬆!, :upcase!

  alias_method :↩, :reverse
  alias_method :↩!, :reverse!

  alias_method :♻️⟶, :remove_until
  alias_method :♻️⟶∞, :remove_until_last

  # ---------------------------------------------------------------------------------------------------------- | *f09* |
  include ::Ruuuby::Feature::Includable::StringF09
  # ---------------------------------------------------------------------------------------------------------- | *f21* |
  include ::Ruuuby::Feature::Includable::StringF21
  # ---------------------------------------------------------------------------------------------------------- | *f26* |
  include ::Ruuuby::Feature::Includable::StringF26
  # ---------------------------------------------------------------------------------------------------------- | *f04* |
  alias_method :∅?, :empty?
  # | ------------------------------------------------------------------------------------------------------------------

  alias_method :⬆?, :upcase?
  alias_method :⬇?, :downcase?

  def clean!
    self.gsub!($/, '')
  end

  # TODO: not finalized design
  #
  # @param [Symbol] normalizer
  #
  # @return [String]
  def η̂(normalizer)
    if normalizer == :iso8601
      self.as_iso8601
    else
      🛑 RuntimeError.new("c{String}-> m{η̂} got invalid arg(normalizer){#{normalizer.to_s}} w/ type{#{normalizer.Ⓣ}}")
    end
  end

  # @return [String] self with modified +encoding+ if not already +UTF-8+
  def as_utf8; self.force_encoding(::Encoding::UTF_8); end

  # @return [Boolean] true, if this `String` has equal contents written forwards or backwards
  def palindrome?; self == self.↩; end

end
