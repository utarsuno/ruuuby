# coding: utf-8

# add various functions to existing class +String+ (and explicitly create aliases to play nice with IDEs)
class ::String

  # | feature | *f03* | ------------------------------------------------------------------------------------------------
  alias_method :𝔠, :length
  # | feature | *f04* | ------------------------------------------------------------------------------------------------
  alias_method :∅?, :empty?
  # | feature | *f05* | ------------------------------------------------------------------------------------------------
  alias_method :>>, :>>
  # | ------------------------------------------------------------------------------------------------------------------

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

  # @param [String|Array] them
  #
  # @raise [WrongParamType]
  #
  # @return [Boolean] true, if this string instance is not contained in the provided str (or array)
  def ∉?(them) ; 🛑str_or_ary❓(:them, them) ; them.∌?(self) ; end

  # @param [String|Array] them
  #
  # @raise [WrongParamType]
  #
  # @return [Boolean] true, if this string instance is contained in the provided str (or array)
  def ∈?(them) ; 🛑str_or_ary❓(:them, them) ; them.∋?(self) ; end

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
    self >> (last_matched == '' ? start : start[0..(start.𝔠-1-last_matched.𝔠)])
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
    self << (last_matched == '' ? ending : ending[last_matched.𝔠..ending.𝔠-1])
  end

end
