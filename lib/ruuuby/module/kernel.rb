# coding: UTF-8

# add various aliases & functions to existing module +Kernel+
module ::Kernel

  # ---------------------------------------------------------------------------------------------------------- | *f14* |

  # @return [String] the function name which had a failing parameter type
  def 🌽_previous_⨍ ; caller_locations(2, 1).first.base_label.to_s ; end

  # | ------------------------------------------------------------------------------------------------------------------

  alias_method :🛑, :raise

  # check if a module exists on 'global-scope' or under the provided argument(`owner`)
  #
  # @param [Symbol|String] module_name
  # @param [Module]        owner (default⟶Kernel)
  #
  # @raise [WrongParamType]
  #
  # @return [Boolean] true, if the module exists on 'global-scope' or in the provided owner
  def ∃module?(module_name, owner=(::Kernel))
    🛑 Ruuuby::ParamErr::throw(::Kernel, :∃module?, :module_name, ::Ruuuby::VirtualTypes::STRY, module_name) unless module_name.stry?
    🛑 Ruuuby::ParamErr::throw(::Kernel, :∃module?, :owner, ::Ruuuby::VirtualTypes::NUCLEOTIDES, owner) unless owner.nucleotide?
    owner.∃const?(module_name) && owner.const_get(module_name).instance_of?(::Module)
  end

  # check if a class exists on 'global-scope' or under the provided argument(owner)
  #
  # @param [Symbol|String] class_name
  # @param [Class]         owner (default⟶Kernel)
  #
  # @raise [WrongParamType]
  #
  # @return [Boolean] true, if the module exists on 'global-scope' or in the provided owner
  def ∃class?(class_name, owner=(::Kernel))
    🛑 ::Ruuuby::ParamErr::throw(::Kernel, :∃class?, :class_name, ::Ruuuby::VirtualTypes::STRY, class_name) unless class_name.stry?
    🛑 ::Ruuuby::ParamErr::throw(::Kernel, :∃class?, :owner, ::Ruuuby::VirtualTypes::NUCLEOTIDES, owner) unless owner.nucleotide?
    owner.∃const?(class_name) && owner.const_get(class_name).instance_of?(::Class)
  end

  # ---------------------------------------------------------------------------------------------------------- | *f03* |

  # return the *cardinality(𝔠)* (the length/size) of the provided argument(`n`)
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

  # -------------------------------------------------------------------------------------------------- | *f10* | *f17* |
  alias_method :🎲, :rand

  # return the sin of the provided angle in radians
  #
  # @param [Integer|Float|Numeric] radian
  #
  # @return [Float|Numeric]
  def sin(radian) ; ::Math.sin(radian) ; end

  # return the sin of the provided angle in degrees
  #
  # @param [Integer|Float|Numeric] angle
  #
  # @return [Float|Numeric]
  def sin°(degrees) ; ::Math.sin(∠ᶜ(degrees)) ; end

  # return the cos of the provided angle in radians
  #
  # @param [Integer|Float|Numeric] radian
  #
  # @return [Float|Numeric]
  def cos(radian) ; ::Math.cos(radian) ; end

  # return the cos of the provided angle in degrees
  #
  # @param [Integer|Float|Numeric] angle
  #
  # @return [Float|Numeric]
  def cos°(degrees) ; ::Math.cos(∠ᶜ(degrees)) ; end

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
  def π ; ::Math::PI ; end

  # @return [Float] Float::INFINITY
  def ∞ ; ::Float::INFINITY ; end

  # @return [Float] Float::NAN
  def ¿ ; ::Float::NAN ; end

  # @return [Symbol] 'complex-infinity'
  def ∞ℂ ; :∞ℂ ; end

  # pre-computed value of `golden-ratio`
  #
  # @return [Float]
  def φ ; 1.618033988749895 ; end

  # pre-computed value of `Euler-Mascheroni constant`
  #
  # for when 50 digit version will eventually be needed: {0.57721566490153286060651209008240243104215933593992}
  #
  # @return [Float]
  def γ ; 0.5772156649015329 ; end

  # @param [Float] n angle in degree
  #
  # @return [Float] angle in radians
  def ∠ᶜ(n) ; ::Math::RATIO_DEGREES_TO_RADIAN * n ; end

  # @param [Float] n angle in radians
  #
  # @return [Float] angle in degrees
  def ∠°(n) ; ::Math::RATIO_RADIANS_TO_DEGREE * n ; end

  # | ------------------------------------------------------------------------------------------------------------------

end
