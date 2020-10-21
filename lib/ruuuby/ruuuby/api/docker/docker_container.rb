# encoding: UTF-8

using ::Ruuuby::Heuristics::ContextParsingCommandOutput

# 3ʳᵈ_party gem class
class Docker::Container

  alias_method :♻️, :remove

  # ------------------------------------------------------------------------
  # @type [String]
  SEARCH_ARG = 'container_name'
  extend ::Ruuuby::Attribute::Findable
  # ------------------------------------------------------------------------

  def name?(partial_match)
    self.info['Names'].each do |n|
      if n.include?(partial_match)
        return true
      end
    end
    false
  end

  # @return [Boolean]
  def alpine?; self.os == 'alpine'; end

  # @return [Boolean]
  def debian?; self.os == 'debian'; end

  # @return [Boolean]
  def dev?; self.env_vars['SERVICE_ENV'] == 'dev'; end

  # @return [Boolean]
  def prod?; self.env_vars['SERVICE_ENV'] == 'prod'; end

  # @return [String]
  def env; self.env_vars['SERVICE_ENV']; end

  # @return [String]
  def os; self.env_vars['SERVICE_OS']; end

  # @raise [RuntimeError]
  #
  # @return [Boolean]
  def os_architecture
    if dev?
      begin
        self.cmd!(%w(dpkg --print-architecture))
      rescue ::RuntimeError
        self.cmd!(%w(apk add --no-cache dpkg))
        os_architecture!
      end
    else
      "| production mode does not have lib{dpkg} installed |"
    end
  end

  def os_architecture!
    if self.dev?
      self.cmd!(%w(dpkg --print-architecture))
    else
      🛑 ::RuntimeError.new("| production mode does not have lib{dpkg} installed |")
    end
  end

  # @see https://www.freedesktop.org/software/systemd/man/os-release.html
  #
  # @return [Hash]
  def os_release; self.📁📖('/etc/os-release').clean.convert_to_json; end

  # @return [String]
  def os_version; self.env_vars['SERVICE_OS_VERSION']; end

  # @see https://linuxize.com/post/how-to-check-the-kernel-version-in-linux/
  #
  # @return [String]
  def linux_kernel_version; self.📁📖('/proc/version'); end

  # @return [Boolean]
  def healthy?
    self.env_vars['BUILD_ENV'] == self.env_vars['SERVICE_ENV']
  end

  # TODO: health check that config volumes match info['Mounts']

  # @return [Hash, NilClass]
  def volumes
    vols = self.info['Volumes']
    if vols.∅?
      vols = []
      self.mounts.each do |m|
        if m['Type'] == 'volume'
          vols << [m['Name'], m['Source'], m['Destination']]
        end
      end
    end
    vols
  end

  # @return [Hash, Array, NilClass]
  def mounts; self.info['Mounts']; end

  # @param [String] name
  # @param [String] destination
  #
  # @raise [ArgumentError]
  #
  # @return [Boolean]
  def ∃mount?(name, destination)
    🛑strs❓([name, destination])
    self.mounts.∀{|mount| return true if (mount['Name'] == name && mount['Destination'] == destination)}
    false
  end

  # @return [Boolean]
  def tty?; self.info['Config']['Tty']; end

  # @raise [RuntimeError]
  #
  # @return [Hash]
  def env_vars
    if @cached_env_vars == nil
      @cached_env_vars = self.info['Config']['Env'].convert_to_json
    end
    @cached_env_vars
  end

  # @param [String]             path_in_container
  # @param [String, CSV::Table] contents
  #
  # @raise [ArgumentError]
  #
  # @return [Docker::Container] self
  def file_create(path_in_container, contents)
    🛑str❓('path_in_container', path_in_container)
    if contents.str?
      self.store_file(path_in_container, contents)
      self.cmd!(%w(chmod 644) + [path_in_container])
    elsif contents.ⓣ == ::CSV::Table
      self.store_file(path_in_container, contents.to_s)
      self.cmd!(%w(chmod 644) + [path_in_container])
    else
      🛑str❓('contents', contents)
    end
    self
  end

  # @param [String] path_host_file
  # @param [String] path_container_output_directory
  #
  # @raise [ArgumentError]
  def copy_host_file(path_host_file, path_container_output_directory)
    # TODO: add regex checks on path syntax
    🛑str❓('path_host_file', path_host_file)
    🛑str❓('path_container_output_directory', path_container_output_directory)
    file_name                  = ::File.basename(path_host_file)
    path_container_output_file = "#{path_container_output_directory.ensure_ending!('/')}#{file_name}"
    if path_host_file.start_with?("#{💎.engine.path_base}")
      self.file_create(path_container_output_file, ::File.read(path_host_file))
    else
      self.file_create(path_container_output_file, ::File.read("#{💎.engine.path_base}#{path_host_file}"))
    end
  end

  alias_method :📁✏️, :file_create
  alias_method :📁_create, :file_create
  alias_method :📁📖, :read_file
  alias_method :copy_host_📁, :copy_host_file

  # @param [Array]   cmd
  # @param [Integer] timeout
  #
  # @raise [ArgumentError, RuntimeError]
  #
  # @return [String]
  def cmd!(cmd, timeout=5)
    🛑ary❓('cmd', cmd)
    🛑int❓('timeout', timeout, :∈𝕎)
    result    = self.exec(cmd, wait: timeout)
    out       = result[1]
    err       = result[0]
    exit_code = result[2]
    if err.∅? && exit_code == 0
      return (out.ary? || out.str?) ? out.clean : out
    elsif out.∅? && exit_code == 0
      return (err.ary? || err.str?) ? err.clean : err
    else
      🛑 ::RuntimeError.new("| c{Docker::Container}-> m{cmd!} executed{#{cmd}} w/ a timeout of{#{timeout.to_s}} and received exit-code{#{exit_code.to_s}} w/ error{#{err.to_s} and w/ output{#{out.to_s}} |")
    end
  end

end
