# coding: UTF-8

# ------------------------------------------------------------------------------------------------------------ | *f23* |

BEGIN {

  # add these methods onto the `main` object (similar to adding methods to `Kernel`, but of smaller scope to avoid polluting other Classes)
  class << self
    include(
        ::Ruuuby::Feature::Extendable::MainF06,
        ::Ruuuby::Feature::Extendable::MainF10,
        ::Ruuuby::Feature::Extendable::MainF12,
        ::Ruuuby::Feature::Extendable::MainF26,
        ::Ruuuby::Feature::Extendable::MainF27,
        ::Ruuuby::Feature::Extendable::MainF28,
        ::Ruuuby::Feature::Extendable::MainF17::MathAliases,
        ::Ruuuby::Feature::Extendable::MainF17::Trigonometry
    )

    #$🌎 = self
  end

  💎.engine.warm_up

  # ---------------------------------------------------------------------------------------------------------- | *f28* |
  # TODO: create better solution than loading it here
  module ::Kernel

    # TODO: https://en.wikipedia.org/wiki/Golden_spiral
    # TODO: https://en.wikipedia.org/wiki/Polar_coordinate_system
    # TODO: https://en.wikipedia.org/wiki/Euler%27s_formula

    def ∅; ::Math::SetTheory::EmptySet.ℹ; end

    def 𝕚; ::Math::SetTheory::ImaginaryNumbers.ℹ; end

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
  end
  # | --------------------------------------------------------------------------------------------------------------------

}

END {
  💎.engine.cool_down
}
