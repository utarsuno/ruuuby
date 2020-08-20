# encoding: UTF-8

# 3ʳᵈ_party gem class
class Docker::Network

  alias_method :♻️, :delete

  # @param [String] network_name
  #
  # @raise [ArgumentError]
  def self.♻️_by_name(network_name); self.find_by_name(network_name).♻️; end

  # @param [String] network_name
  #
  # @raise [ArgumentError]
  #
  # @return [Docker::Network]
  def self.find_by_name(network_name)
    🛑str❓('network_name', network_name)
    ::Docker::Network.all.∀{|network| return network if network.info['Name'] == network_name}
    🛑 ::ArgumentError.new("| c{🐋}-> m{find_by_name} was not able to find a network w/ the name{#{network_name.to_s}}")
  end

end
