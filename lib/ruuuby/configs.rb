# coding: UTF-8

# ------------------------------------------------------------------------------------------------------------ | *f23* |

BEGIN {

  # add these methods onto the `main` object (similar to adding methods to `Kernel`, but of smaller scope to avoid polluting other Classes)
  class << self
    include(
        ::Ruuuby::Feature::Extendable::MainF10,
        ::Ruuuby::Feature::Extendable::MainF12,
        ::Ruuuby::Feature::Extendable::MainF26,
        ::Ruuuby::Feature::Extendable::MainF27,
        ::Ruuuby::Feature::Extendable::MainF17::MathAliases,
        ::Ruuuby::Feature::Extendable::MainF17::FloatAliases,
        ::Ruuuby::Feature::Extendable::MainF17::Trigonometry
    )
    $🌎 = self
  end

  💎.engine.warm_up

  # ---------------------------------------------------------------------------------------------------------- | *f28* |
  # TODO: create better solution than loading it here
  module ::Kernel
    # @type [ThetaAngle]
    Ⴔ = ::Math::GOLDEN_ANGLE
  end
  # | --------------------------------------------------------------------------------------------------------------------
}

END {
  💎.engine.cool_down
}
