# coding: UTF-8

# add various functions to existing module +Enumerable+
#
# this module is included-in:
#  * +Array+
#  * +Set+
#  * +Hash+
#  * +Range+
module ::Enumerable

  alias_method :⨍, :map
  alias_method :∀ₓᵢ, :each_with_index

  # @param [Proc] &block
  #
  # @raise [RuntimeError, ArgumentError]
  def ∀τ²∈λ𝑓₍ᵢ،ᵢ₊₁₎(&block)
    if block && block.𝔠 == 2
      if self.length > 1
        enumerator = self.each
        previous   = enumerator.next
        loop do
          node     = enumerator.next
          block.call(previous, node)
          previous = node
        end
      else
        🛑 RuntimeError.new("| m{Enumerable}-> m{∀τ²∈λ𝑓₍ᵢ،ᵢ₊₁₎} received valid block but length of self is{#{self.length.to_s}} |")
      end
    else
      🛑 ArgumentError.new("| m{Enumerable}-> m{∀τ²∈λ𝑓₍ᵢ،ᵢ₊₁₎} must receive a block #{block ? 'with{2} args, not the received{' + block.𝔠.to_s + '}' : ''} |")
    end
  end

  # Same meaning as: `arg.∉ self`
  #
  # @param [*] arg
  #
  # @return [Boolean] true, if this Enumerable instance contains the provided arg
  def ∌?(arg) ; not self.include?(arg) ; end

end
