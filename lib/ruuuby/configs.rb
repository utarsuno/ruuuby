# encoding: UTF-8

# ------------------------------------------------------------------------------------------------------------ | *f23* |

BEGIN {
  💎.engine.engine.start

  # add these methods onto the `main` object (similar to adding methods to `Kernel`, but of smaller scope to avoid polluting other Classes)
  class << self
    include(
        ::Math::Trig
    )

    #$🌎 = self
    #$git = 💎.engine.api_locale.api_git
  end

  # TODO: create better solution than loading it here
  module ::Kernel

    # @type [Float]
    Ω = ::Float::CONST_OMEGA

    # TODO: https://en.wikipedia.org/wiki/Golden_spiral
    # TODO: https://en.wikipedia.org/wiki/Polar_coordinate_system
    # TODO: https://en.wikipedia.org/wiki/Euler%27s_formula

    # ---------------------------------------------------------------------------------------------------------- | *f28* |

    𝔹 = ::Math::SetTheory::BooleanNumbers.instance

    ℕ = ::Math::SetTheory::NaturalNumbers.instance

    𝕎 = ::Math::SetTheory::WholeNumbers.instance

    ℤ = ::Math::SetTheory::IntegerNumbers.instance

    ℚ = ::Math::SetTheory::RationalNumbers.instance

    𝔸ᵣ = ::Math::SetTheory::RealAlgebraicNumbers.instance

    𝔸 = ::Math::SetTheory::AlgebraicNumbers.instance

    ℂ = ::Math::SetTheory::ComplexNumbers.instance

    #𝕋 = ::Math::GroupTheory::CircleGroup.instance

    𝕀 = ::Math::SetTheory::IrrationalNumbers.instance

    ℝ = ::Math::SetTheory::RealNumbers.instance

    𝕌 = ::Math::SetTheory::UniversalSet.instance

    # ---------------------------------------------------------------------------------------------------------- | *f06* |

    ::Kernel.const_set(:𝕊, ::Math::Space::SymbolicNumbers.instance)

    ::Kernel.const_set(:🅱, ::Math::Space::BooleanSpace.instance)

    🙈

    def 🧬; ::Math::Space::NucleotideSpace.instance; end

    def 🔢; ::Math::Space::NumberSpace.instance; end

    def ∅; ::Math::SetTheory::EmptySet.instance; end

    def 𝕚; ::Math::SetTheory::ImaginaryNumbers.instance; end
  end
  # | --------------------------------------------------------------------------------------------------------------------

}

END {
  💎.engine.engine.stop
}
