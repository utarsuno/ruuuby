# encoding: UTF-8

# add various aliases & functions to existing Class(+Array+)
class ::Array

  # ---------------------------------------------------------------------------------------------------------- | *f03* |
  alias_method :𝔠, :length
  # ---------------------------------------------------------------------------------------------------------- | *f08* |

  # @param [*]
  #
  # @return [Boolean] true, if this array ends with the provided elements
  def end_with?(*ending)
    return false if (ending.∅? || ending.𝔠 > self.𝔠)
    return self.last == ending[0] if (ending.𝔠 == 1)
    self.last(ending.𝔠) == ending
  end

  # @param [*]
  #
  # @return [Boolean] true, if this array starts with the provided elements
  def start_with?(*start)
    return false if (start.∅? || start.𝔠 > self.𝔠)
    return self.first == start[0] if (start.𝔠 == 1)
    self.first(start.𝔠) == start
  end

  # @param [*]
  #
  # @return [Array] this array instance, modified if not starting with provided starting elements
  def ensure_start!(*start)
    return self if (start.∅? || self.start_with?(*start))
    return self >> start[0] if (start.𝔠 == 1)
    delta        = 0
    last_matched = nil
    while delta <= self.𝔠 && delta <= start.𝔠
      ending_of_start = start[(start.𝔠 - (1 + delta))...start.𝔠]
      last_matched    = ending_of_start if self[0..delta] == ending_of_start
      delta          += 1
    end
    if last_matched == nil
      start.↩∀{|element| self >> element}
    else
      start[0...(start.𝔠 - (last_matched.𝔠))].↩∀{|element| self >> element}
    end
    self
  end

  # @param [*]
  #
  # @return [Array] this array instance, modified if not ending with provided endings elements
  def ensure_ending!(*ending)
    return self if (ending.∅? || self.end_with?(*ending))
    return self << ending[0] if (ending.𝔠 == 1)
    delta        = 0
    last_matched = nil
    while delta <= self.𝔠 && delta <= ending.𝔠
      starting_of_end = ending[0..delta]
      last_matched    = starting_of_end if self[(self.𝔠 - (1 + delta))...self.𝔠] == starting_of_end
      delta          += 1
    end
    if last_matched == nil
      ending.∀{|element| self << element }
    else
      ending[last_matched.𝔠...ending.𝔠].∀{|element| self << element}
    end
    self
  end

  # TODO: lots of feature-coverage to add
  #
  # @param [Symbol] normalization_opts
  #
  # @return [Array] self, modified if any normalization needed to occur
  def η̂!(normalization_opts)
    if ::Math::Space::NumberSpace::NORMALIZERS_ALL_NUMS_W_STR.∋?(normalization_opts)
      🛑nums❓(self, normalization_opts)
      self.∀ₓᵢ do |element, i|
        if element.num?(normalization_opts)
          if element.str?
            if element.to_num?
              self[i] = element.to_num
            else
              raise "normalizer{#{element.to_s}} can't be parsed as a number!"
            end
          end
        end
      end
    else
      raise "normalizer{#{normalization_opts.to_s}} is unknown"
    end
    self
  end

  # ---------------------------------------------------------------------------------------------------------- | *f09* |

  # Performs the relative complement (or set difference) of these two arrays, operation order/side does matter.
  #
  # @param [Array] them
  #
  # @raise [ArgumentError]
  #
  # @return [Array] a new Array instance containing the relative complement between this array and the one provided
  def ∖(them); 🛑ary❓('them', them); self - them; end

  alias_method(:∀, :each)
  alias_method(:∋?, :include?)

  alias_method :uniq_to_me, :∖

  # @param [Array] them
  #
  # @raise [ArgumentError]
  #
  # @return [Boolean] true, if both arrays are matching in contents, supports multiple types and without order mattering.
  def ≈≈(them)
    🛑ary❓('them', them)
    self.📊 == them.📊
  end

  alias_method :📊, :tally

  # TODO: organize later but Set and Array classes will perform this differently
  # Performs the symmetric difference (or disjunctive union) of these two arrays, operation order/side does not matter.
  #
  # @param [Array] them
  #
  # @raise [ArgumentError]
  #
  # @return [Array] a new Array instance containing the symmetric difference between this array and the one provided
  alias_method :⨁, :disjunctive_union

  # ---------------------------------------------------------------------------------------------------------- | *f04* |
  alias_method :∅?, :empty?
  # ---------------------------------------------------------------------------------------------------------- | *f10* |

  alias_method :↩, :reverse
  alias_method :↩!, :reverse!
  alias_method :↩∀, :reverse_each

  # | ------------------------------------------------------------------------------------------------------------------

  # @see source credit to: https://stackoverflow.com/questions/2149802/in-ruby-what-is-the-cleanest-way-of-obtaining-the-index-of-the-largest-value-in
  #
  # @return [Integer]
  def maxᵢ; each_with_index.max[1]; end

  # @raise [RuntimeError]
  def ∀𝚡λ𝑓🖨️
    🛑 ::RuntimeError.new('| c{Array}-> m{∀𝚡λ𝑓🖨️} called when self has a length of{0} |') if self.∅?
    self.∀{|content| puts content}
  end

  # @raise [RuntimeError]
  #
  # @return [Hash]
  def convert_to_json
    contents = {}
    self.∀ do |content|
      🛑str❓('content', content)
      if content.∋?('=')
        parsed      = content.split('=')
        the_value   = parsed[1]
        if the_value.in_quotes?
          the_value = the_value[1...(the_value.length - 1)]
        end
        contents[parsed[0]] = the_value
      else
        🛑 ::RuntimeError.new("| c{Array}-> m{convert_to_json} called when content{#{content.to_s}} did not contain char{=} |")
      end
    end
    contents
  end

end
