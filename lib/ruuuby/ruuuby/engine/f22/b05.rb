# encoding: UTF-8

using ::Ruuuby::Heuristics::ContextParsingCommandOutput

module ::Ruuuby::MetaData
  class RuuubyEngine

    # helpful CLI commands: @see https://unix.stackexchange.com/questions/252980/is-there-a-whoami-to-find-the-current-group-im-logged-in-as
    #
    #  | scenario           | cmd        |
    #  | ------------------ | ---------- |
    #  | current group ID   | `id -g`    |
    #  | current group name | `id -g -n` |
    #  | current user ID    | `id -u`    |
    #  | current user name  | `id -u -n` |
    #
    # `💎.engine.os`
    module F22B05

      # @param [String]
      def self.current_user; ::Etc.getlogin; end

      # @param [Boolean]
      def self.windows?; ::TTY::Command.windows?; end

      # @see source credit: https://stackoverflow.com/questions/170956/how-can-i-find-which-operating-system-my-ruby-program-is-running-on
      #
      # @param [Boolean]
      def self.unix?; !self.windows?; end

      # @see source credit: https://stackoverflow.com/questions/170956/how-can-i-find-which-operating-system-my-ruby-program-is-running-on
      #
      # @param [Boolean]
      def self.mac?; (/darwin/ =~ RUBY_PLATFORM) != nil; end

      # @see source credit: https://stackoverflow.com/questions/170956/how-can-i-find-which-operating-system-my-ruby-program-is-running-on
      #
      # @param [Boolean]
      def self.linux?; self.unix && !self.mac?; end

      # @return [Integer] the number of CPUs available to `Ruuuby`, not necessarily the number that exists in hardware
      def self.num_cpu_cores; ::Etc.nprocessors; end

      # @return [String]
      def self.architecture; 💻('dpkg --print-architecture'); end

      # TODO: https://www.howtoforge.com/linux-pstree-command/
      module Processes🧟

        # @see https://www.servernoobs.com/how-to-find-and-kill-all-zombie-processes/
        # @see https://vitux.com/how-to-create-a-dummy-zombie-process-in-ubuntu/
        #
        # @return [Integer]
        def self.total_count
          begin
            return 💎.engine.api.run_cmd("ps aux | awk {'print $8'} | grep -c Z")
          rescue ::TTY::Command::ExitError => e

            match_code = 'exit status: 1'
            match_out  = 'stdout: 0'
            match_err  = 'stderr: Nothing written'
            matches    = [false, false, false]
            parsed     = e.to_s.dup.strip.split($/)
            parsed.each do |row|
              matches[0] = true if (!matches[0] && row.include?(match_code))
              matches[1] = true if (!matches[1] && row.include?(match_out))
              matches[2] = true if (!matches[2] && row.include?(match_err))
            end
            if matches[0] && matches[1] && matches[2]
              return 0
            else
              throw e
            end
          end
        end

        # @see https://www.servernoobs.com/how-to-find-and-kill-all-zombie-processes/
        #
        # @return [String, Array]
        def self.pids; 💻('ps aux | awk \'{ print $8 " " $2 }\' | grep -w Z'); end

      end

    end # end: {F22B05}

    # @return [Ruuuby::MetaData::RuuubyEngine::F22B05]
    def os; ::Ruuuby::MetaData::RuuubyEngine::F22B05; end

  end
end
