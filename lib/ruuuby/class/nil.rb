
unless ::NilClass.respond_to?(:empty?)
  class ::NilClass
    # @return [Boolean] +true+ (*always*)
    def empty?; true end
  end
end
