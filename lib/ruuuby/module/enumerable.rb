# encoding: utf-8

# add various functions to existing module +Enumerable+ (and explicitly create aliases to play nice with IDEs)
#
# this module is included-in:
#  * +Array+
#  * +Set+
#  * +Hash+
module ::Enumerable

  alias_method :⨍, :map

  # Same meaning as: `arg.∉ self`
  #
  # @param [*] arg
  #
  # @return [Boolean] true, if this Enumerable instance contains the provided arg
  def ∌?(arg) ; not self.include?(arg) ; end

end
