# coding: utf-8

# add various functions to existing class +String+ (and explicitly create aliases to play nice with IDEs)
class ::String

  # @param [String] str
  #
  # @raise [WrongParamType]
  #
  # @return [Boolean] true, if this string instance contains the provided str
  def ∋?(str)
    raise Ruuuby::Err::param¬str(::String, 'str', str) unless str.str?
    self.include?(str)
  end

  # @param [String] str
  #
  # @raise [WrongParamType]
  #
  # @return [Boolean] true, if this string instance contains the provided str
  def ∌?(str)
    raise Ruuuby::Err::param¬str(::String, 'str', str) unless str.str?
    not self.include?(str)
  end

  # @param [String] str
  #
  # @raise [WrongParamType]
  #
  # @return [Boolean] true, if this string instance is not contained in the provided str
  def ∉?(str)
    raise Ruuuby::Err::param¬str(::String, 'str', str) unless str.str?
    str.∌?(self)
  end

  # @param [String] str
  #
  # @raise [WrongParamType]
  #
  # @return [Boolean] true, if this string instance is contained in the provided str
  def ∈?(str)
    raise Ruuuby::Err::param¬str(::String, 'str', str) unless str.str?
    str.∋?(self)
  end

  # @param [String]  start the text that this string start with
  # @param [Boolean] use_partial_fill_in ex: 'baa'.ensure_start!('bba', true) -> 'bbaa', 'baa'.ensure_start!('bba', false) -> 'bbabaa'
  #
  # @raise [WrongParamType]
  #
  # @return [String] the original string with the starting text added if at least partially missing prior
  def ensure_start!(start, use_partial_fill_in)
    raise Ruuuby::Err::param¬str(::String, 'start', start) unless start.str?
    raise Ruuuby::Err::param¬bool(::String, 'use_partial_fill_in', use_partial_fill_in) unless use_partial_fill_in.bool?
    return self if start.length == 0 || self.start_with?(start)
    return self >> start if (self.length == 0 || !use_partial_fill_in)
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
  # @param [Boolean] use_partial_fill_in ex: 'baa'.ensure_ending!('aab', true) -> 'baab', 'baa'.ensure_ending!('aab', false) -> 'baaaab'
  #
  # @raise [WrongParamType]
  #
  # @return [String] the original string with ending-string added if missing prior
  def ensure_ending!(ending, use_partial_fill_in)
    raise Ruuuby::Err::param¬str(::String, 'ending', ending) unless ending.str?
    raise Ruuuby::Err::param¬bool(::String, 'use_partial_fill_in', use_partial_fill_in) unless use_partial_fill_in.bool?
    return self if ending.length == 0 || self.end_with?(ending)
    return self << ending if self.length == 0 || !use_partial_fill_in
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
