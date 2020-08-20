# encoding: UTF-8

module ::Ruuuby

  # | term                    | definition                                                           |
  # | ----------------------- | ------------------------------------------------------------------- |
  # | `admissible`            | a function that "never overestimates the cost of reaching the goal" |
  # | `consistent`/`monotone` | in context of path-finding, a function whose "estimate is always less than or equal to the estimated distance from any neighbouring vertex to the goal, plus the cost of reaching that neighbour" |
  module Heuristics

    module ContextParsingCommandOutput

      refine ::Array do

        # @return [Boolean]
        def all_str?; self.∀{|element| return false unless element.str?}; return true; end

        def clean
          if self.length == 1
            if self[0].str?
              return self[0].clean
            else
              return self[0]
            end
          else
            if self.all_str?
              results = []
              self.∀ do |element|
                e = element.clean
                unless e.∅? || e == $/
                  results << e
                end
              end
              return results
            else
              self
            end
          end
        end

      end # end: {refine{Array}}
    end

  end
end

using ::Ruuuby::Heuristics::ContextParsingCommandOutput

module ::Ruuuby

  module Heuristics

    module ContextParsingCommandOutput

      refine ::String do

        def clean
          if self.∋?($/)
            out = self.strip.split($/)
            return out.clean
          else
            return self
          end
        end

      end # end: {refine{String}}

    end
  end
end


# resources
# 0x0) https://en.wikipedia.org/wiki/Admissible_heuristic
# 0x1) https://en.wikipedia.org/wiki/Consistent_heuristic
