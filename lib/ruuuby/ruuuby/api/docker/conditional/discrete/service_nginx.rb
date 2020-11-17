# encoding: UTF-8

class RuuubyServiceNGINX < ::RuuubyService

  def initialize(ruuuby_service)
    super(ruuuby_service.name, ruuuby_service.configs, '/v/')
  end

  def file_create(path, content)
    self.container.file_create("#{@path_base}#{path}", content)
  end

  def file_delete(path)
    self.container.cmd!(['rm', self.path_self(path)])
  end

end
