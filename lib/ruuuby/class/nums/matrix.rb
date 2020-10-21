# encoding: UTF-8

#using ::Math::Algebra::Tropical::ContextNumeric
#using ::Math::Algebra::Tropical::ContextMatrix

# `Ruuuby` aliases & function additions to existing Class{+Matrix+}
class ::Matrix

  module ContextParamCheck
    refine ::Object do
      # @param [String, Symbol] arg_name
      # @param [*]              arg
      #
      # @raise [ArgumentError]
      def 🛑matrix❓(arg_name, arg); 🛑 ::ArgErr.new(self, arg_name.to_s, arg, 'Matrix') unless arg.matrix?; end
    end
  end

  alias_method :▣?, :square?
  alias_method :ᵀ, :transpose
  alias_method :num_rows, :row_count
  alias_method :num_cols, :column_count

  # @return [Enumerator]
  def ∀ₓ↘(&block)
    🛑 ::ExceptionForMatrix::ErrDimensionMismatch unless self.▣?
    self.each(:diagonal, &block)
  end

  # @return [Enumerator]
  def ∀ₓᵢ↘(&block)
    🛑 ::ExceptionForMatrix::ErrDimensionMismatch unless self.▣?
    self.each_with_index(:diagonal, &block)
  end

  # @return [Array] the diagonal of this matrix
  def ↘_to_a; self.∀ₓ↘.to_a; end

  # @return [Enumerator]
  def ∀ₓᵢⱼ(&block); self.each_with_index(:all, &block); end

end
