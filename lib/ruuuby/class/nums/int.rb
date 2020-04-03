# encoding: utf-8

# add various aliases & functions to existing Class(+Integer+)
#
# == Documentation Variables
# [Rℤ] all/any possible instances of Ruby's Class(`Integer`)
# [ℤ]  the mathematical integers-numbers(+ℤ+)
# [ℕ]  the mathematical natural-numbers(+ℕ+)
# [ℚ]  the mathematical rational-numbers(+ℚ+) (all ints can be represented as a rational)
# [ℂ]  the mathematical complex-numbers(+ℂ+) (all ints can be represented as complex numbers {}with imaginary component of 0})
# [ℝ]  the mathematical real-numbers(+ℝ+)
# [𝕌]  the mathematical universal-set(+ℝ+) (in this context only excludes (NaN, +∞, and -∞) which ints may not be and/or represent)
class ::Integer

  # ---------------------------------------------------------------------------------------------------------- | *f11* |

  # @return [Boolean] true, all *non-negative* integers(+ℤ+) are considered in the set of natural-numbers(+ℕ+)
  def ℕ? ; self >= 0; end

  # ∀ x ∈ Rℤ, x ∈ ℤ
  #
  # ∴ ⨍(`infinite?`) will always return `false`
  ⨍_add_aliases(:infinite?, [:∞?, :♾️?, :∞ℂ?, :nan?, :¿?])

  # ∀ x ∈ Rℤ, x ∈ ℤ, x ∈ ℚ, x ∈ ℂ, x ∈ ℝ, x ∈ 𝕌
  #
  # ∴ ⨍(`finite?`) will always return `true`
  ⨍_add_aliases(:finite?, [:ℤ?, :ℚ?, :ℂ?, :ℝ?, :𝕌?])

  # | ------------------------------------------------------------------------------------------------------------------

end
