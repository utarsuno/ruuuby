# coding: UTF-8

# mathematics related code
module ::Math

  module Expr
    # a singular 'mathematical object', in `Ruuuby` context, something that can be evaluated given content and a context
    #
    # @see https://en.wikipedia.org/wiki/Expression_(mathematics)
    # @see https://en.wikipedia.org/wiki/Well-formed_formula
    class AbstractExpression

      def initialize(*args)
        @all_args = args
        @context  = nil
      end

    end

    # terminology:
    #  - variables/indeterminates: "a symbol that is treated as a variable"
    #  - coefficients:              "a multiplicative factor in some term of a polynomial, a series, or any expression"
    #  - monic polynomial:         a polynomial w/ a coefficient of 1 for the highest order term
    #
    #
    # involves only the following operations:
    #  - addition[+]
    #  - subtraction[-]
    #  - multiplication[*]
    #  - non-negative integer exponents of variables
    class Polynomial < AbstractExpression

    end
  end

end