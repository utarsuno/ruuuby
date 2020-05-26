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

  REPRESENTATIONS_TO_SYMBOLS = {as_degree: '°'.❄️, as_radian: 'ʳ'.❄️, as_gon: 'ᵍ'.❄️, as_turn: '𝞽'.❄️}.❄️

  # TODO:
  #module Syntax
  #  # @type [String]
  #  TRIGONOMETRIC_ANGLE = '(\d+)?π(/\d+)?'.❄️
  #  # @type [String]
  #  FORMAT_DEGREES      = '(\d+)((.)(\d+))?((°(θ))|( degrees))?'.❄️
  #end

  # include ::Ruuuby::Attribute::Includable::SyntaxCache

  # ____________________________________________________________________________________________________________________
  #            ___          __   __   ___  __       ___    __        __
  #  |\/|  /\   |  |__|    /  \ |__) |__  |__)  /\   |  | /  \ |\ | /__`
  #  |  | /~~\  |  |  |    \__/ |    |___ |  \ /~~\  |  | \__/ | \| .__/
  # ____________________________________________________________________________________________________________________

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
    "#{value}#{REPRESENTATIONS_TO_SYMBOLS[self.repr]}θ"
  end

  # ____________________________________________________________________________________________________________________
  #                   __   ___  __
  #  /\  |    |  /\  /__` |__  /__`
  # /~~\ |___ | /~~\ .__/ |___ .__/
  # ____________________________________________________________________________________________________________________

  alias_method :ʳ, :as_radian
  alias_method :ʳ?, :radians?

  alias_method :°, :as_degree
  alias_method :°?, :degrees?

  alias_method :ᵍ, :as_gon
  alias_method :ᵍ?, :gons?

  alias_method :𝞽, :as_turn
  alias_method :𝞽?, :turns?

  alias_method :∠?, :angle?

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

# TODO: after adding geometry sub-modules / shapes: attach these formulas --> https://mathworld.wolfram.com/LawofCosines.html
