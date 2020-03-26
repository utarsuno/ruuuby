# encoding: UTF-8

# utilize class +ApplicationRecord+ as a location for any re-usable ORM functionality & abstraction
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  alias_method :♻️, :destroy
  alias_method :♻️!, :destroy!

  # provides abstraction to fetching & generating the `UID`
  module ORMAttributeUID

    # requires implementation of func{cache_calculate_uid}

    # @return [String]
    def uid ; @uid ||= self.cache_calculate_uid ; end

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
        🛑 RuntimeError.🆕("unable to find UID{#{args.to_s}}") if result.nil?
        result
      end
    end
    # ------------------------------------------------------------------------
  end

  # provides abstraction to fetching & generating any needed `cache` for `ORM` performance
  module ORMAttributeCache
    # ------------------------------------------------------------------------

    # utilized to ensure `ORMStaticAttributeQueryCache` automatically gets extended by whomever is using `include ORMAttributeCache`
    def self.included(kclass)
      kclass.extend(Ruuuby::StaticAttributeSyntaxCache)
      kclass.extend(ORMStaticAttributeQueryCache)
    end

    # provides static-level abstraction to fetching & generating any needed `cache` for `ORM` performance
    module ORMStaticAttributeQueryCache

      # @param [String|Symbol] cache_key
      #
      # @return [*]
      def cache_generate(cache_key)
        ::Regexp.gen_closed_match(cache_key)
      end

    end
    # ------------------------------------------------------------------------
  end

end
