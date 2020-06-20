# encoding: UTF-8

# add various aliases & functions to existing Class(+Symbol+)
class ::Symbol

  include ::Ruuuby::Attribute::Includable::SubscriptIndexing

  # ---------------------------------------------------------------------------------------------------------- | *f03* |
  include ::Ruuuby::Attribute::Includable::Cardinality
  # ---------------------------------------------------------------------------------------------------------- | *f10* |

  alias_method :⬇, :downcase
  alias_method :⬆, :upcase

  # @return [String]
  def as_source_ruby
    as_str = self.to_s
    as_str.∋?('-') ? ":'#{as_str}'" : ":#{as_str}"
  end

  # | ------------------------------------------------------------------------------------------------------------------
end
