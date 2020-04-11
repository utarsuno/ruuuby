# encoding: UTF-8

# `Ruuuby` ORM-attribute: `UID`
module ::Ruuuby

  # (not-final-design): ORM attributes that are re-usable amongst ORM-Classes (across categories/natural-groupings)
  module ORMAttribute

    # attributes that are to be extended, not included
    module Extendable

      # provides static-level abstraction to fetching & generating the `UID`
      module UID

        # @param [*] args
        #
        # @return [Object] instance of `ApplicationRecord`
        def find_by_uid(*args)
          result = self.generate_query_uid(*args).first
          🛑 RuntimeError.🆕("unable to find UID{#{args.to_s}}") if result == nil
          result
        end
      end
    end
  end
end

