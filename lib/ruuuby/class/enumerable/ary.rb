# encoding: utf-8

# add various functions to existing class +Array+ (and explicitly create aliases to play nice with IDEs)
class ::Array

  # Performs the relative complement (or set difference) of these two arrays, operation order/side does matter.
  #
  # @param [Array] them
  #
  # @raise [WrongParamType]
  #
  # @return [Array] a new Array instance containing the relative complement between this array and the one provided
  def ∖(them) ; 🛑ary❓(:them, them) ; self - them ; end

  # @param [*]
  #
  # @return [Boolean] true, if this array ends with the provided elements
  def end_with?(*ending)
    return false if (ending.∅? || ending.length > self.length)
    return self.last == ending[0] if ending.length == 1
    self.last(ending.length) == ending
  end

  # @param [*]
  #
  # @return [Boolean] true, if this array starts with the provided elements
  def start_with?(*start)
    return false if (start.∅? || start.length > self.length)
    return self.first == start[0] if start.length == 1
    self.first(start.length) == start
  end

  # @param [*]
  #
  # @return [Array] this array instance, modified if not starting with provided starting elements
  def ensure_start!(*start)
    return self if (start.∅? || self.start_with?(*start))
    return self >> start[0] if start.length == 1
    delta        = 0
    last_matched = nil
    while delta <= self.length && delta <= start.length
      ending_of_start = start[(start.length-1-delta)..(start.length-1)]
      last_matched    = ending_of_start if self[0..delta] == ending_of_start
      delta          += 1
    end
    if last_matched == nil
      start.↩️∀{|element| self >> element}
    else
      start[0..(start.length-1-last_matched.length)].↩️∀{|element| self >> element}
    end
    self
  end

  # @param [*]
  #
  # @return [Array] this array instance, modified if not ending with provided endings elements
  def ensure_ending!(*ending)
    return self if (ending.∅? || self.end_with?(*ending))
    return self << ending[0] if ending.length == 1
    delta        = 0
    last_matched = nil
    while delta <= self.length && delta <= ending.length
      starting_of_end = ending[0..delta]
      last_matched    = starting_of_end if self[(self.length-1-delta)..(self.length-1)] == starting_of_end
      delta          += 1
    end
    if last_matched == nil
      ending.∀{|element| self << element }
    else
      ending[(last_matched.length)..(ending.length-1)].∀{|element| self << element }
    end
    self
  end

  alias_method :>>, :>>
  alias_method :∀, :each
  alias_method :↩️, :reverse
  alias_method :↩️!, :reverse!
  alias_method :↩️∀, :reverse_each
  alias_method :∅?, :empty?
  alias_method :remove_empty!, :remove_empty!
  alias_method :uniq_to_me, :∖
  alias_method :∋?, :include?

  # Return true if both arrays are matching in contents, supports multiple types and without order mattering.
  #
  # @param [Array] them
  #
  # @raise [ArgumentError]
  #
  # @return [Boolean] true, if both arrays have the same contents (order does not matter)
  alias_method :equal_contents?, :equal_contents?
  alias_method :≈≈, :equal_contents?

  # Retrieve the frequency counts of elements in this array as a hash.
  #
  # @example:
  #   a = [1, 1, '1', nil, [], nil, nil].📊
  #   a[1]   == 2
  #   a['1'] == 1
  #   a[nil] == 3
  #   a[[]]  == 1
  #
  # @raise [ArgumentError]
  #
  # @return [Hash|NilClass] nil if empty, otherwise returns a new hash with --> key: a value from the array, value: the total number of occurrences
  alias_method :frequency_counts, :frequency_counts
  alias_method :📊, :frequency_counts

  # Performs the symmetric difference (or disjunctive union) of these two arrays, operation order/side does not matter.
  #
  # @param [Array] them
  #
  # @raise [ArgumentError]
  #
  # @return [Array] a new Array instance containing the symmetric difference between this array and the one provided
  alias_method :disjunctive_union, :disjunctive_union
  alias_method :⊕, :disjunctive_union

end
