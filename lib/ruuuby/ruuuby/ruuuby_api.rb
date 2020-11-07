# encoding: UTF-8

using ::Ruuuby::Heuristics::ContextParsingCommandOutput

# -------------------------------------------- ⚠️ --------------------------------------------

# information and utilities that define and work w/ aspects of `Ruuuby`
module ::Ruuuby::MetaData

  # @see https://stackoverflow.com/questions/16064957/how-to-check-in-applescript-if-an-app-is-running-without-launching-it-via-osa
  # @see https://stackoverflow.com/questions/4426280/what-do-pty-and-tty-mean
  # | tty | teletype        | "in UNIX, /dev/tty* is any device that acts like a `teletype`, ie, a terminal"
  # | pty | pseudo-teletype | "device entry that acts like a terminal to the process performing I/O, but is managed by something else"
  #
  # `💎.engine.api`
  class RuuubyAPI < ::Ruuuby::MetaData::EngineComponentAPI

    # @param [*]       engine
    # @param [Integer] default_timeout
    def initialize(engine, default_timeout)
      🛑int❓('default_timeout', default_timeout, :∈ℕ)
      super(engine)
      @gem_tty         = nil
      @default_timeout = default_timeout
    end

    # @return [Array] out then err
    def run_cmd(cmd)
      out, err = self.get_tty.run(cmd, {timeout: @default_timeout, pty: false})
      [out, err]
    end

    # @return [String, Array] parsed output
    def run_cmd_custom(cmd)
      self.get_tty.run!(cmd, {timeout: @default_timeout, pty: false})
    end

    # @see http://www.tldp.org/LDP/abs/html/exitcodes.html
    #
    # | error code | description                |
    # | ---------- | -------------------------- |
    # | 1          | general error              |
    # | 2          | mis-used shell built-ins   |
    # | 126        | cmd invoked cannot execute |
    # | 127        | cmd not found              |
    # | 128        | invalid argument to exit   |
    # | 128 + n    | fatal error signal `n`     |
    # | 130        | terminated w/ Control-C    |
    # | 255\*      | exit status out of range   |
    #
    # TODO: useful cmd: ps -lww -p <PID>
    def run_cmd!(cmd)
      out, err = self.get_tty.run(cmd, timeout: @default_timeout, pty: false)
      unless err.empty?
        raise "cmd{#{cmd.to_s}} encountered error{#{err.to_s}}"
      end
      if cmd.str? || cmd.ary?
        out.clean
      else
        out
      end
    end

    # @param [String] cmd
    #
    # @raise [ArgumentError]
    #
    # @return [String, Array]
    def run_apple_script!(cmd)
      🛑str❓('cmd', cmd)
      self.run_cmd!("osascript -e '#{cmd}'")
    end

    # @param [Integer] pid_id
    #
    # @raise [ArgumentError]
    def pid_terminate(pid_id)
      🛑int❓('pid_id', pid_id, :∈ℕ)
      self.run_cmd!("pkill -9 #{pid_id}")
    end

    🙈

    #==printer options
    # [null]     no output
    # [pretty]   colorful output
    # [progress] minimal output with green dot for success and F for failure
    # [quiet]    only output actual command stdout and stderr
    def get_tty
      if @gem_tty.nil?
        if @engine.logger.nil?
          @gem_tty = ::TTY::Command.new(printer: :pretty) #(printer: :pretty) #printer: :null
        else
          @gem_tty = ::TTY::Command.new(output: @engine.logger, color: false)
        end
      end
      @gem_tty
    end

  end

end

# -------------------------------------------- ⚠️ --------------------------------------------
