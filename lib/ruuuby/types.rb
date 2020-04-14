
# *Ruuuby's* Module(+VirtualTypes+) offers conceptual types that can be enforced (helpful for type checking scenarios)
module ::Ruuuby

  # ---------------------------------------------------------------------------------------------------------- | *f06* |

  # conceptual types that can be enforced
  module VirtualTypes

    module Normalizers

      # @type [Symbol]
      BELONGS_TO_M_EXPONENTIALS    = :∈superscripts

      # @type [Symbol]
      BELONGS_TO_M_NATURAL_NUMBERS = :∈ℕ

      # @type [Symbol]
      NONE                         = :none

      # @type [Symbol]
      NO_EMPTY                     = :'!∅'

      ❄️
    end

    module Numerical

      # @type [Array]
      PURE_NUMS = [::Integer, ::Float].❄️

      # @type [Array]
      NO_LIMIT  = [-1, ::Float::INFINITY].❄️

      ❄️
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

    # TODO: need a way to specific that the array only contains elements of type Symbol
    # @type [Array]
    NORMALIZERS = [::Symbol, ::Array].❄️

    # @type [Array]
    NUCLEOTIDES = [::Module, ::Class].❄️

    ❄️
  end

  # | ------------------------------------------------------------------------------------------------------------------

end
