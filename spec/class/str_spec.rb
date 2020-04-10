# coding: utf-8

RSpec.describe 'str' do
  let(:data_empty){''}
  let(:wrong_param_type){Ruuuby::ParamErr::WrongParamType}
  let(:syntax_str){::String::Syntax}

  let(:funcs_upcase?){[:upcase?, :⬆️?, :⬆?, :🔠?]}
  let(:funcs_downcase?){[:downcase?, :⬇️?, :⬇?, :🔡?]}


  context 'extends class[String]' do

    context 'by adding needed static functions' do

      context 'syntax-functions' do
        context 'warm cache exists' do
          it 'func{syntax_char_uppercase}' do
            expect_syntax(::String, :syntax_char_uppercase, syntax_str::CHAR_UPPERCASE)
          end
          it 'func{syntax_char_lowercase}' do
            expect_syntax(::String, :syntax_char_lowercase, syntax_str::CHAR_LOWERCASE)
          end
          it 'func{syntax_case_camel}' do
            expect_syntax(::String, :syntax_case_camel, syntax_str::CASE_CAMEL)
          end
          it 'func{syntax_case_snake}' do
            expect_syntax(::String, :syntax_case_snake, syntax_str::CASE_SNAKE)
          end
          it 'func{syntax_len_any_as_int}' do
            expect_syntax(::String, :syntax_len_any_as_int, syntax_str::LEN_ANY_AS_INT)
          end
          it 'func{syntax_len_3_as_inf}' do
            expect_syntax(::String, :syntax_len_3_as_inf, syntax_str::LEN_3_AS_INF)
          end
          it 'func{syntax_len_3_as_int}' do
            expect_syntax(::String, :syntax_len_3_as_int, syntax_str::LEN_3_AS_INT)
          end
          it 'func{syntax_len_3_as_flt}' do
            expect_syntax(::String, :syntax_len_3_as_flt, syntax_str::LEN_3_AS_FLT)
          end
          it 'func{syntax_trigonometric_angle}' do
            expect_syntax(::String, :syntax_trigonometric_angle, syntax_str::TRIGONOMETRIC_ANGLE)
          end
        end
        context 'cold cache exists' do
          it 'syntax{SQL_LEN_2_INF} is not cached' do
            do_not_expect_syntax(::String, :syntax_sql_len_2_inf)
          end
          it 'syntax{SQL_LEN_3_INF} is not cached' do
            do_not_expect_syntax(::String, :syntax_sql_len_3_inf)
          end
        end
      end

    end

    it 'by creating needed aliases' do
      expect_added_ruby_methods(::String, cΔ_String)

      RuuubyTestHelper::CONFIG_STRING[:c].∀{ |func| expect(::String.∃⨍?(func)).to eq(true) }
      RuuubyTestHelper::CONFIG_STRING[:aliases].∀{ |aliased_func, base_func| expect(::String.∃⨍?(aliased_func)).to eq(true) }
    end

    context 'snake vs camel case' do

      context 'func{to_🐍}' do
        context 'handles needed scenarios' do
          context 'cases: positive' do
            it 'from syntax{🐫}' do
              expect('HelloWorld'.to_🐍).to eq('hello_world')
            end
            it 'from syntax{🐫⬇}' do
              expect('helloWorld'.to_🐍).to eq('hello_world')
            end
          end
          it 'cases: error' do
            expect{''.to_🐍}.to raise_error(RuntimeError)
            expect{'_'.to_🐍}.to raise_error(RuntimeError)
            expect{'hello_world'.to_🐍}.to raise_error(RuntimeError)
          end
        end
      end

      context 'func{to_🐫}' do
        context 'handles needed scenarios' do
          context 'cases: positive' do
            it 'from syntax{🐍}' do
              expect('hello_world'.to_🐫).to eq('HelloWorld')
            end
            it 'from syntax{🐍⬆}' do
              expect('HELLO_WORLD'.to_🐫).to eq('HelloWorld')
            end
          end
          it 'cases: error' do
            expect{''.to_🐫}.to raise_error(RuntimeError)
            expect{'_'.to_🐫}.to raise_error(RuntimeError)
            expect{'HelloWorld'.to_🐫}.to raise_error(RuntimeError)
          end
        end
      end  # end: {func{to_🐫}}

      context 'func{🐫?}' do
        context 'handles needed scenarios' do
          context 'cases: positive' do
            it 'camel case strings' do
              %w(HelloWorld NotSnakeCase AMuchLongerVersion AnExcellentTestCaseForAMuchLongerVersion).∀{|scenario| expect(scenario.🐫?).to eq(true)}
            end
            it 'camel case strings w/ numbers too' do
              expect('HelloWorld1337'.🐫?).to eq(true)
              expect('NotSnake1337Case'.🐫?).to eq(true)
            end
          end
          context 'cases: negative' do
            it 'not camel case strings' do
              (%w(_ snake_case helloWorld Hello_World) + ['']).∀{|scenario| expect(scenario.🐫?).to eq(false)}
            end
            it 'not camel case strings w numbers too' do
              %w(A A1337 1337 1337snake_case 1337AMuchLongerVersion).∀{|scenario| expect(scenario.🐫?).to eq(false)}
            end
          end
        end
      end # end: {func{🐫?}}

      context 'func{🐍?}' do
        context 'handles needed scenarios' do
          context 'cases: positive' do
            it 'camel case strings' do
              %w(a hello_world a_much_longer_version_of_hello_world).∀ {|scenario| expect(scenario.🐍?).to eq(true)}
            end
            it 'came case strings w/ numbers too' do
              %w(hello_world1337 hello1337 hello_1337_world).∀ {|scenario| expect(scenario.🐍?).to eq(true)}
            end
          end
          context 'cases: negative' do
            it 'not camel case strings' do
              ['', '_', 'a_', '_a', '__a', 'a__', '_a_', '_a_b'].∀ {|scenario| expect(scenario.🐍?).to eq(false)}
            end
            it 'not camel case strings w numbers too' do
              ['_1337', '1337', '1337a', '1337_a', '1337a_', '1_3_3_7_a_', 'a_ 1_3_3_7_a_'].∀ {|scenario| expect(scenario.🐍?).to eq(false)}
            end
          end
        end
      end  # end: {func{🐍}}

      context 'func{🐫⬇?}' do
        context 'handles needed scenarios' do
          context 'cases: positive' do
            it 'w/ text only' do
              expect('lowerCamelCase'.🐫⬇?).to eq(true)
            end
            it 'w/ text & numbers' do
              expect('lowerCamelCase1337'.🐫⬇?).to eq(true)
            end
          end
          context 'cases: negative' do
            it 'w/ text only' do
              expect(''.🐫⬇?).to eq(false)
              expect('SNAKE'.🐫⬇?).to eq(false)
              expect('LowerCamelCase'.🐫⬇?).to eq(false)
            end
            it 'w/ text & numbers' do
              expect('1337'.🐫⬇?).to eq(false)
              expect('SNAKE1337'.🐫⬇?).to eq(false)
              expect('LowerCamelCase1337'.🐫⬇?).to eq(false)
              expect('1337lowerCamelCase'.🐫⬇?).to eq(false)
              expect('lowerCamelCase_1337'.🐫⬇?).to eq(false)
            end
          end
        end
      end # end: {func{🐫⬇?}}

      context 'func{🐍⬆?}' do
        context 'handles needed scenarios' do
          context 'cases: positive' do
            it 'w/ text only' do
              expect('UPPER_SNAKE_CASE'.🐍⬆?).to eq(true)
              expect('AA'.🐍⬆?).to eq(true)
              expect('ZZ'.🐍⬆?).to eq(true)
            end
            it 'w/ text & numbers' do
              expect('UPPER_SNAKE_CASE1337'.🐍⬆?).to eq(true)
              expect('AA1337'.🐍⬆?).to eq(true)
              expect('ZZ1337'.🐍⬆?).to eq(true)
              expect('UPPER_SNAKE_CASE_1337'.🐍⬆?).to eq(true)
              expect('AA_1337'.🐍⬆?).to eq(true)
              expect('ZZ_1337'.🐍⬆?).to eq(true)
            end
          end
          context 'cases: negative' do
            it 'w/ text only' do
              expect(''.🐍⬆?).to eq(false)
              expect('snake'.🐍⬆?).to eq(false)
              expect('upper_snake_case'.🐍⬆?).to eq(false)
              expect('AaA'.🐍⬆?).to eq(false)
            end
            it 'w/ text & numbers' do
              expect('1337'.🐍⬆?).to eq(false)
              expect('upper_snake_case1337'.🐍⬆?).to eq(false)
            end
          end
        end
      end # end: {func{🐍⬆?}}
    end

    context 'functions for single character operations' do

      context 'func{upcase?}' do
        context 'handles needed scenarios' do
          context 'cases: positive' do
            it 'w/ char' do
              %w(A Z).∀ do |scenario|
                funcs_upcase?.∀{|func| expect(scenario.send(func)).to eq(true)}
              end
            end
            it 'w/ many chars' do
              %w(IsThisUppercase AA ZZ IS_THIS_UPPER_SNAKE_CASE).∀ do |scenario|
                funcs_upcase?.∀{|func| expect(scenario.send(func)).to eq(true)}
              end
            end
          end
          context 'cases: negative' do
            it 'not upper case' do
              %w(a z).∀ do |scenario|
                funcs_upcase?.∀{|func| expect(scenario.send(func)).to eq(false)}
              end
            end
            it 'not single char' do
              ['Aa'].∀ do |scenario|
                funcs_upcase?.∀{|func| expect(scenario.send(func)).to eq(false)}
              end
            end
          end
        end
      end # end: {func{upcase?}}

      context 'func{downcase?}' do
        context 'handles needed scenarios' do
          context 'cases: positive' do
            it 'w/ char' do
              %w(a z).∀ do |scenario|
                funcs_downcase?.∀{|func| expect(scenario.send(func)).to eq(true)}
              end
            end
            it 'w/ many chars' do
              %w(aa zz is_this_downcase).∀ do |scenario|
                funcs_downcase?.∀{|func| expect(scenario.send(func)).to eq(true)}
              end
            end
          end
          context 'cases: negative' do
            it 'not lower case' do
              %w(A Z).∀ do |scenario|
                funcs_downcase?.∀{|func| expect(scenario.send(func)).to eq(false)}
              end
            end
            it 'not single char' do
              %w(aA zZ).∀ do |scenario|
                funcs_downcase?.∀{|func| expect(scenario.send(func)).to eq(false)}
              end
            end
          end
        end
      end # end: {func{downcase?}}

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
      end # end: {func{digit?}}

    end # end-context: {functions for single character operations}

    context 'functions for math related operations (ex: symbolic math)' do

      context 'func{∞?}' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            %w(∞ +∞ -∞ ♾️ +♾️ -♾️ ∞ℂ).∀{|scenario| expect(scenario.∞?).to eq(true)}
          end
          it 'cases: negative' do
            cases_a = %w(∞∞ ++∞ ∞-- ♾️∞ ♾️+ --♾️ ℂ∞ ℂ +ℂ -ℂ +ℂ∞ -ℂ∞ ℂ∞+ ℂ∞-)
            cases_b = ['- ∞', "\n", "\t"]
            (cases_a + cases_b).∀{|scenario| expect(scenario.∞?).to eq(false)}
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
            it 'format D' do
              expect('π/2'.to_radian).to eq(90.0)
            end
          end
          it 'cases: error' do
            ['', 'a', 'ππ', '/3', '2', 'π / 3'].∀{|scenario_err| expect{scenario_err.to_radian}.to raise_error(RuntimeError)}
          end
        end
      end

    end # end-context: {functions for math related operations (ex: symbolic math)}

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
                %w(∞ +∞ -∞ ♾️ +♾️ -♾️ ∞ℂ π +π -π φ +φ -φ).∀{|scenario| expect(scenario.to_num?).to eq(true)}
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

    context 'funcs w/ ♻️' do
      let(:scenarios_p1_error_runtime){[['', 'a'], %w(ab aa)]}
      let(:scenarios_p1_bad_args){[['a', ''], ['a', nil]]}
      let(:scenarios_p2_bad_args){[['abbbabbbabbbabbb', 'a', 5], ['abc', 'a', nil]]}
      let(:specific_data){"5v\t32rfdfkds S\nDgr@ ♻️G<RFG9k@,ex \t\t\n m9t♻️y4f 4v3tbh 54h"}

      context 'func{♻️⟵}' do
        context 'handles needed scenarios' do
          context 'cases: positive' do
            context 'w/ single char terminator' do
              it 'w/ single match' do
                expect('a'.♻️⟵('a')).to eq('')
                expect('a '.♻️⟵(' ')).to eq('a')
                expect(' a'.♻️⟵(' ')).to eq('')
                expect('ab'.♻️⟵('a')).to eq('')
                expect('ab'.♻️⟵('b')).to eq('a')
                expect('bb aab'.♻️⟵('a')).to eq('bb a')
                expect('bb aab'.♻️⟵(' a')).to eq('bb')
                expect('abab'.♻️⟵('b')).to eq('aba')
              end
              it 'w/ multiple matches' do
                expect('aaa'.♻️⟵('a', 2)).to eq('a')
                expect('c c a  '.♻️⟵(' ', 3)).to eq('c c')
                expect('bb aab'.♻️⟵('b', 2)).to eq('b')
                expect('bb aab'.♻️⟵('a', 2)).to eq('bb ')
                expect('bb aaab'.♻️⟵('a', 3)).to eq('bb ')
                expect('bba aab'.♻️⟵('a', 3)).to eq('bb')
                expect('bbaaba'.♻️⟵('a', 3)).to eq('bb')
                expect('aabab'.♻️⟵('b', 2)).to eq('aa')
                expect('astrbvR*QWBRUQW#* aabab'.♻️⟵('b', 3)).to eq('astr')
              end
            end
            context 'w/ multi char terminator' do
              it 'w/ single match' do
                expect('abab'.♻️⟵('ab')).to eq('ab')
                expect('ababab'.♻️⟵('ab')).to eq('abab')
                expect(specific_data.♻️⟵('♻️')).to eq("5v\t32rfdfkds S\nDgr@ ♻️G<RFG9k@,ex \t\t\n m9t")
              end
              it 'w/ multiple matches' do
                expect('ababababab'.♻️⟵('ab', 4)).to eq('ab')
                expect('ababababab'.♻️⟵('aba', 2)).to eq('abab')
                expect(specific_data.♻️⟵('♻️', 2)).to eq("5v\t32rfdfkds S\nDgr@ ")
              end
            end
          end
          context 'cases: error' do
            it 'bad args' do
              scenarios_p2_bad_args.∀ {|s| expect{s[0].♻️⟵(s[1], s[2])}.to raise_error(ArgumentError)}
              scenarios_p1_bad_args.∀ {|s| expect{s[0].♻️⟵(s[1])}.to raise_error(ArgumentError)}
            end
            it 'runtime errors' do
              scenarios_p1_error_runtime.∀ {|s| expect{s[0].♻️⟵(s[1])}.to raise_error(RuntimeError)}
            end
          end
        end
      end # end: {func{♻️⟵}}

      context 'func{♻️⟶}' do
        context 'handles needed scenarios' do
          context 'cases: positive' do
            context 'w/ single char terminator' do
              it 'w/ single match' do
                expect('a'.♻️⟶('a')).to eq('')
                expect('a '.♻️⟶(' ')).to eq('')
                expect(' a'.♻️⟶(' ')).to eq('a')
                expect('ab'.♻️⟶('a')).to eq('b')
                expect('ab'.♻️⟶('b')).to eq('')
                expect('bb aab'.♻️⟶('a')).to eq('ab')
                expect('abab'.♻️⟶('b')).to eq('ab')
              end
              it 'w/ multiple matches' do
                expect('abab'.♻️⟶('b')).to eq('ab')
                expect('ababab'.♻️⟶('b')).to eq('abab')
                expect(specific_data.♻️⟶('G')).to eq("<RFG9k@,ex \t\t\n m9t♻️y4f 4v3tbh 54h")
              end
            end
            context 'w/ multi character terminator' do
              it 'w/ single match' do
                expect('abab'.♻️⟶('ab')).to eq('ab')
                expect('ababab'.♻️⟶('ab')).to eq('abab')
                expect(specific_data.♻️⟶('♻️')).to eq("G<RFG9k@,ex \t\t\n m9t♻️y4f 4v3tbh 54h")
              end
              it 'w/ multiple matches' do
                expect('abab'.♻️⟶('ab', 2)).to eq('')
                expect('abababab'.♻️⟶('ab', 3)).to eq('ab')
                expect(specific_data.♻️⟶('♻️', 2)).to eq("y4f 4v3tbh 54h")
              end
            end
          end
          context 'cases: error' do
            it 'bad args' do
              scenarios_p2_bad_args.∀ {|s| expect{s[0].♻️⟶(s[1], s[2])}.to raise_error(ArgumentError)}
              scenarios_p1_bad_args.∀ {|s| expect{s[0].♻️⟶(s[1])}.to raise_error(ArgumentError)}
            end
            it 'runtime errors' do
              scenarios_p1_error_runtime.∀ {|s| expect{s[0].♻️⟶(s[1])}.to raise_error(RuntimeError)}
            end
          end
        end
      end # end: {func{♻️⟶}}

      context 'fund{♻️⟶∞}' do
        context 'handles needed scenarios' do
          context 'cases: positive' do
            it 'single char terminating pattern' do
              expect('a'.♻️⟶∞('a')).to eq('')
              expect('aaaadsadasdasdaaaaaaaaaabaaaaaaaab'.♻️⟶∞('a')).to eq('b')
              expect('a '.♻️⟶∞(' ')).to eq('')
              expect(' a'.♻️⟶∞(' ')).to eq('a')
              expect('ab'.♻️⟶∞('a')).to eq('b')
              expect('abba'.♻️⟶∞('a')).to eq('')
              expect('ab'.♻️⟶∞('b')).to eq('')
              expect('bb aab'.♻️⟶∞('a')).to eq('b')
              expect('abab'.♻️⟶∞('b')).to eq('')
              expect('abab'.♻️⟶∞('a')).to eq('b')
            end
            it 'multi char terminating pattern' do
              expect('abab'.♻️⟶∞('ab')).to eq('')
              expect('ababab'.♻️⟶∞('ab')).to eq('')
              expect('abaccbab'.♻️⟶∞('cc')).to eq('bab')
              expect('abacccbabcbab'.♻️⟶∞('cc')).to eq('babcbab')
              expect(specific_data.♻️⟶∞('♻️')).to eq("y4f 4v3tbh 54h")
            end
          end
          context 'cases: error' do
            it 'bad args' do
              scenarios_p2_bad_args.∀ {|s| expect{s[0].♻️⟶∞(s[1], s[2])}.to raise_error(ArgumentError)}
              scenarios_p1_bad_args.∀ {|s| expect{s[0].♻️⟶∞(s[1])}.to raise_error(ArgumentError)}
            end
            it 'runtime errors' do
              scenarios_p1_error_runtime.∀ {|s| expect{s[0].♻️⟶∞(s[1])}.to raise_error(RuntimeError)}
            end
          end
        end
      end # end: {fund{♻️⟶∞}}
    end # end: {funcs w/ ♻️}

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

    context 'set operations' do
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
  context 'performance', :performance do
    let(:big_str){'ABT$JM^#$^ABT$JM^#$^ABT$JM^#$^ABT$JM^#$^ABT$JM^#$^AT$JM^#$^ABT$JM^#$^ABT$JM^#$^ABT$JM^#$^ABT$JM^#$^ABT$JM^#$^ABT$JM^#$^'}
    let(:a_str){'any54wyv45hv'}

    context 'set operations run fast enough' do
      context 'func{∋?}' do
        context 'for needed scenarios' do
          it 'cases: positive' do
            expect{a_str.∋?('c')}.to perform_very_quickly
          end
          it 'cases: negative' do
            expect{'abc'.∋?('d')}.to perform_very_quickly
          end
        end
      end

      context 'func{∌?}' do
        context 'for needed scenarios' do
          it 'cases: positive' do
            expect{a_str.∌?('c')}.to perform_very_quickly
          end
          it 'cases: negative' do
            expect{'abc'.∌?('b')}.to perform_very_quickly
          end
        end
      end

      context 'func{∈?}' do
        context 'for needed scenarios' do
          it 'cases: positive' do
            expect{a_str.∈?('c')}.to perform_very_quickly
          end
          it 'cases: negative' do
            expect{'d'.∈?('abc')}.to perform_very_quickly
          end
        end
      end

      context 'func{∉?}' do
        context 'for needed scenarios' do
          it 'cases: positive' do
            expect{a_str.∉?('c')}.to perform_very_quickly
          end
          it 'cases: negative' do
            expect{'b'.∉?(%w(a cc b))}.to perform_very_quickly
          end
        end
      end
    end

    context 'snake vs camel case' do
      context 'func{🐫?}' do
        context 'runs fast enough for needed scenarios' do
          context 'cases: positive' do
            it 'camel case strings' do
              expect{'AMuchLongerVersion'.🐫?}.to perform_very_quickly
            end
            it 'camel case strings w/ numbers too' do
              expect{'HelloWorld1337'.🐫?}.to perform_very_quickly
            end
          end
          context 'cases: negative' do
            it 'camel case strings' do
              expect{'_'.🐫?}.to perform_very_quickly
            end
            it 'camel case strings w/ numbers too' do
              expect{'1337AMuchLongerVersion'.🐫?}.to perform_very_quickly
            end
          end
        end
      end
      context 'func{🐫⬇?}' do
        context 'runs fast enough for needed scenarios' do
          context 'cases: positive' do
            it 'w/ text only' do
              expect{'lowerCamelCase'.🐫⬇?}.to perform_very_quickly
            end
            it 'w/ text & numbers' do
              expect{'lowerCamelCase1337'.🐫⬇?}.to perform_very_quickly
            end
          end
          context 'cases: negative' do
            it 'w/ text only' do
              expect{'SNAKE'.🐫⬇?}.to perform_very_quickly
            end
            it 'w/ text & numbers' do
              expect{'LowerCamelCase1337'.🐫⬇?}.to perform_very_quickly
            end
          end
        end
      end
      context 'func{🐍?}' do
        context 'runs fast enough for needed scenarios' do
          context 'cases: positive' do
            it 'camel case strings' do
              expect{'longer_version_of_hello_world'.🐍?}.to perform_very_quickly
            end
            it 'came case strings w/ numbers too' do
              expect{'hello_world1337'.🐍?}.to perform_very_quickly
            end
          end
          context 'cases: negative' do
            it 'not camel case strings' do
              expect{'a_'.🐍?}.to perform_very_quickly
            end
            it 'not camel case strings w numbers too' do
              expect{'1337_a'.🐍?}.to perform_very_quickly
            end
          end
        end
      end
      context 'func{🐍⬆?}' do
        context 'runs fast enough for needed scenarios' do
          context 'cases: positive' do
            it 'camel case strings' do
              expect{'UPPER_SNAKE_CASE'.🐍⬆?}.to perform_very_quickly
            end
            it 'came case strings w/ numbers too' do
              expect{'UPPER_SNAKE_CASE_1337'.🐍⬆?}.to perform_very_quickly
            end
          end
          context 'cases: negative' do
            it 'not camel case strings' do
              expect{'upper_snake_case'.🐍⬆?}.to perform_very_quickly
            end
            it 'not camel case strings w numbers too' do
              expect{'upper_snake_case1337'.🐍⬆?}.to perform_very_quickly
            end
          end
        end
      end
    end # end: {snake vs camel case}

    context 'character functions' do
      context 'func{upcase?} runs fast enough' do
        context 'for needed scenarios' do
          it 'cases: positive' do
            expect{'A'.upcase?}.to perform_very_quickly
            expect{'A'.⬆️?}.to perform_very_quickly
            expect{'A'.⬆?}.to perform_very_quickly
            expect{'A'.🔠?}.to perform_very_quickly
          end
          context 'cases: negative' do
            it 'not lower case' do
              expect{'a'.downcase?}.to perform_very_quickly
              expect{'a'.⬆️?}.to perform_very_quickly
              expect{'a'.⬆?}.to perform_very_quickly
              expect{'a'.🔠?}.to perform_very_quickly
            end
            it 'not single char' do
              expect{'AA'.downcase?}.to perform_very_quickly
              expect{'AA'.⬆️?}.to perform_very_quickly
              expect{'AA'.⬆?}.to perform_very_quickly
              expect{'AA'.🔠?}.to perform_very_quickly
            end
          end
        end
      end
      context 'func{downcase?} runs fast enough' do
        context 'for needed scenarios' do
          it 'cases: positive' do
            expect{'a'.downcase?}.to perform_very_quickly
            expect{'a'.⬇️?}.to perform_very_quickly
            expect{'a'.⬇?}.to perform_very_quickly
            expect{'a'.🔡?}.to perform_very_quickly
          end
          context 'cases: negative' do
            it 'not lower case' do
              expect{'A'.downcase?}.to perform_very_quickly
              expect{'A'.⬇️?}.to perform_very_quickly
              expect{'A'.⬇?}.to perform_very_quickly
              expect{'A'.🔡?}.to perform_very_quickly
            end
            it 'not single char' do
              expect{'aa'.downcase?}.to perform_very_quickly
              expect{'aa'.⬇️?}.to perform_very_quickly
              expect{'aa'.⬇?}.to perform_very_quickly
              expect{'aa'.🔡?}.to perform_very_quickly
            end
          end
        end
      end
      context 'func{digit?} runs fast enough' do
        context 'for needed scenarios' do
          it 'cases: positive' do
            expect{'1'.digit?}.to perform_very_quickly
          end
          it 'cases: negative' do
            expect{'+1'.digit?}.to perform_very_quickly
          end
        end
      end
    end # end: {character functions}

    it 'func{>>} runs fast enough' do
      expect{''.>> ''}.to perform_extremely_quickly
      expect{''.>> 'bASDVASb5t4t'}.to perform_very_quickly
      expect{a_str.>> 'bASDVASb5t4t'}.to perform_very_quickly
    end

    context 'funcs w/ ♻️' do
      context 'func{♻️⟵}' do
        context 'handles needed performance scenarios' do
          context 'cases: positive' do
            context 'w/ single char terminator' do
              it 'w/ single match' do
                expect{'bb aab'.♻️⟵('a')}.to perform_very_quickly
              end
              it 'w/ multiple matches' do
                expect{'c c a  '.♻️⟵(' ', 3)}.to perform_very_quickly
              end
            end
            context 'w/ multi char terminator' do
              it 'w/ single match' do
                expect{'ababab'.♻️⟵('ab')}.to perform_very_quickly
              end
              it 'w/ multiple matches' do
                expect{'ababababab'.♻️⟵('aba', 2)}.to perform_very_quickly
              end
            end
          end
        end
      end # end: {func{♻️⟵}}

      context 'func{♻️⟶}' do
        context 'handles needed performance scenarios' do
          context 'cases: positive' do
            context 'w/ single char terminator' do
              it 'w/ single match' do
                expect{'bb aab'.♻️⟶('a')}.to perform_very_quickly
              end
              it 'w/ multiple matches' do
                expect{'ababab'.♻️⟶('b')}.to perform_very_quickly
              end
            end
            context 'w/ multi character terminator' do
              it 'w/ single match' do
                expect{'ababab'.♻️⟶('ab')}.to perform_very_quickly
              end
              it 'w/ multiple matches' do
                expect{'abababab'.♻️⟶('ab', 3)}.to perform_very_quickly
              end
            end
          end
        end
      end # end: {func{♻️⟶}}

      context 'fund{♻️⟶∞}' do
        context 'handles needed performance scenarios' do
          context 'cases: positive' do
            it 'single char terminating pattern' do
              expect{'abbaa'.♻️⟶∞('a')}.to perform_very_quickly
            end
            it 'multi char terminating pattern' do
              expect{'abacccbabcbab'.♻️⟶∞('cc')}.to perform_very_quickly
            end
          end
        end
      end # end: {fund{♻️⟶∞}}
    end # end: {funcs w/ ♻️}

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
          it 'format D' do
            expect{'π/2'.to_radian}.to perform_very_quickly
          end
        end
      end
    end

    # TODO: LOTS OF MISSING COVERAGE

  end

end
