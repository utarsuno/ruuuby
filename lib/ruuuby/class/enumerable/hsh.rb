# encoding: UTF-8

# `Ruuuby` modifications to existing Class{+Hash+}
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

  # @return [Boolean]
  def ∄🔑?(*keys); !self.key?(*keys); end

  # @param [*] keys
  def λ𝑓∀🔑：₍🔑∉₎(*keys); self.dup.λ𝑓∀🔑：₍🔑∉₎!(*keys); end

  # @param [*] keys
  def λ𝑓∀🔑：₍🔑∉₎!(*keys)
    🛑 ::ArgumentError.new("| c{Hash}-> m{λ𝑓∀🔑：₍🔑∉₎!} received no args or args of len-zero |") if keys.∅?
    🛑 ::RuntimeError.new("| c{Hash}-> m{λ𝑓∀🔑：₍🔑∉₎!} received valid args{#{keys.to_s}} but self is empty |") if self.∅?
    keys.∀{|key| self.delete(key)}
    self
  end

  # TODO: MISSING TDD!
  #
  # `does each provided key exist w/ the the same provided value?`
  #
  # @param [Array] keys_to_find
  # @param [*]     expected_value
  #
  # @return [Boolean]
  def ∀🔑∃_value?(keys_to_find, expected_value)
    matched_keys = 0
    num_to_find   = keys_to_find.length
    keys_to_find.∀ do |key|
      if self.∃🔑?(key)
        if self[key] == expected_value
          if matched_keys + 1 == num_to_find
            return true
          else
            matched_keys += 1
          end
        end
      else
        return false
      end
    end
    if matched_keys == num_to_find
      true
    else
      🛑 ::RuntimeError.new("| {Hash}-> m{∀🔑∃_value?} called w/ keys_to_find as{#{keys_to_find.to_s}} and expected_value as {#{expected_value.to_s}} which did not match the result length of{#{matched_keys.to_s}} |")
    end
  end

end
