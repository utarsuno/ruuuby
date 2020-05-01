# encoding: UTF-8

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

  # -------------------------------------------------------------------------------------------------- | *f10* | *f17* |
  alias_method :🎲, :rand

  # ---------------------------------------------------------------------------------------------------------- | *f28* |

  # @type [Float]
  𝚽 = ::Float::GOLDEN_RATIO

  # | ------------------------------------------------------------------------------------------------------------------

  # @return [::Ruuuby::MetaData]
  def 💎; ::Ruuuby::MetaData; end

end
