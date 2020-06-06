# coding: UTF-8

# ------------------------------------------------------------------------------------------------------------ | *f23* |

BEGIN {

  # add these methods onto the `main` object (similar to adding methods to `Kernel`, but of smaller scope to avoid polluting other Classes)
  class << self
    include(
        ::Ruuuby::Feature::Extendable::MainF28,
        ::Math::Trig::Funcs
    )

    #$🌎 = self
  end

  💎.engine.warm_up

  # TODO: create better solution than loading it here
  module ::Kernel

    # TODO: https://en.wikipedia.org/wiki/Golden_spiral
    # TODO: https://en.wikipedia.org/wiki/Polar_coordinate_system
    # TODO: https://en.wikipedia.org/wiki/Euler%27s_formula

    # ---------------------------------------------------------------------------------------------------------- | *f28* |

    ℕ𝕌𝕃𝕃 = ::Math::SetTheory::NullSet.ℹ

    𝔹 = ::Math::SetTheory::BooleanNumbers.ℹ

    ℕ = ::Math::SetTheory::NaturalNumbers.ℹ

    𝕎 = ::Math::SetTheory::WholeNumbers.ℹ

    ℤ = ::Math::SetTheory::IntegerNumbers.ℹ

    ℚ = ::Math::SetTheory::RationalNumbers.ℹ

    𝔸ᵣ = ::Math::SetTheory::RealAlgebraicNumbers.ℹ

    𝔸 = ::Math::SetTheory::AlgebraicNumbers.ℹ

    ℂ = ::Math::SetTheory::ComplexNumbers.ℹ

    𝕋 = ::Math::GroupTheory::CircleGroup.ℹ

    𝕀 = ::Math::SetTheory::IrrationalNumbers.ℹ

    ℝ = ::Math::SetTheory::RealNumbers.ℹ

    𝕌 = ::Math::SetTheory::UniversalSet.ℹ

    # ---------------------------------------------------------------------------------------------------------- | *f06* |

    ::Kernel.const_set(:𝕊, ::Math::Space::SymbolicNumbersSpace.ℹ)

    ::Kernel.const_set(:🅱, ::Math::Space::BooleanSpace.ℹ)

    🙈

    def 🧬; ::Math::Space::NucleotideSpace.ℹ; end

    def 🔢; ::Math::Space::NumberSpace.ℹ; end

    def ∅; ::Math::SetTheory::EmptySet.ℹ; end

    def 𝕚; ::Math::SetTheory::ImaginaryNumbers.ℹ; end
  end
  # | --------------------------------------------------------------------------------------------------------------------

}

END {
  💎.engine.cool_down
}
