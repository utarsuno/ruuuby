
# Numbers

| symbol | set              | domain                                    | description |
| ------ | ---------------- | ----------------------------------------- | ----------- |
| 𝔹      | boolean domain   | {0, 1}                                    |             |
| ℕ      | Natural Numbers  | {0, 1, 2, 3...}                           |             |
| ℤ      | Integers         | {..., -3, -2, -1, 0, 1, 2, 3...}          | set of all whole numbers |
| ℂ      | Complex Numbers  |                                           |             |
| ℚ      | Rational Numbers | `p/q` where `p` and `q` `∈ ℤ` and `q ≠ 0` | |
| ℝ      | Real Numbers     |                                           | |
| 𝕌      | Universal        | any `n` where `n ∉ {NaN, +∞, -∞}`         | |

### ℤ

 * single operation: `+` (`-` operation is just adding a negative integer)
 * `x + y -> an integer` "closed under addition"
 * `x / y -> not an integer` "not closed under division"

### Group

 * set of elements `G`
 * set of operations, ex: `+`, `*`
 * closer under operation `x, y ∈ G -> x * y ∈ G`
 * inverse `x⁻¹` exists for all `x`
   * `x * x⁻¹ = e`
 * identity: `y * e = e * y = y`
 * associativity: `(a * b) * c = a * (b * c)`
 * may not be `commutative`
 * if `G` is `commutative`, it's called `Abelian`/`Commutative` group
 * if `G` is not `commutative`, `noncommutative`/`non-abelian` group

### Ring

 * set of elements where you can `+`, `-`, `*`
   * may not have `division`
 * adding two elements in a ring will give another element from the ring
 * `*` may be `non-commutative`
 * multiplication is `associative`
 * `distributive property`: `a * (b + c) = a * b + a * c`

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
| 0x24 | `Jacobian matrix` | | "In `vector calculus`, the `Jacobian matrix`, of a `vector-valued function` in several variables is the `matrix` of all its first-order `partial derivatives`" | |
| 0x25 | `Reimann sphere` | | "is a `model` of the `extended complex plane`, the `complex plane` plus a `point at infinity`" | "this `extended plane` represents the `extended complex numbers`, that is, the `complex numbers` plus a value `∞` for `infinity` |
| 0x26 | `ring` | | "one of the fundamental `algebraic structures` used in `abstract algebra`. In consists of a `set` equipped with two `binary operations` that generalize the  `arithmetic operations` of `addition` and `multiplication`. Through this generalization, theorems from `arithmetic` are extended to non-numerical objects such as `polynomials`, `series`, `matrices`, and `functions` | "a `ring` is an `abelian group` with a second `binary operation` that is `associative`, is `distributive` over the `abelian group operation` and has an `identity element`" |
| 0x27 | `trigonometric functions` | `circular functions`, `angle functions`, `goniometric functions` | "are `real functions` which relate an angle of a `right-angled triangle` to ratios fo two side lengths" | |
| 0x28 | `Niven's Theorem` | | if `x/π` and `sin(x)` are both `rational`, then the `sine` takes values `0, ±1/2, and ±1` | |
| 0x29 | `measure zero` | | "a set of points capable of being enclosed in intervals whose total length is arbitrarily small" | |
| 0x30 | `first-order logic` | `predicate logic`, `quantificational logic`, `first-order predicate calculus` | "a collection of `formal systems` used in mathematics, philosophy, linguistics, and computer science" | |
| 0x31 | `even & odd functions` | | "functions which satisfy particular `symmetry` relations, with respect to taking `additive inverses`" | |
| 0x32 | `domain` | | "what can go into a function" | |
| 0x33 | `codomain` | | "what may possibly come out of a function" | |
| 0x34 | `range` | | "what actually comes out of a function" | |
| 0x35 | `principal value` | | "the `principal value` of a `multivalued function` are the values along one chosen `branch` of that function, so that it is `single-valued`" | ex: 4 has two roots (±2); the positive root(2) is the `principal root` and denoted as `√4` |

| # | more | example |
| --- | --- | --- |
| 0x00 | "in the natural numbers `ℕ` and all of its supersets(`ℤ`, `ℚ`, `ℝ`, or `ℂ`), the `additive identity` is `0`. Thus for any one of these numbers `n`, `n + 0 = n = 0 + n`" | `5 + 0 = 5 = 0 + 5` |
| 0x20, 0x21 | `f: X → Y` is a `function` from the `set X` to the `set Y` |
| 0x22 | `one-to-one function` is different than `one-to-one correspondence` (`bijective functions`)(0x23) |

TODO formal def: `logistic distribution`
TODO formal def: `normal distrubtion`

### Properties

| # | term | definition | extra |
| --- | --- | --- | --- |
| 0x0 | `commutative property` | "a `binary operation` is `commutative` if changing the order of the `operands` does not change the result. It is a fundamental property of many `binary operations`, and many `mathematrical proofs` depend on it" | `law of commutativity`: `a + b = b + a`; `ab = ba`, for all `a, b ∈ R` |
| 0x1 | `distributive property` | "in `abstract algebra` and `formal logic`, the `distributive property` of `binary operations` generalizes the `distributive law` from `Boolean algebra` and `elementary algebra`. In `propositional logic`, `distribution` refers to two `valid rules of replacement`. The rules allow one to reformulate `conjunctions` and `disjunctions` with `logical proofs`" | |
| 0x2 | `reflexive property` | "for every real number `x`, `x = x`" | |
| 0x3 | `symmetric property` | "for all real numbers `x` and `y`, if `x = y`, then `y = x`" | |
| 0x4 | `transitive property` | "for all real numbers `x`, `y`, and `z`, if `x = y` and `y = z`, then `x = z`" | |
| 0x5 | `substitution property` | "if `x = y` and `y = z`, then `x = z` | |
| 0x6 | `associative property` | TODO: |

