
unless ::NilClass.respond_to?(:empty?)
  # functionality extension for +NilClass+
  class ::NilClass
    # @return [Boolean] +true+ (*always*)
    def empty?; true end
  end
end
