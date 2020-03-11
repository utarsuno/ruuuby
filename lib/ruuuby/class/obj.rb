# coding: utf-8

# add various functions to existing class +Object+ (and explicitly create aliases to play nice with IDEs)
class ::Object

  alias_method :🆔, :object_id
  alias_method :ary?, :ary?
  alias_method :bool?, :bool?
  alias_method :🅱️?, :bool?
  alias_method :hsh?, :hsh?
  alias_method :int?, :int?
  alias_method :sym?, :sym?
  alias_method :str?, :str?
  alias_method :stry?, :stry?

  # | feature | *f00* | ------------------------------------------------------------------------------------------------
  alias_method :❄️, :freeze
  alias_method :❄️?, :frozen?
  # | feature | *f01* | ------------------------------------------------------------------------------------------------
  alias_method :🙈funcs, :private_methods
  # | feature | *f02* | ------------------------------------------------------------------------------------------------
  alias_method :🛡️funcs, :protected_methods
  # | ------------------------------------------------------------------------------------------------------------------

  # @param [Symbol] arg_name
  # @param [*]      arg
  #
  # @raise [WrongParamType]
  def 🛑bool❓(arg_name, arg)
    🛑 Ruuuby::ParamErr::throw(self.class, caller_locations.first.label.to_s, arg_name.to_s, [::TrueClass, ::FalseClass], arg) unless arg.bool?
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
    🛑 Ruuuby::ParamErr::throw(self.class, caller_locations.first.label.to_s, arg_name.to_s, [::String, ::Symbol], arg) unless arg.stry?
  end

  # @param [Symbol] arg_name
  # @param [*]      arg
  #
  # @raise [WrongParamType]
  def 🛑str_or_ary❓(arg_name, arg)
    🛑 Ruuuby::ParamErr::throw(self.class, caller_locations.first.label.to_s, arg_name.to_s, [::String, ::Array], arg) unless (arg.str? || arg.ary?)
  end

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

end
