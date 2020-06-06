# coding: UTF-8

# mathematics related code
module ::Math

  # code representations of mathematical expressions
  module Expr

    # TODO: MISSING TDD!!!!
    # TODO: look into {Enumerator::ArithmeticSequence} first
    class Sequence

      attr_reader :input_type

      def initialize(input_type, early_cache=[])
        @input_type = input_type
        @cached     = early_cache
        if @cached.∅?
          @max_cache_index = 1
        else
          @max_cache_index = @cached.length - 1
        end
      end

      def ∋?(n)
        🛑num❓(:n, n, @input_type)
        if @cached.∋?(n)
          true
        else
          self._∋?(n.to_i)
        end
      end

      def [](index)
        🛑num❓(:index, index, :∈𝕎)
        if index <= @max_cache_index
          if @cached.∅? && @max_cache_index != -1
            self.populate_cache
          end
          @cached[index]
        else
          self.calculate_value_at(index)
        end
      end

      def ∀ₓᵢ(max_i)
        i = 0
        while i < max_i
          yield self[i], i
          i += 1
        end
      end

      def ∀ₓ(max_i)
        i = 0
        while i < max_i
          yield self[i]
          i += 1
        end
      end

      def A∀ₓ(max_x)
        last_x = -1
        curr   = self[0]
        index  = 0
        while last_x < max_x
          index += 1
          prev = curr
          curr = self[index]

          if curr >= max_x
            return
          else
            last_x = curr
            ((prev + 1)..(curr - 1)).∀ do |val|
              yield val
            end

          end
        end
      end

      🙈

      def calc_val_at(n)
        🛑num❓(:n, n, @input_type)
        self.calculate_value_at(n)
      end

      def populate_cache
        i = 0
        while i <= @max_cache_index
          @cached[i] = self.calculate_value_at(i)
          i += 1
        end
      end

    end

  end

end

