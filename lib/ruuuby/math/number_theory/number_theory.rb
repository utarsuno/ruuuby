# coding: UTF-8

# mathematics related
module ::Math

  # @see: https://en.wikipedia.org/wiki/Number_theory
  #
  # math related code that can be categorized under +NumberTheory+
  module NumberTheory

    # equations within +NumberTheory+ that only involve 1-input
    module ℕ¹

      # vocab:
      #  - prime number:        a natural-number that can't be created from the multiplication of other natural-numbers
      #  - factors:             the numbers multiplied together resulting in another number
      #  - prime factorization: process of finding the prime numbers which multiply to equal some original number
      #
      # @example
      #   prime factors of 76 are: 2² x 19¹
      #   a = 76.get_prime_factors
      #   a == [[2, 2], [19, 1]]
      #
      # @param [Integer] n
      #
      # @raise [ArgumentError] if n is not ∈ ℕ
      #
      # @return [Array]
      def self.get_prime_factors(n)
        🛑num❓(:n, n, :∈ℕ)
        Prime.prime_division(n)
      end

      # @see http://rosettacode.org/wiki/Factors_of_an_integer#Using_the_prime_library
      #
      # @param [Integer] n
      #
      # @raise [ArgumentError] if n is not ∈ ℕ
      #
      # @return [Array]
      def self.get_divisors(n)
        🛑num❓(:n, n, :∈ℕ)
        return [1] if 1 == n
        primes, powers = Prime.prime_division(n).transpose
        ranges = powers.map{|m| (0..m).to_a}
        ranges[0].product(*ranges[1..-1]).map{|es| primes.zip(es).map{|p,e| p**e}.reduce :*}.sort
      end

      # @param [Integer] n
      #
      # @raise [ArgumentError] if n is not ∈ ℕ
      #
      # @return [Array] the same result as +get_divisors+ but without `n` itself
      def self.get_proper_divisors(n)
        🛑num❓(:n, n, :∈ℕ)
        if n == 1
          return []
        elsif n < 4
          return [1]
        else
          result = ::Math::NumberTheory::ℕ¹.get_divisors(n)
          result[0..result.length-2]
        end
      end

      # @param [Integer] n
      #
      # @raise [ArgumentError] if n is not ∈ ℕ
      #
      # @return [Boolean]
      def self.perfect_number?(n)
        🛑num❓(:n, n, :∈ℕ)
        n == ::Math::NumberTheory::ℕ¹.get_proper_divisors(n).sum
      end

    end

    # equations within +NumberTheory+ that involve 2-inputs
    module ℕ²

      # base source from:
      # @see http://www.codecodex.com/wiki/Euclidean_algorithm
      #
      # for more information:
      # @see https://www.khanacademy.org/computing/computer-science/cryptography/modarithmetic/a/the-euclidean-algorithm
      #
      # @param [Integer] a
      # @param [Integer] b
      #
      # @raise [ArgumentError] if a or b is not ∈ ℕ
      #
      # @return [Integer]
      def self.gcd(a, b)
        🛑num❓($PRM_MANY, [a, b], :∈ℕ)
        a, b = b, a%b  until b.zero?
        a
      end

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
      def self.coprime?(a, b); ::Math::NumberTheory::ℕ².gcd(a, b) == 1; end

    end

  end

end

# TODO: https://en.wikipedia.org/wiki/Diophantine_equation
# TODO: https://en.wikipedia.org/wiki/Euler%27s_totient_function#Computing_Euler.27s_totient_function
