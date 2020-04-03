# encoding: UTF-8

# explicitly expose semi-hidden aliases to play nice with IDEs
class ::Object
  alias_method :define_singleton_⨍, :define_singleton_⨍
end

# explicitly expose semi-hidden aliases to play nice with IDEs
class ::Integer
  # ---------------------------------------------------------------------------------------------------------- | *f16* |
  alias_method :bitwise_xor, :bitwise_xor
  # ---------------------------------------------------------------------------------------------------------- | *f11* |

  # @return [Boolean] false, all integers(+ℤ+) are considered not infinite
  alias_method :infinite?, :infinite?

  # @return [Boolean] true, all integers(+ℤ+) are considered finite
  alias_method :finite?, :finite?

  # | ------------------------------------------------------------------------------------------------------------------
end

# explicitly expose semi-hidden aliases to play nice with IDEs
class ::Float
  # ---------------------------------------------------------------------------------------------------------- | *f16* |

  # @param [Numeric|Symbol] them | if 🆔 matches a power (ex: ²), then essentially perform: Math.pow(self, them)
  #
  # @return [Numeric]
  alias_method :^, :^
  # | ------------------------------------------------------------------------------------------------------------------
end

# explicitly expose semi-hidden aliases to play nice with IDEs
class ::NilClass
  # ---------------------------------------------------------------------------------------------------------- | *f04* |
  alias_method :empty?, :empty?
  # | ------------------------------------------------------------------------------------------------------------------
end

# explicitly expose semi-hidden aliases to play nice with IDEs
class ::Object
  # ---------------------------------------------------------------------------------------------------------- | *f06* |
  alias_method :ary?, :ary?
  alias_method :bool?, :bool?
  alias_method :hsh?, :hsh?
  alias_method :int?, :int?
  alias_method :flt?, :flt?
  alias_method :num?, :num?
  alias_method :sym?, :sym?
  alias_method :str?, :str?
  alias_method :stry?, :stry?
  # | ------------------------------------------------------------------------------------------------------------------
end

# explicitly expose semi-hidden aliases to play nice with IDEs
class ::String
  # ---------------------------------------------------------------------------------------------------------- | *f05* |
  alias_method :>>, :>>
  # | ------------------------------------------------------------------------------------------------------------------
end

# explicitly expose semi-hidden aliases to play nice with IDEs
class ::Array
  # ---------------------------------------------------------------------------------------------------------- | *f07* |
  alias_method :remove_empty!, :remove_empty!
  # ---------------------------------------------------------------------------------------------------------- | *f08* |
  alias_method :equal_contents?, :equal_contents?
  alias_method :frequency_counts, :frequency_counts
  alias_method :disjunctive_union, :disjunctive_union
  # | ------------------------------------------------------------------------------------------------------------------
end
