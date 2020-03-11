
# add various functions to existing class +Hash+ (and explicitly create aliases to play nice with IDEs)
class ::Hash
  alias_method :∀, :each
  alias_method :∋?, :include?

  alias_method :🔑?, :key?
  alias_method :🗝?, :key?
  alias_method :∃🔑?, :key?
  alias_method :∃🗝?, :key?

  # | feature | *f03* | ------------------------------------------------------------------------------------------------
  alias_method :𝔠, :length
  # | feature | *f04* | ------------------------------------------------------------------------------------------------
  alias_method :∅?, :empty?
  # | ------------------------------------------------------------------------------------------------------------------
end
