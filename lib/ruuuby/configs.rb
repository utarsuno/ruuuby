# encoding: UTF-8

# ------------------------------------------------------------------------------------------------------------ | *f23* |

BEGIN {

  # add these methods onto the `main` object (similar to adding methods to `Kernel`, but of smaller scope to avoid polluting other Classes)
  class << self
    include(
        ::Math::Trig
    )

    #$🌎 = self
  end

  💎.engine.warm_up

  # TODO: create better solution than loading it here
  module ::TTY
    class Command
      attribute_versionable('0.9.0'){::TTY::Command::VERSION}

      # @return [Boolean]
      def self.healthy?
        ::TTY::Command.record_separator == $/ && !::TTY::Command.windows? && ::TTY::Command.∃version?
      end
    end
  end

  # TODO: create better solution than loading it here
  module ::Kernel

    # @type [Float]
    Ω = ::Float::CONST_OMEGA

    # @return [Float]
    def ₑˆΩ; ::Float::E_POW_CONST_OMEGA; end

    # TODO: https://en.wikipedia.org/wiki/Golden_spiral
    # TODO: https://en.wikipedia.org/wiki/Polar_coordinate_system
    # TODO: https://en.wikipedia.org/wiki/Euler%27s_formula

    # ---------------------------------------------------------------------------------------------------------- | *f28* |

    ℕ𝕌𝕃𝕃 = ::Math::SetTheory::NullSet.instance

    𝔹 = ::Math::SetTheory::BooleanNumbers.instance

    ℕ = ::Math::SetTheory::NaturalNumbers.instance

    𝕎 = ::Math::SetTheory::WholeNumbers.instance

    ℤ = ::Math::SetTheory::IntegerNumbers.instance

    ℚ = ::Math::SetTheory::RationalNumbers.instance

    𝔸ᵣ = ::Math::SetTheory::RealAlgebraicNumbers.instance

    𝔸 = ::Math::SetTheory::AlgebraicNumbers.instance

    ℂ = ::Math::SetTheory::ComplexNumbers.instance

    𝕋 = ::Math::GroupTheory::CircleGroup.instance

    𝕀 = ::Math::SetTheory::IrrationalNumbers.instance

    ℝ = ::Math::SetTheory::RealNumbers.instance

    𝕌 = ::Math::SetTheory::UniversalSet.instance

    # ---------------------------------------------------------------------------------------------------------- | *f06* |

    ::Kernel.const_set(:𝕊, ::Math::Space::SymbolicNumbersSpace.instance)

    ::Kernel.const_set(:🅱, ::Math::Space::BooleanSpace.instance)

    🙈

    def 🧬; ::Math::Space::NucleotideSpace.instance; end

    def 🔢; ::Math::Space::NumberSpace.instance; end

    def ∅; ::Math::SetTheory::EmptySet.instance; end

    def 𝕚; ::Math::SetTheory::ImaginaryNumbers.instance; end
  end
  # | --------------------------------------------------------------------------------------------------------------------

  # TODO: temporary code & design

  f10_configs = ENV['RUUUBY_F10']
  f12_configs = ENV['RUUUBY_F12']
  f26_configs = ENV['RUUUBY_F26']

  unless f10_configs.∅?
    if f10_configs.include?('b03')
      ::Method.alias_method :🏠, :source_location
    end
  end

  unless f12_configs.∅?
    if f12_configs.∋?('b00')
      module ::Kernel
        private
        # @return [::File]
        def 📁; ::File; end
        # @return [::Dir]
        def 🗄️; ::Dir; end
      end
    end
  end

  unless f26_configs.∅?
    if f26_configs.∋?('b00')
      module ::Kernel
        private
        # @return [::Date]
        def 📅; ::Date; end
        # @return [::Time]
        def 🕒; ::Time; end
        # @return [::DateTime]
        def 📅🕒; ::DateTime; end
      end
    end
  end

}

END {
  💎.engine.cool_down
}
