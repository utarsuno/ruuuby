
# *Ruuuby's* Module()+VirtualTypes+) offers conceptual types that can be enforced (helpful for type checking scenarios)
module ::Ruuuby

  # ---------------------------------------------------------------------------------------------------------- | *f06* |

  # conceptual types that can be enforced
  module VirtualTypes

    module Numerical

      PURE_NUMS = [::Integer, ::Float].❄️

    end

    # textual data types
    module Textual

      # data types consisting of a length 1 `String`
      module Char
        # @type [Array]
        UPPER = [:𝔠₁, :🔠?].❄️

        # @type [Array]
        LOWER = [:𝔠₁, :🔡?].❄️

        ❄️
      end

      # data types representing textual syntax (specially camel-case and snake-case)
      module Case
        # @type [Symbol]
        CAMEL       = :🐫

        # @type [Symbol]
        CAMEL_LOWER = :🐫⬇

        # @type [Symbol]
        SNAKE_UPPER = :🐍⬆

        # @type [Symbol]
        SNAKE       = :🐍

        # @type [Array]
        CAMEL_ANY   = [CAMEL, CAMEL_LOWER].❄️

        # @type [Array]
        SNAKE_ANY   = [SNAKE, SNAKE_UPPER].❄️

        # @type [Array]
        ALL         = [CAMEL, SNAKE, SNAKE_UPPER, CAMEL_LOWER].❄️

        ❄️
      end

    end

    # @type [Array]
    const_set(:🅱️, [::TrueClass, ::FalseClass])

    # @type [Array]
    STRY        = [::Symbol, ::String].❄️

    # @type [Array]
    NUMS        = [::Integer, ::Float, ::Complex, ::Rational, ::BigDecimal].❄️

    # @type [Array]
    COUNTABLES  = [::String, ::Set, ::Array].❄️

    # @type [Array]
    NUCLEOTIDES = [::Module, ::Class].❄️

    ❄️
  end

  # | ------------------------------------------------------------------------------------------------------------------

end
