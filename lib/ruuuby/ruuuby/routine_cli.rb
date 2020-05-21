# encoding: UTF-8

# -------------------------------------------- ⚠️ --------------------------------------------

module Ruuuby

  # TODO: move into meta-data

  class Routine

    class CommandCLI
      attr_reader :out, :err
      attr_accessor :normalizer

      TIMEOUT_DEFAULT  = 6
      TIMEOUT_EXTENDED = 60

      module Syntax
        module GitCommands

          # @type [String]
          COMMIT_HISTORY   = 'git log --pretty=format:"%H|%ad|%s" --date=iso'.❄️

          def self.parse_commit_history(data)
            parsed_data = []
            data.split("\n").∀ do |line|
              parsed_data << line.split('|').remove_empty!
            end
            parsed_data
          end
        end
      end

      def initialize(the_cmd=nil)
        @cmd          = nil
        @original_cmd = the_cmd
        @out          = nil
        @err          = nil
      end

      #==printer options
      # [null]     no output
      # [pretty]   colorful output
      # [progress] minimal output with green dor for success and F for failure
      # [quiet]    only output actual command stdout and stderr
      def cmd
        if @cmd.nil?
          @cmd = TTY::Command.new(printer: :null) #(printer: :pretty)
        end
        @cmd
      end

      def run(cmd_to_run=nil)
        if cmd_to_run.nil?
          if @original_cmd.nil?
            raise "cmd is not defined!"
          else
            self._run_the_cmd(@original_cmd)
          end
        else
          self._run_the_cmd(cmd_to_run)
        end
        if @err.∅?
          @out
        else
          raise "cmd{#{@original_cmd.to_s}} failed!"
        end
      end

      def walk
        self._run_the_cmd(@original_cmd, Ruuuby::Routine::CommandCLI::TIMEOUT_EXTENDED)
      end

      🛡️

      def _run_the_cmd(the_cmd, the_timeout=nil)
        if the_timeout == nil
          @out, @err = self.cmd.run(the_cmd, only_output_on_error: true, timeout: Ruuuby::Routine::CommandCLI::TIMEOUT_DEFAULT, pty: false)
        else
          @out, @err = self.cmd.run(the_cmd, only_output_on_error: true, timeout: the_timeout, pty: false)
        end
      end
    end

  end

end

# -------------------------------------------- ⚠️ --------------------------------------------
