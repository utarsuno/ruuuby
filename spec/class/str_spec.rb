# coding: utf-8

RSpec.describe 'str' do
  let(:data_empty){''}
  let(:wrong_param_type){Ruuuby::ParamErr::WrongParamType}

  context 'extends class[String]' do

    context 'by adding needed static functions' do

      context 'syntax-functions' do

        it 'func{syntax_len_any}' do
          expect(::String.respond_to?(:syntax_len_any)).to eq(true)
          expect(::String.syntax_len_any.class).to eq(Regexp)
          expect(::String.syntax_len_any.source).to eq("\\A#{::String::Syntax::LEN_ANY}\\z")
        end

        it 'func{syntax_len_any_as_int}' do
          expect(::String.respond_to?(:syntax_len_any_as_int)).to eq(true)
          expect(::String.syntax_len_any_as_int.class).to eq(Regexp)
          expect(::String.syntax_len_any_as_int.source).to eq("\\A#{::String::Syntax::LEN_ANY_AS_INT}\\z")
        end

        it 'func{syntax_len_3_as_inf' do
          expect(::String.respond_to?(:syntax_len_3_as_inf)).to eq(true)
          expect(::String.syntax_len_3_as_inf.class).to eq(Regexp)
          expect(::String.syntax_len_3_as_inf.source).to eq("\\A#{::String::Syntax::LEN_3_AS_INF}\\z")
        end

        it 'func{syntax_len_3_as_int' do
          expect(::String.respond_to?(:syntax_len_3_as_int)).to eq(true)
          expect(::String.syntax_len_3_as_int.class).to eq(Regexp)
          expect(::String.syntax_len_3_as_int.source).to eq("\\A#{::String::Syntax::LEN_3_AS_INT}\\z")
        end

        it 'func{syntax_len_3_as_flt' do
          expect(::String.respond_to?(:syntax_len_3_as_flt)).to eq(true)
          expect(::String.syntax_len_3_as_flt.class).to eq(Regexp)
          expect(::String.syntax_len_3_as_flt.source).to eq("\\A#{::String::Syntax::LEN_3_AS_FLT}\\z")
        end

      end

    end

    it 'by creating needed aliases' do
      expect_added_ruby_methods(::String, cΔ_String)

      RuuubyTestHelper::CONFIG_STRING[:c].∀{ |func| expect(::String.∃⨍?(func)).to eq(true) }
      RuuubyTestHelper::CONFIG_STRING[:aliases].∀{ |aliased_func, base_func| expect(::String.∃⨍?(aliased_func)).to eq(true) }
    end

    context 'func{digit?}' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          data_range_ints_zero_to_nine.∀ do |scenario|
            expect(scenario.to_s.digit?).to eq(true)
          end
        end
        it 'cases: negative' do
          expect('+1'.digit?).to eq(false)
          expect('-1'.digit?).to eq(false)
          expect('1.'.digit?).to eq(false)
          expect('1.0'.digit?).to eq(false)
          expect('.1'.digit?).to eq(false)
        end
      end
    end

    context 'func{∞?}' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          expect('∞'.∞?).to eq(true)
          expect('+∞'.∞?).to eq(true)
          expect('-∞'.∞?).to eq(true)

          expect('♾️'.∞?).to eq(true)
          expect('+♾️'.∞?).to eq(true)
          expect('-♾️'.∞?).to eq(true)

          expect('∞ℂ'.∞?).to eq(true)
        end
        it 'cases: negative' do
          expect('∞∞'.∞?).to eq(false)
          expect('++∞'.∞?).to eq(false)
          expect('- ∞'.∞?).to eq(false)

          expect('♾️∞'.∞?).to eq(false)
          expect('♾️+'.∞?).to eq(false)
          expect('--♾️'.∞?).to eq(false)

          expect('ℂ∞'.∞?).to eq(false)
        end
      end
    end

    context 'func{to_radian}' do
      context 'handles needed scenarios' do
        context 'cases: positive' do
          it 'format A' do
            expect('0'.to_radian).to eq(0.0)
            expect('π'.to_radian).to eq(180.0)
          end
          it 'format B' do
            expect('2π'.to_radian).to eq(360.0)
            expect('3π'.to_radian).to eq(540.0)
          end
          it 'format C' do
            expect('2π/3'.to_radian).to eq(120)
          end
        end
        it 'cases: error' do
          expect{''.to_radian}.to raise_error(RuntimeError)
          expect{'a'.to_radian}.to raise_error(RuntimeError)
          expect{'ππ'.to_radian}.to raise_error(RuntimeError)
          expect{'/3'.to_radian}.to raise_error(RuntimeError)
          expect{'2'.to_radian}.to raise_error(RuntimeError)
          expect{'π / 3'.to_radian}.to raise_error(RuntimeError)
        end
      end
    end

    context 'func{to_num} and func{to_num?}' do
      context 'handles needed scenarios' do
        context 'cases: positive' do

          context 'validates special formats and characters' do
            it 'infinity' do
              expect('∞'.to_num).to eq(data_float_inf)
              expect('+∞'.to_num).to eq(data_float_inf)
              expect('-∞'.to_num).to eq(data_float_negative_inf)

              expect('♾️'.to_num).to eq(data_float_inf)
              expect('+♾️'.to_num).to eq(data_float_inf)
              expect('-♾️'.to_num).to eq(data_float_negative_inf)

              expect('∞ℂ'.to_num).to eq(::Float::INFINITY_COMPLEX)
            end
            it 'pie(π)' do
              expect('π'.to_num).to eq(π)
              expect('+π'.to_num).to eq(π)
              expect('-π'.to_num).to eq(-π)
            end
            it 'golden-ratio(φ)' do
              expect('φ'.to_num).to eq(φ)
              expect('+φ'.to_num).to eq(φ)
              expect('-φ'.to_num).to eq(-φ)
            end
            context 'for func{to_num?}' do
              it 'same-cases' do
                expect('∞'.to_num?).to eq(true)
                expect('+∞'.to_num?).to eq(true)
                expect('-∞'.to_num?).to eq(true)

                expect('♾️'.to_num?).to eq(true)
                expect('+♾️'.to_num?).to eq(true)
                expect('-♾️'.to_num?).to eq(true)

                expect('∞ℂ'.to_num?).to eq(true)

                expect('π'.to_num?).to eq(true)
                expect('+π'.to_num?).to eq(true)
                expect('-π'.to_num?).to eq(true)

                expect('φ'.to_num?).to eq(true)
                expect('+φ'.to_num?).to eq(true)
                expect('-φ'.to_num?).to eq(true)
              end
            end
          end

          context 'valid formats of length 1' do
            it 'all cases' do
              data_range_ints_zero_to_nine.∀ do |scenario|
                expect_regular_int(scenario.to_s.to_num, scenario)
              end
            end
            context 'for func{to_num?}' do
              it 'same-cases' do
                data_range_ints_zero_to_nine.∀ do |scenario|
                  expect(scenario.to_s.to_num?).to eq(true)
                end
              end
            end
          end

          context 'valid formats of length 2' do
            it 'equaling 0' do
              expect_regular_int('00'.to_num, 0)
              expect_regular_int('-0'.to_num, 0)
              expect_regular_int('+0'.to_num, 0)
              expect_regular_flt('.0'.to_num, 0.0)
            end
            it 'equaling whole number' do
              expect_regular_int('01'.to_num, 1)
              expect_regular_int('10'.to_num, 10)
              expect_regular_int('13'.to_num, 13)
            end
            it 'equaling decimal number' do
              expect_regular_flt('.1'.to_num, 0.1)
              expect_regular_flt('.9'.to_num, 0.9)
            end
            context 'for func{to_num?}' do
              it 'same-cases' do
                %w(00 -0 +0 .0 01 10 13 .1 .9).∀ do |scenario|
                  expect(scenario.to_num?).to eq(true)
                end
              end
            end
          end
          context 'valid formats of length 3' do
            it 'equaling 0' do
              expect_regular_int('000'.to_num, 0)
              expect_regular_int('-00'.to_num, 0)
              expect_regular_int('+00'.to_num, 0)
              expect_regular_flt('0.0'.to_num, 0)
            end
            it 'equaling whole number' do
              expect_regular_int('001'.to_num, 1)
              expect_regular_int('+01'.to_num, 1)
              expect_regular_int('-01'.to_num, -1)
              expect_regular_int('456'.to_num, 456)
              expect_regular_int('+56'.to_num, 56)
              expect_regular_int('-56'.to_num, -56)
              expect_regular_flt('4.0'.to_num, 4.0)
              expect_regular_flt('4.7'.to_num, 4.7)
            end
            it 'equaling decimal number' do
              expect_regular_flt('+.1'.to_num, 0.1)
              expect_regular_flt('-.1'.to_num, -0.1)
              expect_regular_flt('1.1'.to_num, 1.1)
            end
            it 'scientific notation' do
              expect_regular_flt('1e1'.to_num, 10.0)
              expect_regular_flt('4e5'.to_num, 4e5)
            end
            context 'for func{to_num?}' do
              it 'same-cases' do
                %w(000 -00 +00 0.0 001 +01 -01 456 +56 -56 4.0 4.7 +.1 -.1 1.1 1e1 4e5).∀ do |scenario|
                  expect(scenario.to_num?).to eq(true)
                end
              end
            end
          end
          context 'valid formats of length > 3' do
            it 'handles all' do
              expect_regular_int('1337133713371337'.to_num, 1337133713371337)
              expect_regular_int('+1337133713371337'.to_num, 1337133713371337)
              expect_regular_int('-1337133713371337'.to_num, -1337133713371337)

              expect_regular_flt('-3e33'.to_num, -3e33)
              expect_regular_flt('1.3371337e3'.to_num, (1.3371337e3))
              expect_regular_flt('+1.3371337e3'.to_num, (1.3371337e3))
              expect_regular_flt('-1.3371337e3'.to_num, (-1.3371337e3))
            end
            context 'for func{to_num?}' do
              it 'same-cases' do
                %w(1337133713371337 +1337133713371337 -1337133713371337 -3e33 1.3371337e3 +1.3371337e3 -1.3371337e3).∀ do |scenario|
                  expect(scenario.to_num?).to eq(true)
                end
              end
            end
          end
        end
        context 'cases: error' do
          it 'empty string' do
            expect{''.to_num}.to raise_error(RuntimeError)
          end
          it 'invalid formats of length 1' do
            expect{'-'.to_num}.to raise_error(RuntimeError)
            expect{'+'.to_num}.to raise_error(RuntimeError)
            expect{'.'.to_num}.to raise_error(RuntimeError)
            expect{'a'.to_num}.to raise_error(RuntimeError)
            expect{"\n".to_num}.to raise_error(RuntimeError)
          end
          it 'invalid formats of length 2' do
            expect{'-+'.to_num}.to raise_error(RuntimeError)
            expect{'1+'.to_num}.to raise_error(RuntimeError)
            expect{'+.'.to_num}.to raise_error(RuntimeError)
            expect{'aa'.to_num}.to raise_error(RuntimeError)

            # such scenarios will not be allowed
            expect{'0.'.to_num}.to raise_error(RuntimeError)
            expect{'7.'.to_num}.to raise_error(RuntimeError)
          end
          context 'for func{to_num?}' do
            it 'same-cases' do
              %w(- + . a \n -+ 1+ +. aa 0. 7.).∀ do |scenario|
                expect(scenario.to_num?).to eq(false)
              end
            end
          end
        end
      end
    end

    context 'fund{♻️until!}' do
      context 'handles needed scenarios' do
        context 'cases: positive' do
          it 'single char terminating pattern' do
            expect('a'.♻️until!('a')).to eq('')
            expect('a '.♻️until!(' ')).to eq('')
            expect(' a'.♻️until!(' ')).to eq('a')
            expect('ab'.♻️until!('a')).to eq('b')
            expect('ab'.♻️until!('b')).to eq('')
            expect('bb aab'.♻️until!('a')).to eq('ab')
            expect('abab'.♻️until!('b')).to eq('ab')
          end
          it 'multi char terminating pattern' do
            expect('abab'.♻️until!('ab')).to eq('ab')
            expect('ababab'.♻️until!('ab')).to eq('abab')
            expect('ababab'.♻️until!('ab')).to eq('abab')

            specific_data = "5v\t32rfdfkds S\nDgr@ G<RFG9k@,ex \t\t\n m9t♻️y4f 4v3tbh 54h"
            expect(specific_data.♻️until!('♻️')).to eq("y4f 4v3tbh 54h")
          end
          it 'preserves object ID' do
            a_str = 'abc'
            a_id  = a_str.🆔
            a_str.♻️until!('b')
            expect(a_id).to eq(a_str.🆔)
          end
        end
        context 'cases: error' do
          it 'bad args' do
            expect{'a'.♻️until!('')}.to raise_error(ArgumentError)
          end
          it 'runtime errors' do
            expect{''.♻️until!('a')}.to raise_error(RuntimeError)
            expect{'ab'.♻️until!('aa')}.to raise_error(RuntimeError)
          end
        end
      end
    end

    context 'func{ensure_ending!}' do
      context 'handles cases' do
        it 'preserving object_id' do
          a = 'apple'
          b = a.🆔
          a.ensure_ending!('plebasdagh524yc')
          expect(a).to eq('applebasdagh524yc')
          expect(a.🆔).to eq(b)
        end
        context 'positive' do
          context 'with partial fill in' do
            it 'passes simple scenarios' do
              [
                  ['', '', ''], ['', 'aaa', 'aaa'], ['aaa', '', 'aaa'], %w(hello? ? hello?), %w(hello ?a hello?a), %w(hellb ?? hellb??), %w(hello? ?? hello??)
              ].∀{|a|expect(a[0].ensure_ending!(a[1])).to eq(a[2])}
            end
            it 'passes complex scenarios' do
              [
                  %w(baa aaa baaa), %w(bba aaa bbaaa), %w(baa aaaaaaaaa baaaaaaaaa),
                  %w(baaaaa aaaaaa baaaaaa), %w(ba aaaaaaaa baaaaaaaa), %w(abc bca abca),
                  ['hi ', ' ', 'hi '], [' hi', ' ', ' hi '], %w(abc bcd abcd)
              ].∀{|a|expect(a[0].ensure_ending!(a[1])).to eq(a[2])}
            end
          end # end context 'positive' -> 'with partial fill in'
        end # end context 'positive'
        context 'error' do
          it 'catches bad param: start' do
            [nil, 1337, {}].∀{|a|expect{''.ensure_ending!(a)}.to raise_exception(ArgumentError)}
          end
          it 'catches frozen string' do
            a = 'my_frozen_string'.❄️
            a.❄️
            expect{a.ensure_ending!('bbb')}.to raise_error(FrozenError)
          end
        end # end context 'error'
      end
    end

    context 'func{∋?} (include?)' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          expect('abc'.∋? 'b').to eq(true)
        end
        it 'cases: negative' do
          expect('abc'.∋? 'd').to eq(false)
        end
        it 'cases: error' do
          expect{'b'.∋?(nil)}.to throw_wrong_param_type('String', '∋?', 'them', NilClass, String)
        end
      end
    end

    context 'func{∌?} (excluded?)' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          expect('abc'.∌? 'd').to eq(true)
        end
        it 'cases: negative' do
          expect('abc'.∌? 'b').to eq(false)
        end
        it 'cases: error' do
          expect{'b'.∌? nil}.to raise_exception(ArgumentError)
          expect{'b'.∌? 1337}.to raise_exception(ArgumentError)
          expect{'b'.∌? %w(a cc b)}.to raise_exception(ArgumentError)
        end
      end
    end

    context 'func{∈?} (include?)' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          expect('b'.∈? 'abc').to eq(true)
          expect('b'.∈? %w(a cc b)).to eq(true)
        end
        it 'cases: negative' do
          expect('d'.∈? 'abc').to eq(false)
        end
        it 'cases: error' do
          expect{'b'.∈? nil}.to raise_exception(ArgumentError)
          expect{'b'.∈? 1337}.to raise_exception(ArgumentError)
        end
      end
    end

    context 'func{∅?} (alias for "remove_empty!")' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          expect(''.∅?).to eq(true)
        end
        it 'cases: negative' do
          expect(' '.∅?).to eq(false)
        end
      end
    end

    context 'func{∉?} (excluded?)' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          expect('d'.∉? 'abc').to eq(true)
          expect('d'.∉? %w(a cc b)).to eq(true)
        end
        it 'cases: negative' do
          expect('b'.∉? 'abc').to eq(false)
          expect('b'.∉? %w(a cc b)).to eq(false)
        end
        it 'cases: error' do
          expect{'b'.∉? nil}.to raise_exception(ArgumentError)
          expect{'b'.∉? 1337}.to raise_exception(ArgumentError)
        end
      end
    end

    context 'func{>>} (prepend operation)' do
      context 'handles cases' do
        context 'positive' do
          it 'simple data' do
            [['', ''], %w(a a), %w(ab ab), [" abcde 101 \n", " abcde 101 \n"]].∀{|a|expect('' >> a[0]).to eq(a[1])}
          end
          it 'complex data' do
            expect('b' >> 'a').to eq('ab')
            expect('baa' >> 'ba').to eq('babaa')
            expect('baaDd' >> 'baaDdd').to eq('baaDddbaaDd')
          end
          it 'preserves object_id' do
            a = 'apple'
            b = a.🆔
            a >> 'c'
            expect(a).to eq('capple')
            expect(a.🆔).to eq(b)
          end
        end
        context 'error' do
          it 'catches wrong parameter type provided' do
            [nil, 1337, {}].∀{|a|expect{'' >> a}.to raise_exception(ArgumentError)}
            expect{'' >> [1] }.to throw_wrong_param_type(String, '>>', 'them', Array, String)
            expect{'' >> nil }.to throw_wrong_param_type(String, '>>', 'them', NilClass, String)
            expect{'' >> 1337 }.to throw_wrong_param_type(String, '>>', 'them', Integer, String)
            expect{'' >> {'apple' => 'aa'} }.to throw_wrong_param_type(String, '>>', 'them', Hash, String)
          end
          it 'catches frozen strings' do
            a = 'my_frozen_string'.❄️
            a.❄️
            expect{a.>>('bbb')}.to raise_error(FrozenError)
          end
        end
      end
    end

    context 'func{ensure_start!}' do
      context 'handles cases' do
        context 'positive' do
          context 'with partial fill in' do
            it 'simple data' do
              [
                  ['', '', ''], ['', ' ', ' '], [' ', ' ', ' '], ['', 'a', 'a'], %w(b a ab), %w(c aaac aaac)
              ].∀{|a|expect(a[0].ensure_start!(a[1])).to eq(a[2])}
            end
            it 'complex data' do
              [
                  %w(baa b baa), %w(baa ba baa), %w(baa baa baa), %w(baa bb bbaa), %w(baa bba bbaa),
                  %w(baa bbaa bbaa), %w(baa bbaaa bbaaabaa), %w(abc123xyz 123 123abc123xyz)
              ].∀{|a|expect(a[0].ensure_start!(a[1])).to eq(a[2])}
            end
          end
        end # end context 'positive'

        context 'error' do
          it 'catches bad param: start' do
            [nil, 1337, {}].∀{|a|expect{''.ensure_start!(a)}.to raise_exception(ArgumentError)}
          end
          it 'catches frozen string' do
            a = 'my_frozen_string'.❄️
            a.❄️
            expect{a.ensure_start!('bbb')}.to raise_error(FrozenError)
          end
        end
      end
    end
  end

  #  __   ___  __   ___  __   __                   __   ___
  # |__) |__  |__) |__  /  \ |__)  |\/|  /\  |\ | /  ` |__
  # |    |___ |  \ |    \__/ |  \  |  | /~~\ | \| \__, |___
  context 'performance', :'performance' do
    let(:big_str){'ABT$JM^#$^ABT$JM^#$^ABT$JM^#$^ABT$JM^#$^ABT$JM^#$^AT$JM^#$^ABT$JM^#$^ABT$JM^#$^ABT$JM^#$^ABT$JM^#$^ABT$JM^#$^ABT$JM^#$^'}
    let(:a_str){'any54wyv45hv'}

    # TODO: HEAVY COVERAGE AUDIT REQUIRED

    context 'func{∋?} runs fast enough' do
      context 'for needed scenarios' do
        it 'cases: positive' do
          expect{a_str.∋?('c')}.to perform_very_quickly
        end
        it 'cases: negative' do
          expect{'abc'.∋?('d')}.to perform_very_quickly
        end
      end
    end

    context 'func{∌?} runs fast enough' do
      context 'for needed scenarios' do
        it 'cases: positive' do
          expect{a_str.∌?('c')}.to perform_very_quickly
        end
        it 'cases: negative' do
          expect{'abc'.∌?('b')}.to perform_very_quickly
        end
      end
    end

    context 'func{∈?} runs fast enough' do
      context 'for needed scenarios' do
        it 'cases: positive' do
          expect{a_str.∈?('c')}.to perform_very_quickly
        end
        it 'cases: negative' do
          expect{'d'.∈?('abc')}.to perform_very_quickly
        end
      end
    end

    context 'func{∉?} runs fast enough' do
      context 'for needed scenarios' do
        it 'cases: positive' do
          expect{a_str.∉?('c')}.to perform_very_quickly
        end
        it 'cases: negative' do
          expect{'b'.∉?(%w(a cc b))}.to perform_very_quickly
        end
      end
    end

    it 'func{>>} runs fast enough' do
      expect{''.>> ''}.to perform_extremely_quickly
      expect{''.>> 'bASDVASb5t4t'}.to perform_very_quickly
      expect{a_str.>> 'bASDVASb5t4t'}.to perform_very_quickly
    end

    context 'func{♻️until!} runs rast enough' do
      # TODO: ADD TEST CASES TO MEASURE BIG-O NOTATION
      context 'handles performance for needed scenarios (for now, more needed)' do
        it 'searching for len-1-match' do
          a_str = 'ABT$JM^#$^ABT$JM^#$^ABT$JM^#$^ABT$JM^#$^ABT$JM^#$^A♻♻️T$JM^#$^ABT$JM^#$^ABT$JM^#$^ABT$JM^#$^ABT$JM^#$^ABT$JM^#$^ABT$JM^#$^'
          expect{a_str.♻️until!('♻')}.to perform_very_quickly
        end
        it 'searching for len-2-match' do
          a_str = 'ABT$JM^#$^ABT$JM^#$^ABT$JM^#$^ABT$JM^#$^ABT$JM^#$^A♻♻️T$JM^#$^ABT$JM^#$^ABT$JM^#$^ABT$JM^#$^ABT$JM^#$^ABT$JM^#$^ABT$JM^#$^'
          expect{a_str.♻️until!('♻️')}.to perform_very_quickly
        end
      end
    end

    context 'with partial fill in, performs quickly' do
      # TODO: ADD TEST CASES TO MEASURE BIG-O NOTATION
      it 'func[ensure_ending!]' do
        [%w(hello ?a), ['', big_str], [big_str, '']].∀{|a|expect{a[0].ensure_ending!(a[1])}.to perform_quickly}
      end
      it 'func[ensure_start!]' do
        [%w(hello ?a), ['', big_str], [big_str, '']].∀{|a|expect{a[0].ensure_start!(a[1])}.to perform_quickly}
      end
    end

    context 'func{∅?} (alias for "remove_empty!")' do
      # TODO: ADD TEST CASES TO MEASURE BIG-O NOTATION
      context 'handles needed scenarios very quickly' do
        it 'cases: positive' do
          expect{''.∅?}.to perform_very_quickly
        end
        it 'cases: negative' do
          expect{' '.∅?}.to perform_very_quickly
        end
      end
    end

    context 'func{to_radian}' do
      context 'handles needed scenarios very quickly' do
        context 'cases: positive' do
          it 'format A' do
            expect{'0'.to_radian}.to perform_very_quickly
            expect{'π'.to_radian}.to perform_very_quickly
          end
          it 'format B' do
            expect{'2π'.to_radian}.to perform_very_quickly
            expect{'1337π'.to_radian}.to perform_very_quickly
          end
          it 'format C' do
            expect{'2π/3'.to_radian}.to perform_very_quickly
            expect{'1337π/1337'.to_radian}.to perform_very_quickly
          end
        end
      end
    end

    # TODO: LOTS OF MISSING COVERAGE

  end

end
