# encoding: UTF-8

# mathematics related code
module ::Math

  # math related code that can be categorized under +Space+
  module Space

    class SymbolicNumbers < ::Math::Space::TypesSpaceⓣ¹

      module ContextStr
        refine ::String do

          def symbolic?
            case(self)
            when 'π', '𝚽'
              true
            else
              false
            end
          end

          def parse_symbolic_to_num
            case(self)
            when 'π'
              return ::Math::PI
            when '𝚽'
              return ::Float::RATIO_GOLDEN
            else
              raise "self{#{self.to_s}} is not symbolic"
            end
          end

        end
      end

      MAPPING = {
          ∞: ::Float::INFINITY,
          π: ::Math::PI,
          ℮: ::Math::E,
          𝚽: ::Float::RATIO_GOLDEN,
          Ⴔ: ::Math::ANGLE_GOLDEN,
          𝞽: ::Math::ANGLE_TAU,
          Ω: ::Float::CONST_OMEGA
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
          if SymbolicNumbers::MAPPING.∋?(as_sym)
            return SymbolicNumbers::MAPPING[as_sym]
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
              if SymbolicNumbers::MAPPING.∋?(as_sym)
                if char == '-'
                  return (-1.0 * SymbolicNumbers::MAPPING[as_sym])
                else
                  return SymbolicNumbers::MAPPING[as_sym]
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

      include ::Singleton

    end

  end

end
