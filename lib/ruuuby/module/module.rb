
# add various functions to existing module +Module+ (and explicitly create aliases to play nice with IDEs)
class ::Module
  alias_method :🙈, :private
  alias_method :🙈constants⟶, :private_constant
  alias_method :∃const?, :const_defined?
  alias_method :∃🙈func?, :private_method_defined?

  # @param [Symbol|String] func_name
  # @param [Symbol|String] alias_name
  #
  # @raise [WrongParamType]
  #
  # @return [Boolean] true, if this instance of Module has a function with provided name and alias
  def ∃func_alias?(func_name, alias_name)
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
  def ∃func?(func_name)
    🛑stry❓(:func_name, func_name)
    return true if self.method_defined?(func_name)
    self.∃🙈func?(func_name)
  end

end
