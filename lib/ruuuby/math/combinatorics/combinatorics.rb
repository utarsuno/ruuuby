# encoding: UTF-8

# mathematics related code
module ::Math::Combinatorics

  # equations within +Combinatorics+ that involve 1-input (belonging to the `whole-numbers`)
  module 𝕎¹

    # @param [Integer] n
    #
    # @raise [ArgumentError] if `n` is not ∈ 𝕎
    #
    # @return [Integer]
    def self.len_powerset(n: 0)
      🛑int❓(:n, n, :∈𝕎)
      2 ** n
    end

  end # end: {𝕎¹}

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

    # @param [Numeric] n | sample_size
    # @param [Numeric] k | number_of_items
    #
    # @raise [ArgumentError] if `n` or `k` are not ∈ 𝕎
    #
    # @return [Integer]
    def self.len_ordered_with_replacement(n: 0, k: 0)
      🛑nums❓([n, k], :∈𝕎)
      n ** k
    end

  end # end: {𝕎²}

  # ===================================================================
  #  ___     ___  ___       __     __           ___            __   __
  # |__  \_/  |  |__  |\ | /__` | /  \ |\ |    |__  |  | |\ | /  ` /__`
  # |___ / \  |  |___ | \| .__/ | \__/ | \|    |    \__/ | \| \__, .__/
  # ===================================================================

  # static-func:
  #  choose(n, k) --> # of combinations (unordered subsets)
  #  permutations(n, k) --> # of permutations w/ `n` elements is `n!`

end

# TODO: https://en.wikipedia.org/wiki/Catalan_number
