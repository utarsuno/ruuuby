
unless ::Object.respond_to?(:sym?)
  # add function +sym?+ to existing class +Object+
  class ::Object
    # @return [Boolean] +true+, if the current object is an instance of +Symbol+
    def sym?; self.class == Symbol; end
  end
end
