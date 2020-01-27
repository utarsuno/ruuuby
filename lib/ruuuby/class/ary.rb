# -*- encoding : utf-8 -*-

unless ::Array.respond_to?(:∑)
  # explicitly create aliases to play nice with IDEs
  class ::Array
    alias :∑ :each
    alias :⨍ :map
    # Same meaning as: `arg.∈ self`
    alias_method :∋?, :include?
    alias_method :remove_empty!, :remove_empty!

    # :category: Set Mathematics
    #
    # Same meaning as: `arg.∉ self`
    #
    # @see https://en.wikipedia.org/wiki/ISO_31-11#Sets
    #
    # @param [*] arg
    #
    # @return [Boolean] true, if this array instance contains the provided arg
    def ∌?(arg)
      not self.include?(arg)
    end

    # @param [*] ary
    #
    # @return [Array] this array modified with provided arguments pre-pended
    def >>(arg)
      self.insert(0, arg)
    end

    # :category: Set Mathematics
    #
    # Performs the symmetric difference (or disjunctive union) of these two arrays, operation order/side does not matter.
    #
    # @see https://en.wikipedia.org/wiki/Symmetric_difference
    #
    # @param [Array] ary
    #
    # @return [Array] a new Array instance containing the symmetric difference between this array and the one provided
    def ⊕(ary)
      raise ArgumentError.new("Array#⊕ symmetric difference operation only accepts an array argument, received a {#{ary.class.to_s}} instead!") unless ary.ary?
      (self - ary) | (ary - self)
    end

    # :category: Set Mathematics
    #
    # Performs the relative complement (or set difference) of these two arrays, operation order/side does matter.
    #
    # @see https://en.wikipedia.org/wiki/Symmetric_difference
    #
    # @param [Array] ary
    #
    # @return [Array] a new Array instance containing the relative complement between this array and the one provided
    def ∖(ary)
      raise ArgumentError.new("Array∖⊕ relative complement operation only accepts an array argument, received a {#{ary.class.to_s}} instead!") unless ary.ary?
      self - ary
    end
  end
end
