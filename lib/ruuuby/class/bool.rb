
unless ::Object.respond_to?(:bool?)
  # add function +ary?+ to existing class +Object+
  class ::Object
    # @return [Boolean] true, if current object's class is either +TrueClass+ or +FalseClass+
    def bool?; self.class == TrueClass || self.class == FalseClass; end
  end
end
