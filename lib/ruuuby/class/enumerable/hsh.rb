# encoding: UTF-8

# add various aliases & functions to existing Class(+Hash+)
class ::Hash

  # ---------------------------------------------------------------------------------------------------------- | *f03* |
  alias_method :𝔠, :length
  # ---------------------------------------------------------------------------------------------------------- | *f04* |
  alias_method :∅?, :empty?
  # ---------------------------------------------------------------------------------------------------------- | *f09* |
  include ::Ruuuby::Attribute::Includable::Notation::SetMathematics
  # ---------------------------------------------------------------------------------------------------------- | *f10* |
  alias_method :∃🔑?, :key?
  alias_method :🔑s, :keys
  alias_method :∀τ², :each_pair
  alias_method :∀🔑, :each_key
  # | ------------------------------------------------------------------------------------------------------------------

  # @param [*] keys
  def λ𝑓∀🔑：₍🔑∉₎(*keys); self.dup.λ𝑓∀🔑：₍🔑∉₎!(*keys); end

  # @param [*] keys
  def λ𝑓∀🔑：₍🔑∉₎!(*keys)
    🛑 ::ArgumentError.new("| c{Hash}-> m{λ𝑓∀🔑：₍🔑∉₎!} received no args or args of len-zero |") if keys.∅?
    🛑 ::RuntimeError.new("| c{Hash}-> m{λ𝑓∀🔑：₍🔑∉₎!} received valid args{#{keys.to_s}} but self is empty |") if self.∅?
    keys.∀{|key| self.delete(key)}
    self
  end

end
