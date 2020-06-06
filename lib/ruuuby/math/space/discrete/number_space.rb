# coding: UTF-8

# mathematics related code
module ::Math

  # math related code that can be categorized under +Space+
  module Space

    class NumberSpace < ::Math::Space::TypesSpaceⓣ¹

      # @type [Array]
      ALL_NUMS                   = [::Integer, ::Float, ::Complex, ::Rational, ::BigDecimal].❄️

      # @type [Array]
      NORMALIZERS_ALL_NUMS_W_STR = [:∈ℕ, :∈𝕎, :∈ℤ, :∈ℕ𝕊, :∈𝕎𝕊, :∈ℤ𝕊].❄️

      def initialize
        @space_type     = 'types'
        @symbol         = :🔢
        @num_dimensions = 1
      end

      def ∋?(n); n.num?; end

      def ∌?(n); !(self.∋?(n)); end

      include ::Ruuuby::Attribute::Includable::RuuubySingleton

    end

  end

end
