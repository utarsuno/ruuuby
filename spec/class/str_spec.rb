# encoding: UTF-8

RSpec.describe 'str' do
  let(:data_empty){''}
  let(:wrong_param_type){Ruuuby::ParamErr::WrongParamType}
  let(:syntax_str){::String::Syntax}

  let(:scenarios_iso8601_full){%w(2020-04-04T00:00:00Z 2020-04-04T00:00:00-1200 1920-04-04T00:00:01-12:00
1999-04-04T00:00:00-0500 2000-04-04T00:00:01-05:00 2020-01-04T00:01:00+0500 2020-12-04T00:01:01+05:00 2020-11-04T01:00:01+1400
2020-04-04T01:00:01+14:00 2020-04-04T01:01:00-1400 2020-10-04T01:01:01+14:00 2020-09-04T23:12:12+0000 2020-08-04T23:12:12+00:00
2020-07-04T23:12:12+0000 2020-06-04T23:12:12+00:00)}

  let(:scenarios_iso8601_error){['', '2020-04-04T00:00:00-3500', '2020-04-04T00:00:01+26:00']}

  context 'extends class[String]' do

    context 'by adding needed static functions' do
      context 'syntax-functions' do
        context 'warm cache exists' do

          context 'time-related' do

            context 'func{to_iso8601}' do
              context 'handles needed scenarios' do
                context 'cases: positive' do
                  it 'year' do
                    data = '2020'.to_iso8601
                    expect(data.ⓣ).to eq(::DateTime)
                    expect(data.year).to eq(2020)
                  end
                  it 'year & month' do
                    data = '2000-04'.to_iso8601
                    expect(data.ⓣ).to eq(::DateTime)
                    expect(data.year).to eq(2000)
                    expect(data.month).to eq(4)
                  end
                  it 'year & month & day' do
                    data = '1999-11-22'.to_iso8601
                    expect(data.ⓣ).to eq(::DateTime)
                    expect(data.year).to eq(1999)
                    expect(data.month).to eq(11)
                    expect(data.day).to eq(22)
                  end
                  it 'year & month & day & time' do
                    data = '2021-09-01T23:59:00'.to_iso8601
                    expect(data.ⓣ).to eq(::DateTime)
                    expect(data.year).to eq(2021)
                    expect(data.month).to eq(9)
                    expect(data.day).to eq(1)
                    expect(data.hour).to eq(23)
                    expect(data.minute).to eq(59)
                    expect(data.second).to eq(0)
                  end
                  it 'year & month & day & time & time-zone' do
                    data  = '2020-06-02T00:12:12+00:00'.to_iso8601
                    data2 = '2020-06-02T01:12:12+00:00'.to_iso8601
                    expect(data.ⓣ).to eq(::DateTime)
                    expect(data.year).to eq(2020)
                    expect(data.month).to eq(06)
                    expect(data.day).to eq(02)
                    expect(data.hour).to eq(0)
                    expect(data.minute).to eq(12)
                    expect(data.second).to eq(12)

                    expect(data2 > data).to eq(true)
                    expect(data2 < data).to eq(false)
                    expect(data > data2).to eq(false)
                    expect(data < data2).to eq(true)
                  end
                end
              end
            end

            it 'func{syntax_iso8601_normalizable}' do
              expect_syntax(::String, :syntax_iso8601_normalizable, syntax_str::ISO8601_NORMALIZABLE)
            end

            context 'func{syntax_time_year}' do
              it 'exists' do
                expect_syntax(::String, :syntax_time_year, syntax_str::TIME_YEAR)
              end
              it 'handles cases: positive' do
                expect('2020'.match?(::String.syntax_time_year)).to eq(true)
                expect('1900'.match?(::String.syntax_time_year)).to eq(true)
              end
              it 'handles cases: negative' do
                ['0000', '3003', '', '202020'].∀{|scenario| expect(scenario.match?(::String.syntax_time_year)).to eq(false)}
              end
            end
            context 'func{syntax_time_month}' do
              it 'exists' do
                expect_syntax(::String, :syntax_time_month, syntax_str::TIME_MONTH)
              end
              it 'handles cases: positive' do
                expect('01'.match?(::String.syntax_time_month)).to eq(true)
                expect('12'.match?(::String.syntax_time_month)).to eq(true)
              end
              it 'handles cases: negative' do
                ['0', '00', '', '13'].∀{|scenario| expect(scenario.match?(::String.syntax_time_month)).to eq(false)}
              end
            end
            context 'func{syntax_time_day}' do
              it 'exists' do
                expect_syntax(::String, :syntax_time_day, syntax_str::TIME_DAY)
              end
              it 'handles cases: positive' do
                %w(01 12 30 31 29 19 10 09).∀{|scenario| expect(scenario.match?(::String.syntax_time_day)).to eq(true)}
              end
              it 'handles cases: negative' do
                ['-1', '', '34', '41', '00'].∀{|scenario| expect(scenario.match?(::String.syntax_time_day)).to eq(false)}
              end
            end
            context 'func{syntax_time_hour_min}' do
              it 'exists' do
                expect_syntax(::String, :syntax_time_hour_min, syntax_str::TIME_HOUR_MIN)
              end
              it 'handles cases: positive' do
                %w(00:00 23:59 10:12 12:50).∀{|scenario| expect(scenario.match?(::String.syntax_time_hour_min)).to eq(true)}
              end
              it 'handles cases: negative' do
                ['', '000:00', '234:59', '12:60', '24:01'].∀{|scenario| expect(scenario.match?(::String.syntax_time_hour_min)).to eq(false)}
              end
            end
            context 'func{syntax_time_hour_min_sec}' do
              it 'exists' do
                expect_syntax(::String, :syntax_time_hour_min_sec, syntax_str::TIME_HOUR_MIN_SEC)
              end
              it 'handles cases: positive' do
                %w(00:00:00 23:59:13 10:12:10 12:50:02).∀{|scenario| expect(scenario.match?(::String.syntax_time_hour_min_sec)).to eq(true)}
              end
              it 'handles cases: negative' do
                ['', '000:00:00', '234:59:00', '12:60:00', '24:01:00', '10:10:623'].∀{|scenario| expect(scenario.match?(::String.syntax_time_hour_min_sec)).to eq(false)}
              end
            end
            context 'func{syntax_utc_offsets}' do
              it 'exists' do
                expect_syntax(::String, :syntax_utc_offsets, syntax_str::UTC_OFFSETS)
              end
              it 'handles cases: positive' do
                expect('Z'.match?(::String.syntax_utc_offsets)).to eq(true)
                expect('+01'.match?(::String.syntax_utc_offsets)).to eq(true)
                expect('+0100'.match?(::String.syntax_utc_offsets)).to eq(true)
                expect('+01:00'.match?(::String.syntax_utc_offsets)).to eq(true)
                expect('-11:59'.match?(::String.syntax_utc_offsets)).to eq(true)
                expect('+11:59'.match?(::String.syntax_utc_offsets)).to eq(true)
                expect('+23:59'.match?(::String.syntax_utc_offsets)).to eq(true)
                expect('-23:59'.match?(::String.syntax_utc_offsets)).to eq(true)
              end
              it 'handles cases: negative' do
                expect('ZZ'.match?(::String.syntax_utc_offsets)).to eq(false)
                expect(''.match?(::String.syntax_utc_offsets)).to eq(false)
                expect('+24:59'.match?(::String.syntax_utc_offsets)).to eq(false)
                expect('-24:59'.match?(::String.syntax_utc_offsets)).to eq(false)
                expect('+23:61'.match?(::String.syntax_utc_offsets)).to eq(false)
                expect('-23:111'.match?(::String.syntax_utc_offsets)).to eq(false)
              end
            end
            context 'func{syntax_iso8601}' do
              it 'exists' do
                expect_syntax(::String, :syntax_iso8601, syntax_str::ISO8601)
              end
              context 'handles cases: positive' do
                it 'year' do
                  expect('2020'.match?(::String.syntax_iso8601)).to eq(true)
                end
                it 'year & month' do
                  expect('2020-04'.match?(::String.syntax_iso8601)).to eq(true)
                end
                it 'year & month & day' do
                  expect('2020-04-04'.match?(::String.syntax_iso8601)).to eq(true)
                end
                it 'year & month & day & time' do
                  expect('2020-04-04T23:12:12'.match?(::String.syntax_iso8601)).to eq(true)
                end
                it 'year & month & day & time & time-zone' do
                  scenarios_iso8601_full.∀{|scenario| expect(scenario.match?(::String.syntax_iso8601)).to eq(true)}
                end
              end
            end
          end # end: {time-related}
          context 'snake vs camel case' do
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
          end # end: {snake vs camel case}
          context 'symbolic-math' do
            it 'func{syntax_len_any_as_int}' do
              expect_syntax(::String, :syntax_len_any_as_int, syntax_str::LEN_ANY_AS_INT)
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
          end # end: {symbolic-math}
        end
      end # end: {syntax-functions}
    end # end: {by adding needed static functions}

    context 'time relating functionality' do
      context 'func{iso8601?}' do
        context 'cases: positive' do
          it 'year' do
            expect('2020'.iso8601?).to eq(true)
          end
          it 'year & month' do
            expect('2020-04'.iso8601?).to eq(true)
          end
          it 'year & month & day' do
            expect('2020-04-04'.iso8601?).to eq(true)
          end
          it 'year & month & day & time' do
            expect('2020-04-04T23:12:12'.iso8601?).to eq(true)
          end
          it 'year & month & day & time & time-zone' do
            scenarios_iso8601_full.∀{|scenario| expect(scenario.iso8601?).to eq(true)}
          end
        end
        context 'cases: negative' do
          it 'year' do
            expect('-2020'.iso8601?).to eq(false)
          end
          it 'year & month' do
            expect('2020-54'.iso8601?).to eq(false)
          end
          it 'year & month & day' do
            expect('2020-54-04'.iso8601?).to eq(false)
          end
          it 'year & month & day & time' do
            expect('2020-04-04A23:12:123'.iso8601?).to eq(false)
          end
          it 'year & month & day & time & time-zone' do
            scenarios_iso8601_error.∀{|scenario| expect(scenario.iso8601?).to eq(false)}
          end
        end
      end # end: {func{iso8601?}}
      context 'func{η̂} && func{as_iso8601}' do
        context 'normalizer{:iso8601}' do
          context 'cases: positive' do
            it 'year' do
              expect('2020'.η̂(:iso8601)).to eq('2020')
              expect('2020'.as_iso8601).to eq('2020')
            end
            it 'year & month' do
              expect('2020-04'.η̂(:iso8601)).to eq('2020-04')
              expect('2020-04'.as_iso8601).to eq('2020-04')
            end
            it 'year & month & day' do
              expect('2020-04-04'.η̂(:iso8601)).to eq('2020-04-04')
              expect('2020-04-04'.as_iso8601).to eq('2020-04-04')
            end
            it 'year & month & day & time' do
              expect('2020-04-04T23:12:12'.η̂(:iso8601)).to eq('2020-04-04T23:12:12')
              expect('2020-04-04 23:12:12'.η̂(:iso8601)).to eq('2020-04-04T23:12:12')

              expect('2020-04-04T23:12:12'.as_iso8601).to eq('2020-04-04T23:12:12')
              expect('2020-04-04T23:12:12'.as_iso8601).to eq('2020-04-04T23:12:12')
            end
            it 'year & month & day & time & time-zone' do
              expect('2020-04-04T23:12:12+11:00'.η̂(:iso8601)).to eq('2020-04-04T23:12:12+11:00')
              expect('2020-04-04T23:12:12+1100'.η̂(:iso8601)).to eq('2020-04-04T23:12:12+11:00')
              expect('2020-04-04 23:12:12+11:00'.η̂(:iso8601)).to eq('2020-04-04T23:12:12+11:00')
              expect('2020-04-04 23:12:12+1100'.η̂(:iso8601)).to eq('2020-04-04T23:12:12+11:00')

              expect('2020-04-04T23:12:12+11:00'.as_iso8601).to eq('2020-04-04T23:12:12+11:00')
              expect('2020-04-04T23:12:12+1100'.as_iso8601).to eq('2020-04-04T23:12:12+11:00')
              expect('2020-04-04 23:12:12+11:00'.as_iso8601).to eq('2020-04-04T23:12:12+11:00')
              expect('2020-04-04 23:12:12+1100'.as_iso8601).to eq('2020-04-04T23:12:12+11:00')
            end
          end
          context 'cases: negative' do
            it 'year' do
              expect{'-1000'.η̂(:iso8601)}.to raise_error(RuntimeError)
              expect{'a123'.η̂(:iso8601)}.to raise_error(RuntimeError)
              expect{''.η̂(:iso8601)}.to raise_error(RuntimeError)

              expect{'-1000'.as_iso8601}.to raise_error(RuntimeError)
              expect{'a123'.as_iso8601}.to raise_error(RuntimeError)
              expect{''.as_iso8601}.to raise_error(RuntimeError)
            end
            it 'year & month' do
              expect{'-1000'.η̂(:iso8601)}.to raise_error(RuntimeError)
              expect{'a123'.η̂(:iso8601)}.to raise_error(RuntimeError)
              expect{''.η̂(:iso8601)}.to raise_error(RuntimeError)
              expect{'2020-55'.η̂(:iso8601)}.to raise_error(RuntimeError)

              expect{'-1000'.as_iso8601}.to raise_error(RuntimeError)
              expect{'a123'.as_iso8601}.to raise_error(RuntimeError)
              expect{''.as_iso8601}.to raise_error(RuntimeError)
              expect{'2020-55'.as_iso8601}.to raise_error(RuntimeError)
            end
            it 'year & month & day' do
              expect{'-1000'.η̂(:iso8601)}.to raise_error(RuntimeError)
              expect{'2020-04-54'.η̂(:iso8601)}.to raise_error(RuntimeError)
              expect{''.η̂(:iso8601)}.to raise_error(RuntimeError)

              expect{'-1000'.as_iso8601}.to raise_error(RuntimeError)
              expect{'2020-04-54'.as_iso8601}.to raise_error(RuntimeError)
              expect{''.as_iso8601}.to raise_error(RuntimeError)
            end
            it 'year & month & day & time' do
              expect{'-1000'.η̂(:iso8601)}.to raise_error(RuntimeError)
              expect{'2020-04-04A23:12:12'.η̂(:iso8601)}.to raise_error(RuntimeError)
              expect{'2020-04-04T25:12:12'.η̂(:iso8601)}.to raise_error(RuntimeError)
              expect{''.η̂(:iso8601)}.to raise_error(RuntimeError)

              expect{'-1000'.as_iso8601}.to raise_error(RuntimeError)
              expect{'2020-04-04A23:12:12'.as_iso8601}.to raise_error(RuntimeError)
              expect{'2020-04-04T25:12:12'.as_iso8601}.to raise_error(RuntimeError)
              expect{''.as_iso8601}.to raise_error(RuntimeError)
            end
            it 'year & month & day & time & time-zone' do
              scenarios_iso8601_error.∀{|scenario| expect{scenario.η̂(:iso8601)}.to raise_error(RuntimeError)}
              scenarios_iso8601_error.∀{|scenario| expect{scenario.as_iso8601}.to raise_error(RuntimeError)}
            end
          end
        end # end: {normalizer{:iso8601}}
      end # end: {func{η̂}}
    end # end: {time relating functionality}

    context 'functions for single character operations' do

      context 'func{upcase?}' do
        context 'handles needed scenarios' do
          context 'cases: positive' do
            it 'w/ char' do
              %w(A Z).∀{|scenario| expect(scenario.⬆?).to eq(true)}
            end
            it 'w/ many chars' do
              %w(IsThisUppercase AA ZZ IS_THIS_UPPER_SNAKE_CASE).∀{|scenario| expect(scenario.⬆?).to eq(true)}
            end
          end
          context 'cases: negative' do
            it 'not upper case' do
              %w(a z).∀{|scenario| expect(scenario.⬆?).to eq(false)}
            end
            it 'not single char' do
              %w(Aa).∀{|scenario| expect(scenario.⬆?).to eq(false)}
            end
          end
        end
      end # end: {func{upcase?}}

      context 'func{downcase?}' do
        context 'handles needed scenarios' do
          context 'cases: positive' do
            it 'w/ char' do
              %w(a z).∀{|scenario| expect(scenario.⬇?).to eq(true)}
            end
            it 'w/ many chars' do
              %w(aa zz is_this_downcase).∀{|scenario| expect(scenario.⬇?).to eq(true)}
            end
          end
          context 'cases: negative' do
            it 'not lower case' do
              %w(A Z).∀{|scenario| expect(scenario.⬇?).to eq(false)}
            end
            it 'not single char' do
              %w(aA zZ).∀{|scenario| expect(scenario.⬇?).to eq(false)}
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

              expect('∞ℂ'.to_num).to eq(::Float::INFINITY_COMPLEX)
            end
            it 'pie(π)' do
              expect('π'.to_num).to eq(π)
              expect('+π'.to_num).to eq(π)
              expect('-π'.to_num).to eq(-π)
            end
            it 'golden-ratio(𝚽)' do
              expect('𝚽'.to_num).to eq(𝚽)
            end
            it 'super-golden-ratio(ψ)' do
              expect('Ψ'.to_num).to eq(Ψ)
            end
            it 'plastic-ratio{ρ}' do
              expect('ρ'.to_num).to eq(ρ)
            end
            it 'golden-angle(Ⴔ)' do
              expect('Ⴔ'.to_num).to eq(Ⴔ)
            end
            it 'tau-angle(τ)' do
              expect('τ'.to_num).to eq(τ)
            end
            it 'omega-constant{Ω}' do
              expect('Ω'.to_num).to eq(Ω)
            end
            it 'euler-mascheroni-constant(γ)' do
              expect('γ'.to_num).to eq(γ)
              expect('+γ'.to_num).to eq(γ)
              expect('-γ'.to_num).to eq(-γ)
            end
            it 'NaN' do
              expect('nan'.to_num.nan?).to eq(true)
              expect('NaN'.to_num.nan?).to eq(true)
              expect('NAN'.to_num.nan?).to eq(true)
            end
            context 'for func{to_num?}' do
              it 'same-cases' do
                %w(∞ +∞ -∞ ∞ℂ π +π -π Ⴔ Ω Ψ ρ τ 𝚽 γ +γ -γ).∀{|scenario| expect(scenario.to_num?).to eq(true)}
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

    context 'func{∅?}' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          expect(''.∅?).to eq(true)
        end
        it 'cases: negative' do
          expect(' '.∅?).to eq(false)
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

    context 'character functions' do
      context 'func{upcase?} runs fast enough' do
        context 'for needed scenarios' do
          it 'cases: positive' do
            expect{'A'.upcase?}.to perform_very_quickly
            expect{'A'.⬆?}.to perform_very_quickly
          end
          context 'cases: negative' do
            it 'not lower case' do
              expect{'a'.downcase?}.to perform_very_quickly
              expect{'a'.⬆?}.to perform_very_quickly
            end
            it 'not single char' do
              expect{'AA'.downcase?}.to perform_very_quickly
              expect{'AA'.⬆?}.to perform_very_quickly
            end
          end
        end
      end
      context 'func{downcase?} runs fast enough' do
        context 'for needed scenarios' do
          it 'cases: positive' do
            expect{'a'.downcase?}.to perform_very_quickly
            expect{'a'.⬇?}.to perform_very_quickly
          end
          context 'cases: negative' do
            it 'not lower case' do
              expect{'A'.downcase?}.to perform_very_quickly
              expect{'A'.⬇?}.to perform_very_quickly
            end
            it 'not single char' do
              expect{'aa'.downcase?}.to perform_very_quickly
              expect{'aa'.⬇?}.to perform_very_quickly
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
