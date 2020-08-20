# encoding: UTF-8

using ::Math::Space::SymbolicNumbersSpace::ContextStr

class ::ThetaAngle

  # @type [String]
  SYN_NUM     = "[-]?(\\d+(.\\d+)?)"

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
    FORMAT_GON         = "(?<s0>#{SYN_NUM}( )?(ᵍ|gon(s)?))".❄️

    # @type [String]
    FORMAT_TRN         = "(?<s0>#{SYN_NUM}( )?(trn|turns))".❄️

    # @type [String]
    NUMERIC_SCENARIOS  = "(?<s0>#{SYN_NUM})(?<s1>((\\/)#{SYN_NUM}))?".❄️

    # @type [String]
    SYMBOLIC_SCENARIOS = "(?<s0>[-]?((\\d+(.\\d+)?))?)(?<s1>(π|𝚽))(?<s2>((\\/)?(\\d+(.\\d+)?))?)".❄️

      #❄️
  end

  include ::Ruuuby::Attribute::Includable::SyntaxCache

  module ContextStr
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
  end # end: {module{ContextStr}}
end

using ::ThetaAngle::ContextStr

class ::ThetaAngle

  module ContextRuuuby
    refine ::Object do

      # a full rotation around the circle, base representation in turns(+θ𝞽+)
      #
      # @type [ThetaAngle]
      def 𝞽; ::Math::ANGLE_TAU; end

      # @param [Float, Int, ThetaAngle, String] arg
      #
      # @return [ThetaAngle]
      def θ°(arg); arg.str? ? ::ThetaAngle.new_degree(arg.°) : ::ThetaAngle.new_degree(arg); end

      # @param [Float, Int, ThetaAngle, String] arg
      #
      # @return [ThetaAngle]
      def θʳ(arg); arg.str? ? ::ThetaAngle.new_radian(arg.ʳ) : ::ThetaAngle.new_radian(arg); end

      # @param [Float, Int, ThetaAngle, String] arg
      #
      # @return [ThetaAngle]
      def θᵍ(arg); arg.str? ? ::ThetaAngle.new_gon(arg.ᵍ) : ::ThetaAngle.new_gon(arg); end

      # @param [Float, Int, ThetaAngle, String] arg
      #
      # @return [ThetaAngle]
      def θ𝞽(arg); arg.str? ? ::ThetaAngle.new_turn(arg.𝞽) : ::ThetaAngle.new_turn(arg); end
    end
  end

  module ContextParamCheck
    refine ::Object do

      alias_method :θ?, :theta_angle?

      # @param [String, Symbol] arg_name
      # @param [*]              arg
      #
      # @raise [ArgumentError]
      def 🛑θ❓(arg_name, arg); 🛑 ::Ruuuby::PrmErrThetaAngle.🆕(self, arg_name.to_s, arg) unless arg.θ?; end

      # @param [*] args
      #
      # @raise [ArgumentError]
      def 🛑θs❓(args)
        args.∀ₓᵢ do |x, i|
          🛑 ::Ruuuby::PrmErrThetaAngle.🆕(self, "[#{i.to_s}]{#{x.to_s}}", x) unless x.θ?
        end
      end
    end
  end

end

using ::ThetaAngle::ContextParamCheck

