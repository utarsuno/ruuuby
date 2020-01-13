
unless ::NilClass.respond_to?(:empty?)
  # add function +empty?+ to existing class +Object+
  class ::NilClass
    # @return [Boolean] +true+ (*always*)
    def empty?; true end
  end
end
