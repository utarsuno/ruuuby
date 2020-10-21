# encoding: UTF-8

class RuuubyServiceJS < ::RuuubyService

  attr_reader :path_intermediate, :path_js

  module Endpoint

    # @type [String]
    MINIFY   = 'http://localhost:8080/minify'

    # @type [String]
    MD5_FILE = 'http://localhost:8080/md5/file'

    # @type [String]
    MD5_DIR  = 'http://localhost:8080/md5/dir'

  end

  def initialize(ruuuby_service, nginx)
    super(ruuuby_service.name, ruuuby_service.configs, '/root/ruuuby_js/')
    @path_intermediate = "#{@path_base}intermediate/"
    @path_js           = "#{@path_base}src/"
    @nginx             = nginx
  end

  def md5_file(path); 🌐.get!(RuuubyServiceJS::Endpoint::MD5_FILE, self.get_params_md5(false, path)).body; end

  def md5_dir(path); 🌐.get!(RuuubyServiceJS::Endpoint::MD5_DIR, self.get_params_md5(false, path, ::File.basename(path))).body; end

  def build_js(debug=false)
    puts 'running webpack' if debug
    self.container.cmd!(%w(webpack), 25)
  end

  # @see https://stackoverflow.com/questions/46221528/inline-the-web-app-manifest
  def parse_html(path_input=self.path_self('assets/ruuuby.html'), path_output="#{@path_intermediate}ruuuby.html")
    🛑str❓('path_input', path_input)
    🛑str❓('path_output', path_output)
    og_data     = self.container.📁📖(path_input).split($/)
    parsed_data = []
    og_data.each do |row|

      pat_style_start    = '<!--|<style>'
      pat_style_end      = '</style>|-->'
      pat_manifest_start = '<!--|manifest|'
      pat_manifest_end   = '|manifest|-->'

      if row.∋?(pat_style_start) && row.∋?(pat_style_end)
        paths       = row.♻️⟶(pat_style_start).♻️⟵(pat_style_end).split('|')
        path_css    = self.path_self(paths[0])
        path_output = self.path_self(paths[1])
        data_css    = self.minify_css(path_css, path_output, true).body
        parsed_data << "\t<style>#{data_css}</style>"
      elsif row.∋?(pat_manifest_start) && row.∋?(pat_manifest_end)
        paths           = row.♻️⟶(pat_manifest_start).♻️⟵(pat_manifest_end).split('|')
        path_manifest   = self.path_self(paths[0])
        output_manifest = self.path_self(paths[1])
        data_manifest   = self.minify_webmanifest(path_manifest, output_manifest, true).body
        parsed_data << "\t<link rel=\"manifest\" href='data:application/manifest+json,#{data_manifest}'>"
      else
        parsed_data << row
      end
    end
    parsed_html = parsed_data.join
    self.container.store_file(path_output, parsed_html)
    return parsed_html
  end

  def minify_html(path_input=self.path_self("#{@path_intermediate}ruuuby.html"), path_output="#{@path_intermediate}ruuuby.min.html")
    🌐.get!(RuuubyServiceJS::Endpoint::MINIFY, self.gen_params_minify(true, path_input, path_output, 'html'))
  end

  def minify_css(path_input=self.path_self('assets/ruuuby.css'), path_output="#{@path_intermediate}ruuuby.min.css", debug=true)
    puts "parsing css{#{path_input}} to output path{#{path_output}}" if debug
     🌐.get!(RuuubyServiceJS::Endpoint::MINIFY, self.gen_params_minify(true, path_input, path_output, 'css'))
  end

  def minify_webmanifest(path_input=self.path_self('assets/ruuuby.webmanifest'), path_output="#{@path_intermediate}ruuuby.parsed.webmanifest", debug=true)
    puts "parsing webmanifest{#{path_input}} to output path{#{path_output}}" if debug
    🌐.get!(RuuubyServiceJS::Endpoint::MINIFY, self.gen_params_minify(true, path_input, path_output, 'json'))
  end

  # _________________________________________________________________
  #  __            __        __   __         __      ___    __
  # /__` \ / |\ | /  ` |__| |__) /  \ |\ | |  /  /\   |  | /  \ |\ |
  # .__/  |  | \| \__, |  | |  \ \__/ | \| | /_ /~~\  |  | \__/ | \|
  # _________________________________________________________________

  def sync_js
    if self.sync_js_dir(💎.engine.dir('services/web_assets/src/'), "#{@path_base}src/")
      self.build_js(true)
      self._sync_js(true)
    end

  end

  def _sync_js(debug=false)
    puts 'transferring file to nginx' if debug
    file_contents = self.container.📁📖(self.path_self('dist/bundle.js'))
    @nginx.file_create('bundle.js', file_contents)
  end

  def sync_js_dir(local_dir, remote_dir)
    diff_found = false

    puts "IN DIR{#{local_dir.path}}"

    local_dir.∀_📁 do |path|
      #puts "PATH{#{path}}, remote-dir{#{remote_dir}}"
      the_path = "#{local_dir.path}".ensure_ending!('/') + path
      remote_path = "#{remote_dir}#{path}"
      remote_md5  = self.md5_file(remote_path)
      local_md5   = ::File.md5(the_path)
      if local_md5 != remote_md5
        diff_found = true
        puts "SYNCING THE_PATH{#{the_path}}, local-md5{#{::File.md5(the_path)}}, md5{#{self.md5_file(remote_path)}}"
        self.container.copy_host_📁(the_path, remote_dir)
      end
    end

    local_dir.∀_🗄️(false) do |d|
      path_dir_remote = d.path.dup.♻️⟶('src/').ensure_start!('src/').ensure_ending!('/')
      #puts "???{#{path_dir_remote}}"
      md5_remote      = self.md5_dir(path_dir_remote)
      md5_local       = d.md5
      #puts "\t SUB DIR{#{d.path}}, md5{#{md5_local}}, path_dir_remote{#{path_dir_remote}}, remote-md5{#{md5_remote}}"
      if md5_remote != md5_local
        diff_found = true
      end

      other_diffs = self.sync_js_dir(d, "#{@path_base}#{path_dir_remote}")
      diff_found  = diff_found || other_diffs
    end

    diff_found
  end

  def sync_web(nginx)
    md5_web   = self.md5('assets/')
    local_web = Dir.new("#{💎.engine.path_base}services/web_assets/assets/")
    md5_local = local_web.md5
    puts "REMOTE web{#{md5_web}}"
    puts "LOCAL web{#{md5_local}}"

    if md5_web != md5_local
      local_web.∀ do |path|
        self.container.copy_host_📁("services/web_assets/assets/#{path}", "#{@path_base}assets/")
      end

      self.parse_html
      response = self.minify_html
      nginx.file_create('ruuuby.html', response.body)
    end
  end

  #def sync_web_manifest; self.container.copy_host_📁("services/web_assets/assets/ruuuby.webmanifest", "#{@path_base}assets/"); end
  #def sync_html; self.container.copy_host_📁("services/web_assets/assets/ruuuby.html", "#{@path_base}assets/"); end

  def sync_configs
    self.container.copy_host_📁("#{@path_assets}webpack.config.js", @path_output_dir)
    self.container.copy_host_📁("#{@path_assets}package.json", @path_output_dir)
  end

  🙈

  def gen_params_minify(debug, path_input, path_output, minification_type)
    {debug: debug, path_output: path_output, path_input: path_input, minify_type: minification_type}
  end

  def get_params_md5(debug, path, base_name=nil)
    if base_name.nil?
      {debug: debug, path: path}
    else
      {debug: debug, path: path, base_name: base_name}
    end
  end

end