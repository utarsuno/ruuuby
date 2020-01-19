
unless ::Object.respond_to?(:str?)
  # add function +str?+ to existing class +Object+
  class ::Object
    # @return [Boolean] +true+, if the current object is an instance of +String+
    def str?; self.class == String; end
  end

  # Extending functionality of core classes.
  class ::String

    # Ruby provides *<<* for string append operation but provides the insert function for prepending operations.
    # This function declaration adds the naturally expected reverse operation for prepending to an existing string.
    #
    # @param [String] arg the text to prepend to this current string object
    #
    # @raise [ArgumentError] thrown if the parameter provided is not a +String+ instance
    #
    # @return [String] a new string object with contents equaling "#{arg}{self.to_s}"
    def >>(arg)
      raise ArgumentError.new("String >> prepend operation only accepts a string argument, received a {#{arg.class.to_s}} instead!") unless arg.str?
      self.insert(0, arg)
    end

    # @param [String] start the text that this string start with
    # @param [Boolean] use_partial_fill_in ex: 'baa'.ensure_start!('bba', true) -> 'bbaa', 'baa'.ensure_start!('bba', false) -> 'bbabaa'
    #
    # @raise [ArgumentError] thrown if the parameter provided is not a +String+ instance
    #
    # @return [String] the original string with the starting text added if at least partially missing prior
    def ensure_start!(start, use_partial_fill_in)
      raise ArgumentError.new("Provided argument is a {#{start.class.to_s}}, not a String!") unless start.str?
      raise ArgumentError.new("Provided argument is a {#{use_partial_fill_in.class.to_s}}, not a Boolean!") unless use_partial_fill_in.bool?
      return self if start.length == 0 || self.start_with?(start)
      return self >> start if self.length == 0 || !use_partial_fill_in
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
    # @raise [ArgumentError] thrown if the parameter provided is not a String instance
    #
    # @return [String] the original string with ending-string added if missing prior
    def ensure_ending!(ending, use_partial_fill_in)
      raise ArgumentError.new("Provided argument is a{#{ending.class.to_s}}, not a String!") unless ending.str?
      raise ArgumentError.new("Provided argument is a{#{use_partial_fill_in.class.to_s}}, not a Boolean!") unless use_partial_fill_in.bool?
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
end
