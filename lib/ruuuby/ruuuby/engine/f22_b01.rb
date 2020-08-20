# encoding: UTF-8

module ::Ruuuby
  module MetaData
    class RuuubyEngine

      # @see https://ruby-doc.org/core-2.7.0/RubyVM/MJIT.html
      module F22B01

        # @return [Boolean]
        def self.enabled?; ::RubyVM::MJIT.enabled?; end

        # @return [Boolean]
        def self.pause; ::RubyVM::MJIT.pause; end

        # @return [Boolean]
        def self.resume; ::RubyVM::MJIT.resume; end
      end # end: {F22B01}

      # @return [Ruuuby::MetaData::RuuubyEngine::F22B01]
      def jit; ::Ruuuby::MetaData::RuuubyEngine::F22B01; end
    end
  end
end
