# coding: UTF-8

# terminology:
#  * radius       | a measurement in distance     |
#  * arc-length   | a measurement in distance     |
#  * angle-of-arc | arc-length / radius           | [notice that the output has no units]
#
# vocabulary:
#  * ephemeral    | lasting for a very short time |
class ThetaAngle
  include ::Comparable

  # TODO: switch to fixnum representation
  REPRESENTATIONS_TO_SYMBOLS = {as_degree: '°'.❄️, as_radian: 'ʳ'.❄️, as_gon: 'ᵍ'.❄️, as_turn: '𝞽'.❄️}.❄️

  # TODO:
  #module Syntax
  #  # @type [String]
  #  TRIGONOMETRIC_ANGLE = '(\d+)?π(/\d+)?'.❄️
  #  # @type [String]
  #  FORMAT_DEGREES      = '(\d+)((.)(\d+))?((°(θ))|( degrees))?'.❄️
  #
  # 1 rad = 10^3 mrad = 10^6 urad
  #
  #end

  # include ::Ruuuby::Attribute::Includable::SyntaxCache

  # ____________________________________________________________________________________________________________________
  #            ___          __   __   ___  __       ___    __        __
  #  |\/|  /\   |  |__|    /  \ |__) |__  |__)  /\   |  | /  \ |\ | /__`
  #  |  | /~~\  |  |  |    \__/ |    |___ |  \ /~~\  |  | \__/ | \| .__/
  # ____________________________________________________________________________________________________________________

  # @return [Boolean] true, if `self.real == 0`
  def ∅?; self.real.zero?; end

  module Vocab



  end

  module Pair

    # @return [Boolean] true, if the provided angles summed together equal{360°}
    def self.explementary?(θa, θb)
      🛑θ❓(:θa, θa)
      🛑θ❓(:θb, θb)
      θa + θb == ::Math::ANGLE_TAU
    end

    # @return [Boolean] true, if the provided angles summed together equal{90°}
    def self.complementary?(θa, θb)
      🛑θ❓(:θa, θa)
      🛑θ❓(:θb, θb)
      θa + θb == ::Math::ANGLE_RIGHT
    end

    # @return [Boolean] true, if the provided angles summed together equal{180°}
    def self.supplementary?(θa, θb)
      🛑θ❓(:θa, θa)
      🛑θ❓(:θb, θb)
      θa + θb == ::Math::ANGLE_STRAIGHT
    end

    # @return [Boolean] true, if the provided angles summed together equal{360°} and are in the ratio{𝚽}
    def self.golden?(θa, θb)
      🛑θ❓(:θa, θa)
      🛑θ❓(:θb, θb)
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
