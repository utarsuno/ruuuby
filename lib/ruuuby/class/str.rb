# coding: utf-8

# add various functions to existing class +String+ (and explicitly create aliases to play nice with IDEs)
class ::String
  alias_method :∅?, :empty?
  alias_method :>>, :>>

  # @param [String] str
  #
  # @raise [WrongParamType]
  #
  # @return [Boolean] true, if this string instance contains the provided str
  def ∋?(str) ; 🛑str❓(:str, str) ; self.include?(str) ; end

  # @param [String] str
  #
  # @raise [WrongParamType]
  #
  # @return [Boolean] true, if this string instance contains the provided str
  def ∌?(str) ; 🛑str❓(:str, str) ; not self.include?(str) ; end

  # @param [String|Array] content
  #
  # @raise [WrongParamType]
  #
  # @return [Boolean] true, if this string instance is not contained in the provided str (or array)
  def ∉?(content) ; 🛑str_or_ary❓(:content, content) ; content.∌?(self) ; end

  # @param [String|Array] content
  #
  # @raise [WrongParamType]
  #
  # @return [Boolean] true, if this string instance is contained in the provided str (or array)
  def ∈?(content) ; 🛑str_or_ary❓(:content, content) ; content.∋?(self) ; end

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
    while delta <= self.length && delta <= start.length
      ending_of_start = start[(start.length-1-delta)..(start.length-1)]
      last_matched    = ending_of_start if self[0..delta] == ending_of_start
      delta          += 1
    end
    self >> (last_matched == '' ? start : start[0..(start.length-1-last_matched.length)])
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
    while delta <= self.length && delta <= ending.length
      starting_of_end = ending[0..delta]
      last_matched    = starting_of_end if self[(self.length-1-delta)..(self.length-1)] == starting_of_end
      delta          += 1
    end
    self << (last_matched == '' ? ending : ending[last_matched.length..ending.length-1])
  end

end
