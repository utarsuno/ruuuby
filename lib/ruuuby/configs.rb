
# ------------------------------------------------------------------------------------------------------------ | *f23* |

BEGIN {
  require_relative 'global_funcs'

  # add these methods onto the `main` object (similar to adding methods to `Kernel`, but of smaller scope to avoid polluting other Classes)
  class << self
    include ::Ruuuby::Feature::Extendable::MainF12
    include ::Ruuuby::Feature::Extendable::MainF17::MathAliases
    include ::Ruuuby::Feature::Extendable::MainF17::FloatAliases
    include ::Ruuuby::Feature::Extendable::MainF17::Trigonometry
  end
}

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
