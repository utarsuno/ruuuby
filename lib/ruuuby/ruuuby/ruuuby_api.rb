# coding: UTF-8

# -------------------------------------------- ⚠️ --------------------------------------------

module ::Ruuuby

  # information and utilities that define and work w/ aspects of `Ruuuby`
  module MetaData

    # `💎.api`
    class RuuubyAPI
      include ::Ruuuby::Attribute::Includable::RuuubySingleton

      def initialize
        @gem_tty = nil
      end

      def info_release_state
        release_current = 💎.api_git.remote_release_current
        #release_previous = 💎.api_git.remote_release_previous

        puts "the last released version was{#{release_current.to_s}}"
      end

      def run_cmd(cmd)
        out, err = self.get_tty.run(cmd, only_output_on_error: true, timeout: 6, pty: false)
        return out, err
      end

      #==printer options
      # [null]     no output
      # [pretty]   colorful output
      # [progress] minimal output with green dot for success and F for failure
      # [quiet]    only output actual command stdout and stderr
      def get_tty
        if @gem_tty.nil?
          @gem_tty = ::TTY::Command.new(printer: :null) #(printer: :pretty)
        end
        @gem_tty
      end

      🙈

    end
  end

end

module ::Ruuuby
  # information and utilities that define and work w/ aspects of `Ruuuby`
  module MetaData
    def self.api; ::Ruuuby::MetaData::RuuubyAPI.ℹ; end
  end
end

# -------------------------------------------- ⚠️ --------------------------------------------
