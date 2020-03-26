

# Automatic Differentiation
 
 * abstractions that enable you to write a function and efficiently apply the chain rule to it
 * `Automatic Differentiation` is not:
   * `Symbolic differentitation`: automatic manipulation of mathematical expressions to get derivatives
   * `Numeric differentiation`: approximating derivatives by finite differences


#### Resources

| resource | link |
| --- | --- |
| paper: `The Simple Essense of Automatic Differentation` | http://conal.net/papers/essence-of-ad/essence-of-ad-icfp.pdf |
| Conal Elliott |  https://www.youtube.com/watch?v=ne99laPUxN4 |
| `PDF slides` of above resource | https://www.microsoft.com/en-us/research/uploads/prod/2018/07/The-Simple-Essence-of-Automatic-Differentiation-slides.pdf |


#### What's a derivative?

`a` and `b` are vector spaces that share a common underlying field

* `D :: (a → b) → (a → (a ⊸ b))`
* `lim(ε→0) of`
  * `0 = ∥⨍(a+E)-(⨍a + D⨍aε)∥ / ∥ε∥`

#### Composition

Sequential:
 * `(∘) :: (b → c) → (a → b) → (a → c)`
 * `(g → ⨍)a = g(⨍a)`
 * `chain rule`: `D(g ∘ ⨍)a = Dg(⨍a) ∘ D⨍a`

Parallel:
 * `( ▵ )::(a → c) → (a → d) → (a → cXd)` -- 'c cross-product d'
 * `(⨍ ▵ g)a = (⨍a, ga)`
 * `D(⨍ ▵ g)a = D⨍a ▵ Dga`

#### Compositionality
 * notice with the `chain rule`(`D(g∘⨍)a = Dg(⨍a)∘D⨍a`), this is `non-compositional`
 * fixed by combining regular result with derivative:
   * `ˆD :: (a → b) → (a → (bX(a ⊸ b)) )`
   * `specification`: `ˆD⨍ = ⨍ ▵ D⨍`


### Theorem 1 (Compose/"Chain" rule)


# TODO-USE: symbol(∥)
# ∥-5∥ == 5



