
| 🆔 | feature |
| --- | --- |
| f00 | `❄️` to alias `freeze`                      |
| f01 | `🙈` to alias `private`                     |
| f02 | `🛡️` to alias `protected`                   |
| f03 | `𝔠` to alias concept of `cardinality`       |
| f04 | `∅` to alias concept of `empty`             |
| f05 | `>>` to offer reverse functionality of `<<` |

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
