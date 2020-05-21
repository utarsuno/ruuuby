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
          context 'adds function{π}' do
            it 'aliases{Math::PI}' do
              expect(π).to eq(::Math::PI)
            end
          end
          context 'adds function{∞}' do
            it 'aliases{Float::INFINITY}' do
              expect(∞).to eq(::Float::INFINITY)
            end
          end
          context 'adds function{¿}' do
            it 'aliases{Float::NAN}' do
              expect(¿.nan?).to eq(true)
            end
          end
          context 'adds function{γ}' do
            it 'defines up to first 50 digits' do
              as_string = γ.to_s
              first_50   = '0.57721566490153286060651209008240243104215933593992'
              expect(γ).to eq(0.5772156649015329)
              expect(as_string[0..as_string.length-2]).to eq(first_50[0..16])
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

      context 'adds function[𝔠]' do
        context 'handles needed scenarios' do
          it 'cases: array' do
            expect(𝔠([])).to eq(0)
            expect(𝔠([nil])).to eq(1)
            expect(𝔠([''])).to eq(1)
            expect(𝔠([1])).to eq(1)
            expect(𝔠([1, 2, 3, nil, nil, []])).to eq(6)
          end
          it 'cases: string' do
            ['', ' ', "\n", 'a', 'ab', 'ab ', ' ab', ' ab ', '  '].∀ {|scenario| expect(𝔠(scenario)).to eq(scenario.length)}
          end
          it 'cases: set' do
            expect(𝔠(Set[])).to eq(0)
            expect(𝔠(Set[nil])).to eq(1)
            expect(𝔠(Set[''])).to eq(1)
            expect(𝔠(Set[1])).to eq(1)
            expect(𝔠(Set[1, 2, 3, nil, nil, []])).to eq(5)
          end
          it 'cases: hash' do
            expect(𝔠({})).to eq(0)
            expect(𝔠({a: 'a'})).to eq(1)
            expect(𝔠({a: 'a', b: {}, c: nil})).to eq(3)
          end
          it 'cases: -1' do
            expect(𝔠(data_new_obj)).to eq(-1)
            expect(𝔠(nil)).to eq(-1)
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
