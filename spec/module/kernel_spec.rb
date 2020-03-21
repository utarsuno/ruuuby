# coding: utf-8

RSpec.describe ::Kernel do
  let(:wrong_param_type){Ruuuby::ParamErr::WrongParamType}
  let(:empty_object){Object.🆕}

  context 'extends module[Kernel]' do

    context 'by adding needed functions & aliases' do

      context 'adds function{√}' do
        it 'equals (Math.sqrt)' do
          expect(√(25)).to eq(Math.sqrt(25))
        end
      end

      context 'adds function{√}' do
        it 'equals (Math.cbrt)' do
          expect(∛(25)).to eq(Math.cbrt(25))
        end
      end

      context 'adds function{π}' do
        it 'aliases{Math::PI}' do
          expect(π).to eq(Math::PI)
        end
      end

      context 'adds function{φ}' do
        it 'equals ((1+Math.sqrt(5))/(2.0))' do
          expect(φ).to eq(((1+Math.sqrt(5))/(2.0)))
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

      context 'adds function: ∃module?' do
        context 'handling needed scenarios' do
          context 'for cases: global &' do
            it 'true-positive' do
              expect(∃module?(:Ruuuby)).to eq(true)
              expect(∃module?('Ruuuby')).to eq(true)
            end
            it 'false-positive' do
              expect(∃module?(:BigDecimal)).to eq(false)
              expect(∃module?('BigDecimal')).to eq(false)
            end
            it 'true-negative' do
              expect(∃module?(:RuuubyFake)).to eq(false)
              expect(∃module?('RuuubyFake')).to eq(false)
            end
          end
          context 'for cases: sub_module &' do
            it 'true-positive' do
              expect(∃module?(:ParamErr, Ruuuby)).to eq(true)
              expect(∃module?('ParamErr', Ruuuby)).to eq(true)
            end
            it 'false-positive' do
              expect(∃module?(:VERSIONFAKE, Ruuuby)).to eq(false)
              expect(∃module?('VERSIONFAKE', Ruuuby)).to eq(false)
            end
            it 'true-negative' do
              expect(∃module?(:RuuubyFake)).to eq(false)
              expect(∃module?('RuuubyFake')).to eq(false)
            end
          end
          context 'for cases: bad args' do
            it 'first arg: module_name' do
              expect{∃module?(nil)
              }.to raise_error(ArgumentError, Ruuuby::ParamErr::generate_error_text(Kernel, :∃module?, :module_name, NilClass, [Symbol, String]))

              expect{∃module?(5)
              }.to raise_error(ArgumentError, Ruuuby::ParamErr::generate_error_text(Kernel, :∃module?, :module_name, Integer, [Symbol, String]))
            end
            it 'second arg: module_owner' do
              expect{∃module?(:VERSION, 5)
              }.to raise_error(ArgumentError, Ruuuby::ParamErr::generate_error_text(Kernel, :∃module?, :module_owner, Integer, Module))
            end
          end
        end
      end

      context 'adds function: ∃class?' do
        context 'handling needed scenarios' do
          context 'for cases: global &' do
            it 'true-positive' do
              expect(∃class?(:TestDataGlobalClass)).to eq(true)
              expect(∃class?('TestDataGlobalClass')).to eq(true)
            end
            it 'false-positive' do
              expect(∃class?(:TestDataGlobalClassFake)).to eq(false)
              expect(∃class?('TestDataGlobalClassFake')).to eq(false)
            end
            it 'true-negative' do
              expect(∃class?(:Ruuuby)).to eq(false)
              expect(∃class?('Ruuuby')).to eq(false)
            end
          end
          context 'for cases: sub_classes &' do
            it 'true-positive' do
              expect(∃class?(:TestDataInternalClass, TestDataGlobalClass)).to eq(true)
              expect(∃class?('TestDataInternalClass', TestDataGlobalClass)).to eq(true)
            end
            it 'false-positive' do
              expect(∃class?(:TestDataInternalClassFake, TestDataGlobalClass)).to eq(false)
              expect(∃class?('TestDataInternalClassFake', TestDataGlobalClass)).to eq(false)
            end
            it 'true-negative' do
              expect(∃class?(:TestDataInternalModule, TestDataGlobalClass)).to eq(false)
              expect(∃class?('TestDataInternalModule', TestDataGlobalClass)).to eq(false)
            end
          end
          context 'for cases: bad args' do
            it 'first arg: module_name' do
              expect{∃class?(nil)
              }.to raise_error(Ruuuby::ParamErr::WrongParamType, Ruuuby::ParamErr::generate_error_text(Kernel, :∃class?, :class_name, NilClass, [Symbol, String]))

              expect{∃class?(5)
              }.to raise_error(Ruuuby::ParamErr::WrongParamType, Ruuuby::ParamErr::generate_error_text(Kernel, :∃class?, :class_name, Integer, [Symbol, String]))
            end
            it 'second arg: module_owner' do
              expect{∃class?(:VERSION, 5)
              }.to raise_error(Ruuuby::ParamErr::WrongParamType, Ruuuby::ParamErr::generate_error_text(Kernel, :∃class?, :class_owner, Integer, Module))

              expect{∃class?(:VERSION, {})
              }.to raise_error(Ruuuby::ParamErr::WrongParamType, Ruuuby::ParamErr::generate_error_text(Kernel, :∃class?, :class_owner, Hash, Module))
            end
          end
        end
      end

      context 'adds function[√]' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            expect(√(1)).to eq(1.0)
            expect(√(1.0)).to eq(1.0)
            expect(√(25)).to eq(5.0)
            expect(√(Rational(25, 1))).to eq(5.0)
            expect(√(Complex(25))).to eq(5.0)
          end
          it 'cases: error' do
            expect{√('1.0')}.to raise_error(TypeError)
            expect{√(nil)}.to raise_error(TypeError)
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
            expect(𝔠('')).to eq(0)
            expect(𝔠(' ')).to eq(1)
            expect(𝔠("\n")).to eq(1)
            expect(𝔠('a')).to eq(1)
            expect(𝔠('ab')).to eq(2)
            expect(𝔠('ab ')).to eq(3)
            expect(𝔠(' ab')).to eq(3)
            expect(𝔠(' ab ')).to eq(4)
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
            expect(𝔠(empty_object)).to eq(-1)
            expect(𝔠(nil)).to eq(-1)
          end
        end
      end

    end
  end

  #  __   ___  __   ___  __   __                   __   ___
  # |__) |__  |__) |__  /  \ |__)  |\/|  /\  |\ | /  ` |__
  # |    |___ |  \ |    \__/ |  \  |  | /~~\ | \| \__, |___
  context 'performance', :'performance' do

    context 'func[∃module?] runs fast enough' do
      context 'for cases: global &' do
        it 'true-positive' do
          expect{∃module?(:Ruuuby)}.to perform_very_quickly
          expect{∃module?('Ruuuby')}.to perform_very_quickly
        end
        it 'true-negative' do
          expect{∃module?(:RuuubyFake)}.to perform_very_quickly
          expect{∃module?('RuuubyFake')}.to perform_very_quickly
        end
      end
      context 'for cases: sub_module &' do
        it 'true-positive' do
          expect{∃module?(:Version, Ruuuby)}.to perform_very_quickly
          expect{∃module?('Version', Ruuuby)}.to perform_very_quickly
        end
        it 'true-negative' do
          expect{∃module?(:VERSIONFAKE, Ruuuby)}.to perform_very_quickly
          expect{∃module?('VERSIONFAKE', Ruuuby)}.to perform_very_quickly
        end
      end
    end

    context 'func[∃class?] runs fast enough' do
      context 'for cases: global &' do
        it 'true-positive' do
          expect{∃class?(:TestDataGlobalClass)}.to perform_very_quickly
          expect{∃class?('TestDataGlobalClass')}.to perform_very_quickly
        end
        it 'true-negative' do
          expect{∃class?(:Ruuuby)}.to perform_very_quickly
          expect{∃class?('Ruuuby')}.to perform_very_quickly
        end
      end
      context 'for cases: sub_class &' do
        it 'true-positive' do
          expect{∃class?(:TestDataInternalClass, TestDataGlobalClass)}.to perform_very_quickly
          expect{∃class?('TestDataInternalClass', TestDataGlobalClass)}.to perform_very_quickly
        end
        it 'true-negative' do
          expect{∃class?(:TestDataInternalModule, TestDataGlobalClass)}.to perform_very_quickly
          expect{∃class?('TestDataInternalModule', TestDataGlobalClass)}.to perform_very_quickly
        end
      end
    end

    context 'func[∃class?] runs fast enough' do
      context 'for needed scenarios:' do
        it 'cases: positive' do
          expect{𝔠({a: 'a'})}.to perform_very_quickly
          expect{𝔠(Set[nil])}.to perform_very_quickly
          expect{𝔠('aaa bb c')}.to perform_very_quickly
          expect{𝔠([1])}.to perform_very_quickly
        end
        it 'cases: negative' do
          expect{𝔠(empty_object)}.to perform_very_quickly
          expect{𝔠(nil)}.to perform_very_quickly
        end
      end
    end

    # TODO: Add performance tests for (𝔠)

  end

end
