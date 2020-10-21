# encoding: UTF-8

module ::Ruuuby::MetaData
  class RuuubyEngine

    module F22B06

      # @param [String] ruby_code
      #
      # @raise [ArgumentError]
      #
      # @return [String]
      def self.get_compiled_code(ruby_code)
        🛑str❓('ruby_code', ruby_code)
        ::RubyVM::InstructionSequence.compile(ruby_code).disassemble
      end
    end # end: {F22B06}

    # @return [Ruuuby::MetaData::RuuubyEngine::F22B06]
    def source; ::Ruuuby::MetaData::RuuubyEngine::F22B06; end

  end # end: {RuuubyEngine}
end
