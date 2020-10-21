# encoding: UTF-8

# -------------------------------------------- ⚠️ --------------------------------------------

class RuuubyServiceSet

  SECTIONS_YAML = %w(version services networks volumes).freeze

  attr_reader :contents, :services, :networks

  # @param [String] path
  def initialize(path)
    @contents = ::File::YAML.read!(path, SECTIONS_YAML)
    @services = {}
    @contents['services'].each do |s, k|
      @services[s] = ::RuuubyService.new(s, k, 'TODO')
    end
  end

  def networks; @contents['networks']; end

  # @return [Boolean]
  def ∃volumes?; @contents['volumes'].∀{|name, volume| return false if Docker::Volume.∄?(name)}; true; end

  # @raise [RuntimeError]
  #
  # @return [Boolean]
  def ∃network?
    if self.networks.keys == %w(default)
      if self.networks['default'].keys == %w(external)
        if self.networks['default']['external'].keys == %w(name)
          return ::Docker::Network.∃?(self.network_name)
        else
          🛑 ::NotImplementedError.new("| c{RuuubyServiceSet}-> m{∃network?} unhandled network parsing mode for data{#{self.networks.to_s}}) |")
        end
      else
        🛑 ::NotImplementedError.new("| c{RuuubyServiceSet}-> m{∃network?} unhandled network parsing mode for data{#{self.networks.to_s}}) |")
      end
    else
      🛑 ::NotImplementedError.new("| c{RuuubyServiceSet}-> m{∃network?} unhandled network parsing mode for data{#{self.networks.to_s}}) |")
    end
  end

  # @return [String]
  def network_name; self.networks['default']['external']['name']; end

  # @return [Boolean]
  def ∃services?; @contents['services'].keys.∀{|name| return false unless 🐋.∃🐋?(name)}; true; end

  alias_method :∃💾?, :∃volumes?
  alias_method :∃🌐?, :∃network?
  alias_method :∃🐋?, :∃services?

  def ∅?; false; end

end

# -------------------------------------------- ⚠️ --------------------------------------------
