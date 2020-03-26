# coding: UTF-8

module ::Ruuuby

  # to use: 'extend StaticAttributeSyntaxCache', NOT 'include StaticAttributeSyntaxCache'
  module StaticAttributeSyntaxCache

    def cache_fetch(cache_key)
      unless self.cached_syntax.∃🔑?(cache_key)
        🛑 RuntimeError.🆕("c{#{self.to_s}} has not defined sf{#{self.to_s}.gen_closed_match}") unless self.respond_to?(:cache_generate)
        self.cached_syntax[cache_key] = self.cache_generate(cache_key)
      end
      self.cached_syntax[cache_key]
    end

    # @return [Hash] the current collection of cached keys n vals (belonging to the the `Class-instance`, not instances of that `Class`)
    def cached_syntax ; @cached_syntax ||= {} ; end

  end


end
