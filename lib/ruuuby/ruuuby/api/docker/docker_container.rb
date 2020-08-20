# encoding: UTF-8

using ::Ruuuby::Heuristics::ContextParsingCommandOutput

# 3ʳᵈ_party gem class
class Docker::Container

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
      self.cmd!(%w(dpkg --print-architecture))
    else
      🛑 ::RuntimeError.new("| production mode does not have lib{dpkg} installed |")
    end
  end

  # @return [String]
  def os_version; self.env_vars['SERVICE_OS_VERSION']; end

  # @return [String]
  def linux_kernel_version; self.cmd!(%w(cat /proc/version)); end

  # @return [Boolean]
  def healthy?
    self.env_vars['BUILD_ENV'] == self.env_vars['SERVICE_ENV']
  end

  # @return [Boolean]
  def healthy_os?; self.linux_kernel_version == 'Linux version 4.19.76-linuxkit (root@4abe09437d05) (gcc version 8.3.0 (Alpine 8.3.0)) #1 SMP Tue May 26 11:42:35 UTC 2020'; end

  # @return [Hash, NilClass]
  def volumes; self.info['Volumes']; end

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

  alias_method :✏️📁, :file_create
  alias_method :📁_create, :file_create

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
