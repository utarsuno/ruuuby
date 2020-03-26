
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

# Vocab

(lots to be re-organized/sorted/etc)

### Vocab-Groupings

| #    | term | alt. name | definition | extra |
| ---- | --- | --- | --- | --- |
| 1x00 | `Category theory` | | * "formalizes `mathematical structure` and its concepts in terms of a `labeled directed graph` called a `category`, whose `nodes` are called `objects`, and whose `labelled directed edges` are called `arrows` (or `morphisms`) <br/> * "The `language` of `Category Theory` has been used to formalize concepts of other high-level `abstractions` such as `sets`, `rings`, and `groups`" <br/> * "Informally, category theory is a general theory of `functions`"| has 2 basic properties: <br/> * the ability to `compose` the arrows `associatively` <br/> * and the existence of an `identity` arrow for each `object` |

### Vocab-Discrete

| # Grouping | #    | term | alt. name | definition | extra |
| ---- | --- | --- | --- | --- | --- |
| 1x00 | 0x00 | `category` | `abstract category` | "a collection of `'objects'` that are linked by `'arrows'` | |
| 1x00 | 0x01 | `functor` | | "a `map` between `categories` | TODO: add formal-definition(https://en.wikipedia.org/wiki/Functor) |


| #    | term | alt. name | definition | extra |
| ---- | --- | --- | --- | --- |
| 0x00 | `additive identity` | | "Let `N` be a set that is closed under the operation of addition, denoted `+`. An `additive identity` for `N` is any element `e` such that for element `n` in `N`, `e + n = n = n + e`; example: `n + 0 = n = 0 + n`" | ex: the number `0`, "but additive identities occur in other mathematical structures where addition is defined, such as in `groups` and `rings`" |
| 0x01 | `identity function` | `identity relation`, `identity map`, `identity transformation` | "a function that always returns the same value that was used as its argument" | for `⨍` being identity, the equality `f(x) = x` holds for all `x` |
| 0x02 | `cardinal numbers` | `cardinals` | "a generalization of the natural numbers used to measure the `cardinality (size)` of sets" | "`cardinality` of a finite set is a `natural number`" |
| 0x03 | `transfinite numbers` | | "numbers that are 'infinite' in the sense that they are larger than all finite numbers, yet not necessarily `absolutely infinite`" | "include the `transfinite cardinals`, which are used to quantify the size of infinite sets, and the `transfinite ordinals`, which are used to provide an ordering of infinite sets" |
| 0x04 | `ordinal numbers` | `ordinal` | "is one generalization of the concept of a natural number that is used to describe a way to arrange a (possibly infinite) collection of objects in order, one after another" | |
| 0x05 | `urelement` | `ur-element`, `atoms`, `individuals` | "an object that is not a `set`, but that may be an `element` of a set" | |
| 0x06 | `0⁰` | | "a mathematical expression with no agreed-upon value. The most common possibilities are `1` or leaving the expression undefined, with justifications existing for each, depending on context" | `Ruuuby` will evaluate as: `0⁰ == 1` |
| 0x07 | `golden ratio` | `φ` | "two quantities are in the `golden ratio` if their `ratio` is the same as the `ratio of their sum` to the `larger of the two quantities` | `a+b` is to `a` as `a` is to `b` |
| 0x08 | `Euler-Mascheroni constant` | `γ` |the `limiting` difference between the `harmonic series` and the `natural logarithm` | "a mathematical constant recurring in analysis and number theory` |
| 0x09 | `Ordinary Differential Equation` | | a `differential equation` involving only ordinary derivatives with respect to a single independent variable |
| 0x11 | `Partial Differential Equation` | | a `differential equation` involving partial derivatives with respect to more than one independent variable |
| 0x12 | `Lagarias arithmetic derivative` | `number derivative` | D(p) = 1 for any `prime` p <br/> D(pq) = D(q)p + pD(q) for any p, q ∈ ℕ | "a function defined for `integers`, based on `prime factorization`, by analogy with the `product rule` for the `derivative of a function` that is used in `mathematical analysis` |
| 0x13 | `Integer factorization` | | (context: `Number Theory`) "the decomposition of a `composite number` into a product of smaller integers" |
| 0x14 | `prime factorization` | | (context: `Number Theory`), integer factorization when the `factors` are restricted to `prime numbers` |
| 0x15 | `compositionality` | | "In mathematics, semantics, and philosophy of language, the principle of compositionality is the principle that the meaning of a complex expression is determined by the meanings of its constituent expressions and the rules used to combine them. This principle is also called Frege's principle, because Gottlob Frege is widely credited for the first modern formulation of it." | |
| 0x16 | `metric space` | | "a set together with a metric on the set. The metric is a function that defines a concept of distance between any two members of the set, which are usually called `points`" | satisfies the following: <br/> * distance from a point to itself is zero <br/> * distance between two distinct points is positive <br/> * distance from `A` to `B` is the same as the distance from `B` to `A` <br/> distance from `A` to `B` (directly) is less than or equal to the distance from `A` to `B` via any third point `C` |
| 0x17 | `topology` | (from Greek τόπος, 'place', and λόγος, 'study') | "is concerned with the properties of a `geometric object` that are preserved under `continuous deformations`, such as `stretching`, `twisting`, `crumpling` and `bending`, but not `tearing` or `gluing` | |
| 0x18 | `morphism` | | "is a structure-preserving `map` from one `mathematical strcuture` to another one of the same type. The notion of morphism recurs in much of contemporary mathematics. In `set theory`, morphisms are `functions`; in `linear algebra`, `linear transformations`; in `group theory`, `group homomorphisms`; in `topology`, `continuous functions`, and so on"
| 0x20 | `image` | | "in mathematics, the `image` of a `function` is the set of all output values it may produce" | "More generally, evaluating a given function `f` at each element of a given `subset A` of its `domain` produces a `set` called the `'image of A under (or through) f'" |
| 0x21 | `inverse image` | `preimage` | "the `preimage` of a given subset `B` of the `codomain` of `f` is the set of all elements of the `domain` that map to the members of `B` | |
| 0x22 | `injective function` | `injection`, `one-to-one function` | "a `function` that `maps distinct elements` of its `domain` to `distinct elements` of its `codomain`" | "every element of the `function's codomain` is the `image` of at most one element of its `domain` |
| 0x23 | `bijective functions` | | "`functions` such that each element in the `codomain` is an `image` of exactly on element in the `domain` | |

| # | more | example |
| --- | --- | --- |
| 0x00 | "in the natural numbers `ℕ` and all of its supersets(`ℤ`, `ℚ`, `ℝ`, or `ℂ`), the `additive identity` is `0`. Thus for any one of these numbers `n`, `n + 0 = n = 0 + n`" | `5 + 0 = 5 = 0 + 5` |
| 0x06 | is solution to  `x² - x - 1 = 0` which is `φ = (1 + √(5))/2` | `φ = 1 + 1/φ` |
| 0x20, 0x21 | `f: X → Y` is a `function` from the `set X` to the `set Y` |
| 0x22 | `one-to-one function` is different than `one-to-one correspondence` (`bijective functions`)(0x23) |


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


* https://en.wikipedia.org/wiki/Category_theory
* https://en.wikipedia.org/wiki/Image_(mathematics)
* https://en.wikipedia.org/wiki/Functor
* https://en.wikipedia.org/wiki/Category_(mathematics)
* https://en.wikipedia.org/wiki/Category_theory
* https://en.wikipedia.org/wiki/Topological_property
* https://en.wikipedia.org/wiki/Topological_space
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

