# encoding: UTF-8

# mathematics related code
module ::Math

  # math related code that can be categorized under +SetTheory+
  module SetTheory

    # @see https://en.wikipedia.org/wiki/Closure_(mathematics)
    #
    # ==Axioms
    # @see https://en.wikipedia.org/wiki/Axiom
    #
    # | term                        | meaning                                                                                                |
    # | --------------------------- | ------------------------------------------------------------------------------------------------------ |
    # | closed under addition       | the sum of any two elements from the set will also be in that set                                      |
    # | closed under subtraction    | the difference of any two elements from the set will also be in that set                               |
    # | closed under division       | the quotient of any two elements from the set will also be in that set                                 |
    # | closed under multiplication | the product of any two elements from the set will also be in that set                                  |
    # | dense                       | between any two elements from the set, there is another number in that set                             |
    # | continuous                  | continuous w/o gaps, sequences that converge to a limit will have that limit exist within the same set |
    # | algebraically closed        | all polynomials using coefficients from this set will have the root(s) exist within the same set        |
    class Closure

      # @param [Hash] axioms
      #def initialize(axioms)
      #  🛑hsh❓(:axioms, axioms)
      #  @axioms = {}
      #  ::Math::SetTheory::Closure::Axioms.constants.∀ do |axiom|
      #    if axioms.∃🔑?(axiom)
      #      @axioms[axiom] = axioms[axiom]
      #    else
      #      @axioms[axiom] = false
      #    end
      #  end
      #end
    end # end: {class Closure}
  end
end
