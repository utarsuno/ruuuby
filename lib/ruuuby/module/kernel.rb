# coding: UTF-8

# add various aliases & functions to existing module(+Kernel+)
module ::Kernel

  # ---------------------------------------------------------------------------------------------------------- | *f14* |

  # @return [String] the function name which had a failing parameter type
  def 🌽_previous_⨍; caller_locations(2, 1).first.base_label.to_s; end

  # | ------------------------------------------------------------------------------------------------------------------

  alias_method :🛑, :raise

  # ---------------------------------------------------------------------------------------------------------- | *f03* |

  # return the *cardinality(𝔠)* (the length/size) of the provided argument(`n`)
  #
  # @param [*] n
  #
  # @return {Integer} -1 is returned when provided arg does not have function for .length or .size
  def 𝔠(n)
    return n.length if n.respond_to?(:length)
    return n.size   if n.respond_to?(:size)
    -1
  end

  # -------------------------------------------------------------------------------------------------- | *f10* | *f17* |
  alias_method :🎲, :rand

  # | ------------------------------------------------------------------------------------------------------------------

  # @return [::Ruuuby::MetaData]
  def 💎; ::Ruuuby::MetaData; end

end
