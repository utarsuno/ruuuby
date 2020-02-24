
### Ruuuby Glossary

#### Arrows

| symbol(s) | description and/or use-cases |
| ------ | ---------------------------- |
| ⟶, 👉, ➡️ | right |
| ⟵, 👈 , ⬅️ | left |

#### Math

| symbol(s) | description and/or use-cases |
| ------ | ---------------------------- |
| root | `√`, `∛`, `∜` |
| set  | `∈`, `∉`, `∋`, `∌` |
| number sets | `ℕ`, `ℤ`, `ℚ`, `ℂ`, `ℝ` |
| powers | `⁰`, `¹`, `²`, `³`, `⁴`, `⁵`, `⁶`, `⁷`, `⁸`, `⁹` |
| enumerators | `∑`, `∀`, `⨍` |
| logical and/operations | `∃`, `¬`, `≈`, `≪`, `≫` |

#### Misc

| misc | `📊`, `🔑`, `❄️`, `🙈`, `🆔` |
| not-used | `⚠️`, `👈`, `👉`, `🆚`, `🆕` |

#### Emoji References

| for | use |
| --- | --- |
| sets | https://en.wikipedia.org/wiki/ISO_31-11#Sets |
| currency | https://unicode-table.com/en/sets/currency-symbols/ |
| arrows   | https://coolsymbol.com/arrow-symbols-arrow-signs.html |
| greek    | https://unicode-table.com/en/sets/greek-symbols/ |
| math-signs | https://unicode-table.com/en/sets/mathematical-signs/ |
| special-symbols | https://unicode-table.com/en/sets/special-symbols/ |
| unicode-math | https://en.wikipedia.org/wiki/Mathematical_operators_and_symbols_in_Unicode |

### $GLOBALS

##### taken from: https://www.techotopia.com/index.php/Ruby_Variable_Scope

| Variable Name | Variable Value |
| ------------- | -------------- |
| $@ | The location of latest error |
| $_ | The string last read by gets |
| $. | The line number last read by interpreter |
| $& | The string last matched by regexp |
| $~ | The last regexp match, as an array of subexpressions |
| $n | The nth subexpression in the last match (same as $~[n]) |
| $= | The case-insensitivity flag |
| $/ | The input record separator |
| $\ | The output record separator |
| $0 | The name of the ruby script file currently executing |
| $* | The command line arguments used to invoke the script |
| $$ | The Ruby interpreter's process ID |
| $? | The exit status of last executed child process |


#### Ruby Build

```
CC=/usr/bin/gcc rbenv install 2.7.0
```


#### helpful links

 * http://www.mathspadilla.com/3ESO/Unit4-DecimalNumbersRealNumbersScientificNotation/conjuntos_reales.png


##### TODOs

 * document this: https://blog.bigbinary.com/2016/11/18/ruby-2-4-unifies-fixnum-and-bignum-into-integer.html
 
 * https://silverhammermba.github.io/emberb/c/#string // You can pass the string VALUE to rb_str_export_locale() to get a new VALUE with your locale’s encoding

#### Temporary Code (to be cleaned up for future versions)

```ruby

class Kernel
  def √(n)
    Math.sqrt(n)
  end
end

class Integer
  
  # @return [Integer] 1 if >= 0, else -1
  def ⁰ ; return 1 if self >= 0 ; -1 ; end

  # @return [Integer] the value of this int
  def ¹
    self
  end

  # @return [Integer] the value of this int squared
  def ²
    return self if self == 0 || self == 1
    self ** 2
  end

  # @return [Integer] the value of this int cubed
  def ³
    return self if self == 0 || self == 1 || self == -1
    self ** 3
  end

  # @return [Integer] the value of this int quartic
  def ⁴
    return self if self == 0 || self == 1
    self ** 4
  end

  # @return [Integer] the value of this int quintic
  def ⁵
    return self if self == 0 || self == 1
    self ** 5
  end

  # @return [Integer] the value of this int sextic
  def ⁶
    return self if self == 0 || self == 1
    self ** 6
  end

  # @return [Integer] the value of this int heptic
  def ⁷
    return self if self == 0 || self == 1
    self ** 7
  end

  # @return [Integer] the value of this int octic
  def ⁸
    return self if self == 0 || self == 1
    self ** 8
  end
end

```

```ruby

let(:int_range){[-4, -3, -2, -1, 0, 1, 2, 3, 4]}

context 'by adding function[¹]' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          int_range.∀{|n|expect(n.¹).to eq(n)}
        end
      end
    end

    context 'by adding function[²]' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          int_range.∀{|n|expect(n.²).to eq(n * n)}
        end
      end
    end

    context 'by adding function[³]' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          int_range.∀{|n|expect(n.³).to eq(n * n * n)}
        end
      end
    end

    context 'by adding function[⁴]' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          int_range.∀{|n|expect(n.⁴).to eq(n * n * n * n)}
        end
      end
    end

    context 'by adding function[⁵]' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          int_range.∀{|n|expect(n.⁵).to eq(n * n * n * n * n)}
        end
      end
    end

    context 'by adding function[⁶]' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          int_range.∀{|n|expect(n.⁶).to eq(n * n * n * n * n * n)}
        end
      end
    end

    context 'by adding function[⁷]' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          int_range.∀{|n|expect(n.⁷).to eq(n * n * n * n * n * n * n)}
        end
      end
    end

    context 'by adding function[⁸]' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          int_range.∀{|n|expect(n.⁸).to eq(n * n * n * n * n * n * n * n)}
        end
      end
    end
```