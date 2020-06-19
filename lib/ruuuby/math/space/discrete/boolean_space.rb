# coding: UTF-8

# mathematics related code
module ::Math

  # math related code that can be categorized under +Space+
  module Space

    class BooleanSpace < ::Math::Space::TypesSpaceⓣ¹

      # common expressions or any sub-components needed for creating them (ex: for `Regular Expressions`)
      module Syntax

        # @type [String]
        FORMATS_TRUE  = '((1)|(1.0)|((Y(es|ES)?)|(y(es)?))|((T(rue|RUE)?)|(t(rue)?)))'.❄️

        # @type [String]
        FORMATS_FALSE = '((0)|(0.0)|((N(o|O)?)|(n(o)?))|((F(alse|ALSE)?)|(f(alse)?)))'.❄️

        # @type [String]
        FORMAT_ANY    = "((#{FORMATS_TRUE})|(#{FORMATS_FALSE}))".❄️

        ❄️
      end

      include ::Ruuuby::Attribute::Includable::SyntaxCache

      def initialize
        @space_type     = 'types'
        @symbol         = :🅱
        @num_dimensions = 1
      end

      def η̂!(n)
        if self.∋?(n)
          if n.bool?
            return n
          elsif n.int?
            return n.to_b
          elsif n.flt?
            if n.one?
              return true
            else
              return false
            end
          elsif n.str?
            return ::Math::Space::BooleanSpace.syntax_formats_true.match?(n)
          end
        else
          🛑 ::Ruuuby::DescriptiveStandardError.new(self, "arg(n) has val{#{n.to_s}} w/ type{#{n.Ⓣ}}")
        end
      end

      def ∋?(n)
        if n.bool?
          true
        elsif n == nil
          return true
        else
          case(n)
          when Integer, Float
            n.zero? || n.one?
          when String
            ::Math::Space::BooleanSpace.syntax_format_any.match?(n)
          else
            false
          end
        end
      end

      def ∌?(n); !(self.∋?(n)); end

      include ::Singleton

    end

  end

end
