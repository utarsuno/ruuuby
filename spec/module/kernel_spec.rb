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

      context 'adds function{∛}' do
        it 'equals (Math.cbrt)' do
          expect(∛(25)).to eq(Math.cbrt(25))
        end
      end

      context 'adds function{π}' do
        it 'aliases{Math::PI}' do
          expect(π).to eq(Math::PI)
        end
      end

      context 'adds function{sin}' do
        it 'aliases{Math.sin}' do
          expect(sin(∠ᶜ(90.0))).to eq(1)
          expect(sin(∠ᶜ(180.0))).to eq(Math.sin(∠ᶜ(180.0)))
          expect(sin(∠ᶜ(270.0))).to eq(-1)
          expect(sin(∠ᶜ(360.0))).to eq(Math.sin(∠ᶜ(360.0)))
        end
        it 'provides utility-alternative{sin°}' do
          expect(sin°(90.0)).to eq(1)
          expect(sin°(180.0)).to eq(Math.sin(∠ᶜ(180.0)))
          expect(sin°(270.0)).to eq(-1)
          expect(sin°(360.0)).to eq(Math.sin(∠ᶜ(360.0)))
        end
      end

      context 'adds function{cos}' do
        it 'aliases{Math.cos}' do
          expect(cos(∠ᶜ(90.0))).to eq(Math.cos(∠ᶜ(90.0)))
          expect(cos(∠ᶜ(180.0))).to eq(-1)
          expect(cos(∠ᶜ(270.0))).to eq(Math.cos(∠ᶜ(270.0)))
          expect(cos(∠ᶜ(360.0))).to eq(1)
        end
        it 'provides utility-alternative{cos°}' do
          expect(cos°(90.0)).to eq(Math.cos(∠ᶜ(90.0)))
          expect(cos°(180.0)).to eq(-1)
          expect(cos°(270.0)).to eq(Math.cos(∠ᶜ(270.0)))
          expect(cos°(360.0)).to eq(1)
        end
      end

      context 'adds function{∠ᶜ}' do
        it 'works' do
          expect(∠ᶜ(0)).to eq(0)
          expect(∠ᶜ(30)).to eq(π * (1.0/6.0))
          expect(∠ᶜ(45)).to eq(π / 4)
          expect(∠ᶜ(60)).to eq(π * (1.0/3.0))
          expect(∠ᶜ(90)).to eq(π / 2)
          expect(∠ᶜ(120)).to eq(π * (2.0/3.0))
          expect(∠ᶜ(135)).to eq(π * (3.0/4.0))
          expect(∠ᶜ(150)).to eq(π * (5.0/6.0))
          expect(∠ᶜ(180)).to eq(π)
          expect(∠ᶜ(210)).to eq(π * (7.0/6.0))
          expect(∠ᶜ(225)).to eq(π * (5.0/4.0))
          expect(∠ᶜ(240)).to eq(π * (4.0/3.0))
          expect(∠ᶜ(270)).to eq(π * (3.0/2.0))
          expect(∠ᶜ(300)).to eq(π * (5.0/3.0))
          expect(∠ᶜ(315)).to eq(π * (7.0/4.0))
          expect(∠ᶜ(330)).to eq(π * (11.0/6.0))
          expect(∠ᶜ(360)).to eq(π * 2)
        end
      end

      context 'adds function{∠ᶜ}' do
        it 'works' do
          expect(∠°(0)).to eq(0)
          expect(∠°(π * (1.0/6.0)).≈≈(30)).to eq(true)
          expect(∠°(π / 4)).to eq(45)
          expect(∠°(π * (1.0/3.0)).≈≈(60)).to eq(true)
          expect(∠°(π / 2)).to eq(90)
          expect(∠°(π * (2.0/3.0)).≈≈(120)).to eq(true)
          expect(∠°(π * (3.0/4.0)).≈≈(135)).to eq(true)
          expect(∠°(π * (5.0/6.0)).≈≈(150)).to eq(true)
          expect(∠°(π)).to eq(180)
          expect(∠°(π * (7.0/6.0)).≈≈(210)).to eq(true)
          expect(∠°(π * (5.0/4.0)).≈≈(225)).to eq(true)
          expect(∠°(π * (4.0/3.0)).≈≈(240)).to eq(true)
          expect(∠°(π * (3.0/2.0)).≈≈(270)).to eq(true)
          expect(∠°(π * (5.0/3.0)).≈≈(300)).to eq(true)
          expect(∠°(π * (7.0/4.0)).≈≈(315)).to eq(true)
          expect(∠°(π * (11.0/6.0)).≈≈(330)).to eq(true)
          expect(∠°(π * 2)).to eq(360)
        end
      end

      context 'adds function{φ}' do
        it 'equals: (1 + √(5)) / 2.0' do
          expect(φ).to eq((1 + √(5)) / 2.0)
        end
        it 'equals: φ = 1 + 1/φ' do
          expect(φ).to eq(1 + Rational(1, φ))
          expect(φ).to eq(1 + (φ^⁻¹))
        end
        it '(ALMOST) equals: 2 * sin(54)' do
          expect(φ.≈≈(2.0 * Math.sin(∠ᶜ(54.0)))).to eq(true)
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

    # TODO: Add performance tests for (𝔠, ∠ᶜ, sin°, etc)

  end

end
