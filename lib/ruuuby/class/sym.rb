# encoding: UTF-8

# add various aliases & functions to existing Class(+Symbol+)
class ::Symbol

  include ::Ruuuby::Attribute::Includable::SubscriptIndexing

  # ---------------------------------------------------------------------------------------------------------- | *f03* |
  include ::Ruuuby::Attribute::Includable::Cardinality
  # ---------------------------------------------------------------------------------------------------------- | *f10* |
  ⨍_add_aliases(:downcase, [:⬇️, :⬇, :🔡])
  ⨍_add_aliases(:upcase, [:⬆️, :⬆, :🔠])
  # | ------------------------------------------------------------------------------------------------------------------
end
