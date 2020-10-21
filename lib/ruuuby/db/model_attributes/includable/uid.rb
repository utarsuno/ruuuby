# encoding: UTF-8

# `Ruuuby` ORM-attribute: `UID`
module ::Ruuuby

  # (not-final-design): ORM attributes that are re-usable amongst ORM-Classes (across categories/natural-groupings)
  module ORMAttribute

    # attributes that are to be included, not extended
    module Includable

      # provides abstraction to fetching & generating the `UID`
      module UID

        # requires implementation of func{cache_calculate}

        # @return [String]
        def uid
          @uid ||= ''
          if @uid.∅?
            @uid = self.cache_calculate(:uid)
          end
          @uid
        end

        # @return [Array]
        def uid_components
          @uid_components ||= ''
          if @uid_components.∅?
            @uid_components = self.cache_calculate(:uid_components)
          end
          @uid_components
        end

        # automatically include & extend needed attributes for supporting UID
        #
        # @param [Class] kclass
        #
        # @return [Class]
        def self.included(kclass)
          kclass.include(::Ruuuby::Attribute::Includable::SyntaxCache)
            #kclass.extend(::Ruuuby::ORMAttribute::Extendable::UID)

          class << kclass
            # @param [*] args
            #
            # @return [Object] instance of `ApplicationRecord`
            def find_by_uid(*args)
              result = self.generate_query_uid(*args).first
              #result = self.generate_query_uid(*args).limit(1).first
              🛑 RuntimeError.new("unable to find UID{#{args.to_s}}") if result == nil
              result
            end

            alias_method :[], :find_by_uid
          end

        end
      end
    end
  end
end

