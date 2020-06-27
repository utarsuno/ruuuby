# encoding: UTF-8

using ::Math::Space::SymbolicNumbersSpace::ContextStrParsing

class ::ThetaAngle

  # @type [String]
  SYN_NUM     = "[-]?(\\d+(.\\d+)?)"

  # @type [String]
  SYM_NUM_POS = "\\d+(.\\d+)?"

  # @type [Hash]
  UNITS_RAD = {'urad' => 10000.0, 'mrad' => 1000.0, 'radians' => 1, 'rad' => 1, 'ʳ' => 1}

  # @type [Hash]
  UNITS_DGR = {"''" => 3600.0, 'arc-seconds' => 3600.0, "'" => 60.0, 'arc-minutes' => 60.0, '°' => 1}

  # @type [Hash]
  UNITS_GON = {'gons' => 1, 'gon' => 1, 'ᵍ' => 1}

  # @type [Hash]
  UNITS_TRN = {'turns' => 1, 'trn' => 1}

  module Syntax

    # | `degree`    | `°`  |
    # | `arcminute` | `'`  |
    # | `arcsecond` | `''` |
    #
    # (ex: `3°7'30''` == `3 + 7/60 + 30/3600` == `3.125°`)
    #
    # @type [String]
    FORMAT_DGR         = "(?<s0>#{SYN_NUM}(( )?(°|dgr|degrees)))?(?<s1>( )?#{SYN_NUM}(( )?('|arc[-]minutes)))?(?<s2>( )?#{SYN_NUM}(( )?(''|arc[-]seconds)))?".❄️

    # @type [String]
    FORMAT_RAD         = "(?<s0>#{SYN_NUM}(( )?(ʳ|radians|rad)))?(?<s1>( )?#{SYN_NUM}(( )?mrad))?(?<s2>( )?#{SYN_NUM}(( )?urad))?".❄️

    # @type [String]
    FORMAT_GON         = "(?<s0>#{SYN_NUM}( )?(ᵍ|gon(s)?))"

    # @type [String]
    FORMAT_TRN         = "(?<s0>#{SYN_NUM}( )?(trn|turns))".❄️

    # @type [String]
    NUMERIC_SCENARIOS  = "(?<s0>#{SYN_NUM})(?<s1>((\\/)#{SYN_NUM}))?".❄️

    # @type [String]
    SYMBOLIC_SCENARIOS = "(?<s0>[-]?((\\d+(.\\d+)?))?)(?<s1>(π|𝚽))(?<s2>((\\/)?(\\d+(.\\d+)?))?)".❄️

    ❄️
  end

  include ::Ruuuby::Attribute::Includable::SyntaxCache

  module ContextStrParsing

    refine ::String do

      # @return [Boolean]
      def ʳ?; self.∅? ? false : ::ThetaAngle.syntax_format_rad.match?(self); end

      # @return [Boolean]
      def ᵍ?; self.∅? ? false : ::ThetaAngle.syntax_format_gon.match?(self); end

      # @return [Boolean]
      def 𝞽?; self.∅? ? false : ::ThetaAngle.syntax_format_trn.match?(self); end

      # @return [Boolean]
      def °?; self.∅? ? false : ::ThetaAngle.syntax_format_dgr.match?(self); end

      # @raise [RuntimeError]
      #
      # @return [Float]
      def °
        if self.length == 0
          🛑 RuntimeError.new("| c{String}-> m{ᵍ} called but self{#{self.to_s}} is empty |")
        elsif self.match?(::ThetaAngle.syntax_symbolic_scenarios)
          self._parse_symbolic(self.dup)
        elsif self.match?(::ThetaAngle.syntax_numeric_scenarios)
          return self._parse_numeric(self.dup)
        else
          🛑 RuntimeError.new("| c{String}-> m{°} called but self{#{self.to_s}} is not in format{dgr} |") unless self.°?
          parsed = ::ThetaAngle.syntax_format_dgr.match(self)
          part_a = parsed[:s0].∅? ? 0.0 : _parse_out_segment(parsed[:s0].dup, ::ThetaAngle::UNITS_DGR)
          part_b = parsed[:s1].∅? ? 0.0 : _parse_out_segment(parsed[:s1].dup, ::ThetaAngle::UNITS_DGR)
          part_c = parsed[:s2].∅? ? 0.0 : _parse_out_segment(parsed[:s2].dup, ::ThetaAngle::UNITS_DGR)
          return part_a + part_b + part_c
        end
      end

      # @raise [RuntimeError]
      #
      # @return [Float]
      def ʳ
        if self.length == 0
          🛑 RuntimeError.new("| c{String}-> m{ʳ} called but self{#{self.to_s}} is empty |")
        elsif self.match?(::ThetaAngle.syntax_symbolic_scenarios)
          self._parse_symbolic(self.dup)
        elsif self.match?(::ThetaAngle.syntax_numeric_scenarios)
          return self._parse_numeric(self.dup)
        else
          🛑 RuntimeError.new("| c{String}-> m{ʳ} called but self{#{self.to_s}} is not in format{rad} |") unless self.ʳ?
          parsed = ::ThetaAngle.syntax_format_rad.match(self)
          return self.to_f if parsed[:s0].∅? && parsed[:s1].∅? && parsed[:s2].∅?
          part_a = parsed[:s0].∅? ? 1.0 : _parse_out_segment(parsed[:s0].dup, ::ThetaAngle::UNITS_RAD)
          part_b = parsed[:s1].∅? ? 1.0 : _parse_out_segment(parsed[:s1].dup, ::ThetaAngle::UNITS_RAD)
          part_c = parsed[:s2].∅? ? 1.0 : _parse_out_segment(parsed[:s2].dup, ::ThetaAngle::UNITS_RAD)
          return part_a * part_b * part_c
        end
      end

      # @raise [RuntimeError]
      #
      # @return [Float]
      def ᵍ
        if self.length == 0
          🛑 RuntimeError.new("| c{String}-> m{ᵍ} called but self{#{self.to_s}} is empty |")
        elsif self.match?(::ThetaAngle.syntax_symbolic_scenarios)
          self._parse_symbolic(self.dup)
        elsif self.match?(::ThetaAngle.syntax_numeric_scenarios)
          return self._parse_numeric(self.dup)
        else
          🛑 RuntimeError.new("| c{String}-> m{ᵍ} called but self{#{self.to_s}} is not in format{gon} |") unless self.ᵍ?
          parsed = ::ThetaAngle.syntax_format_gon.match(self)
          return self.to_f if parsed[:s0].∅?
          return _parse_out_segment(parsed[:s0].dup, ::ThetaAngle::UNITS_GON)
        end
      end

      # @raise [RuntimeError]
      #
      # @return [Float]
      def 𝞽
        if self.length == 0
          🛑 RuntimeError.new("| c{String}-> m{𝞽} called but self{#{self.to_s}} is empty |")
        elsif self.match?(::ThetaAngle.syntax_symbolic_scenarios)
          self._parse_symbolic(self.dup)
        elsif self.match?(::ThetaAngle.syntax_numeric_scenarios)
          return self._parse_numeric(self.dup)
        else
          🛑 RuntimeError.new("| c{String}-> m{𝞽} called but self{#{self.to_s}} is not in format{trn} |") unless self.𝞽?
          _parse_out_segment(::ThetaAngle.syntax_format_trn.match(self)[:s0].dup, ::ThetaAngle::UNITS_TRN)
        end

      end

      🙈

      def _parse_numeric(val)
        return -1.0 * self._parse_numeric(val[1,val.length]) if val[0] == '-'
        parsed = ::ThetaAngle.syntax_numeric_scenarios.match(val)
        part_a = parsed[:s0].∅? ? 1.0 : parsed[:s0]
        part_b = parsed[:s1].∅? ? 1.0 : parsed[:s1]
        if part_b != 1.0 && part_b.∋?('/')
          part_b = part_b[1,part_b.length]
          return (part_a.to_f) / part_b.to_f
        elsif part_b != 1.0 && !part_b.∋?('/')
          raise "bad format, investigate{#{self.to_s}}"
        else
          return part_a.to_f
        end
      end

      def _parse_symbolic(val)
        return -1.0 * self._parse_symbolic(val[1,val.length]) if val[0] == '-'
        parsed = ::ThetaAngle.syntax_symbolic_scenarios.match(val)
        part_a = parsed[:s0].∅? ? 1.0 : parsed[:s0]
        part_b = parsed[:s1].∅? ? 1.0 : parsed[:s1].symbolic? ? parsed[:s1].parse_symbolic_to_num : parsed[:s1]
        part_c = parsed[:s2].∅? ? 1.0 : parsed[:s2]
        if part_c != 1.0 && part_c.∋?('/')
          part_c = part_c[1,part_c.length]
          return (part_a.to_f * part_b.to_f) / part_c.to_f
        else
          return part_a.to_f * part_b.to_f
        end
      end

      def _parse_out_segment(str, vals)
        vals.each do |key, value|
          if str.∋?(key)
            return str.♻️⟵(key).to_f / value
          end
        end
        return str.to_f
      end

    end # end: {refine ::String do}

  end

end
