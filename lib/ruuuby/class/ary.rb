
unless ::Array.respond_to?(:remove_empty!)
  # add various functions to existing class +Array+
  class ::Array
    # @return [Array] the same object instance but with empty values removed
    def remove_empty!
      return self if self.length == 0
      reject!{|node| node.respond_to?(:empty?) && node.empty?}
      self
    end
  end
end
