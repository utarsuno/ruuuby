# encoding: UTF-8

using ::Math::Algebra::Tropical::ContextNumeric

module ::Math
  module Algebra
    module Tropical
      module ContextMatrix
        refine ::Matrix do

          # @note source-code heavily mimicked from `Matrix's` func{`+`}
          #
          # @return [Matrix] m
          def ⨁(m)
            🛑matrix❓('m', m)
            🛑 ::ExceptionForMatrix::ErrDimensionMismatch unless self.num_rows == m.num_rows && self.num_cols == m.num_cols
            rows = ::Array.new(self.num_rows) {|i|
              ::Array.new(self.num_cols) {|j|
                self[i, j].⨁(m[i, j])
              }
            }
            self.new_matrix(rows, m.num_cols)
          end

          # @param [Matrix] m
          #
          # @raise [ArgumentError, ::ExceptionForMatrix::ErrDimensionMismatch]
          #
          # @return [Matrix] self
          def ⨁!(m)
            🛑matrix❓('m', m)
            🛑 ::ExceptionForMatrix::ErrDimensionMismatch unless self.num_rows == m.num_rows && self.num_cols == m.num_cols
            self.∀ₓᵢⱼ{|x,i,j| self[i,j] = x.⨁(m[i,j])}
          end

          # @param [Integer] n
          #
          # @raise [ArgumentError]
          #
          # @return [Matrix]
          def ⨂ⁿ(n)
            🛑int❓('n', n)
            🛑 ::ArgumentError.new("| func{⨂ⁿ} expected arg(n) to have value >= 2, instead received value{#{n.to_s}} |") unless n >= 2
            i      = 2
            result = self.⨂(self)
            while i < n
              prev   = result
              result = self.⨂(prev)
              i += 1
            end
            result
          end

          # @note source-code heavily mimicked from `Matrix's` func{`*`}
          #
          # @param [Matrix, Numeric, Integer, Float] m
          #
          # @return [Matrix] m
          def ⨂(m)
            if m.num?
              return m.⨂(self)
            end
            🛑matrix❓('m', m)
            🛑 ::ExceptionForMatrix::ErrDimensionMismatch if self.num_cols != m.num_rows
            rows = ::Array.new(self.num_rows) {|i|
              ::Array.new(m.num_cols) {|j|
                chunks = []
                (0...self.num_cols).each do |c|
                  curr_val = self[i, c]
                  val_them = m[c, j]
                  chunks << curr_val.⨂(val_them)
                end
                local_sums = []
                chunks.∀τ²∈λ𝑓₍ᵢ،ᵢ₊₁₎{|prev, curr| local_sums << prev.⨁(curr)}
                local_sums.max
              }
            }
            self.new_matrix(rows, m.num_cols)
          end

        end # end: {refine ::Matrix}
      end # end: {ContextMatrix}
    end # end: {Tropical}
  end # end: {Algebra}
end # end: {Math}
