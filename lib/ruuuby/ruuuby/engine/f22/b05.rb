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

      # @return [Ruuuby::MetaData::RuuubyEngine::F22B05::IPv4]
      def self.ipv4; self::IPv4; end

      # `💎.engine.os.ipv4`
      module IPv4

        # TODO: TDD
        #
        # @see https://stackoverflow.com/questions/14112955/how-to-get-my-machines-ip-address-from-ruby-without-leveraging-from-other-ip-ad/27454154
        # @see https://en.wikipedia.org/wiki/Localhost
        def self.internal
          results = ::Socket.ip_address_list.reject(&:ipv6?).reject {|s| s.inspect_sockaddr == '127.0.0.1'}
          if results.length == 1
            return results[0].inspect_sockaddr
          else
            error_message = "| {💎.engine.os.ipv4}-> m{ipv4_internal} got results{#{results.to_s}}, currently only built to expect single IP back |"
            🛑 ::NotImplementedError.new(error_message)
          end
        end

        # TODO: TDD
        #
        # @see https://unix.stackexchange.com/questions/22615/how-can-i-get-my-external-ip-address-in-a-shell-script
        # @see https://www.linuxtrainingacademy.com/determine-public-ip-address-command-line-curl/
        # @see https://stackoverflow.com/questions/13270042/get-public-remote-ip-address
        # @see https://www.whatismyip.com/what-is-my-public-ip-address/
        def self.external; res, req = 🌐.get!('https://api.ipify.org'); res.body; end
      end

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
