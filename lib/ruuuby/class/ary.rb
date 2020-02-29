# encoding: utf-8

# add various functions to existing class +Array+ (and explicitly create aliases to play nice with IDEs)
class ::Array

  # Retrieve the frequency counts of elements in this array as a hash.
  #
  # @example:
  #   a = [1, 1, '1', nil, [], nil, nil].📊
  #   a[1]   == 2
  #   a['1'] == 1
  #   a[nil] == 3
  #   a[[]]  == 1
  #
  # @return [Hash] key: a value from the array, value: the total number of occurrences
  def 📊
    return {} if self.∅?
    new_hash = Hash.new(0)
    self.∀{|x| new_hash[x] += 1}
    new_hash
  end

  # Same meaning as: `arg.∉ self`
  #
  # @param [*] arg
  #
  # @return [Boolean] true, if this array instance contains the provided arg
  def ∌?(arg) ; not self.include?(arg) ; end

  # Performs the symmetric difference (or disjunctive union) of these two arrays, operation order/side does not matter.
  #
  # @param [Array] ary
  #
  # @raise [WrongParamType]
  #
  # @return [Array] a new Array instance containing the symmetric difference between this array and the one provided
  def ⊕(ary) ; 🛑ary❓(:ary, ary) ; self.disjunctive_union(ary) ; end

  # Performs the relative complement (or set difference) of these two arrays, operation order/side does matter.
  #
  # @param [Array] ary
  #
  # @raise [WrongParamType]
  #
  # @return [Array] a new Array instance containing the relative complement between this array and the one provided
  def ∖(ary) ; 🛑ary❓(:ary, ary) ; self - ary ; end

  # Return true if both arrays are matching in contents, supports multiple types and without order mattering.
  #
  # @param [Array] them
  #
  # @raise [WrongParamType]
  #
  # @return [Boolean] true, if both arrays have the same contents (order does not matter)
  def ≈(them)
    🛑ary❓(:them, them)
    return true  if self.∅? && them.∅?
    return false if self.length != them.length
    self.📊 == them.📊
  end

  # @param [*]
  #
  # @return [Boolean] true, if this array ends with the provided elements
  def end_with?(*ending)
    return false if (ending.∅? || ending.length > self.length)
    return self.last == ending[0] if ending.length == 1
    self[(self.length-ending.length)..(self.length-1)] == ending
  end

  # @param [*]
  #
  # @return [Array] this array instance, modified if not ending with provided endings elements
  def ensure_ending!(*ending)
    return self if ending.∅? || self.end_with?(ending)
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
  alias_method :∑, :each
  alias_method :∀, :each
  alias_method :⨍, :map
  alias_method :∋?, :include?
  alias_method :remove_empty!, :remove_empty!
  alias_method :disjunctive_union, :disjunctive_union
  alias_method :uniq_to_me, :∖
  alias_method :∅?, :empty?

  🙈 :disjunctive_union

end
