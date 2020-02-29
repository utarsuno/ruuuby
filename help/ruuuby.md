
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

module Kernel
  # @param [String] path
  #
  # @return [::Dir] a new Dir object with the provided path
  def 📁(path)
    ::Dir.new(path)
  end
end

class Array
  #  :⋂, :⋃, :uniq_to_them

    context 'func{⋂} (set intersection)' do
      context 'works for needed scenarios' do
        it 'works for cases: positive' do
          ary_a = %w(a a d)
          ary_b = %w(b a dd d c)
          result = ary_a.⋂(ary_b)
          expect(result).to eq(%w(a d))
          expect(ary_a).to eq(%w(a a d))
          expect(ary_b).to eq(%w(b a dd d c))
        end
        it 'works for cases: negative' do
          expect([1, 2, 3].⋂(%w(1 2 3))).to eq(%w())
        end
        it 'catches cases: error' do
          expect{[].⋂ nil}.to raise_error(ArgumentError)
        end
      end
    end

    context 'func{⋃} (set union)' do
      context 'works for needed scenarios' do
        it 'works for cases: positive' do
          expect([].⋃([])).to eq([])
          expect([1].⋃([])).to eq([1])
          expect([].⋃([nil])).to eq([nil])
          expect(%w(a a b).⋃(%w(b a a))).to eq(%w(a b))

          ary_a = [1337, nil, 1337, -1]
          ary_b = ['str', -1, nil, nil]
          expect(ary_a.⋃(ary_b)).to eq([1337, nil, -1, 'str'])
        end
        it 'works for cases: negative' do
          expect([1, 2, 3].⋃(%w(1 2 3))).to eq([1, 2, 3, '1', '2', '3'])
        end
        it 'catches cases: error' do
          expect{[].⋃(nil)}.to raise_error(ArgumentError)
          expect{[].⋃(1337)}.to raise_error(ArgumentError)
        end
      end
    end

    context 'func{start_with?}' do
      context 'works for needed scenarios' do
        it 'works for cases: positive' do
          expect([nil].start_with?(nil)).to eq(true)
          expect([1, '3', nil, [1, 2], 'a'].start_with?(1, '3', nil, [1, 2])).to eq(true)
          expect(%w(a a bb).start_with?('a')).to eq(true)
          expect(%w(a a bb).start_with?('a', 'a')).to eq(true)
          expect(%w(a a bb).start_with?('a', 'a', 'bb')).to eq(true)
        end
        it 'works for cases: negative' do
          expect([].start_with?()).to eq(false)
          expect([nil].start_with?()).to eq(false)
          expect([].start_with?(nil)).to eq(false)
          expect([1, 2, 'a'].start_with?()).to eq(false)
          expect([1, 2, 'a'].start_with?(['a'])).to eq(false)

          expect([nil].start_with?(1, 2, 3, 4, 5)).to eq(false)
        end
      end
    end

    context 'func[start_with?] runs fast enough' do
      it 'for scenarios: positive' do
        expect{%w(a a bb).start_with?('a', 'a', 'bb')}.to perform_very_quickly
      end
      it 'for scenarios: negative' do
        expect{[nil].start_with?(1, 2, 3, 4, 5)}.to perform_very_quickly
      end
    end

  # Return a list containing the intersection of self and them (set of elements found both in self and them)
  #
  # @param [Array] them
  #
  # @raise [WrongParamType]
  #
  # @return [Array] a new array containing unique elements found in both in both arrays (self and one provided)
  def ⋂(them) ; 🛑❓ary(:them, them) ; self.uniq & them.uniq ; end

  # Return a list of unique elements found in both this array and the one provided.
  #
  # @param [Array] them
  #
  # @raise [WrongParamType]
  #
  # @return [Array] a new array containing unique elements found in both in both arrays (self and one provided)
  def ⋃(them) ; 🛑❓ary(:them, them) ; self.union(them) ; end

  # Simply provides reverse direction compared to {'uniq_to_me', '∖'}.
  #
  # @param [Array] them
  #
  # @raise [WrongParamType]
  #
  # @return [Array] a new array containing unique elements found in the provided array and not found in this array
  def uniq_to_them(them) ; 🛑❓ary(:them, them) ; them.∖(self) ; end

    context 'func{uniq_to_them}' do
      context 'works for needed scenarios' do
        it 'works for cases: positive' do
          expect([1, 2, 'a', 3].uniq_to_them([3, nil, 4, 5])).to eq([nil, 4, 5])
        end
        it 'works for cases: error' do
          expect{[1, 2, 3].uniq_to_them(nil)}.to raise_error(ArgumentError)
          expect{[1, 2, 3].uniq_to_them(1337)}.to raise_error(ArgumentError)
        end
      end
    end

  # @param [*]
  #
  # @return [Boolean] true, if this array starts with the provided elements
  def start_with?(*start)
    return false if (start.∅? || start.length > self.length)
    return self.first == start[0] if start.length == 1
    self[0..(start.length-1)] == start
  end

  def last_n(n)
    🛑❓int(:ary, n)
    🛑 ArgumentError.new("c{Array}-> m{last_n} received arg{#{n.to_s}} is longer than this array{#{self.length}}") if n > self.length
    return self if n == self.length
    self[self.length-1-n..self.length-1]
  end

  def add_each(*elements)
    elements.∀{|e|self << e}
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