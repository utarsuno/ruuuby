# coding: UTF-8

RSpec.describe ::Kernel do
  let(:wrong_param_type){Ruuuby::ParamErr::WrongParamType}

  context 'extends module[Kernel]' do

    context 'by adding needed functions & aliases' do

      context 'func{🌽_previous_⨍}' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            def hello_world
              return 🌽_previous_⨍
            end
            def yes
              hello_world
            end
            expect(yes).to eq('yes')
          end
        end
      end

      context 'adds math functionality (features f10 & f17)' do

        context 'simple aliased functions' do
          context 'adds function{√}' do
            it 'equals (Math.sqrt)' do
              expect(√(25)).to eq(Math.sqrt(25))
            end
          end
          context 'adds function{∛}' do
            it 'equals (Math.cbrt)' do
              expect(∛(25)).to eq(Math.cbrt(25))
            end
          end
        end
      end

      context 'adds function[√]' do
        context 'handles needed scenarios' do
          context 'cases: positive' do
            it 'w/ regular numerics' do
              expect(√(1)).to eq(1.0)
              expect(√(1.0)).to eq(1.0)
              expect(√(25)).to eq(5.0)
              expect(√(Rational(25, 1))).to eq(5.0)
              expect(√(Complex(25))).to eq(5.0)
            end
            it 'w/ with numerics represented by strings' do
              expect(√('2.0')).to eq(√(2.0))
              expect(√('𝚽')).to eq(√(𝚽))
              expect(√('1337')).to eq(√(1337))
            end
          end
          it 'cases: error' do
            expect{√(nil)}.to raise_error(ArgumentError)
          end
        end
      end

    end
  end

  #  __   ___  __   ___  __   __                   __   ___
  # |__) |__  |__) |__  /  \ |__)  |\/|  /\  |\ | /  ` |__
  # |    |___ |  \ |    \__/ |  \  |  | /~~\ | \| \__, |___
  context 'performance', :performance do

  end

end
