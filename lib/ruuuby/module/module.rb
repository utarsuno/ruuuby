
# add various functions to existing module +Module+
class ::Module

  # ---------------------------------------------------------------------------------------------------------- | *f01* |
  alias_method :🙈, :private
  alias_method :∃🙈func?, :private_method_defined?
  alias_method :🙈constants⟶, :private_constant
  alias_method :🙈class_func, :private_class_method
  alias_method :🙈instance_funcs, :private_instance_methods
  # ---------------------------------------------------------------------------------------------------------- | *f02* |
  alias_method :🛡️, :protected
  alias_method :∃🛡️func?, :protected_method_defined?
  alias_method :🛡️instance_funcs, :protected_instance_methods
  # ---------------------------------------------------------------------------------------------------------- | *f09* |

  # @param [Class]
  #
  # @return [Boolean] true, if this particular `Class-instance` is a parent-class of the provided arg
  def ∋?(sub_class) ; (sub_class < self) && true ? true : false ; end

  # @param [Class]
  #
  # @return [Boolean] true, if this particular `Class-instance` is not a parent-class of the provided arg
  def ∌?(sub_class) ; !self.∋?(sub_class) ; end

  # @param [Class]
  #
  # @return [Boolean] true, if this particular `Class-instance` is a sub-class of the provided arg
  def ∈?(parent_class) ; (self < parent_class) && true ? true : false ; end

  # @param [Class]
  #
  # @return [Boolean] true, if this particular `Class-instance` is not a sub-class of the provided arg
  def ∉?(parent_class) ; !self.∈?(parent_class) ; end

  # ---------------------------------------------------------------------------------------------------------- | *f13* |

  alias_method :∃const?, :const_defined?

  # @param [Symbol|String] func_name
  # @param [Symbol|String] alias_name
  #
  # @raise [WrongParamType]
  #
  # @return [Boolean] true, if this instance of Module has a function with provided name and alias
  def ∃⨍_alias?(func_name, alias_name)
    🛑stry❓(:func_name, func_name)
    🛑stry❓(:alias_name, alias_name)
    return false unless (self.instance_methods.include?(func_name) && self.instance_methods.include?(alias_name))
    self.instance_method(func_name) == self.instance_method(alias_name)
  end

  # @param [Symbol] func_name
  #
  # @raise [WrongParamType]
  #
  # @return [Boolean] true, if this object's Class has either a public or private method with matching func_name
  def ∃⨍?(func_name)
    🛑stry❓(:func_name, func_name)
    return true if self.method_defined?(func_name)
    self.∃🙈func?(func_name)
  end

  # | ------------------------------------------------------------------------------------------------------------------

  # @param [Symbol]        the_⨍
  # @param [Array<Symbol>] aliases
  #
  # @raise [RuntimeError]  occurs when trying to apply this function outside of a Class definition (TODO: have Ruuuby handle this ahead of time by removing it from un-needed scopes)
  #
  # @return [*]            self
  def ⨍_add_aliases(the_⨍, aliases)
    🛑 RuntimeError.🆕("m{Module}-> f{⨍_add_aliases} must only apply to Classes but self is a{#{self.class.to_s}}") unless self.class?
    aliases.each {|a| self.alias_method a, the_⨍}
  end

end
