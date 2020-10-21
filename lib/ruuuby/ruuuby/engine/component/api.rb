# encoding: UTF-8

module ::Ruuuby
  # information and utilities that define and work w/ aspects of `Ruuuby`
  module MetaData
    class EngineComponentAPI < ::Ruuuby::MetaData::EngineComponent

      # @param [*] engine
      def initialize(engine)
        super(engine)
      end

      # @return [String]
      def version
        @cached_version = self._calculate_version if @cached_version.∅?
        @cached_version
      end

    end
  end
end
