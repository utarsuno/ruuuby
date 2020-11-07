# encoding: UTF-8

#   -----------------------------------------------------------------------------------------
#  | for                                  | regex                                            |
#  | ------------------------------------ | ------------------------------------------------ |
#  | lowercase letter                     | `[[:lower:]]`                                    |
#  | uppercase letter                     | `[[:upper:]]`                                    |
#  | marker start                         | `\A`                                             |
#  | market end                           | `\z`                                             |
#   -----------------------------------------------------------------------------------------
#
# add various functions to existing class +Regexp+
class ::Regexp

  # @param [String] expression
  #
  # @return [Regexp] a new instance-of(+Regexp+) with a strict match of the expression provided
  def self.closed_match(expression)
    🛑str❓(:expression, expression)
    ::Regexp.new(expression.ensure_enclosed_with!('\A', '\z'))
  end

end
