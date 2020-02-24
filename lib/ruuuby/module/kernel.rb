
# add various functions to existing module +Kernel+ (and explicitly create aliases to play nice with IDEs)
module ::Kernel

  # Check if a module exists on global scope, if provided a second argument, the first will be owner/scope.
  #
  # @param [Symbol|String] module_name
  # @param [Module]        module_owner (default⟶Kernel)
  #
  # @raise [WrongParamType]
  #
  # @return [Boolean] true, if the module exists on global scope or in the provided owner
  def ∃module?(module_name, module_owner=(::Kernel))
    raise Ruuuby::Err::param¬stry(::Kernel, 'module_name', module_name) unless module_name.stry?
    raise Ruuuby::Err::param¬module(::Kernel, 'module_owner', module_owner) unless (module_owner == ::Kernel || module_owner.instance_of?(::Module))
    module_owner.∃const?(module_name) && module_owner.const_get(module_name).instance_of?(::Module)
  end

  # Check if a class exists on global scope, if provided a second argument, the first will be owner/scope.
  #
  # @param [Symbol|String] class_name
  # @param [Class]         class_owner (default⟶Kernel)
  #
  # @raise [WrongParamType]
  #
  # @return [Boolean] true, if the module exists on global scope or in the provided owner
  def ∃class?(class_name, class_owner=(::Kernel))
    raise Ruuuby::Err::param¬stry(::Kernel, 'class_name', class_name) unless class_name.stry?
    raise Ruuuby::Err::param¬module(::Kernel, 'class_owner', class_owner) unless (class_owner == ::Kernel || class_owner.is_a?(Module))
    class_owner.∃const?(class_name) && class_owner.const_get(class_name).instance_of?(::Class)
  end

end
