# encoding: UTF-8

# add various aliases & functions to existing module(+Kernel+)
module ::Kernel
  # ---------------------------------------------------------------------------------------------------------- | *f10* |

  alias_method :🛑, :raise

  # @return [Math::Stats::RNG]
  def 🎲; ::Math::Stats::RNG; end

  # @return [Ruuuby::MetaData]
  def 💎; ::Ruuuby::MetaData; end

  # @return [Ruuuby::MetaData::DockerAPI]
  def 🐋; ::Ruuuby::MetaData.engine.api_locale.api_docker; end

  # @return [Ruuuby::MetaData::BrewAPI]
  def 🍺; ::Ruuuby::MetaData.engine.api_locale.api_brew; end

  # @param [String]  cmd
  # @param [Boolean] allow_errors
  #
  # @raise [ArgumentError]
  #
  # @return [Array, String]
  def 💻(cmd, allow_errors=false)
    🛑str❓('cmd', cmd)
    🛑bool❓('allow_errors', allow_errors)
    ::Ruuuby::MetaData.engine.api.run_cmd!(cmd, allow_errors)
  end

  # @return [Ruuuby::Protocols::RequestHTTP]
  def 🌐; ::Ruuuby::Protocols::RequestHTTP; end

  # | ------------------------------------------------------------------------------------------------------------------
end
