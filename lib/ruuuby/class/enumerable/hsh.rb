
# add various functions to existing class +Hash+ (and explicitly create aliases to play nice with IDEs)
class ::Hash
  alias_method :∀, :each
  alias_method :∅?, :empty?
  alias_method :∋?, :include?

  alias_method :🔑?, :key?
  alias_method :🗝?, :key?
  alias_method :∃🔑?, :key?
  alias_method :∃🗝?, :key?
end
