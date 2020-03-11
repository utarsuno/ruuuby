
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

| category | symbol(s) |
| --- | --- |
| misc | `📊`, `🔑`, `❄️`, `🙈`, `🆔` |
| not-used | `⚠️`, `👈`, `👉`, `🆚`, `🆕` |
| misc-not-used | `🎲`, `📝`, `📁` |

#### Emoji References

| for | use |
| --- | --- |
| Emoji Data for UTR #51 | https://unicode.org/Public/emoji/1.0/emoji-data.txt |
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

```

```ruby

#require 'open3'
#cmd = 'wc FILE_PATH'
#Open3.popen3(cmd) do |stdin, stdout, stderr, wait_thr|
#  puts "stdout is:" + stdout.read
#  puts "stderr is:" + stderr.read
#end

#RbConfig
#

=begin
        path = 'PPAATTHH'
        d = Dir.new(path)

        #d.each do |e|
        #d.each do |e|
        d.entries.each do |e|
          #puts "e{#{e.class.to_s}} --> {#{e.to_s}}"

          ee = "#{path}#{e.to_s}"

          📝 = ::File
          #my_file = File.new(ee)
          #exists = File.file?(ee)
          my_file = 📝.new(ee)
          exists = 📝.file?(ee)
          if exists
            puts "FILE{#{ee}} EXISTS{#{exists.to_s}}, file{#{my_file.to_s}}, abs-path-chars{#{ee.to_s.length.to_s}}"
          end
=end

  def perform_big_o_constant
    RSpec::Benchmark::Matchers::ben
    exec_func_n_times = bench_range()
    expect{ |n, i| }
  end

=begin
  module ArchivedRubyCode

    module Feature_⊕
      def self.add_comparison_version
        class ::Array
          # starting(v0.0.16), switched 📊 from Ruby implementation to C
          def archived_≈(them)
            🛑ary❓(:ary, them)
            return true  if self.∅? && them.∅?
            return false if self.length != them.length
            self.📊 == them.📊
          end
        end
      end
    end

  end
=end

  def ₋₂ ; self[-2] ; end
  def ₋₁ ; self[-1] ; end
  def ₀  ; self[0]  ; end
  def ₁  ; self[1]  ; end


=begin
 * add the following gems:
 
 | gem                     | version   |
 | ----------------------- | --------- |
 | `sqlite3`               | `1.4.2`   |
 | `activerecord`          | `5.2.4.1` |
 | `standalone_migrations` | `5.2.7`   |


           'sqlite3': '1.4.2',
          'activerecord': '5.2.4.1',
          'standalone_migrations': '5.2.7'

# TODO: automate this type of tracking (ex: parse git history)

# 0.0.17
 * unit:        274
 * performance: 132
 * audits:      12

* 0.0.16
 * unit:        238
 * performance: 124
 * audits:      12

