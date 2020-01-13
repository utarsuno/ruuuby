
unless ::Object.respond_to?(:bool?)
  # add function +bool?+ to existing class +Object+
  class ::Object
    # @return [Boolean] +true+, if the current object is an instance of either +TrueClass+ or +FalseClass+
    def bool?; self.object_id == true.object_id || self.object_id == false.object_id; end
  end
end
