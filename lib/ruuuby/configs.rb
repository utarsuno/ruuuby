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

    const_set(:🅱, ::Math::Space::BooleanLikeSpace.ℹ)

    def 🧬; ::Math::Space::NucleotideLikeSpace.ℹ; end

    def 🔢; ::Math::Space::NumberLikeSpace.ℹ; end

    # a∶b = (a+b)∶a
    # a∶b = (1+b/a)∶1
    #
    # the only positive solution to: x² = x + 1
    #
    # @type [Float]
    𝚽 = ::Float::GOLDEN_RATIO

    # the only real solution to: x³ = x² + 1
    #
    # @type [Float]
    Ψ = ::Float::SUPER_GOLDEN_RATIO

    # @type [Float]
    Ω = ::Float::OMEGA_CONSTANT

    # TODO: https://en.wikipedia.org/wiki/Golden_spiral
    # TODO: https://en.wikipedia.org/wiki/Polar_coordinate_system
    # TODO: https://en.wikipedia.org/wiki/Euler%27s_formula

    # the only real solution to: x³ = x + 1
    #
    # @return [Float]
    def ρ; ::Float::PLASTIC_RATIO; end

    # a∶b = (2a+b)∶a  ≡ δ
    # a∶b = (2+b/a)∶1 ≡ δ
    #
    # δ = 2 + 1/δ
    #
    # @return [Float]
    def δ; ::Float::SILVER_RATIO; end

    # let `a+b = circumference of a circle`, (a+b)/a = a/b; (a->longer_arc, b->smaller_arc)
    #
    # @type [ThetaAngle]
    Ⴔ = ::Math::ANGLE_GOLDEN

    # a full rotation around the circle, base representation in turns(+θτ+)
    #
    # @type [ThetaAngle]
    def τ; ::Math::ANGLE_TAU; end

    # TODO: CREATE DIVIDER / ORGANIZATION HERE!

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

    𝕀 = ::Math::SetTheory::IrrationalNumbers.ℹ

    ℝ = ::Math::SetTheory::RealNumbers.ℹ

    𝕌 = ::Math::SetTheory::UniversalSet.ℹ
  end
  # | --------------------------------------------------------------------------------------------------------------------

}

END {
  💎.engine.cool_down
}
