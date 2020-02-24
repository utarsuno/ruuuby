
# add various functions to existing module +Module+ (and explicitly create aliases to play nice with IDEs)
class ::Module
  alias_method :🙈, :private
  alias_method :🙈constants⟶, :private_constant
  alias_method :∃const?, :const_defined?
  alias_method :∃func?, :method_defined?

  # @param [Symbol|String] func_name
  # @param [Symbol|String] alias_name
  #
  # @raise [WrongParamType]
  #
  # @return [Boolean] true, if this instance of Module has a function with provided name and alias
  def ∃func_alias?(func_name, alias_name)
    raise Ruuuby::Err::param¬stry(::Module, 'func_name', func_name) unless func_name.stry?
    raise Ruuuby::Err::param¬stry(::Module, 'alias_name', alias_name) unless alias_name.stry?
    return false unless (self.instance_methods.include?(func_name) && self.instance_methods.include?(alias_name))
    self.instance_method(func_name) == self.instance_method(alias_name)
  end

end
