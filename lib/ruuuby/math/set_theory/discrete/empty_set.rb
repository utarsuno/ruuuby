# encoding: UTF-8

# mathematics related code
module ::Math

  # math related code that can be categorized under +SetTheory+
  module SetTheory

    # aliased by{+∅+}
    class EmptySet < ::Math::SetTheory::NumberSet
      include ::Singleton

      def initialize; super(:∅, 0); end

      # @param [*] n
      #
      # @return [Boolean]
      def ∋?(n); false; end

      # @param [*] s
      #
      # @return [Boolean] false (always)
      def ⊂?(s); false; end

      # @param [*] s
      #
      # @return [Boolean] true (always)
      def ⊆?(s); s.symbol == self.symbol; end

      # @param [*] n
      #
      # @return [Boolean]
      def ⊃?(s); false; end

      # @param [*] s
      #
      # @return [Boolean] true (always)
      def ⊇?(s); s.symbol == self.symbol; end
    end
  end
end
