
unless ::Object.respond_to?(:int?)
  # add function +int?+ to existing class +Object+
  class ::Object
    # @return [Boolean] +true+, if the current object is an instance of +Integer+
    def int?; self.class == Integer; end
  end
end
