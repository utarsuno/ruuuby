# encoding: UTF-8

# mathematics related code
module ::Math

  module Expr

    # a declaration that `LHS` = `RHS`
    class Equation

      def initialize(*args)
        @all_args = args
        @context  = nil
      end

    end

  end

end
