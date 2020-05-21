# coding: UTF-8

RSpec.describe 'f24_b00' do

  context 'func{to_🐍}' do
    context 'handles needed scenarios' do
      context 'cases: positive' do
        context 'from base format:' do
          context '🐫' do
            it 'w/ text only' do
              expect('HelloWorld'.to_🐍).to eq('hello_world')
              expect('NotSnakeCase'.to_🐍).to eq('not_snake_case')
              expect('AnExcellentTestCase'.to_🐍).to eq('an_excellent_test_case')
            end
            it 'w/ text & nums' do
              expect('HelloWorld1337'.to_🐍).to eq('hello_world1337')
              expect('Not1337SnakeCase'.to_🐍).to eq('not1337_snake_case')
              expect('AnExcellent1337TestCase'.to_🐍).to eq('an_excellent1337_test_case')
            end
          end
          context '🐫⬇' do
            it 'w/ text only' do
              expect('helloWorld'.to_🐍).to eq('hello_world')
              expect('notSnakeCase'.to_🐍).to eq('not_snake_case')
              expect('anExcellentTestCase'.to_🐍).to eq('an_excellent_test_case')
            end
            it 'w/ text & nums' do
              expect('helloWorld1337'.to_🐍).to eq('hello_world1337')
              expect('not1337SnakeCase'.to_🐍).to eq('not1337_snake_case')
              expect('anExcellent1337TestCase'.to_🐍).to eq('an_excellent1337_test_case')
            end
          end
          context '🐍⬆' do
            it 'w/ text only' do
              expect('UPPER_SNAKE_CASE'.to_🐍).to eq('upper_snake_case')
              expect('AA'.to_🐍).to eq('aa')
            end
            it 'w/ text & numbers' do
              expect('UPPER_SNAKE_CASE1337'.to_🐍).to eq('upper_snake_case1337')
              expect('AA1337'.to_🐍).to eq('aa1337')
            end
          end
          context '🐍' do
            it 'w/ text only' do
              data_syntax_case_snake.∀{|scenario| expect(scenario.to_🐍).to eq(scenario)}
            end
            it 'w/ text & nums' do
              data_syntax_case_snake_nums.∀{|scenario| expect(scenario.to_🐍).to eq(scenario)}
            end
          end
        end
      end # end: {cases: positive}
      it 'cases: error' do
        expect{'Hello'.to_🐍}.to raise_error(::Ruuuby::DescriptiveStandardError)
        expect{'1337'.to_🐍}.to raise_error(::Ruuuby::DescriptiveStandardError)
        expect{''.to_🐍}.to raise_error(::Ruuuby::DescriptiveStandardError)
        expect{'_'.to_🐍}.to raise_error(::Ruuuby::DescriptiveStandardError)
      end
    end
  end # end: {to_🐍}

  context 'func{🐍?}' do
    context 'handles needed scenarios' do
      context 'cases: positive' do
        it 'camel case strings' do
          data_syntax_case_snake.∀ {|scenario| expect(scenario.🐍?).to eq(true)}
        end
        it 'came case strings w/ numbers too' do
          data_syntax_case_snake_nums.∀ {|scenario| expect(scenario.🐍?).to eq(true)}
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
  end # end: {func{🐍?}}

  #  __   ___  __   ___  __   __                   __   ___
  # |__) |__  |__) |__  /  \ |__)  |\/|  /\  |\ | /  ` |__
  # |    |___ |  \ |    \__/ |  \  |  | /~~\ | \| \__, |___
  context 'performance', :performance do

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

    context 'func{to_🐍}' do
      context 'runs fast enough for needed scenarios' do
        context 'cases: positive' do
          it 'from syntax{🐫}' do
            expect{'HelloToday1337'.to_🐍}.to perform_very_quickly
          end
          it 'from syntax{🐫⬇}' do
            expect{'helloWorldWith1337Numbers'.to_🐍}.to perform_very_quickly
          end
        end
      end
    end

  end

end
