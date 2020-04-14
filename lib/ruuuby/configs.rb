# encoding: UTF-8

# ------------------------------------------------------------------------------------------------------------ | *f23* |

BEGIN {
  # add these methods onto the `main` object (similar to adding methods to `Kernel`, but of smaller scope to avoid polluting other Classes)
  class << self
    include ::Ruuuby::Feature::Extendable::MainF10
    include ::Ruuuby::Feature::Extendable::MainF12
    include ::Ruuuby::Feature::Extendable::MainF17::MathAliases
    include ::Ruuuby::Feature::Extendable::MainF17::FloatAliases
    include ::Ruuuby::Feature::Extendable::MainF17::Trigonometry
  end

  💎.engine.warm_up
}

END {
  💎.engine.cool_down
}

# | --------------------------------------------------------------------------------------------------------------------
