# encoding: UTF-8

# `Ruuuby` modifications to existing Class{+String+}
class ::String
  module ContextF24
    refine ::String do
      # @return [Boolean] true, if this String's content's syntax match camel-case
      def 🐫?; self.match?(::String.syntax_case_camel); end

      # @return [Boolean] true, if this String's content's syntax match camel-case-lower
      def 🐫⬇?; self.match?(::String.syntax_case_lower_camel); end

      # @return [Boolean] true, if this String's content's syntax match snake-case-upper
      def 🐍⬆?; self.match?(::String.syntax_case_upper_snake); end

      # @return [Boolean] true, if this String's content's syntax match snake-case
      def 🐍?; self.match?(::String.syntax_case_snake); end

      # @raise [Ruuuby::DescriptiveStandardError]
      #
      # @return [String]
      def to_🐫⬇; as_camel = self.to_🐫; as_camel[0].⬇ + as_camel[1...as_camel.length]; end

      # @raise [Ruuuby::DescriptiveStandardError]
      #
      # @return [String]
      def to_🐍⬆; self.to_🐍.⬆; end

      # @raise [Ruuuby::DescriptiveStandardError]
      #
      # @return [String]
      def to_🐍
        if self.🐍⬆?
          self.⬇
        elsif self.🐫? || self.🐫⬇?
          chars = ''
          self.each_char do |c|
            if c.⬆?
              if chars.∅?
                chars << "#{c.⬇}"
              else
                chars << "_#{c.⬇}"
              end
            else
              chars << c
            end
          end
          chars
        elsif self.🐍?
          self
        else
          🛑 ::Ruuuby::DescriptiveStandardError.new(self, "which is not in one of the formats: [🐫, 🐫⬇, 🐍⬆, 🐍]")
        end
      end

      # @raise [Ruuuby::DescriptiveStandardError]
      #
      # @return [String]
      def to_🐫
        chars = ''
        mark  = true
        if self.🐍⬆?
          self.each_char do |c|
            if c == '_'
              mark = true
            elsif mark
              chars << c
              mark = false
            else
              chars << c.downcase
            end
          end
          chars
        elsif self.🐍?
          self.each_char do |c|
            if c == '_'
              mark = true
            elsif mark
              mark = false
              chars << c.upcase
            else
              chars << c
            end
          end
          chars
        elsif self.🐫?
          self
        elsif self.🐫⬇?
          self[0].upcase + self[1...self.𝔠]
        else; 🛑 ::Ruuuby::DescriptiveStandardError.new(self, "which is not in one of the formats: [🐫, 🐫⬇, 🐍⬆, 🐍]"); end
      end
    end
  end
end
