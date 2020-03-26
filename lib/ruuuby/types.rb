
module ::Ruuuby

  # ---------------------------------------------------------------------------------------------------------- | *f06* |

  # conceptual types that can be enforced
  module VirtualTypes

    # @type [Array]
    const_set(:🅱️,   [::TrueClass, ::FalseClass])

    # @type [Array]
    const_set(:STRY, [::Symbol, ::String])

    # @type [Array]
    const_set(:NUMS, [::Integer, ::Float, ::Complex, ::Rational, ::BigDecimal])

    # @type [Array]
    const_set(:COUNTABLES, [::String, ::Set, ::Array])

    # @type [Array]
    const_set(:NUCLEOTIDES, [::Module, ::Class])

    ❄️
  end

  # | ------------------------------------------------------------------------------------------------------------------

end
