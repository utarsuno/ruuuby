# coding: UTF-8

# mathematics related
module ::Math

  # math related code that can be categorized under +SetTheory+
  module SetTheory

    # @see https://en.wikipedia.org/wiki/Closure_(mathematics)
    class Closure

      # @see https://en.wikipedia.org/wiki/Axiom
      module Axioms

        # the sum of any two elements from the set will also be in that set
        #
        # @type [Symbol]
        CLOSED_UNDER_ADDITION       = :closed_under_addition

        # the difference of any two elements from the set will also be in that set
        #
        # @type [Symbol]
        CLOSED_UNDER_SUBTRACTION    = :closed_under_subtraction

        # the product of any two elements from the set will also be in that set
        #
        # @type [Symbol]
        CLOSED_UNDER_MULTIPLICATION = :closed_under_multiplication

        # the quotient of any two elements from the set will also be in that set
        #
        # @type [Symbol]
        CLOSED_UNDER_DIVISION       = :closed_under_division

        # between any two elements from the set, there is another number in that set
        #
        # @type [Symbol]
        DENSE                       = :dense

        # continuous w/o gaps, sequences that converge to a limit will have that limit exist within the same set
        #
        # @type [Symbol]
        CONTINUOUS                  = :continuous

        # all polynomials using coefficients from this set will have the root(s) exist within the same set
        #
        # @type [Symbol]
        ALGEBRAICALLY_CLOSED        = :algebraically_closed
      end

      attr_reader :axioms

      # @param [Hash] axioms
      def initialize(axioms)
        🛑hsh❓(:axioms, axioms)
        @axioms = {}
        ::Math::SetTheory::Closure::Axioms.constants.∀ do |axiom|
          if axioms.∃🔑?(axiom)
            @axioms[axiom] = axioms[axiom]
          else
            @axioms[axiom] = false
          end
        end
      end
    end # end: {class Closure}
  end
end
