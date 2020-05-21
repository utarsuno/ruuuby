# coding: UTF-8

module ::Math

  module Expression

    # a declaration that `LHS` = `RHS`
    class Equation

      def initialize(*args)
        @all_args = args
        @context  = nil
      end

    end

  end

end
