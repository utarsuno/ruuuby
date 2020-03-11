#encoding: UTF-8

# add various aliases/functions to existing class +Class+ (and explicitly create aliases to play nice with IDEs)
class ::Class
  alias_method :🆕, :new
end
