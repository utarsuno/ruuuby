
unless ::Object.respond_to?(:str?)
  # add function +str?+ to existing class +Object+
  class ::Object
    # @return [Boolean] +true+, if the current object is an instance of +String+
    def str?; self.class == String; end
  end
end
