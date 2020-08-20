# encoding: UTF-8

# add various aliases & functions to existing module(+Kernel+)
module ::Kernel
  # ---------------------------------------------------------------------------------------------------------- | *f10* |

  alias_method :🎲, :rand
  alias_method :🛑, :raise

  # @return [::Ruuuby::MetaData]
  def 💎; ::Ruuuby::MetaData; end

  # @return [::Ruuuby::MetaData::DockerAPI]
  def 🐋; ::Ruuuby::MetaData.engine.api_locale.api_docker; end

  # @return [::Ruuuby::MetaData::BrewAPI]
  def 🍺; ::Ruuuby::MetaData.engine.api_locale.api_brew; end

  # @param [String] cmd
  #
  # @raise [ArgumentError]
  #
  # @return [Array, String]
  def 💻(cmd)
    🛑str❓('cmd', cmd)
    ::Ruuuby::MetaData.engine.api.run_cmd!(cmd)
  end

  # | ------------------------------------------------------------------------------------------------------------------
end
