# encoding: UTF-8

module ::Ruuuby
  # information and utilities that define and work w/ aspects of `Ruuuby`
  module MetaData
    class RuuubyEngineComponent

      attr_reader :versionable

      # @param [*]       engine
      # @param [Boolean] versionable
      def initialize(engine, versionable=false)
        @engine      = engine
        @versionable = versionable
      end

    end
  end
end
