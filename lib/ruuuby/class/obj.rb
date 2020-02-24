# coding: utf-8

# add various functions to existing class +Object+ (and explicitly create aliases to play nice with IDEs)
class ::Object

  # mapped to Ruby language constructs
  alias_method :🆔, :object_id
  alias_method :❄️, :freeze
  alias_method :❄️?, :frozen?
  # custom
  alias_method :ary?, :ary?
  alias_method :bool?, :bool?
  alias_method :hsh?, :hsh?
  alias_method :int?, :int?
  alias_method :sym?, :sym?
  alias_method :str?, :str?
  alias_method :stry?, :stry?

end
