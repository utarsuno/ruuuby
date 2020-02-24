# coding: utf-8

# add various functions to existing class +Array+ (and explicitly create aliases to play nice with IDEs)
class ::Array
  alias_method :∑, :each
  alias_method :∀, :each
  alias_method :⨍, :map
  alias_method :∋?, :include?
  alias_method :remove_empty!, :remove_empty!
  alias_method :disjunctive_union, :disjunctive_union

  # Retrieve the frequency counts of elements in this array as a hash.
  #
  # @example:
  #   a = [1, 1, '1', nil, [], nil, nil, 2].📊
  #   a[1]   == 2
  #   a['1'] == 1
  #   a[nil] == 3
  #   a[[]]  == 1
  #   a[2]   == 1
  #
  # @return [Hash] key: a value from the array, value: the total number of occurrences
  def 📊
    return {} if self.length == 0
    new_hash = Hash.new(0)
    self.∀{|x| new_hash[x] += 1}
    new_hash
  end

  # :category: Set Mathematics
  #
  # Same meaning as: `arg.∉ self`
  #
  # @param [*] arg
  #
  # @return [Boolean] true, if this array instance contains the provided arg
  def ∌?(arg) ; not self.include?(arg) ; end

  # :category: Set Mathematics
  #
  # Performs the symmetric difference (or disjunctive union) of these two arrays, operation order/side does not matter.
  #
  # @param [Array] ary
  #
  # @raise [WrongParamType]
  #
  # @return [Array] a new Array instance containing the symmetric difference between this array and the one provided
  def ⊕(ary)
    raise Ruuuby::Err::param¬ary(::Array, 'ary', ary) unless ary.ary?
    self.disjunctive_union(ary)
  end

  # :category: Set Mathematics
  #
  # Performs the relative complement (or set difference) of these two arrays, operation order/side does matter.
  #
  # @param [Array] ary
  #
  # @raise [WrongParamType]
  #
  # @return [Array] a new Array instance containing the relative complement between this array and the one provided
  def ∖(ary)
    raise Ruuuby::Err::param¬ary(::Array, 'ary', ary) unless ary.ary?
    self - ary
  end

  # Return true if both arrays are matching in contents, supports multiple types and without order mattering.
  #
  # @param [Array] them
  #
  # @raise [WrongParamType]
  #
  # @return [Boolean] true, if both arrays have the same contents (order does not matter)
  def ≈(them)
    raise Ruuuby::Err::param¬ary(::Array, 'them', them) unless them.ary?
    return true  if self.length == 0 && them.length == 0
    return false if self.length != them.length
    self.📊 == them.📊
  end

  # mark {disjunctive_union} as a private method
  🙈 :disjunctive_union

end
