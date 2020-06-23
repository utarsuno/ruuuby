# encoding: UTF-8

class ::ThetaAngle

  module Syntax
    #  # @type [String]
    #  TRIGONOMETRIC_ANGLE = '(\d+)?π(/\d+)?'.❄️

    # | `degree`    | `°`  |
    # | `arcminute` | `'`  |
    # | `arcsecond` | `''` |
    #
    # (ex: `3°7'30''` == `3 + 7/60 + 30/3600` == `3.125°`)
    #
    # preserved-previous-solution: '[-]?\d+(.\d+)?(( )?(°|θ|degrees|dgr|°θ))?'.❄️
    #
    # @type [String]
    FORMAT_DGR = '([-]?\d+(.\d+)?(( )?(°|θ|degrees|dgr|°θ))?)?(( )?(\d+\'))?(( )?(\d+\'\'))?'.❄️

    # 1 rad = 10^3 mrad = 10^6 urad

    ❄️
  end

  include ::Ruuuby::Attribute::Includable::SyntaxCache

  module ContextStrParsing

    refine ::String do

      # @return [Boolean]
      def °?; self.∅? ? false : ::ThetaAngle.syntax_format_dgr.match?(self); end

      # @raise [RuntimeError]
      #
      # @return [Float]
      def °
        🛑 RuntimeError.new("| c{String}-> m{°} called but self{#{self.to_s}} is not in format{degree} |") unless self.°?
        if self.∋?("''")
          temp = self.♻️⟵("''")
          if temp.∋?("'")
            arc_second = temp[temp.index("'") + 1, temp.length].strip.to_f
            temp = temp.♻️⟵("'")
            if temp.∋?("°")
              arc_minute = temp[temp.index('°') + 1, temp.length].strip.to_f
              temp    = temp.♻️⟵("°")
              degrees = temp.strip.to_f
              if degrees < 0
                arc_second *= -1
                arc_minute *= -1
              end
              return degrees + (arc_minute / 60.0) + (arc_second / 3600.0)
            else
              arc_minute = temp.strip.to_f
              return (arc_minute / 60.0) + (arc_second / 3600.0)
            end
          elsif temp.∋?("°")
            arc_second = temp[temp.index("°") + 1, temp.length].strip.to_f
            temp       = temp.♻️⟵("°")
            degrees    = temp.strip.to_f
            if degrees < 0
              arc_second *= -1
            end
            return degrees + (arc_second / 3600.0)
          else
            arc_second = temp.strip.to_f
            return arc_second / 3600.0
          end
        elsif self.∋?("'")
          temp = self.♻️⟵("'")
          if temp.∋?('°')
            arc_minute = temp[temp.index('°') + 1, temp.length].strip.to_f
            temp    = temp.♻️⟵('°')
            degrees = temp.strip.to_f
            if degrees < 0
              arc_minute *= -1
            end
            return degrees + (arc_minute / 60.0)
          else
            arc_minute = temp.strip.to_f
            return arc_minute / 60.0
          end
        elsif self.∋?('°')
          self.♻️⟵('°').to_f
        elsif self.∋?('d')
          self.♻️⟵('d').to_f
        elsif self.∋?('θ')
          self.♻️⟵('θ').to_f
        else
          self.to_f
        end
      end

    end # end: {refine ::String do}

  end

end
