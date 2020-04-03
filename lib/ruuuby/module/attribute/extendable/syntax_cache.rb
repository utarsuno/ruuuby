# coding: UTF-8

# `Ruuuby` attribute: `SyntaxCache`
module ::Ruuuby

  # (not-final-design): attributes that are re-usable amongst Classes (across categories/natural-groupings)
  module Attribute

    # attributes that are to be extended, not included
    module Extendable

      # provide functionality to automatically apply the Class-attribute: `SyntaxCache`
      module SyntaxCache

        def cache_warmup(kclass)
          local_syntax = kclass::Syntax
          all_consts   = local_syntax.constants

          all_consts.each do |c|
            constant_name = c.⬇

            unless constant_name.start_with?('sql_')
              kclass.define_singleton_method("syntax_#{constant_name}") do
                kclass.cache_fetch(local_syntax.const_get(c))
              end
            end
          end
        end

        # provide a default implementation
        #
        # @return [*]
        def cache_generate(cache_key) ; ::Regexp.gen_closed_match(cache_key) ; end

        def cache_fetch(cache_key)
          unless self.cached_syntax.∃🔑?(cache_key)
            #🛑 RuntimeError.🆕("c{#{self.to_s}} has not defined sf{#{self.to_s}.cache_generate}") unless self.respond_to?(:cache_generate)
            self.cached_syntax[cache_key] = self.cache_generate(cache_key)
          end
          self.cached_syntax[cache_key]
        end

        # @return [Hash] the current collection of cached keys n vals (belonging to the the `Class-instance`, not instances of that `Class`)
        def cached_syntax ; @cached_syntax ||= {} ; end

      end

    end

  end


end
