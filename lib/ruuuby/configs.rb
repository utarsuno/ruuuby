
# ------------------------------------------------------------------------------------------------------------ | *f23* |

BEGIN {
  # add these methods onto the `main` object (similar to adding methods to `Kernel`, but of smaller scope to avoid polluting other Classes)
  class << self
    include ::Ruuuby::Feature::Extendable::MainF12
    include ::Ruuuby::Feature::Extendable::MainF17::MathAliases
    include ::Ruuuby::Feature::Extendable::MainF17::FloatAliases
    include ::Ruuuby::Feature::Extendable::MainF17::Trigonometry
  end

  💎.engine.settings_logging = ENV['RUUUBY_LOGGING_MODE']
}

END {
  if ENV['RUUUBY_DBG'].str?('t')
    # command from: https://stackoverflow.com/questions/7220896/get-current-ruby-process-memory-usage
    cmd = Ruuuby::Routine::CommandCLI.new("ps ax -o pid,rss | grep -E \"^[[:space:]]*#{$$}\"")
    cmd.run
    pid, size = cmd.out.strip.split.map(&:to_i)
    puts "pid[#{pid.to_s}] terminating with current memory usage at [#{size.to_s}kB]"
  end

  if ENV['RUUUBY_LOGGING_MODE'].str?
    💎.debug('closing logger!')
    💎.engine.logger.close
  end
}

# | --------------------------------------------------------------------------------------------------------------------
