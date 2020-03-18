
# add various functions to existing class +Hash+
class ::Hash
  alias_method :∀, :each
  alias_method :∋?, :include?

  alias_method :🔑?, :key?
  alias_method :🗝?, :key?
  alias_method :∃🔑?, :key?
  alias_method :∃🗝?, :key?

  # ---------------------------------------------------------------------------------------------------------- | *f03* |
  alias_method :𝔠, :length
  # ---------------------------------------------------------------------------------------------------------- | *f04* |
  alias_method :∅?, :empty?
  # | ------------------------------------------------------------------------------------------------------------------
end
