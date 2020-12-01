# utf-8

RSpec.describe 'f24_b03' do

  context 'func{🐫⬇?}' do
    context 'handles needed scenarios' do
      context 'cases: positive' do
        it 'w/ text only' do
          data_syntax_case_camel_lower.∀{|scenario| expect(scenario.🐫⬇?).to eq(true)}
        end
        it 'w/ text & numbers' do
          data_syntax_case_camel_lower_nums.∀{|scenario| expect(scenario.🐫⬇?).to eq(true)}
        end
      end
      context 'cases: negative' do
        it 'w/ text only' do
          expect(''.🐫⬇?).to eq(false)
          expect('SNAKE'.🐫⬇?).to eq(false)
          expect('LowerCamelCase'.🐫⬇?).to eq(false)
        end
        it 'w/ non-letter-text' do
          expect('!'.🐫⬇?).to eq(false)
          expect('SNAKE!'.🐫⬇?).to eq(false)
          expect('!LowerCamelCase'.🐫⬇?).to eq(false)
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

  context 'func{to_🐫⬇}' do
    context 'handles needed scenarios' do
      context 'cases: positive' do
        context 'from base format:' do
          context '🐍' do
            it 'w/ text only' do
              expect('hello_world'.to_🐫⬇).to eq('helloWorld')
              expect('much_longer_version_of_hello_world'.to_🐫⬇).to eq('muchLongerVersionOfHelloWorld')
            end
            it 'w/ text & nums' do
              expect('hello_world1337'.to_🐫⬇).to eq('helloWorld1337')
              expect('much_longer_version1337_of_hello_world'.to_🐫⬇).to eq('muchLongerVersion1337OfHelloWorld')
            end
          end
          context '🐍⬆' do
            it 'w/ text only' do
              expect('UPPER_SNAKE_CASE'.to_🐫⬇).to eq('upperSnakeCase')
              expect('YIKES_YIKES'.to_🐫⬇).to eq('yikesYikes')
            end
            it 'w/ text & numbers' do
              expect('UPPER_SNAKE_CASE1337'.to_🐫⬇).to eq('upperSnakeCase1337')
            end
          end
          context '🐫⬇' do
            it 'w/ text only' do
              data_syntax_case_camel_lower.∀{|scenario| expect(scenario.to_🐫⬇).to eq(scenario)}
            end
            it 'w/ text & nums' do
              data_syntax_case_camel_lower_nums.∀{|scenario| expect(scenario.to_🐫⬇).to eq(scenario)}
            end
          end
          context '🐫' do
            it 'w/ text only' do
              expect('HelloWorld'.to_🐫⬇).to eq('helloWorld')
              expect('NotSnakeCase'.to_🐫⬇).to eq('notSnakeCase')
              expect('AnExcellentTestCase'.to_🐫⬇).to eq('anExcellentTestCase')
            end
            it 'w/ text & nums' do
              expect('HelloWorld1337'.to_🐫⬇).to eq('helloWorld1337')
              expect('Not1337SnakeCase'.to_🐫⬇).to eq('not1337SnakeCase')
              expect('AnExcellent1337TestCase'.to_🐫⬇).to eq('anExcellent1337TestCase')
            end
          end
        end
      end
    end
  end

  #  __   ___  __   ___  __   __                   __   ___
  # |__) |__  |__) |__  /  \ |__)  |\/|  /\  |\ | /  ` |__
  # |    |___ |  \ |    \__/ |  \  |  | /~~\ | \| \__, |___
  context 'performance', :performance do

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

  end

end
