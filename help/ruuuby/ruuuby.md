
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

#### Ruby Build

```
CC=/usr/bin/gcc rbenv install 2.7.0
```


#### helpful links

 * http://www.mathspadilla.com/3ESO/Unit4-DecimalNumbersRealNumbersScientificNotation/conjuntos_reales.png


##### TODOs

 * from: https://makandracards.com/makandra/20633-ruby-constant-lookup-the-good-the-bad-and-the-ugly
   * "Never make a class name for which an existing class name is a suffix. E.g. don't create a class Api::User when you also have a ::User."

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

# TODO: automate this type of tracking (ex: parse git history)
# 0.0.18
 * unit:        n
 * performance: n
 * audits:      n
 * features:    ~21

# 0.0.18
 * unit:        292
 * performance: 143
 * audits:      29
 * features:    ~20

# 0.0.17
 * unit:        274
 * performance: 132
 * audits:      12
 * features:    6

* 0.0.16
 * unit:        238
 * performance: 124
 * audits:      12

# 0.0.15
 * unit:        219
 * performance: 111
 * audits:      8


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


module ::Ruuuby

  class LocalCLI
    module LocalGIT
      CMD_LIST_CONFIGS                  = 'git config --list'.❄️
      CONFIG_WINDOWS_NEWLINE_PREVENTION = 'core.autocrlf'.❄️
    end

    def initialize
      @tty_cmd = nil
      @out     = nil
      @err     = nil
    end

    # @return [TTY::Command]
    def tty_cmd
      # printer options:
      #  * :null     (no output)
      #  * :pretty   (colorful output)
      #  * :progress (minimal output with green dot for success and F for failure)
      #  * :quiet    (only output actual command stdout and stderr)
      @tty_cmd ||= TTY::Command.new(printer: :progress)
    end

    def run(cmd)
      @out, @err = self.tty_cmd.run(cmd)
      🛑 RuntimeError.new("cmd{#{cmd.to_s}} failed{#{@err}}") unless @err.∅?

    end
  end
  
end


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

class ::Integer
=begin

  # default operation{"Bitwise EXCLUSIVE OR"}; a check is added in to allow operations such as `5^²`
  #
  # @overload
  #
  # @param [Numeric|Symbol] them | if 🆔 matches a power (ex: ²), then essentially perform: Math.pow(self, them); otherwise default bitwise operation
  #
  # @return [Numeric] "The result may be an Integer, a Float, a Rational, or a complex number."
  #def ^(them)
  #  return self.bitwise_xor(them) if them.int?
    #if ::Numeric::MATH_SET_EXPONENTS.∋?(them.object_id)
    #  ::Numeric::MATH_SET_EXPONENTS.find_index
    #end

  #  case(::Numeric::MATH_OPERATIONS_POWERS.fetch(them.🆔, -1337))
  #  when -1337
  #    self.bitwise_xor(them)
  #  when 0
  #    return 1
  #  when 1
  #    self
  #  else
  #    self ** ::Numeric::MATH_OPERATIONS_POWERS[them.🆔]
  #  end
  #end

    pow_match = ::Numeric::MATH_OPERATIONS_POWERS.fetch(them.🆔, -1337)
    case(pow_match)
    when -1337
      self.bitwise_xor(them)
    when 0
      return 1
    when 1
      self
    else
      self ** pow_match
    end
=end

end

class ::Array
  # @return [Boolean] true, if this array has a length(+𝔠+) of *1*
  def 𝔠₁?; self.𝔠 == 1; end

  # @return [Boolean] true, if this array has a length(+𝔠+) of *2*
  def 𝔠₂?; self.𝔠 == 2; end

  # @return [Boolean] true, if this array has a length(+𝔠+) of *2*
  def 𝔠₃?; self.𝔠 == 3; end
end

class ApplicationRecord < ActiveRecord::Base

end
    it 'defines func{uid}' do
      expect(::ApplicationRecord.∃func?(:uid)).to eq(true)
    end

#TODO: Section for tech_debts

```