
unless ::Object.respond_to?(:ary?)
  # add function +ary?+ to existing class +Object+
  class ::Object
    # @return [Boolean] +true+, if the current object is an instance of +Array+
    def ary?; self.class == Array; end
  end
end

# add various functions to existing class +Array+
class ::Array

  # :category: Modifications
  #
  # @return [Array] the same object instance but with empty values removed
  def remove_empty!
    return self if self.length == 0
    reject!{|node| node.respond_to?(:empty?) && node.empty?}
    self
  end

end
