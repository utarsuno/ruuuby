# encoding: UTF-8

# mathematics related code
module ::Math

  # math related code that can be categorized under +SetTheory+
  module SetTheory

    # number groupings
    class NumberSet < ::Math::SetTheory::Closure

      attr_reader :name, :symbol, :𝔠

      # @see https://en.wikipedia.org/wiki/Aleph_number
      module AlephNumbers
        # cardinality of the natural-numbers(+ℕ+)
        #
        # @type [Symbol]
        ZERO = :ℵ₀

        # "cardinality of the set of all countable ordinal-numbers"
        #
        # @type [Symbol]
        ONE  = :ℵ₁

        # exact size is unknown but it is a finite integer > 0
        #
        # @type [Symbol]
        UNKNOWN_ℕ = :unknown_ℕ
      end

      # @param [Symbol]                    symbol
      # @param [Integer, NilClass, Symbol] cardinality
      def initialize(symbol, cardinality)
        🛑sym❓(:symbol, symbol)
        @name        = self.Ⓣ.♻️⟶∞('::').to_🐍.gsub('_', ' ')
        @symbol      = symbol
        @𝔠           = cardinality
        @subset_of   = []
        @superset_of = []
      end

      # ----------------------------------------------------------------------------------------------------------------
      #        ___        __   ___  __   __          __      __        ___  __        __
      #  |\/| |__   |\/| |__) |__  |__) /__` |__| | |__)    /  ` |__| |__  /  ` |__/ /__`
      #  |  | |___  |  | |__) |___ |  \ .__/ |  | | |       \__, |  | |___ \__, |  \ .__/
      # ----------------------------------------------------------------------------------------------------------------

      def ∋?(n)
        if n.num?
          self._∋?(n)
        else
          false
        end
      end

      def ∌?(n); !(self.∋?(n)); end

      # ----------------------------------------------------------------------------------------------------------------
      #  __        __   __   ___ ___   /  __        __   ___  __   __   ___ ___
      # /__` |  | |__) /__` |__   |   /  /__` |  | |__) |__  |__) /__` |__   |
      # .__/ \__/ |__) .__/ |___  |  /   .__/ \__/ |    |___ |  \ .__/ |___  |
      # ----------------------------------------------------------------------------------------------------------------

      # proper subset?
      #
      # @param [*]
      #
      # @return [Boolean]
      def ⊂?(s)
        🛑 RuntimeError.new("c{#{self.Ⓣ}}-> m{⊂?} requires arg of type{NumberSet}, not the provided type{#{s.Ⓣ}}") unless s.is_a?(::Math::SetTheory::NumberSet)
        if s.symbol == :∅
          false
        else
          s.⊃?(self)
        end
      end

      # subset?
      #
      # @param [*]
      #
      # @return [Boolean]
      def ⊆?(s)
        🛑 RuntimeError.new("c{#{self.Ⓣ}}-> m{⊆?} requires arg of type{NumberSet}, not the provided type{#{s.Ⓣ}}") unless s.is_a?(::Math::SetTheory::NumberSet)
        if s.symbol == :∅
          false
        else
          s.⊇?(self)
        end
      end

      # proper subset?
      #
      # @param [*]
      #
      # @return [Boolean]
      def ⊃?(s)
        🛑 RuntimeError.new("c{#{self.Ⓣ}}-> m{⊃?} requires arg of type{NumberSet}, not the provided type{#{s.Ⓣ}}") unless s.is_a?(::Math::SetTheory::NumberSet)
        if s.symbol == :∅
          true
        elsif @symbol == s.symbol
          false
        else
          @superset_of.∋?(s.symbol)
        end
      end

      # subset?
      #
      # @param [*]
      #
      # @return [Boolean]
      def ⊇?(s)
        🛑 RuntimeError.new("c{#{self.Ⓣ}}-> m{⊇?} requires arg of type{NumberSet}, not the provided type{#{s.Ⓣ}}") unless s.is_a?(::Math::SetTheory::NumberSet)
        if s.symbol == :∅
          true
        elsif @symbol == s.symbol
          true
        else
          @superset_of.∋?(s.symbol)
        end
      end

      # not subset?
      #
      # @param [*]
      #
      # @return [Boolean]
      def ⊅?(s); !(self.⊃?(s)); end

      # not subset?
      #
      # @param [*]
      #
      # @return [Boolean]
      def ⊄?(s); !(self.⊂?(s)); end

      # ----------------------------------------------------------------------------------------------------------------
      #  __   __   __   __   ___  __  ___    ___  __
      # |__) |__) /  \ |__) |__  |__)  |  | |__  /__`
      # |    |  \ \__/ |    |___ |  \  |  | |___ .__/
      # ----------------------------------------------------------------------------------------------------------------

      # @return [Boolean]
      def finite?; (@𝔠.int? || @𝔠 == ::Math::SetTheory::NumberSet::AlephNumbers::UNKNOWN_ℕ); end

      # @return [Boolean]
      def countable?; (self.countably_infinite? || self.finite?); end

      # @return [Boolean]
      def countably_infinite?; @𝔠 == ::Math::SetTheory::NumberSet::AlephNumbers::ZERO; end

      # @return [Boolean]
      def uncountable?; (@𝔠 == ::Math::SetTheory::NumberSet::AlephNumbers::ONE || @𝔠 == nil); end
    end

  end
end
