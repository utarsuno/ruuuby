# encoding: UTF-8

# utilize class +ApplicationRecord+ as a location for any re-usable ORM functionality & abstraction
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  alias_method :♻️, :destroy
  alias_method :♻️!, :destroy!

  # provides abstraction to fetching & generating the `UID`
  module ORMAttributeUID

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

    # ------------------------------------------------------------------------

    # utilized to ensure `ORMStaticAttributeUID` automatically gets extended by whomever is using `include ORMAttributeUID`
    def self.included(kclass) ; kclass.extend(ORMStaticAttributeUID) ; end

    # provides static-level abstraction to fetching & generating the `UID`
    module ORMStaticAttributeUID

      # @param [*] args
      #
      # @return [Object] instance of `ApplicationRecord`
      def find_by_uid(*args)
        result = self.generate_query_uid(*args).first
        🛑 RuntimeError.🆕("unable to find UID{#{args.to_s}}") if result == nil
        result
      end
    end
    # ------------------------------------------------------------------------
  end

end
