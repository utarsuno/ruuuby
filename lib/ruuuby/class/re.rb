# coding: UTF-8

# add various functions to existing class +Regexp+
class ::Regexp

  # useful components for building `Regular Expressions`
  module Syntax

    # @type [String]
    MARKER_START = '\A'.❄️

    # @type [String]
    MARKER_END   = '\z'.❄️

    # @type [String]
    CHAR_PERIOD  = '\.'.❄️

    # @type [String]
    CHAR_STAR    = '\*'.❄️

    # @type [String]
    CHAR_LOWER   = '[[:lower:]]'.❄️

    # @type [String]
    CHAR_UPPER   = '[[:upper:]]'.❄️

    ❄️
  end

  # @param [String] expression
  #
  # @return [Regexp] a new instance-of(+Regexp+) with a strict match of the expression provided
  def self.gen_closed_match(expression)
    🛑stry❓(:expression, expression)
    Regexp.🆕(expression.to_s.dup.ensure_start!(::Regexp::Syntax::MARKER_START).ensure_ending!(::Regexp::Syntax::MARKER_END))
  end

end
