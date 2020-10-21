# encoding: UTF-8

# add various aliases & functions to existing class{+Module+}
class ::Module
  # ---------------------------------------------------------------------------------------------------------- | *f10* |
  alias_method :∃const?, :const_defined?
  # -------------------------------------------------------------------------------------------------- | *b00* | *f10* |
  alias_method :🙈, :private
  alias_method :∃🙈⨍?, :private_method_defined?
  # -------------------------------------------------------------------------------------------------- | *b01* | *f10* |
  alias_method :🛡️, :protected
  alias_method :∃🛡️⨍?, :protected_method_defined?
  # ---------------------------------------------------------------------------------------------------------- | *f13* |

  # @param [Symbol] func_name
  # @param [Symbol] alias_name
  #
  # @raise [ArgumentError]
  #
  # @return [Boolean] true, if this instance of Module has a function with provided name and alias
  def ∃⨍_alias?(func_name, alias_name)
    🛑syms❓([func_name, alias_name])
    (self.instance_methods.include?(func_name) && self.instance_methods.include?(alias_name)) ? self.instance_method(func_name) == self.instance_method(alias_name) : false
  end

  # @param [Symbol] func_name
  #
  # @raise [ArgumentError]
  #
  # @return [Boolean] true, if this object's Class has either a public or private method with matching func_name
  def ∃⨍?(func_name)
    🛑sym❓('func_name', func_name)
    self.method_defined?(func_name) ? true : self.∃🙈⨍?(func_name)
  end

  # | ------------------------------------------------------------------------------------------------------------------
end
