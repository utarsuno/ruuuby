
unless ::Object.respond_to?(:ary?)
  # add function +ary?+ to existing class +Object+
  class ::Object
    # @param [Boolean] require_non_empty(=false)
    #
    # @return [Boolean] true, if provided variable is an array
    def ary?(require_non_empty=false); self.class == Array && (!require_non_empty || !self.empty?); end
  end
end

# add various functions to existing class +Array+
class ::Array

  # :category: Modifications
  #
  # @return [Array]
  def remove_empty!
    return self if self.length == 0
    reject!{|node| node.respond_to?(:empty?) && node.empty?}
    self
  end

end
