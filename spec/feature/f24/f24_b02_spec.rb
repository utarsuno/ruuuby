# encoding: UTF-8

using ::String::ContextF24

RSpec.describe 'f24_b02' do

  context 'func{to_🐫}' do
    context 'handles needed scenarios' do
      context 'cases: positive' do
        context 'from base format:' do
          context '🐍' do
            it 'w/ text only' do
              expect('hello_world'.to_🐫).to eq('HelloWorld')
              expect('much_longer_version_of_hello_world'.to_🐫).to eq('MuchLongerVersionOfHelloWorld')
              expect('zz'.to_🐫).to eq('Zz')
              expect('zzz'.to_🐫).to eq('Zzz')
            end
            it 'w/ text & nums' do
              expect('hello_world1337'.to_🐫).to eq('HelloWorld1337')
              expect('much_longer_version1337_of_hello_world'.to_🐫).to eq('MuchLongerVersion1337OfHelloWorld')
              expect('zz1337'.to_🐫).to eq('Zz1337')
              expect('zzz1337'.to_🐫).to eq('Zzz1337')
            end
          end
          context '🐍⬆' do
            it 'w/ text only' do
              expect('UPPER_SNAKE_CASE'.to_🐫).to eq('UpperSnakeCase')
              expect('YIKES_YIKES'.to_🐫).to eq('YikesYikes')
            end
            it 'w/ text & numbers' do
              expect('UPPER_SNAKE_CASE1337'.to_🐫).to eq('UpperSnakeCase1337')
            end
          end
          context '🐫' do
            it 'w/ text only' do
              data_syntax_case_camel.∀{|scenario| expect(scenario.to_🐫).to eq(scenario)}
            end
            it 'w/ text & nums' do
              data_syntax_case_camel_nums.∀{|scenario| expect(scenario.to_🐫).to eq(scenario)}
            end
          end
        end
        context '🐫⬇' do
          it 'w/ text only' do
            expect('helloWorld'.to_🐫).to eq('HelloWorld')
            expect('notSnakeCase'.to_🐫).to eq('NotSnakeCase')
            expect('anExcellentTestCase'.to_🐫).to eq('AnExcellentTestCase')
          end
          it 'w/ text & nums' do
            expect('helloWorld1337'.to_🐫).to eq('HelloWorld1337')
            expect('not1337SnakeCase'.to_🐫).to eq('Not1337SnakeCase')
            expect('anExcellent1337TestCase'.to_🐫).to eq('AnExcellent1337TestCase')
          end
        end
      end
      it 'cases: error' do
        expect{''.to_🐫}.to raise_error(::Ruuuby::DescriptiveStandardError)
        expect{'_'.to_🐫}.to raise_error(::Ruuuby::DescriptiveStandardError)
        expect{'1337'.to_🐫}.to raise_error(::Ruuuby::DescriptiveStandardError)
      end
    end
  end  # end: {func{to_🐫}}

  context 'func{🐫?}' do
    context 'handles needed scenarios' do
      context 'cases: positive' do
        it 'camel case strings' do
          data_syntax_case_camel.∀{|scenario| expect(scenario.🐫?).to eq(true)}
        end
        it 'camel case strings w/ numbers too' do
          data_syntax_case_camel_nums.∀{|scenario| expect(scenario.🐫?).to eq(true)}
        end
      end
      context 'cases: negative' do
        it 'not camel case strings' do
          (%w(_ snake_case helloWorld Hello_World) + ['']).∀{|scenario| expect(scenario.🐫?).to eq(false)}
        end
        it 'not camel case strings w numbers too' do
          %w(1337 1337snake_case 1337AMuchLongerVersion).∀{|scenario| expect(scenario.🐫?).to eq(false)}
        end
      end
    end
  end # end: {func{🐫?}}

  #  __   ___  __   ___  __   __                   __   ___
  # |__) |__  |__) |__  /  \ |__)  |\/|  /\  |\ | /  ` |__
  # |    |___ |  \ |    \__/ |  \  |  | /~~\ | \| \__, |___
  context 'performance', :performance do

    context 'func{to_🐫}' do
      context 'runs fast enough for needed scenarios' do
        it 'cases: positive' do
          expect{'hello_world'.to_🐫}.to perform_very_quickly
          expect{'HELLO_WORLD'.to_🐫}.to perform_very_quickly
        end
      end
    end

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

  end

end