### Functions

| # | term | definition |
| --- | --- | --- |
| 0x0 | `Sigmoid function` | | 
| 0x1 | `logistic function` | | 
| 0x2 | `odd function` | "Let `f` be a real-valued function of a real variable. Then `f` is `odd` if the following equation holds for all `x` such that `x` and `-x` are in the domain of `f`: <br/> `-f(x) = f(-x)` <br/> or equivalently if the following equation holds for all such `x`: <br/> `f(x) + f(-x) = 0`" |
| 0x3 | `even functions` | "Let `f` be a real-valued function of a real variable. Then `f` is `even` if the following equation holds for all `x such that x` and `-x` in the domain of `f`: <br/> `f(x) = f(-x)` <br/> or equivalently if the following equation holds for all such `x`: `f(x) - f(-x) = 0`" |
| 0x4 | `hyperbolic tangent function` | TODO: ADD DESCRIPTION!!! |
| 0x5 | `error function erf` | TODO: !!!!!!!!!!!!!!!!!!!!!!! |
| 0x6 | `multivalued function` | "similar to a function, but may associate several values to each input" ; "from a `domain X` to a `codomain Y` associates each `x` in `X` to one or more values `y` in `Y`" |
| 0x7 | `principal branch` | "a function which selects one `branch` (`'slice'`) of a `multi-valued function`" |

### Properties of Exponents

 * `xᵃ⋅xᵇ = xᵃ⁺ᵇ`
 * `xᵃ/xᵇ = xᵃ⁻ᵇ`
 * `(xᵃ)ᵇ = xᵃᵇ`
 * `(x⋅y)ᵃ = xᵃ⋅xᵇ`
 * `(x/y)ᵃ = xᵃ/yᵃ`
 * TODO:
   * `(d/dx)x^ᵃ = ax^ᵃ⁻ᵇ, {ᵇ=1}`

### Rationals

 * `0/0` means `⟶0 / ⟶0` where `⟶0` means `approaching to 0`
 * `⟶∞` and `∞` are equivalent notation
 * `⟶0` and `0` are not equivalent notation
   * ex: the ONLY answer for (`5/0`) is `division by zero not defined`
   * ex: `0/0` is `not defined`
   * ex: `⟶0 / ⟶0` is `indeterminate`

#### Examples of `even-functions`:

 * `x -> |x|`
 * `x -> x^2`
 * `x -> x^4`
 * `costine cos`
 * `hyperbolic cosine cosh`

#### Examples of `odd-functions`:

 * (identity function) `x -> x`
 * `x -> x^3`
 * `sine sin`
 * `hyperbolic sine sinh`
 * (error function) `erf`

### Properties of `even-functions` & `odd-functions`

Uniqueness:

 * "If a function is both `even` and `odd`, it is equal to `0` everywhere it is defined"
 * "If a function is `odd`, the `absolute value` of that function is an `even` function"
 
Addition and Subtraction:

 * "The `sum` of two `even` functions is `even`"
 * "The `sum` of two `odd` functions is `odd`"
 * "The `difference` between two `odd` functions is `odd`"
 * "The `difference` between two `even` functions if `even`"
 * "The `sum` of an `even` and `odd` function is neither `even` nor `odd`, unless one of the functions is equal to `zero over the given domain`"

Multiplication and Division:

 * "The `product` of two `even` functions is an `even` function"
 * "The `product` of two `odd` functions is an `even` function"
 * "The `product` of an `even` function and an `odd` function is an `odd` function"
 * "The `quotient` of two `even` functions is an `even` function"
 * "The `quotient` of two `odd` functions is an `even` function"
 * "The `quotient` of an `even` function and an `odd` function is an `odd` function"

Composition:

 * "The `composition` of two `even` functions is `even`"
 * "The `composition` of two `odd` functions is `odd`"
 * "The `composition` of an `even` function and an `odd` function is `even`"
 * "The `composition` of any function with an `even` function is `even` (but not vice versa)"

Even-odd Decomposition:

 * "Every function may be `uniquely decomposed` as the `sum` of an `even` and an `odd` function, which are called respectively the `event part` and the `odd part` of the function; if one defines"
   * `fe(x) = (f(x) + f(-x)) / 2`
   * `fo(x) = (f(x) - f(-x)) / 2`
   * then `fe` is `even` and `fo` is `odd`, and: `f(x) = fe(x) + fo(x)`



### TODO: Unit-Tests
 * `additive identity` for each `Numeric` sub-class

#### TODOs

* https://en.wikipedia.org/wiki/Ring_(mathematics)
* https://en.wikipedia.org/wiki/Lie_algebra
* https://en.wikipedia.org/wiki/Riemann_sphere
* https://en.wikipedia.org/wiki/Jacobian_matrix_and_determinant
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
* https://www.quora.com/What-is-the-value-of-one-to-the-power-infinity

```
phi-constant-digits: https://www2.cs.arizona.edu/icon/oddsends/phi.htm

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



Clock Arithmetic similair to Modular Arthimetic

