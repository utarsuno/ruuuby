
# ------------------------------------------------------------------------------------------------------------ | *f23* |

END {
  if ENV['RUUUBY_DBG'].str? && ENV['RUUUBY_DBG'] == 't'

    cmd = TTY::Command.new(printer: :null) #(printer: :pretty)

    # command from: https://stackoverflow.com/questions/7220896/get-current-ruby-process-memory-usage
    out, err = cmd.run("ps ax -o pid,rss | grep -E \"^[[:space:]]*#{$$}\"")

    if err.∅?
      pid, size = out.strip.split.map(&:to_i)
      puts "pid[#{pid.to_s}] terminating with current memory usage at [#{size.to_s}kB]"
    end

  end
}

# | --------------------------------------------------------------------------------------------------------------------
