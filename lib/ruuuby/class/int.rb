
unless ::Object.respond_to?(:int?)
  # add function +ary?+ to existing class +Object+
  class ::Object
    # @return [Boolean] +true+, if current object is an Integer
    def int?; self.class == Integer; end
  end
end

