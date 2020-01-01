
unless ::Object.respond_to?(:bool?)
  class ::Object
    # @return [Boolean] true, if current object's class is either +TrueClass+ or +FalseClass+
    def bool?; self.class == TrueClass || self.class == FalseClass; end
  end
end
