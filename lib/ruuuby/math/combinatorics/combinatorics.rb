# coding: UTF-8

# mathematics related code
module ::Math

  module Combinatorics

    # equations within +Combinatorics+ that involve 2-inputs (with both belonging to the `whole-numbers`)
    module 𝕎²

      # "there are n_choose_k ways to choose an (unordered) subset of K elements from a fixed set of N elements"
      #
      # @param [Numeric] n
      # @param [Numeric] k
      #
      # @raise [ArgumentError] if `n` or `k` are not ∈ 𝕎
      #
      # @return [Integer]
      def self.choose(n: 0, k: 0)
        🛑nums❓([n, k], :∈𝕎)
        ::Math::Combinatorics.n_choose_k(n.to_i, k.to_i)
      end

    end

    # ===================================================================
    #  ___     ___  ___       __     __           ___            __   __
    # |__  \_/  |  |__  |\ | /__` | /  \ |\ |    |__  |  | |\ | /  ` /__`
    # |___ / \  |  |___ | \| .__/ | \__/ | \|    |    \__/ | \| \__, .__/
    # ===================================================================

    # static-func:
    #  choose(n, k) --> # of combinations (unordered subsets)
    #  permutations(n, k) --> # of permutations w/ `n` elements is `n!`

  end

end

# TODO: https://en.wikipedia.org/wiki/Catalan_number

