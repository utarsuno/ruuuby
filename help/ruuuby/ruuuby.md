
### Ruuuby Glossary

#### TODOs D:
```
 * https://www.honeybadger.io/blog/ruby-unicode-normalization/

```

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
| not-used | `⚠️`, `👈`, `👉`, `🆚`, `📝` |

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


#### helpful links

 * http://www.mathspadilla.com/3ESO/Unit4-DecimalNumbersRealNumbersScientificNotation/conjuntos_reales.png


##### TODOs

 * from: https://makandracards.com/makandra/20633-ruby-constant-lookup-the-good-the-bad-and-the-ugly
   * "Never make a class name for which an existing class name is a suffix. E.g. don't create a class Api::User when you also have a ::User."

 * document this: https://blog.bigbinary.com/2016/11/18/ruby-2-4-unifies-fixnum-and-bignum-into-integer.html
 
#### Temporary Code (to be cleaned up for future versions)

```ruby


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

end

```

```ruby


#RbConfig
#

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


=end

=begin
      it 'has global config ' do

        #git config --list
        #git config --global core.autocrlf true

        #core.autocrlf=true

        cmd = TTY::Command.new(printer: :progress)
        #out, err = cmd.run('git config --list')
        out, err = cmd.run(::Ruuuby::CLI::GIT::CMD_LIST_CONFIGS)

        puts err.class
        puts err.length

        puts "OUTPUT!!!"
        #puts out
        puts out.class

        my_out = out.split("\n")
        puts my_out.class

        my_out.each do |line|
          splitted = line.split('=')
          #puts splitted.to_s
          if splitted[0] == ::Ruuuby::CLI::GIT::CONFIG_WINDOWS_NEWLINE_PREVENTION
            puts line
            puts line
            puts splitted[0]
            puts splitted[1]
          end
        end

        # TODO: USE REGEX TO PARSE CURRENTLY KNOWN FORMAT RULES!

=end
