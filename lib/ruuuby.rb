
BEGIN {
  # ensure the C extensions are loaded right away
  require 'ruby_class_mods'

  # explicitly create aliases to play nice with IDEs
  class ::Object
    alias_method :ary?, :ary?
    alias_method :bool?, :bool?
    alias_method :int?, :int?
    alias_method :str?, :str?
    alias_method :sym?, :sym?
  end
  # explicitly create aliases to play nice with IDEs
  class ::NilClass
    alias_method :empty?, :empty?
  end
}

require 'ruuuby/enum/emoji'
require 'ruuuby/enum/text'
require 'ruuuby/version'
require 'ruuuby/class/ary'
require 'ruuuby/class/str'

# wip: *Ruuuby* is flavored modifications & extensions for increased quality of Ruby coding life
module ::Ruuuby
  # contains the following enums
  #
  #  - Emoji
  #  - Text
  module Enum; end
end
