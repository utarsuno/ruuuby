# coding: UTF-8

# add various aliases & functions to existing module(+Kernel+)
module ::Kernel

  # ---------------------------------------------------------------------------------------------------------- | *f14* |

  # @return [String] the function name which had a failing parameter type
  def 🌽_previous_⨍; caller_locations(2, 1).first.base_label.to_s; end

  # | ------------------------------------------------------------------------------------------------------------------

  alias_method :🛑, :raise

  # -------------------------------------------------------------------------------------------------- | *f10* | *f17* |
  alias_method :🎲, :rand

  # | ------------------------------------------------------------------------------------------------------------------

  # @return [::Ruuuby::MetaData]
  def 💎; ::Ruuuby::MetaData; end

end
