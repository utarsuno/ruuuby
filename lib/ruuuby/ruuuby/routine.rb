
# -------------------------------------------- ⚠️ --------------------------------------------

class Routine

  class CMD

    attr_reader :out, :err

    TIMEOUT_DEFAULT  = 6
    TIMEOUT_EXTENDED = 60

    def initialize(the_cmd)
      @cmd          = nil
      @original_cmd = the_cmd
      @out          = nil
      @err          = nil
    end

    def cmd
      if @cmd.nil?
        @cmd = TTY::Command.new(printer: :null) #(printer: :pretty)
      end
      @cmd
    end

    def run
      @out, @err = cmd.run(@original_cmd, only_output_on_error: true, timeout: CMD::TIMEOUT_DEFAULT, pty: false)
      if err.∅?
        @out
      else
        raise "cmd{#{@original_cmd.to_s}} failed!"
      end
    end

    def walk
      cmd.run(@original_cmd, only_output_on_error: true, timeout: CMD::TIMEOUT_EXTENDED, pty: false)
    end

  end

end

# -------------------------------------------- ⚠️ --------------------------------------------
