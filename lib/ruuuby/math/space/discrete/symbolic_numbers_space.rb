# coding: UTF-8

# mathematics related
module ::Math

  # math related code that can be categorized under +Space+
  module Space

    class SymbolicNumbersSpace < ::Math::Space::TypesSpaceⓣ¹

      MAPPING = {
          ∞: ::Float::INFINITY,
          π: ::Math::PI,
          ℮: ::Math::E,
          𝚽: ::Float::RATIO_GOLDEN,
          Ψ: ::Float::RATIO_GOLDEN_SUPER,
          ρ: ::Float::RATIO_PLASTIC,
          δ: ::Float::RATIO_SILVER,
          Ⴔ: ::Math::ANGLE_GOLDEN,
          τ: ::Math::ANGLE_TAU,
          γ: ::Float::CONST_EULER_MASCHERONI,
          Ω: ::Float::CONST_OMEGA,
          ½: ::Float::ONE_HALF,
          ⅓: ::Float::ONE_THIRD,
          ⅔: ::Float::TWO_THIRDS,
          ¼: ::Float::ONE_FOURTH,
          ¾: ::Float::THREE_FOURTHS,
          ⅕: ::Float::ONE_FIFTH,
          ⅖: ::Float::TWO_FIFTHS,
          ⅗: ::Float::THREE_FIFTHS,
          ⅘: ::Float::FOUR_FIFTHS,
          ⅙: ::Float::ONE_SIXTH,
          ⅐: ::Float::ONE_SEVENTH,
          ⅛: ::Float::ONE_EIGHTH,
          ⅜: ::Float::THREE_EIGHTHS,
          ⅝: ::Float::FIVE_EIGHTHS,
          ⅞: ::Float::SEVEN_EIGHTHS,
          ⅑: ::Float::ONE_NINTH,
          ⅒: ::Float::ONE_TENTH,
      }

      def initialize
        @space_type     = 'types'
        @symbol         = :𝕊
        @num_dimensions = 1
      end

      def ∋?(n)
        if n.str?
          self._∋?(n)
        elsif n.sym?
          n == :∞ℂ
        else
          false
        end
      end

      def ∌?(n); !(self.∋?(n)); end

      def _∋?(n)
        self.parse(n)
        true
      rescue
        return false
      end

      def parse(n)
        if n.length == 1
          as_sym = n.to_sym
          if SymbolicNumbersSpace::MAPPING.∋?(as_sym)
            return SymbolicNumbersSpace::MAPPING[as_sym]
          else
            🛑 ArgumentError.new("𝕊 got invalid arg{#{n.to_s}} w/ type{#{b.Ⓣ}} for func{parse}")
          end
        elsif n.length == 2
          if n == '∞ℂ'
            return ::Float::INFINITY_COMPLEX
          else
            char = n[0]
            if char == '-' || char == '+'
              as_sym = n[1].to_sym
              if SymbolicNumbersSpace::MAPPING.∋?(as_sym)
                if char == '-'
                  return (-1.0 * SymbolicNumbersSpace::MAPPING[as_sym])
                else
                  return SymbolicNumbersSpace::MAPPING[as_sym]
                end
              else
                🛑 ArgumentError.new("𝕊 got invalid arg{#{n.to_s}} w/ type{#{b.Ⓣ}} for func{parse}")
              end
            end
            🛑 ArgumentError.new("𝕊 got invalid arg{#{n.to_s}} w/ type{#{b.Ⓣ}} for func{parse}")
          end
        else
          🛑 ArgumentError.new("𝕊 got invalid arg{#{n.to_s}} w/ type{#{b.Ⓣ}} for func{parse}")
        end
      end

      include ::Ruuuby::Attribute::Includable::RuuubySingleton

    end

  end

end
