# encoding: utf-8

# add various functions to existing class +Set+ (and explicitly create aliases to play nice with IDEs)
class ::Set
  alias_method :∅?, :empty?
  alias_method :∀, :each
  alias_method :∋?, :include?

  # removes all elements for this set that have func{∅?} and respond true
  #
  # @return [Set] this same set instance, potentially with modifications
  def remove_empty!
    return self if self.∅?
    self.keep_if{ |x| !x.respond_to?(:∅?) || !x.∅? }
    self
  end
end