# 0.0.15
 * unit:        219
 * performance: 111
 * audits:      8



      context 'by supporting operation {^⁻⁹}' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            expect(((-1337)^⁻⁹).to_r.to_s).to eq('1/-13651572044273168734454390777')
            expect((-10^⁻⁹).to_s).to eq('1/-1000000000')
            expect(-1^⁻⁹).to eq(data_rational_negative_one)
            expect(1^⁻⁹).to eq(data_rational_one)
            expect(10^⁻⁹).to eq(Rational(1, 10 ** 9))
            expect(1337^⁻⁹).to eq(Rational(1, 1337 ** 9))
          end
          it 'cases: negative' do
            expect{0^⁻⁹}.to raise_error(ZeroDivisionError)
          end
        end
      end

      context 'by supporting operation {^⁻⁸}' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            expect(((-1337)^⁻⁸).to_r).to eq(Rational(1, 1337 ** 8))
            expect((-10^⁻⁸)).to eq(Rational(1, 10 ** 8))
            expect(-1^⁻⁸).to eq(data_rational_one)
            expect(1^⁻⁸).to eq(data_rational_one)
            expect(10^⁻⁸).to eq(Rational(1, 10 ** 8))
            expect(1337^⁻⁸).to eq(Rational(1, 1337 ** 8))
          end
          it 'cases: negative' do
            expect{0^⁻⁸}.to raise_error(ZeroDivisionError)
          end
        end
      end

      context 'by supporting operation {^⁻⁷}' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            expect(((-1337)^⁻⁷).to_r.to_s).to eq('1/-7636948304805671129033')
            expect((-10^⁻⁷).to_s).to eq('1/-10000000')
            expect(-1^⁻⁷).to eq(data_rational_negative_one)
            expect(1^⁻⁷).to eq(data_rational_one)
            expect(10^⁻⁷).to eq(Rational(1, 10 ** 7))
            expect(1337^⁻⁷).to eq(Rational(1, 1337 ** 7))
          end
          it 'cases: negative' do
            expect{0^⁻⁷}.to raise_error(ZeroDivisionError)
          end
        end
      end

      context 'by supporting operation {^⁻⁶}' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            expect(((-1337)^⁻⁶).to_r).to eq(Rational(1, 1337 ** 6))
            expect((-10^⁻⁶)).to eq(Rational(1, 10 ** 6))
            expect(-1^⁻⁶).to eq(data_rational_one)
            expect(1^⁻⁶).to eq(data_rational_one)
            expect(10^⁻⁶).to eq(Rational(1, 10 ** 6))
            expect(1337^⁻⁶).to eq(Rational(1, 1337 ** 6))
          end
          it 'cases: negative' do
            expect{0^⁻⁶}.to raise_error(ZeroDivisionError)
          end
        end
      end

      context 'by supporting operation {^⁻⁵}' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            expect(((-1337)^⁻⁵).to_r.to_s).to eq('1/-4272253717090457')
            expect((-10^⁻⁵).to_s).to eq('1/-100000')
            expect(-1^⁻⁵).to eq(data_rational_negative_one)
            expect(1^⁻⁵).to eq(data_rational_one)
            expect(10^⁻⁵).to eq(Rational(1, 10 ** 5))
            expect(1337^⁻⁵).to eq(Rational(1, 1337 ** 5))
          end
          it 'cases: negative' do
            expect{0^⁻⁵}.to raise_error(ZeroDivisionError)
          end
        end
      end

      context 'by supporting operation {^⁻⁴}' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            expect(((-1337)^⁻⁴).to_r).to eq(Rational(1, 1337 ** 4))
            expect((-10^⁻⁴)).to eq(Rational(1, 10 ** 4))
            expect(-1^⁻⁴).to eq(data_rational_one)
            expect(1^⁻⁴).to eq(data_rational_one)
            expect(10^⁻⁴).to eq(Rational(1, 10 ** 4))
            expect(1337^⁻⁴).to eq(Rational(1, 1337 ** 4))
          end
          it 'cases: negative' do
            expect{0^⁻⁴}.to raise_error(ZeroDivisionError)
          end
        end
      end

      context 'by supporting operation {^⁻³}' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            expect(((-1337)^⁻³).to_r.to_s).to eq('1/-2389979753')
            expect((-10^⁻³).to_s).to eq('1/-1000')
            expect(-1^⁻³).to eq(data_rational_negative_one)
            expect(1^⁻³).to eq(data_rational_one)
            expect(10^⁻³).to eq(Rational(1, 10 ** 3))
            expect(1337^⁻³).to eq(Rational(1, 1337 ** 3))
          end
          it 'cases: negative' do
            expect{0^⁻³}.to raise_error(ZeroDivisionError)
          end
        end
      end

      context 'by supporting operation {^⁻²}' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            expect(((-1337)^⁻²).to_r).to eq(Rational(1, 1337 ** 2))
            expect((-10^⁻²)).to eq(Rational(1, 10 ** 2))
            expect(-1^⁻²).to eq(data_rational_one)
            expect(1^⁻²).to eq(data_rational_one)
            expect(10^⁻²).to eq(Rational(1, 10 ** 2))
            expect(1337^⁻²).to eq(Rational(1, 1337 ** 2))
          end
          it 'cases: negative' do
            expect{0^⁻²}.to raise_error(ZeroDivisionError)
          end
        end
      end

      context 'by supporting operation {^⁻¹}' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            expect(((-1337)^⁻¹).to_r.to_s).to eq('1/-1337')
            expect((-10^⁻¹).to_s).to eq('1/-10')
            expect(-1^⁻¹).to eq(data_rational_negative_one)
            expect(1^⁻¹).to eq(data_rational_one)
            expect(10^⁻¹).to eq(Rational(1, 10))
            expect(1337^⁻¹).to eq(Rational(1, 1337))
          end
          it 'cases: negative' do
            expect{0^⁻¹}.to raise_error(ZeroDivisionError)
          end
        end
      end



  # @return [Symbol]
  def ⁻⁹ ; :⁻⁹ ; end

  # @return [Symbol]
  def ⁻⁸ ; :⁻⁸ ; end

  # @return [Symbol]
  def ⁻⁷ ; :⁻⁷ ; end

  # @return [Symbol]
  def ⁻⁶ ; :⁻⁶ ; end

  # @return [Symbol]
  def ⁻⁵ ; :⁻⁵ ; end

  # @return [Symbol]
  def ⁻⁴ ; :⁻⁴ ; end

  # @return [Symbol]
  def ⁻³ ; :⁻³ ; end

  # @return [Symbol]
  def ⁻² ; :⁻² ; end

  # @return [Symbol]
  def ⁻¹ ; :⁻¹ ; end

      :⁻⁹.🆔 => -9,
      :⁻⁸.🆔 => -8,
      :⁻⁷.🆔 => -7,
      :⁻⁶.🆔 => -6,
      :⁻⁵.🆔 => -5,
      :⁻⁴.🆔 => -4,
      :⁻³.🆔 => -3,
      :⁻².🆔 => -2,
      :⁻¹.🆔 => -1,

    context 'by supporting operation {^⁻⁹}' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          data_range_floats.∀{|n| expect(n^⁻⁹).to eq(1.0 / (n ** 9.0))}
        end
        it 'cases: negative' do
          expect{data_float_nan^⁻⁹}.to raise_error(RuntimeError)
          expect(data_float_inf^⁻⁹).to eq(0)
          expect(data_float_negative_inf^⁻⁹).to eq(0)
        end
      end
    end

    context 'by supporting operation {^⁻⁸}' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          data_range_floats.∀{|n| expect(n^⁻⁸).to eq(1.0 / (n ** 8.0))}
        end
        it 'cases: negative' do
          expect{data_float_nan^⁻⁸}.to raise_error(RuntimeError)
          expect(data_float_inf^⁻⁸).to eq(0)
          expect(data_float_negative_inf^⁻⁸).to eq(0)
        end
      end
    end

    context 'by supporting operation {^⁻⁷}' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          data_range_floats.∀{|n| expect(n^⁻⁷).to eq(1.0 / (n ** 7.0))}
        end
        it 'cases: negative' do
          expect{data_float_nan^⁻⁷}.to raise_error(RuntimeError)
          expect(data_float_inf^⁻⁷).to eq(0)
          expect(data_float_negative_inf^⁻⁷).to eq(0)
        end
      end
    end

    context 'by supporting operation {^⁻⁶}' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          data_range_floats.∀{|n| expect(n^⁻⁶).to eq(Rational(1.0, n ** 6.0))}
        end
        it 'cases: negative' do
          expect{data_float_nan^⁻⁶}.to raise_error(RuntimeError)
          expect(data_float_inf^⁻⁶).to eq(0)
          expect(data_float_negative_inf^⁻⁶).to eq(0)
        end
      end
    end

    context 'by supporting operation {^⁻⁵}' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          data_range_floats.∀{|n| expect(n^⁻⁵).to eq(1.0 / (n ** 5.0))}
        end
        it 'cases: negative' do
          expect{data_float_nan^⁻⁵}.to raise_error(RuntimeError)
          expect(data_float_inf^⁻⁵).to eq(0)
          expect(data_float_negative_inf^⁻⁵).to eq(0)
        end
      end
    end

    context 'by supporting operation {^⁻⁴}' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          data_range_floats.∀{|n| expect(n^⁻⁴).to eq(1.0 / (n ** 4.0))}
        end
        it 'cases: negative' do
          expect{data_float_nan^⁻⁴}.to raise_error(RuntimeError)
          expect(data_float_inf^⁻⁴).to eq(0)
          expect(data_float_negative_inf^⁻⁴).to eq(0)
        end
      end
    end

    context 'by supporting operation {^⁻³}' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          data_range_floats.∀{|n| expect(n^⁻³).to eq(1.0 / (n ** 3.0))}
        end
        it 'cases: negative' do
          expect{data_float_nan^⁻³}.to raise_error(RuntimeError)
          expect(data_float_inf^⁻³).to eq(0)
          expect(data_float_negative_inf^⁻³).to eq(0)
        end
      end
    end

    context 'by supporting operation {^⁻²}' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          data_range_floats.∀{|n| expect(n^⁻²).to eq(1.0 / (n ** 2.0))}
        end
        it 'cases: negative' do
          expect{data_float_nan^⁻²}.to raise_error(RuntimeError)
          expect(data_float_inf^⁻²).to eq(0)
          expect(data_float_negative_inf^⁻²).to eq(0)
        end
      end
    end

    context 'by supporting operation {^⁻¹}' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          data_range_floats.∀{|n| expect(n^⁻¹).to eq(1.0 / n)}
        end
        it 'cases: negative' do
          expect{data_float_nan^⁻¹}.to raise_error(RuntimeError)
          expect(data_float_inf^⁻¹).to eq(0)
          expect(data_float_negative_inf^⁻¹).to eq(0)
        end
      end
    end
    context 'adds support for power operations' do

      context 'by supporting operation {^⁰}' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            data_range_complex_simple.∀{|n| expect(n^⁰).to eq(1)}
            data_range_complex.∀{|n| expect(n^⁰).to eq(1)}
          end
          it 'cases: negative' do
            data_complex_error_cases.∀{|n| expect{n^⁰}.to raise_error(RuntimeError)}
            expect{data_infinity_with_complex^⁰}.to raise_error(RuntimeError)
            expect{data_negative_infinity_with_complex^⁰}.to raise_error(RuntimeError)
            expect{data_nan_with_complex^⁰}.to raise_error(RuntimeError)
          end
        end
      end

      context 'by supporting operation {^¹}' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            data_range_complex_simple.∀{|n| expect(n^¹).to eq(n)}
            data_range_complex.∀{|n| expect(n^¹).to eq(n)}
            expect(data_complex_inf^¹).to eq(data_complex_inf)
            expect(data_complex_negative_inf^¹).to eq(data_complex_negative_inf)
            expect(data_infinity_with_complex^¹).to eq(data_infinity_with_complex)
            expect(data_negative_infinity_with_complex^¹).to eq(data_negative_infinity_with_complex)
          end
          it 'cases: negative' do
            expect{data_complex_nan^¹}.to raise_error(RuntimeError)
            expect{data_nan_with_complex^¹}.to raise_error(RuntimeError)
          end
        end
      end

      context 'by supporting operation {^²}' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            data_range_complex_simple.∀{|n| expect(n^²).to eq(n * n)}
            data_range_complex.∀{|n| expect(n^²).to eq(n * n)}
            expect(data_complex_inf^²).to eq(data_complex_inf)
            expect(data_complex_negative_inf^²).to eq(data_complex_inf)
            expect(data_infinity_with_complex^²).to eq(data_infinity_with_complex)
            expect(data_negative_infinity_with_complex^²).to eq(data_negative_infinity_with_complex)
          end
          it 'cases: negative' do
            expect{data_complex_nan^²}.to raise_error(RuntimeError)
            expect{data_nan_with_complex^²}.to raise_error(RuntimeError)
          end
        end
      end

    end


  # @param [Numeric|Symbol] them | if 🆔 matches a power (ex: ²), then essentially perform: Math.pow(self, them)
  def ^(them)
    pow_match = ::Numeric::POW_IDS_OBJ_ID_TO_INTS.fetch(them.🆔, -1337)
    case(pow_match)
    when -1337
      🛑 ArgumentError.🆕("| c{Complex}-> m{^}, got arg(them) as{#{them.to_s}}, a {#{them.class.to_s}}, it's object_id did not match any of the pre-defined math power symbols |")
    when 0
      return 1 if self.𝕌?
      🛑 RuntimeError.🆕("| c{Complex}-> m{^}, self is{#{self.to_s}}, which may not be raised to power(0) |")
    when 1
      return self unless self.real.nan?
      🛑 RuntimeError.🆕("| c{Complex}-> m{^}, self is{#{self.to_s}}, which may not be raised to power(1) |")
    else
      return self ** pow_match unless self.real.nan?
      🛑 RuntimeError.🆕("| c{Complex}-> m{^}, self is{#{self.to_s}}, which may not be raised to power(#{pow_match.to_s}) |")
    end
  end

  # @param [Numeric|Symbol] them | if 🆔 matches a power (ex: ²), then essentially perform: Math.pow(self, them)
  def ^(them)
    pow_match = self.get_pow_match(them.🆔)
    case(pow_match)
    when -1337
      🛑 ArgumentError.🆕("| c{BigDecimal}-> m{^}, got arg(them) as{#{them.to_s}}, a {#{them.class.to_s}}, it's object_id did not match any of the pre-defined math power symbols |")
    else
      self ** pow_match
    end
  end

  # @param [Numeric|Symbol] them | if 🆔 matches a power (ex: ²), then essentially perform: Math.pow(self, them)
  def ^(them)
    pow_match = self.get_pow_match(them.🆔)
    case(pow_match)
    when -1
      🛑 ArgumentError.🆕("| c{Rational}-> m{^}, got arg(them) as{#{them.to_s}}, a {#{them.class.to_s}}, it's object_id did not match any of the pre-defined math power symbols |")
    else
      self ** pow_match
    end
  end


  # @return
  #def ❌ ; -1337 ; end

#TODO: Section for tech_debts


=end


```