# terminology:
#  * radius       | a measurement in distance     |
#  * arc-length   | a measurement in distance     |
#  * angle-of-arc | arc-length / radius           | [notice that the output has no units]
#
# vocabulary:
#  * ephemeral    | lasting for a very short time |
#
#
# | degree | ° | θ°.new(360)            |
# | radian | ʳ | θʳ.new(2 * ::Math::PI) |
# | gon    | ᵍ | θᵍ.new(400)            |
# | turn   | 𝞽 | θ𝞽.new(1)              |
#
#
class ThetaAngle
  include ::Comparable

  # ____________________________________________________________________________________________________________________
  #            ___          __   __   ___  __       ___    __        __
  #  |\/|  /\   |  |__|    /  \ |__) |__  |__)  /\   |  | /  \ |\ | /__`
  #  |  | /~~\  |  |  |    \__/ |    |___ |  \ /~~\  |  | \__/ | \| .__/
  # ____________________________________________________________________________________________________________________

  # @return [Boolean] true, if `self.real == 0`
  def ∅?; self.real.zero?; end

  # `{f27_b03}`
  module Pair

    # @return [Boolean] true, if the provided angles summed together equal{360°}
    def self.explementary?(θa, θb)
      🛑θs❓([θa, θb])
      θa + θb == ::Math::ANGLE_TAU
    end

    # @return [Boolean] true, if the provided angles summed together equal{90°}
    def self.complementary?(θa, θb)
      🛑θs❓([θa, θb])
      θa + θb == ::Math::ANGLE_RIGHT
    end

    # @return [Boolean] true, if the provided angles summed together equal{180°}
    def self.supplementary?(θa, θb)
      🛑θs❓([θa, θb])
      θa + θb == ::Math::ANGLE_STRAIGHT
    end

    # @return [Boolean] true, if the provided angles summed together equal{360°} and are in the ratio{𝚽}
    def self.golden?(θa, θb)
      🛑θs❓([θa, θb])
      if θa >= θb
        ((θa + θb) / θa).real.≈≈(::Float::RATIO_GOLDEN)
      else
        ((θb + θa) / θb).≈≈(::Float::RATIO_GOLDEN)
      end
    end

  end

  # ____________________________________________________________________________________________________________________
  #            ___          ___            __  ___    __        __
  #  |\/|  /\   |  |__|    |__  |  | |\ | /  `  |  | /  \ |\ | /__`
  #  |  | /~~\  |  |  |    |    \__/ | \| \__,  |  | \__/ | \| .__/
  # ____________________________________________________________________________________________________________________

  # @raise [ArgumentError]
  #
  # @return [Boolean]
  def ≈≈(them)
    if them.θ?
      self == them
    else
      🛑flt❓(:them, them)
      self.to_f.≈≈(them)
    end
  end

  # ____________________________________________________________________________________________________________________
  #  __  ___            __        __   __      __   __           ___            __   __
  # /__`  |   /\  |\ | |  \  /\  |__) |  \    /  \ |__)    |    |__  |  | |\ | /  ` /__`
  # .__/  |  /~~\ | \| |__/ /~~\ |  \ |__/    \__/ |__) \__/    |    \__/ | \| \__, .__/
  # ____________________________________________________________________________________________________________________

  # @return [String]
  def to_s
    value = self.real
    if ℤ.∋?(value)
      value = value.to_i.to_s
    else
      value = value.to_s
    end
    case(self.repr)
    when 3
      "#{value}ʳθ"
    when 4
      "#{value}°θ"
    when 5
      "#{value}𝞽θ"
    when 6
      "#{value}ᵍθ"
    else
      🛑 RuntimeError.new("| c{ThetaAngle}-> m{to_s} w/ self{#{self.to_s}} val{#{self.real.to_s}} repr{#{self.repr.to_s}} had an unrecognized representation value |")
    end
  end

  # ____________________________________________________________________________________________________________________
  #                   __   ___  __
  #  /\  |    |  /\  /__` |__  /__`
  # /~~\ |___ | /~~\ .__/ |___ .__/
  # ____________________________________________________________________________________________________________________

  alias_method :⦜?, :right?
  alias_method :⦦?, :obtuse?
  alias_method :⦟?, :acute?
  alias_method :_?, :straight?
  alias_method :○?, :perigon?
  alias_method :𝟞𝟘°?, :sextant?
  alias_method :𝟜𝟝°?, :octant?

  alias_method :ʳ, :as_radian
  alias_method :ʳ?, :radians?

  alias_method :°, :as_degree
  alias_method :°?, :degrees?

  alias_method :ᵍ, :as_gon
  alias_method :ᵍ?, :gons?

  alias_method :𝞽, :as_turn
  alias_method :𝞽?, :turns?

  alias_method :η̂?, :normal?
  alias_method :η̂, :normalize
  alias_method :η̂!, :normalize!

  alias_method :➖, :self_subtraction
  alias_method :➕, :self_addition
  alias_method :✖️, :self_multiplication
  alias_method :➗, :self_division

  # ____________________________________________________________________________________________________________________
  #  __  ___      ___    __      ___            __  ___    __        __
  # /__`  |   /\   |  | /  `    |__  |  | |\ | /  `  |  | /  \ |\ | /__`
  # .__/  |  /~~\  |  | \__,    |    \__/ | \| \__,  |  | \__/ | \| .__/
  # ____________________________________________________________________________________________________________________

end

# vocab
#
# dihedral angle | "angle between two intersecting planes"
# solid angle    | "measure of the amount of the `field of view` from some particular point that a given object covers"
# steradian      | "used in three-dimensional geometry, and is analogous to the radian, which quantifies `planar angles`"
# spat (sp)      | "unit of solid angle" | 1 spat = 4π ~= 41253 square degrees of solid angle

# TODO:
#  - https://en.wikipedia.org/wiki/Circular_segment
#  - https://en.wikipedia.org/wiki/Circular_sector
#  - https://en.wikipedia.org/wiki/Conic_section
