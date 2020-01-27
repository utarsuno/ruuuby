# -*- encoding : utf-8 -*-

unless ::Object.respond_to?(:❄️)
  # explicitly create aliases to play nice with IDEs
  class ::Object
    alias_method :❄️, :freeze
    alias_method :❄️?, :frozen?
    alias 🆔 object_id

    alias_method :ary?, :ary?
    alias_method :bool?, :bool?
    alias_method :hsh?, :hsh?
    alias_method :int?, :int?
    alias_method :str?, :str?
    alias_method :sym?, :sym?
  end
end
