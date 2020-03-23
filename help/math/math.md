
# Numbers

| symbol | set              | domain                           | description |
| ------ | ---------------- | -------------------------------- | ----------- |
| 𝔹      | boolean domain   | {0, 1}                           |             |
| ℕ      | Natural Numbers  | {0, 1, 2, 3...}                  |             |
| ℤ      | Integers         | {..., -3, -2, -1, 0, 1, 2, 3...} |             |
| ℂ      | Complex Numbers  |                                  |             |
| ℚ      | Rational Numbers |                                  |             |
| ℝ      | Real Numbers     |                                  |             |
| 𝕌      | Universal        | all but following: {NaN, +∞, -∞} |             |

## Vocab

| #    | term | alt. name | definition | extra |
| ---- | --- | --- | --- | --- |
| 0x00 | `additive identity` | | "Let `N` be a set that is closed under the operation of addition, denoted `+`. An `additive identity` for `N` is any element `e` such that for element `n` in `N`, `e + n = n = n + e`; example: `n + 0 = n = 0 + n`" | ex: the number `0`, "but additive identities occur in other mathematical structures where addition is defined, such as in `groups` and `rings`" |
| 0x01 | `cardinal numbers` | `cardinals` | "a generalization of the natural numbers used to measure the `cardinality (size)` of sets" | "`cardinality` of a finite set is a `natural number`" |
| 0x02 | `transfinite numbers` | | "numbers that are 'infinite' in the sense that they are larger than all finite numbers, yet not necessarily `absolutely infinite`" | "include the `transfinite cardinals`, which are used to quantify the size of infinite sets, and the `transfinite ordinals`, which are used to provide an ordering of infinite sets" |
| 0x03 | `ordinal numbers` | `ordinal` | "is one generalization of the concept of a natural number that is used to describe a way to arrange a (possibly infinite) collection of objects in order, one after another" | |
| 0x04 | `urelement` | `ur-element`, `atoms`, `individuals` | "an object that is not a `set`, but that may be an `element` of a set" | |
| 0x05 | `0⁰` | | "a mathematical expression with no agreed-upon value. The most common possibilities are `1` or leaving the expression undefined, with justifications existing for each, depending on context" | `Ruuuby` will evaluate as: `0⁰ == 1` |
| 0x06 | `golden ratio` | `φ` | "two quantities are in the `golden ratio` if their `ratio` is the same as the `ratio of their sum` to the `larger of the two quantities` | `a+b` is to `a` as `a` is to `b` |
| 0x07 | `Euler-Mascheroni constant` | `γ` |the `limiting` difference between the `harmonic series` and the `natural logarithm` | "a mathematical constant recurring in analysis and number theory` |
| 0x08 | `Ordinary Differential Equation` | | a `differential equation` involving only ordinary derivatives with respect to a single independent variable |
| 0x09 | `Partial Differential Equation` | | a `differential equation` involving partial derivatives with respect to more than one independent variable |
| 0x11 | `Lagarias arithmetic derivative` | `number derivative` | D(p) = 1 for any `prime` p <br/> D(pq) = D(q)p + pD(q) for any p, q ∈ ℕ | "a function defined for `integers`, based on `prime factorization`, by analogy with the `product rule` for the `derivative of a function` that is used in `mathematical analysis` |
| 0x12 | `Integer factorization` | | (context: `Number Theory`) "the decomposition of a `composite number` into a product of smaller integers" |
| 0x13 | `prime factorization` | | (context: `Number Theory`), integer factorization when the `factors` are restricted to `prime numbers` |

| # | more | example |
| --- | --- | --- |
| 0x00 | "in the natural numbers `ℕ` and all of its supersets(`ℤ`, `ℚ`, `ℝ`, or `ℂ`), the `additive identity` is `0`. Thus for any one of these numbers `n`, `n + 0 = n = 0 + n`" | `5 + 0 = 5 = 0 + 5` |
| 0x06 | is solution to  `x² - x -1 = 0` which is `φ = (1 + √(5))/2` | `φ = 1 + 1/φ` |

### Sequences

| # | term | definition |
| --- | --- | --- |
| 0x0 | `arithmetic sequence` | "the difference between one term and the next is a constant` |
| 0x1 | `geometric sequence` | "each term is found by multiplying the previous term by a constant" |

### Properties of Exponents

 * `xᵃ⋅xᵇ = xᵃ⁺ᵇ`
 * `xᵃ/xᵇ = xᵃ⁻ᵇ`
 * `(xᵃ)ᵇ = xᵃᵇ`
 * `(x⋅y)ᵃ = xᵃ⋅xᵇ`
 * `(x/y)ᵃ = xᵃ/yᵃ`
 * TODO:
   * `(d/dx)x^ᵃ = ax^ᵃ⁻ᵇ, {ᵇ=1}`

### TODO: Unit-Tests
 * `additive identity` for each `Numeric` sub-class

#### TODOs

* http://functions.wolfram.com/Constants/ComplexInfinity/introductions/Symbols/ShowAll.html
* https://en.wikipedia.org/wiki/Directed_infinity
* https://en.wikipedia.org/wiki/Argument_(complex_analysis)

```

| 0x10 | `method of least squares` | | `TODO:` add notes with respect to `α` and `β` for minimizing `S` (`partial derivatives` to be zero) |

 * Jacobian matrix
 * Lagarias arithmetic derivative

ε
ℙ
𝕀
ℍ (quaternions)
𝔼 (expected value)
∂ (partial derivative)

* Transcendental number
* https://en.wikipedia.org/wiki/Transcendental_number

```

