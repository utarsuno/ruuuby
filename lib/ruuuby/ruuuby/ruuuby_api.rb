# coding: UTF-8

# -------------------------------------------- ⚠️ --------------------------------------------

module ::Ruuuby

  # information and utilities that define and work w/ aspects of `Ruuuby`
  module MetaData

    # @see https://stackoverflow.com/questions/4426280/what-do-pty-and-tty-mean
    # | tty | teletype        | "in UNIX, /dev/tty* is any device that acts like a `teletype`, ie, a terminal"
    # | pty | pseudo-teletype | "device entry that acts like a terminal to the process performing I/O, but is managed by something else"
    #
    # `💎.engine.api`
    class RuuubyAPI < ::Ruuuby::MetaData::RuuubyAPIComponent

      def initialize(engine, api_brew)
        super(engine)
        @path_openssl = nil
        @gem_tty      = nil
        @api_brew     = api_brew
      end

      def path_openssl
        require 'openssl'
        if @path_openssl.nil?
          @path_openssl = @api_brew.execute_cmd_prefix_of('openssl@1.1')
        end
        @path_openssl
      end

      def run_cmd(cmd)
        out, err = self.get_tty.run(cmd, timeout: 6, pty: false)
        return out, err
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
        out, err = self.get_tty.run(cmd, timeout: 6, pty: false)
        unless err.empty?
          raise "cmd{#{cmd.to_s}} encountered error{#{err.to_s}}"
        end
        out = out.to_s.strip.split("\n")
        if out.ary? && out.length == 1
          out = out[0].to_s
          if out.include?("\n")
            return out.gsub!("\n", '')
          else
            return out
          end
        elsif out.str?
          if out.include?("\n")
            return out.gsub!("\n", '')
          else
            return out
          end
        else
          out
        end
      end

      def _calculate_version; 1337; end

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

end

# -------------------------------------------- ⚠️ --------------------------------------------
