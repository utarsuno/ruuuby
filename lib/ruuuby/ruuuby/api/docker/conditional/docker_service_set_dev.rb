# encoding: UTF-8

using ::Ruuuby::Heuristics::ContextParsingCommandOutput

class RuuubyServiceSetDev < RuuubyServiceSet

  attr_reader :nginx, :postgresql, :pgadmin

  attr_reader :path_assets, :path_intermediate, :path_js, :path_js_utils, :path_output_dir

  def initialize(host)
    super("#{💎.engine.path_base}docker-compose.dev.yml")

    @host              = host
    @pgadmin           = @services['service_pgadmin']

    @path_assets       = 'services/web_assets/'
    @path_intermediate = "#{@path_assets}intermediate/"
    @path_js_test      = "#{@path_assets}test/"
    @path_js           = "#{@path_assets}src/"
    @path_utils        = "#{@path_assets}utils/"
    @path_output_dir   = '/root/ruuuby_js/'

    @js = nil
  end

  def nginx
    if @nginx == nil
      require_relative 'discrete/service_nginx'
      @nginx = ::RuuubyServiceNGINX.new(@services['service_nginx'])
    end
    @nginx
  end

  def js
    if @js == nil
      require_relative 'discrete/service_js'
      @js = RuuubyServiceJS.new(@services['service_js'], self.nginx)
    end
    @js
  end

  #def postgresql
  #  if @postgresql == nil
  #    require_relative 'discrete/service_postgresql'
  #    @postgresql = RuuubyServicePostgreSQL.new(@services['service_postgres'])
  #  end
  #  @postgresql
  #end

  # _________________________________________________________________
  #  __               __   __
  # |__) |  | | |    |  \ /__`
  # |__) \__/ | |___ |__/ .__/
  # _________________________________________________________________

  def sync_html; @nginx.file_create('ruuuby.html', self.js.container.📁📖(@js.path_self('intermediate/ruuuby.min.html'))); end

  # @param [String]  path_input
  # @param [String]  path_minified
  # @param [Boolean] transfer_to_nginx
  #
  # @raise [ArgumentError, RuntimeError]
  def build_web_manifest(path_input=nil, path_minified=nil, transfer_to_nginx)
    🛑bool❓('transfer_to_nginx', transfer_to_nginx)
    if path_input.nil? && path_minified.nil?
      result = self.js.minify_webmanifest
    else
      🛑str❓('path_input', path_input)
      🛑str❓('path_minified', path_minified)
      result = self.js.minify_webmanifest(path_input, path_minified)
    end
    if transfer_to_nginx
      @nginx.file_create('ruuuby.webmanifest', result.body)
    end
    result.body
  end

end

# -------------------------------------------- ⚠️ --------------------------------------------

module ::Ruuuby
  module MetaData

    # `🐋`
    class DockerAPI < ::Ruuuby::MetaData::EngineComponentAPICLI

      def create_needed_network
        🛑 ::ArgumentError.new("| c{DockerAPI}-> m{create_needed_network} was called when the network{ruuuby_network} already exists |") if ∃🌐?('ruuuby_network')
        self._run_cmd('network create -d bridge --subnet 192.168.0.0/24 --gateway 192.168.0.1 ruuuby_network')
      end

    end
  end
end
