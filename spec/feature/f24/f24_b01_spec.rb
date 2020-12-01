# utf-8

RSpec.describe 'f24_b01' do

  context 'func{🐍⬆?}' do
    context 'handles needed scenarios' do
      context 'cases: positive' do
        it 'w/ text only' do
          data_syntax_case_snake_capital.∀{|scenario| expect(scenario.🐍⬆?).to eq(true)}
        end
        it 'w/ text & numbers' do
          data_syntax_case_snake_capital_nums.∀{|scenario| expect(scenario.🐍⬆?).to eq(true)}
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

  context 'func{to_🐍⬆}' do
    context 'handles needed scenarios' do
      context 'cases: positive' do
        context 'from base format:' do
          context '🐍' do
            it 'w/ text only' do
              expect('hello_world'.to_🐍⬆).to eq('HELLO_WORLD')
              expect('much_longer_version_of_hello_world'.to_🐍⬆).to eq('MUCH_LONGER_VERSION_OF_HELLO_WORLD')
              expect('zz'.to_🐍⬆).to eq('ZZ')
            end
            it 'w/ text & nums' do
              expect('hello_world1337'.to_🐍⬆).to eq('HELLO_WORLD1337')
              expect('much_longer_version1337_of_hello_world'.to_🐍⬆).to eq('MUCH_LONGER_VERSION1337_OF_HELLO_WORLD')
              expect('zz1337'.to_🐍⬆).to eq('ZZ1337')
            end
          end
          context '🐍⬆' do
            it 'w/ text only' do
              data_syntax_case_snake_capital.∀{|scenario| expect(scenario.to_🐍⬆).to eq(scenario)}
            end
            it 'w/ text & nums' do
              data_syntax_case_snake_capital_nums.∀{|scenario| expect(scenario.to_🐍⬆).to eq(scenario)}
            end
          end
          context '🐫' do
            it 'w/ text only' do
              expect('HelloWorld'.to_🐍⬆).to eq('HELLO_WORLD')
              expect('NotSnakeCase'.to_🐍⬆).to eq('NOT_SNAKE_CASE')
              expect('AnExcellentTestCase'.to_🐍⬆).to eq('AN_EXCELLENT_TEST_CASE')
            end
            it 'w/ text & nums' do
              expect('HelloWorld1337'.to_🐍⬆).to eq('HELLO_WORLD1337')
              expect('Not1337SnakeCase'.to_🐍⬆).to eq('NOT1337_SNAKE_CASE')
              expect('AnExcellent1337TestCase'.to_🐍⬆).to eq('AN_EXCELLENT1337_TEST_CASE')
            end
          end
          context '🐫⬇' do
            it 'w/ text only' do
              expect('helloWorld'.to_🐍⬆).to eq('HELLO_WORLD')
              expect('notSnakeCase'.to_🐍⬆).to eq('NOT_SNAKE_CASE')
              expect('anExcellentTestCase'.to_🐍⬆).to eq('AN_EXCELLENT_TEST_CASE')
            end
            it 'w/ text & nums' do
              expect('helloWorld1337'.to_🐍⬆).to eq('HELLO_WORLD1337')
              expect('not1337SnakeCase'.to_🐍⬆).to eq('NOT1337_SNAKE_CASE')
              expect('anExcellent1337TestCase'.to_🐍⬆).to eq('AN_EXCELLENT1337_TEST_CASE')
            end
          end
        end
      end
      it 'cases: negative' do
        expect{'Hello'.to_🐍⬆}.to raise_error(::Ruuuby::DescriptiveStandardError)
        expect{'1337'.to_🐍⬆}.to raise_error(::Ruuuby::DescriptiveStandardError)
        expect{''.to_🐍⬆}.to raise_error(::Ruuuby::DescriptiveStandardError)
        expect{'_'.to_🐍⬆}.to raise_error(::Ruuuby::DescriptiveStandardError)
      end
    end
  end # end: {func{to_🐍⬆}}

  #  __   ___  __   ___  __   __                   __   ___
  # |__) |__  |__) |__  /  \ |__)  |\/|  /\  |\ | /  ` |__
  # |    |___ |  \ |    \__/ |  \  |  | /~~\ | \| \__, |___
  context 'performance', :performance do

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

  end # end: {performance}

end
