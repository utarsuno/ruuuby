# encoding: UTF-8

# `Ruuuby` aliases & function additions to existing Class{+Vector+}
class ::Vector

  # @return [Boolean]
  def ∅?; self.size.zero?; end

  module ContextParamChecks
    refine ::Object do
      def 🛑vec❓(arg_name, arg); 🛑 ::ArgErr.new(self, arg_name.to_s, arg, 'Vec') unless arg.vec?; end
    end
  end

end
