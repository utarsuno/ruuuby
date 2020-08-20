# encoding: UTF-8

# -------------------------------------------- ⚠️ --------------------------------------------

class RuuubyServiceSet

  SECTIONS_YAML = %w(version services networks volumes).freeze

  attr_reader :contents, :services

  def initialize(path)
    @contents = ::File::YAML.read!(path, ::RuuubyManagerService::SECTIONS_YAML)
    @services = {}
    @contents['services'].each do |s, k|
      @services[s] = RuuubyService.new(s, k)
    end
  end

end

# -------------------------------------------- ⚠️ --------------------------------------------
