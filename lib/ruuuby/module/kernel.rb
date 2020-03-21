
# add various aliases & functions to existing module +Kernel+
module ::Kernel
  alias_method :🛑, :raise

  # Check if a module exists on global scope, if provided a second argument, the first will be owner/scope.
  #
  # @param [Symbol|String] module_name
  # @param [Module]        module_owner (default⟶Kernel)
  #
  # @raise [WrongParamType]
  #
  # @return [Boolean] true, if the module exists on global scope or in the provided owner
  def ∃module?(module_name, module_owner=(::Kernel))
    🛑 Ruuuby::ParamErr::throw(::Kernel, :∃module?, :module_name, ::Ruuuby::VirtualTypes::STRY, module_name) unless module_name.stry?
    🛑 Ruuuby::ParamErr::throw(::Kernel, :∃module?, :module_owner, ::Module, module_owner) unless (module_owner == ::Kernel || module_owner.instance_of?(::Module))
    module_owner.∃const?(module_name) && module_owner.const_get(module_name).instance_of?(::Module)
  end

  # Check if a class exists on 'global-scope', if provided a second argument, the first will be owner/scope.
  #
  # @param [Symbol|String] class_name
  # @param [Class]         class_owner (default⟶Kernel)
  #
  # @raise [WrongParamType]
  #
  # @return [Boolean] true, if the module exists on 'global-scope' or in the provided owner
  def ∃class?(class_name, class_owner=(::Kernel))
    🛑 ::Ruuuby::ParamErr::throw(::Kernel, :∃class?, :class_name, ::Ruuuby::VirtualTypes::STRY, class_name) unless class_name.stry?
    🛑 ::Ruuuby::ParamErr::throw(::Kernel, :∃class?, :class_owner, ::Module, class_owner) unless (class_owner == ::Kernel || class_owner.is_a?(::Module))
    class_owner.∃const?(class_name) && class_owner.const_get(class_name).instance_of?(::Class)
  end

  # ---------------------------------------------------------------------------------------------------------- | *f03* |

  # Return the *cardinality(𝔠)* (the length/size) of the provided argument.
  #
  # @param [*] n
  #
  # @return {Integer} -1 is returned when provided arg does not have function for .length or .size
  def 𝔠(n)
    return n.length if n.respond_to?(:length)
    return n.size   if n.respond_to?(:size)
    -1
  end

  # ---------------------------------------------------------------------------------------------------------- | *f12* |

  # @return [::File]
  def 📁; ::File; end

  # @return [::File]
  def 📂; ::File; end

  # @return [::Dir]
  def 🗄️; ::Dir ; end

  # ---------------------------------------------------------------------------------------------------------- | *f10* |
  alias_method :🎲, :rand

  # Return the square-root of the provided argument.
  #
  # @param [Integer|Float|Numeric] n
  #
  # @return [Float|Numeric]
  def √(n) ; ::Math.sqrt(n) ; end

  # Return the cube-root of the provided argument.
  #
  # @param [Integer|Float|Numeric] n
  #
  # @return [Float|Numeric]
  def ∛(n) ; ::Math.cbrt(n) ; end

  # @return [Float]
  def π ; Math::PI ; end

  # ((1+Math.sqrt(5))/(2.0))
  #
  # @return [Float]
  def φ ; 1.618033988749895 ; end

  # for when 50 digit version will eventually be needed: {0.57721566490153286060651209008240243104215933593992}
  #
  # @return [Float]
  def γ ; 0.5772156649015329 ; end

  # | ------------------------------------------------------------------------------------------------------------------

end
