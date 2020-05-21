# coding: UTF-8

# mathematics related
module ::Math

  # math related code that can be categorized under +Space+
  module Space

    class NumberLikeSpace < ::Math::Space::TypesSpaceⓣ¹

      ALL_NUMS = [::Integer, ::Float, ::Complex, ::Rational, ::BigDecimal].❄️

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
