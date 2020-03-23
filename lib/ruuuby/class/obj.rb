# coding: utf-8

# add various functions to existing class +Object+
class ::Object

  # ---------------------------------------------------------------------------------------------------------- | *f01* |
  alias_method :🙈funcs, :private_methods
  # ---------------------------------------------------------------------------------------------------------- | *f02* |
  alias_method :🛡️funcs, :protected_methods
  # ---------------------------------------------------------------------------------------------------------- | *f06* |
  alias_method :🅱️?, :bool?

  # @param [Symbol] arg_name
  # @param [*]      arg
  #
  # @raise [WrongParamType]
  def 🛑bool❓(arg_name, arg)
    🛑 Ruuuby::ParamErr::throw(self.class, caller_locations.first.label.to_s, arg_name.to_s, ::Ruuuby::VirtualTypes::🅱️, arg) unless arg.bool?
  end

  alias_method :🛑🅱️❓, :🛑bool❓

  # @param [Symbol] arg_name
  # @param [*]      arg
  #
  # @raise [WrongParamType]
  def 🛑int❓(arg_name, arg)
    🛑 Ruuuby::ParamErr::throw(self.class, caller_locations.first.label.to_s, arg_name.to_s, ::Integer, arg) unless arg.int?
  end

  # @param [Symbol] arg_name
  # @param [*]      arg
  #
  # @raise [WrongParamType]
  def 🛑flt❓(arg_name, arg)
    🛑 Ruuuby::ParamErr::throw(self.class, caller_locations.first.label.to_s, arg_name.to_s, ::Float, arg) unless arg.flt?
  end

  # @param [Symbol] arg_name
  # @param [*]      arg
  #
  # @raise [WrongParamType]
  def 🛑num❓(arg_name, arg)
    🛑 Ruuuby::ParamErr::throw(self.class, caller_locations.first.label.to_s, arg_name.to_s, ::Ruuuby::VirtualTypes::NUMS, arg) unless arg.num?
  end

  # @param [Symbol] arg_name
  # @param [*]      arg
  #
  # @raise [WrongParamType]
  def 🛑ary❓(arg_name, arg)
    🛑 Ruuuby::ParamErr::throw(self.class, caller_locations.first.label.to_s, arg_name.to_s, ::Array, arg) unless arg.ary?
  end

  # @param [Symbol] arg_name
  # @param [*]      arg
  #
  # @raise [WrongParamType]
  def 🛑str❓(arg_name, arg)
    🛑 Ruuuby::ParamErr::throw(self.class, caller_locations.first.label.to_s, arg_name.to_s, ::String, arg) unless arg.str?
  end

  # @param [Symbol] arg_name
  # @param [*]      arg
  #
  # @raise [WrongParamType]
  def 🛑stry❓(arg_name, arg)
    🛑 Ruuuby::ParamErr::throw(self.class, caller_locations.first.label.to_s, arg_name.to_s, ::Ruuuby::VirtualTypes::STRY, arg) unless arg.stry?
  end

  # @param [Symbol] arg_name
  # @param [*]      arg
  #
  # @raise [WrongParamType]
  def 🛑countable❓(arg_name, arg)
    🛑 Ruuuby::ParamErr::throw(self.class, caller_locations.first.label.to_s, arg_name.to_s, ::Ruuuby::VirtualTypes::COUNTABLES, arg) unless (arg.str? || arg.ary? || arg.is_a?(Set))
  end

  # ---------------------------------------------------------------------------------------------------------- | *f10* |
  alias_method :🆔, :object_id
  alias_method :❄️, :freeze
  alias_method :❄️?, :frozen?
  # ---------------------------------------------------------------------------------------------------------- | *f16* |

  # @return [Symbol]
  def ⁻⁹ ; :⁻⁹ ; end

  # @return [Symbol]
  def ⁻⁸ ; :⁻⁸ ; end

  # @return [Symbol]
  def ⁻⁷ ; :⁻⁷ ; end

  # @return [Symbol]
  def ⁻⁶ ; :⁻⁶ ; end

  # @return [Symbol]
  def ⁻⁵ ; :⁻⁵ ; end

  # @return [Symbol]
  def ⁻⁴ ; :⁻⁴ ; end

  # @return [Symbol]
  def ⁻³ ; :⁻³ ; end

  # @return [Symbol]
  def ⁻² ; :⁻² ; end

  # @return [Symbol]
  def ⁻¹ ; :⁻¹ ; end

  # @return [Symbol]
  def ⁰ ; :⁰ ; end

  # @return [Symbol]
  def ¹ ; :¹ ; end

  # @return [Symbol]
  def ² ; :² ; end

  # @return [Symbol]
  def ³ ; :³ ; end

  # @return [Symbol]
  def ⁴ ; :⁴ ; end

  # @return [Symbol]
  def ⁵ ; :⁵ ; end

  # @return [Symbol]
  def ⁶ ; :⁶ ; end

  # @return [Symbol]
  def ⁷ ; :⁷ ; end

  # @return [Symbol]
  def ⁸ ; :⁸ ; end

  # @return [Symbol]
  def ⁹ ; :⁹ ; end

  # | ------------------------------------------------------------------------------------------------------------------

end
