# encoding: UTF-8

# -------------------------------------------- ⚠️ --------------------------------------------

class RuuubyService

  attr_reader :name, :alias, :configs

  def initialize(service_name, configs)
    @name      = service_name
    @alias     = service_name.♻️⟶('service_')
    @configs    = configs
    @container = nil
  end

  # @return [String]
  def env; self.container.env; end

  def container
    if @container == nil
      @container = 🐋.find_🐋(@name)
    end
    @container
  end

  # @return [Boolean]
  def healthy?
    self.container.healthy? && healthy_os?
  end

end

# -------------------------------------------- ⚠️ --------------------------------------------
