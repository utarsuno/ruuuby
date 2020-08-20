# encoding: UTF-8

module ::Ruuuby
  module MetaData
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

      end # end: {F22B05}

      # @return [Ruuuby::MetaData::RuuubyEngine::F22B05]
      def os; ::Ruuuby::MetaData::RuuubyEngine::F22B05; end
    end
  end
end
