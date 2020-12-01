# utf-8

# 3ʳᵈ_party gem class
class Docker::Image
  alias ♻️ remove

  # @type [String]
  SEARCH_ARG = 'image_name'

  extend ::Ruuuby::Attribute::Findable
end
