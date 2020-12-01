# encoding: UTF-8

module ::Math
  # math related code that can be categorized under +NumberTheory+
  module NumberTheory
    module ℤ³
      refine ::Integer do
        # @param [Integer, Numeric] b
        # @param [Integer]          mod (must not be 0)
        #
        # @raise [ArgumentError, DescriptiveStandardError]
        #
        # @return [Boolean] true, if `self ≡ b (mod c)`
        def ≡(b: ∞, mod: ∞)
          🛑num❓(:b, b, :∈ℤ)
          🛑 ::Ruuuby::DescriptiveStandardError.new(self, "provided param mod{#{mod.to_s}} was either non-int or equal to val{0}") unless (mod.int? && mod != 0)
          (self.modulo(mod)) == (b.modulo(mod))
        end
      end
    end
  end
end

using ::Math::NumberTheory::ℤ³

# @see: https://en.wikipedia.org/wiki/Number_theory
#
# vocab:
#  - | `ordinal numbers` | "is one generalization of the concept of a natural number that is used to describe a way to arrange a (possibly infinite) collection of objects in order, one after another" |
#
# math related code that can be categorized under +NumberTheory+
module ::Math::NumberTheory

  # ==extension funcs:
  #  - semiprime?
  #
  # equations within +NumberTheory+ that only involve 1-input (which belongs to the `natural-numbers`)
  module ℕ¹
    attribute_lazy_loadable('prime', false)

    # vocab:
    #  - prime number:        a natural-number that can't be created from the multiplication of other natural-numbers
    #  - factors:             the numbers multiplied together resulting in another number
    #  - prime factorization: process of finding the prime numbers which multiply to equal some original number
    #
    # "the decomposition of a `composite number` into a product of smaller integers"
    #
    # @example
    #   prime factors of 76 are: 2² x 19¹
    #   a = 76.prime_factors
    #   a == [[2, 2], [19, 1]]
    #
    # @param [Integer] n
    #
    # @raise [ArgumentError] if n is not ∈ ℕ
    #
    # @return [Array]
    def self.prime_factors(n)
      🛑num❓('n', n, :∈ℕ)
      self.ensure_lazy_loaded
      ::Prime.prime_division(n)
    end

    # @see http://rosettacode.org/wiki/Factors_of_an_integer#Using_the_prime_library
    #
    # @param [Integer] n
    #
    # @raise [ArgumentError] if n is not ∈ ℕ
    #
    # @return [Array]
    def self.divisors(n)
      🛑num❓('n', n, :∈ℕ)
      return [1] if 1 == n
      self.ensure_lazy_loaded
      primes, powers = ::Prime.prime_division(n).transpose
      ranges         = powers.map{|m| (0..m).to_a}
      ranges[0].product(*ranges[1..-1]).map{|es| primes.zip(es).map{|p,e| p**e}.reduce :*}.sort
    end

    # @param [Integer] n
    #
    # @raise [ArgumentError] if n is not ∈ ℕ
    #
    # @return [Array] the same result as +divisors+ but without `n` itself
    def self.proper_divisors(n)
      🛑num❓('n', n, :∈ℕ)
      if n == 1
        return []
      elsif n < 4
        return [1]
      else
        result = ::Math::NumberTheory::ℕ¹.divisors(n)
        result[0...-1]
      end
    end

    # @see https://oeis.org/A001065
    #
    # @param [Integer] n
    #
    # @raise [ArgumentError] if n is not ∈ ℕ
    #
    # @return [Integer, Numeric]
    def self.aliquot_sum(n)
      🛑num❓('n', n, :∈ℕ)
      ::Math::NumberTheory::ℕ¹.proper_divisors(n).sum
    end

    # @param [Integer] n
    #
    # @raise [ArgumentError] if n is not ∈ ℕ
    #
    # @return [Boolean]
    def self.perfect?(n); ::Math::NumberTheory::ℕ¹.aliquot_sum(n) == n; end

    # @param [Integer] n
    #
    # @raise [ArgumentError] if n is not ∈ ℕ
    #
    # @return [Boolean]
    def self.almost_perfect?(n); ::Math::NumberTheory::ℕ¹.divisors(n).sum == n * 2 - 1; end

    # @param [Integer] n
    #
    # @raise [ArgumentError] if n is not ∈ ℕ
    #
    # @return [Boolean]
    def self.abundant?(n); ::Math::NumberTheory::ℕ¹.aliquot_sum(n) > n; end

    # @param [Integer] n
    #
    # @raise [ArgumentError] if n is not ∈ ℕ OR n is not +abundant+
    #
    # @return [Integer, Numeric]
    def self.abundance(n)
      if ::Math::NumberTheory::ℕ¹.abundant?(n)
        ::Math::NumberTheory::ℕ¹.aliquot_sum(n) - n
      else
        🛑 ArgumentError.new("| m{NumberTheory::ℕ¹}-> m{abundance} received arg(n) w/ value{#{n.to_s}} which is not `abundant` |")
      end
    end

    # @param [Integer] n
    #
    # @raise [ArgumentError] if n is not ∈ ℕ OR n is not +abundant+
    #
    # @return [Rational]
    def self.abundancy_index(n)
      if ::Math::NumberTheory::ℕ¹.abundant?(n)
        Rational(::Math::NumberTheory::ℕ¹.aliquot_sum(n), n)
      else
        🛑 ArgumentError.new("| m{NumberTheory::ℕ¹}-> m{abundancy_index} received arg(n) w/ value{#{n.to_s}} which is not `abundant` |")
      end
    end

    # @see https://oeis.org/A005100
    #
    # @param [Integer] n
    #
    # @raise [ArgumentError] if n is not ∈ ℕ
    #
    # @return [Boolean]
    def self.deficient?(n); ::Math::NumberTheory::ℕ¹.aliquot_sum(n) < n; end

    # @param [Integer] n
    #
    # @raise [ArgumentError] if n is not ∈ ℕ OR n is not +deficient+
    #
    # @return [Integer, Numeric]
    def self.deficiency(n)
      if ::Math::NumberTheory::ℕ¹.deficient?(n)
        n - ::Math::NumberTheory::ℕ¹.aliquot_sum(n)
      else
        🛑 ArgumentError.new("| m{NumberTheory::ℕ¹}-> m{deficiency} received arg(n) w/ value{#{n.to_s}} which is not `deficient` |")
      end
    end

    # @param [Integer] n
    #
    # @raise [ArgumentError] if n is not ∈ ℕ OR n is not +deficient+
    #
    # @return [Boolean] true, if +n+ is neither +prime+ nor +1+
    def self.composite?(n)
      🛑num❓('n', n, :∈ℕ)
      if n < 4
        return false
      else
        self.ensure_lazy_loaded
        return !::Prime.prime?(n)
      end
    end

  end # end: {ℕ¹}

  # equations within +NumberTheory+ that only involve 1-input which ∈ 𝕎
  module 𝕎¹

    def self.nᵗʰ_euler_totient(n); ::Math::NumberTheory.nth_euler_totient(n); end

    def self.nᵗʰ_cototient(n)
      🛑num❓('n', n, :∈𝕎)
      n - ::Math::NumberTheory.nth_euler_totient(n)
    end

    # @param [Integer] n
    #
    # @raise [ArgumentError] if n is not ∈ 𝕎
    #
    # @return [Integer] summation of all digits, in base{10}, from `n`
    def self.digit_sum(n)
      🛑num❓('n', n, :∈𝕎)
      if n < 10
        return n
      else
        return n.digits.sum
      end
    end

    # @param [Integer] n
    #
    # @raise [ArgumentError] if n is not ∈ 𝕎
    #
    # @return [Integer] summation of all digits recursively until the summation is a single digit, in base{10}, from `n`
    def self.digital_root(n)
      🛑num❓('n', n, :∈𝕎)
      if n < 10
        return n
      else
        mod_9 = n.modulo(9)
        return mod_9 == 0 ? 9 : mod_9
      end
    end

    # @param [Integer] n
    #
    # @raise [ArgumentError] if n is not ∈ 𝕎
    #
    # @return [Integer] the number of +digit_sum+ iterations that func{+digital_root+} would perform for value `n`
    def self.additive_persistence(n)
      🛑num❓('n', n, :∈𝕎)
      if n < 10
        return 0
      elsif n < 19
        return 1
      else
        the_sum    = n.digits.sum
        iterations = 1
        while the_sum >= 10
          iterations += 1
          the_sum = the_sum.digits.sum
        end
        return iterations
      end
    end

    # -------------------------------------------------------------------------------------------- | *b03* | *f32* |
    @seq_pronic = ::Math::Expr::Sequence.new(:∈𝕎)
    @seq_pronic.define_singleton_method(:_∋?) do |n|
      x = ::Math.sqrt(n).to_i
      (x * (x + 1)) == n
    end
    @seq_pronic.define_singleton_method(:calculate_value_at){|n| n * (n + 1)}
    # -------------------------------------------------------------------------------------------- | *b04* | *f32* |
    @seq_square = ::Math::Expr::Sequence.new(:∈𝕎)
    @seq_square.define_singleton_method(:_∋?) do |n|
      # TODO: for when needed: there are many properties that can be checked for to avoid expensive operations (loops, math operations, overflow checks, etc)
      square_root = ::Math.sqrt(n)
      square_root - square_root.floor == 0
    end
    @seq_square.define_singleton_method(:calculate_value_at){|n| n * n}
    # -------------------------------------------------------------------------------------------- | *b05* | *f32* |
    @seq_fibonacci = ::Math::Expr::Sequence.new(:∈𝕎, [0, 1, 1, 2, 3])
    @seq_fibonacci.define_singleton_method(:_∋?){|n| ::Math::NumberTheory::𝕎¹.seq_square.∋?(5 * (n * n) + 4) || ::Math::NumberTheory::𝕎¹.seq_square.∋?(5 * (n * n) - 4)}
    @seq_fibonacci.define_singleton_method(:calculate_value_at){|n| (((::Float::RATIO_GOLDEN ** n) / ::Math.sqrt(5.0)) + 0.5).floor}
    @seq_fibonacci.define_singleton_method(:nᵗʰ_sum){|n| ::Math::NumberTheory::𝕎¹.seq_fibonacci[n + 2] - 1}
    @seq_fibonacci.define_singleton_method(:nᵗʰ_squared_sum){|n| ::Math::NumberTheory::𝕎¹.seq_fibonacci[n] * ::Math::NumberTheory::𝕎¹.seq_fibonacci[n + 1]}
    # -------------------------------------------------------------------------------------------- | *b06* | *f32* |
    @seq_lucas = ::Math::Expr::Sequence.new(:∈𝕎, [2, 1, 3])
    @seq_lucas.define_singleton_method(:A∀ₓ) do |max_n|
      🛑 NotImplementedError.new('todo =)!')
    end
    @seq_lucas.define_singleton_method(:_∋?) do |n|
      prev = 4
      if n < prev
        return false
      elsif n == prev
        return true
      end
      curr = 7
      if n < curr
        return false
      elsif n == curr
        return true
      end
      while curr < n
        temp = curr
        curr += prev
        prev = temp
        if curr == n
          return true
        elsif curr > n
          return false
        end
      end
    end
    @seq_lucas.define_singleton_method(:calculate_value_at){|n| ((::Float::RATIO_GOLDEN ** n) + (-0.618033988749895 ** n)).round}
    # -------------------------------------------------------------------------------------------- | *b07* | *f32* |
    @seq_triangle = ::Math::Expr::Sequence.new(:∈𝕎, [0, 1, 3])
    @seq_triangle.define_singleton_method(:_∋?) do |n|
      x = n * 8 + 1
      x.odd? && ::Math::NumberTheory::𝕎¹.seq_square.∋?(x)
    end
    @seq_triangle.define_singleton_method(:calculate_value_at){|n| ::Math::Combinatorics::𝕎².choose(n: n + 1, k: 2)}
    # -------------------------------------------------------------------------------------------- | *b08* | *f32* |
    @seq_hexagonal = ::Math::Expr::Sequence.new(:∈𝕎, [0, 1, 6, 15])
    @seq_hexagonal.define_singleton_method(:calculate_value_at){|n| n * (2 * n - 1)}
    @seq_hexagonal.define_singleton_method(:_∋?){|n| ::Math::NumberTheory::𝕎¹.seq_triangle.∋?(n)}
    @seq_hexagonal.define_singleton_method(:A∀ₓ) do |max_n|
      🛑 NotImplementedError.new('todo =)!')
    end
    # --------------------------------------------------------------------------------------------------------------
    class << self; attr_reader :seq_pronic, :seq_fibonacci, :seq_lucas, :seq_square, :seq_triangle, :seq_hexagonal; end
  end # end: {𝕎¹}

  # equations within +NumberTheory+ that involve 2-inputs (with both belonging to the `natural-numbers`)
  module ℕ²

    # @see https://en.wikipedia.org/wiki/Coprime_integers
    #
    # also referred to as `relatively-prime` and `mutually-prime`
    #
    # @note if a number `d` divides `(m * n)` and is coprime w/ `n`, then `d` divides `m`
    #
    # @param [Integer] a
    # @param [Integer] b
    #
    # @raise [ArgumentError] if a or b is not ∈ ℕ
    #
    # @return [Boolean] true, if `a` and `b` have a `greatest common divisor` of 1
    def self.coprime?(a, b); ::Math::NumberTheory::ℤ².gcd(a, b) == 1; end

    # @param [Integer] a
    # @param [Integer] b
    #
    # @raise [ArgumentError] if a or b is not ∈ ℕ
    #
    # @return [Boolean] true, if `a` and `b` have equal values for their `abundancy_index`
    def self.friendly?(a, b); ::Math::NumberTheory::ℕ¹.abundancy_index(a) == ::Math::NumberTheory::ℕ¹.abundancy_index(b); end

  end # end: {ℕ²}

  # equations within +NumberTheory+ that involve 2-inputs w/ ∀ input ∈ ℤ {functions w/ exceptions to this rule may exist}
  module ℤ²

    # for more information:
    # @see https://www.khanacademy.org/computing/computer-science/cryptography/modarithmetic/a/the-euclidean-algorithm
    # @see http://www.codecodex.com/wiki/Euclidean_algorithm
    # @see https://tutorialspoint.dev/algorithm/mathematical-algorithms/steins-algorithm-for-finding-gcd
    #
    # ‣ [associative law] | gcd(a,b,c) = gcd(a, gcd(b,c))
    # ‣ [               ] | `∀ a, gcd(a,0) = |a|`
    # ‣ [               ] | `∀ a, gcd(a,a) = |a|`
    #
    # @param [Integer] a
    # @param [Integer] b
    #
    # @raise [ArgumentError] if a or b is not ∈ ℤ
    #
    # @return [Integer]
    def self.gcd(a, b)
      🛑nums❓([a, b], :∈ℤ)
      a.to_i.gcd(b.to_i)
    end

  end # end: {ℤ²}

  # `::Math::NumberTheory::ℤ³`
  #
  # equations within +NumberTheory+ that involve 3-inputs w/ ∀ input ∈ ℤ {functions w/ exceptions to this rule may exist}
  module ℤ³

    # ‣ [reflexivity]   | `a ≡ a (mod c)`
    # ‣ [symmetry]     | if `a ≡ b (mod c)` then `b ≡ a (mod c)`
    # ‣ [transitivity] | if `a ≡ b (mod n)` and `b ≡ c (mod n)`, then `a ≡ c (mod n)`
    #
    # @param [Integer, Numeric] a
    # @param [Integer, Numeric] b
    # @param [Integer, Numeric] c (must not be 0)
    #
    # @raise [ArgumentError] if a or b is not ∈ ℤ or c is not ∈ ℤ
    #
    # @return [Boolean] true, if `a ≡ b (mod c)`
    def self.congruent?(a, b, c)
      🛑num❓(:a, a, :∈ℤ)
      a.to_i.≡(b: b, mod: c)
    end

  end # end: {ℤ³}

end

#module Symbolic
# TODO: Liouville's Constant (OEIS A012245)
# https://mathworld.wolfram.com/LiouvillesConstant.html.
# https://en.wikipedia.org/wiki/Liouville_number
#  ^ (relevant as no Liouville number can be `rational`)
#  ^ (all Liouville numbers are `transcendental`)
#end

# TODO: https://en.wikipedia.org/wiki/Diophantine_equation

# w/ efficient algorithms
# TODO: hemiperfect number
# TODO: highly abundant number
# TODO: highly cototient number
# TODO: untouchable number
# TODO: tetrahedral numbers
# TODO: pentatope numbers
# TODO: square pyramidal number
# TODO: multiplicative persistence
# TODO: https://oeis.org/A002378
