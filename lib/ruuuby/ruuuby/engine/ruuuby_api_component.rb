# encoding: UTF-8

module ::Ruuuby
  # information and utilities that define and work w/ aspects of `Ruuuby`
  module MetaData
    class RuuubyAPIComponent < ::Ruuuby::MetaData::RuuubyEngineComponent

      # @param [*] engine
      def initialize(engine)
        super(engine, true)
        @cached_version = ''
      end

      def get_version
        if @cached_version == ''
          @cached_version = self._calculate_version
        end
        @cached_version
      end

    end
  end
end
