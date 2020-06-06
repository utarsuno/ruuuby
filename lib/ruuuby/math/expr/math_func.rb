# coding: UTF-8

# mathematics related code
module ::Math

  module Expr

    # - a statement on some 'mathematical object(s)'
    # - a mapping of some input to some output
    #
    # also refer to as `Formula`
    class MathFunc

      def initialize(*args)
        @all_args = args
        @context  = nil
      end

    end

  end

end

# to be extended upon in future versions

# -------------------------------------------- ⚠️ --------------------------------------------

=begin
# layer over existing class +Method+ for meta-data purposes (not for runtime)
class ::MathFunction < ::Method

  attr_reader :source_method

  def initialize(source_method, category)
    @source_method = source_method
    @category      = category
  end

  # a func, f, is periodic if there can exist a such that f(x + a) = f(x) for all x
  def periodic?

  # @example
  #
  #   cos(-x) = cos(x)
  #   sec(-x) = sec(x)
  def even?

  # @example
  #
  #   sin(-x) = -sin(x)
  #   csc(-x) = -csc(x)
  #   tan(-x) = -tan(x)
  #   cot(-x) = -cot(x)
  def odd?

end
=end

# -------------------------------------------- ⚠️ --------------------------------------------

# TODO: https://mathworld.wolfram.com/DirichletFunction.html
