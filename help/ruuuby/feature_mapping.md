
`quick in the following context means easy to use/read, not performance`

| 🆔 | feature |
| --- | --- |
| f00 | `❄️` to alias `freeze`                                                 |
| f01 | `🙈` to alias `private`                                                |
| f02 | `🛡️` to alias `protected`                                              |
| f03 | `𝔠` to alias concept of `cardinality` (offered in both styles of `OOP` & `'functional'`) |
| f04 | `∅` to alias concept of `empty`                                        |
| f05 | `>>` to offer reverse functionality of `<<`                            |
| f06 | enable quick type checks against any object (ex: `variable.int?`)      |
| f07 | enable quick clean up functions for `enumerables`                      |
| f08 | enable quick editing functions for `enumerables` (& `String`)          |
| f09 | add math `set operations` (especially for `enumerables` & `String`)    |
| f10 | offer special character aliases for natural ease of readability        |
| f11 | add math `number sets` (ex: `ℕ?`, `ℤ?`, `ℚ?`, `ℂ?`, `ℝ?`, `∞?`, `♾️?`) |
| f12 | enable quick `file/directory io` and alias as file(`📂`) and dir(`🗄️`)   |
| f13 | `∃` to alias concept of `does this(arg) exist?`                        |
| f14 | enable easier catching and throwing of parameter type errors           |
| f15 | enable quicker tracking and auditing of features across versions       |
| f16 | add operation: raising to exponents (`superscript`) via operator(`^`) on `Numeric`'s |
| f96 | automate local `git` configurations                                     |
| f97 | `JRuby-extensions`                                                     |
| f98 | `C-extensions`                                                         |
| f99 | enable a pure `Ruby` only build (without `C-extensions`)               |

---

#### TODO: Auto-generate these:

## f00
 * `class/obj.rb`
   * `❄️` --> `freeze`
   * `❄️?` --> `frozen?`

## f01
 * `module/module.rb`
   * `🙈` --> `private`
   * `∃🙈func?` --> `private_method_defined?`
   * `🙈constants⟶` --> `private_constant`
   * `🙈class_func` --> `private_class_method`
   * `🙈instance_funcs` --> `private_instance_methods`
 * `class/obj.rb`
   * `🙈funcs` --> `private_methods`

## f02
 * `module/module.rb`
   * `🛡️` --> `protected`
   * `∃🛡️func?` --> `protected_method_defined?`
   * `🛡️instance_funcs` --> `protected_instance_methods`
 * `class/obj.rb`
   * `🛡️funcs` --> `protected_methods`

## f03
 * `module/kernel.rb`
   * `𝔠`
 * `class/string.rb`
   * `𝔠` --> `length`
 * `class/ary.rb`
   * `𝔠` --> `length`
 * `class/hsh.rb`
   * `𝔠` --> `length`
 * `class/set.rb`
   * `𝔠` --> `length`

## f04
 * `class/nil.rb`
   * `empty?`
   * `∅?` --> `empty?`
 * `class/string.rb`
   * `∅?` --> `empty?`
 * `class/ary.rb`
   * `∅?` --> `empty?`
 * `class/hsh.rb`
   * `∅?` --> `empty?`
 * `class/set.rb`
   * `∅?` --> `empty?`

## f05
 * `class/str.rb`
   * `>>`
 * `class/ary.rb`
   * `>>`
