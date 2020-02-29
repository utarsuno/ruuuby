# coding: utf-8

# add various functions to existing class +NilClass+ (and explicitly create aliases to play nice with IDEs)
class ::NilClass
  alias_method :empty?, :empty?
  alias_method :∅?, :empty?
end
