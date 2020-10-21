# encoding: UTF-8

# 3ʳᵈ_party gem class
class Docker::Volume

  alias_method :♻️, :remove

  # ------------------------------------------------------------------------
  # @type [String]
  SEARCH_ARG = 'volume_name'
  extend ::Ruuuby::Attribute::Findable
  # ------------------------------------------------------------------------

end
