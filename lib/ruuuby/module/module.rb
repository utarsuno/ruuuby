
# add various functions to existing module +Module+
class ::Module

  # ---------------------------------------------------------------------------------------------------------- | *f01* |
  alias_method :🙈, :private
  alias_method :🙈constants⟶, :private_constant
  alias_method :🙈class_func, :private_class_method
  alias_method :🙈instance_funcs, :private_instance_methods
  # -------------------------------------------------------------------------------------------------- | *f02* | *f13* |
  alias_method :∃🙈func?, :private_method_defined?
  # ---------------------------------------------------------------------------------------------------------- | *f02* |
  alias_method :🛡️, :protected
  alias_method :🛡️instance_funcs, :protected_instance_methods
  # -------------------------------------------------------------------------------------------------- | *f02* | *f13* |
  alias_method :∃🛡️func?, :protected_method_defined?
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

  alias_method :⨍_add_aliases, :f_add_aliases

  # @return [Array]
  def get_all_defined_modules; self.constants.select{|const| self.const_get(const).module?}; end

  # @return [Array]
  def get_all_defined_classes; self.constants.select{|const| self.const_get(const).class?}; end

end
