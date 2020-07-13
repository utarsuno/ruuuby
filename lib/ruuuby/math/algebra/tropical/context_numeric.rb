# encoding: UTF-8

module ::Math
  module Algebra

    # @see https://en.wikipedia.org/wiki/Tropical_geometry
    # @see https://en.wikipedia.org/wiki/Tropical_semiring
    # @see https://en.wikipedia.org/wiki/Algebraic_structure
    #
    # @note geometry aspects will not be primary focus in this module
    #
    # "the study of polynomials and their `geometric properties` when addition is replaced with minimization and multiplication is replaced with ordinary addition"
    #
    # ‣ standard multiplication{`*`} is transformed to{`⨂`}: `x ⨂ y = x + y`
    # ‣ standard addition(`+`) is transformed to{`⨁`} w/ 2 versions:
    #
    #     | name               | definition            | additive identity |
    #     | ------------------ | -------------------- | ----------------- |
    #     | `min-plus algebra` | `x ⨁ y = min{x, y}`  | `∞`              |
    #     | `max-plus algebra` | `x ⨁ y = max{x, y}`  | `−∞`             |
    #
    # ‣ "unit for ⨁ is +∞, and the unit for ⨂ is 0"
    # ‣ `tropical addition` is `commutative`: `∀ a,b ∈ ℝ max(a, b) = max(b, a)`
    # ‣ `tropical addition` is `associative`: `∀ a,b ∈ ℝ max(max(a, b), c) = max(max(a, c), b)`
    # ‣ `tropical multiplication` is `commutative` and `associative ∈ ℝ`
    # ‣ `tropical multiplication` is `distributive`
    # ‣ `additive inverse` DNE as ∀ element does not necessarily have a matching element that when summed, equal the `additive identity`
    #   ‣ (as -∞ is < ∀ element other than -∞; thus, won't be returned from func{`max`})
    #
    # ‣ "`eigenvalue-eigenvector` pair `λ` and `x` for a given matrix `A` satisfy the equation `Ax = λx` where `λ ∈ ℝ, A ∈ ℝⁿˣⁿ`, and `x ∈ ℝⁿ`"
    #
    # ‣ `normalized weight of a cycle` = `sum of edge weights` / `number of edges`
    #
    # ‣ `tropical algebra` is a `semi-ring`
    #   ‣ "given by `(ℝᴹᴬˣ,⨁,⨂) where ℝᴹᴬˣ = ℝ∪{−∞}`"
    module Tropical
      module ContextNumeric
        refine ::Numeric do

          # @param [Integer, Float] m
          #
          # @return [ArgumentError]
          #
          # @return [Integer, Float]
          def ⨁(m)
            🛑num❓('m', m)
            self >= m ? self : m
          end

          # @param [Integer, Float, Numeric, Matrix] m
          #
          # @return [ArgumentError]
          #
          # @return [Integer, Float]
          def ⨂(m)
            if m.matrix?
              rows = ::Array.new(m.num_rows) {|i|
                ::Array.new(m.num_cols) {|j|
                  m[i, j] + self
                }
              }
              ::Matrix[*rows]
            else
              🛑num❓('m', m)
              self + m
            end
          end

        end # end: {refine ::Numeric}
      end # end: {module ContextNumeric}
    end # end: {module Tropical}
  end
end
