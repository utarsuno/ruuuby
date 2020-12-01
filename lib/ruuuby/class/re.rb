# utf-8

# @see https://docs.oracle.com/database/121/ADFNS/adfns_regexp.htm#ADFNS9999
#
#   -----------------------------------------------------------------------------------------
#  | for                                  | regex                                            |
#  | ------------------------------------ | ------------------------------------------------ |
#  | lowercase letter                     | `[[:lower:]]`                                    |
#  | uppercase letter                     | `[[:upper:]]`                                    |
#  | marker start                         | `\A`                                             |
#  | marker end                           | `\z`                                             |
#  | marker start in DB context           | `^`                                              |
#  | marker end in DB context             | `$`                                              |
#   -----------------------------------------------------------------------------------------
#
# `Ruuuby` modifications to existing Class{+Regexp+}
class ::Regexp
  # @param [String] expression
  #
  # @return [Regexp] a new instance-of(+Regexp+) with a strict match of the expression provided
  def self.closed_match(expression)
    🛑str❓(:expression, expression)
    ::Regexp.new(expression.ensure_enclosed_with!('\A', '\z'))
  end
end
