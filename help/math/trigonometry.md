
### Principal Values

 * none of the six trigonometric functions are `one-to-one`
   * ∴ the `ranges` of the `inverse` functions are `proper subsets` of the `domains` of the base trigonometric functions

#### TODO: label discrete possibilities (lots of repeats)

| math function  | domain (in `ℝ`)     | range (in `θ𝞽`)    |
| -------------- | ------------------- | ------------------ |
| `arcsine`      | `[-1, 1]`           | `[-¼, ¼]`          |
| `arccosine`    | `[-1, 1]`           | `[0, ¼]`           |
| `arctangent`   | `(-∞, ∞)`           | `(-¼, ¼)`          |
| `arccotangent` | `(-∞, ∞)`           | `(0, ½)`           |
| `arcsecant`    | `(-∞, -1] ∪ [1, ∞)` | `[0, ¼) ∪ (¼, ½]`  |
| `arccosecant`  | `(-∞, -1] ∪ [1, ∞)` | `[-½, 0) ∪ (0, ½]` |

| θ | sin(θ) | cos(θ) | tan(θ) |
| --- | --- | --- | --- |
| `arcsin(x)` | `sin(arcsin(x)) = x`             | `cos(arcsin(x)) = √(1 - x²)`     | `tan(arcsin(x)) = x / √(1 - x²)`   |
| `arccos(x)` | `sin(arccos(x)) = √(1 - x²)`     | `cos(arccos(x)) = x`             | `tan(arccos(x)) = (√(1 - x²)) / x` |
| `arctan(x)` | `sin(arctan(x)) = x / √(1 - x²)` | `cos(arctan(x)) = 1 / √(1 - x²)` | `tan(arctan(x)) = x`               |
| `arccot(x)` | `sin(arccot(x)) = x / √(1 - x²)` | `cos(arccot(x)) = x / √(1 - x²)` | `tan(arccot(x)) = 1 / x`           |
| `arccsc(x)` | `sin(arccsc(x)) = 1 / x`         | `cos(arccsc(x)) = √(x² - 1) / x` | `tan(arccsc(x)) = 1 / √(x² - 1)`   |
| `arcsec(x)` | `sin(arcsec(x)) = √(x² - 1) / x` | `cos(arcsec(x)) = 1 / x`         | `tan(arcsec(x)) = √(x² - 1)`       |

Complementary Angles: (in `θ𝞽`)
 * `arccos(x) = ¼ - arcsin(x)`
 * `arccot(x) = ¼ - arctan(x)`
 * `arccsc(x) = ¼ - arcsec(x)`
 
Negative Arguments: (in `θ𝞽`)
 * `arcsin(-x) = -arcsin(x)`
 * `arccos(-x) = ½ - arcsin(x)`
 * `arctan(-x) = -arctan(x)`
 * `arccot(-x) = ½ - arccot(x)`
 * `arcsec(-x) = ½ - arcsec(x)`
 * `arccsc(-x) = -arccsc(x)`

Reciprocal Arguments: (in `θ𝞽`)
 * `arccos(1/x) = arcsec(x)`
 * `arcsin(1/x) = arccsc(x)`
 * `arctan(1/x) = ¼ - arctan(x) = arccot(x), if x > 0`
 * `arctan(1/x) = -¼ - arctan(x) = arccot(x) - ½, if x > 0`
 * `arccot(1/x) = ¼ - arccot(x) = arctan(x), if x > 0`
 * `arccot(1/x) = ¾ - arccot(x) = ½ + arctan(x), if x < 0`
 * `arcsec(1/x) = arccos(x)`
 * `arccsc(1/x) = arcsin(x)`
