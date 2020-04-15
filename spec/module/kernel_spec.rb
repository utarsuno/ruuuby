# coding: utf-8

# TODO: test for the following constants
#           #expect_∃⨍(:𝚽, ::Ruuuby::Feature::Extendable::MainF17::FloatAliases)
#           #expect_∃⨍(:Ⴔ, ::Ruuuby::Feature::Extendable::MainF17::FloatAliases)

RSpec.describe ::Kernel do
  let(:wrong_param_type){Ruuuby::ParamErr::WrongParamType}
  let(:empty_object){Object.🆕}

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
          context 'adds function{𝚽}' do
            it 'equals: (1 + √(5)) / 2.0' do
              expect(𝚽).to eq((1 + √(5)) / 2.0)
            end
            it 'equals: 𝚽 = 1 + 1/𝚽' do
              # for v0.0.33
              expect(𝚽).to eq(::Float::GOLDEN_RATIO)
              #expect(φ^²).to eq(1 + (𝚽^⁻¹))
              expect(𝚽).to eq(1 + Rational(1, 𝚽))
              expect(𝚽).to eq(1 + (𝚽^⁻¹))
            end
            it '~equals: 2 * sin(54)' do
              expect(𝚽.≈≈(2.0 * Math.sin(∠ᶜ(54.0)))).to eq(true)
            end
          end
          context 'adds function{𝚽}' do
            it 'equals: π * (3 - √(5))' do
              # for v0.0.33
              #expect(𝚽).to eq(::Float::GOLDEN_ANGLE)
              #expect(::Float::GOLDEN_ANGLE_AS_RADIANS).to eq(π * (3 - √(5)))
              #expect(∠ᶜ(π * (3 - √(5)))).to eq(::Float::GOLDEN_ANGLE)
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

      context 'adds function: ∃module?' do
        context 'handling needed scenarios' do
          context 'for cases: global &' do
            it 'positive' do
              expect_∃module(:Ruuuby)
              expect_∃module(:QAModule)
            end
            it 'negative' do
              do_not_expect_∃module(:BigDecimal)
              do_not_expect_∃module(:RuuubyFake)
            end
          end
          context 'for cases: sub_module &' do
            it 'positive' do
              expect_∃module(:ParamErr, Ruuuby)
              expect_∃module(:InnerModuleDepth1, QAClass)
              expect_∃module(:InnerModuleDepth1, QAModule)
            end
            it 'negative' do
              do_not_expect_∃module(:VERSIONFAKE, Ruuuby)
              do_not_expect_∃module(:InnerModuleDepth1, Ruuuby)
              do_not_expect_∃module(:InnerModuleDepth1, Ruuuby)
              do_not_expect_∃module(:InnerModuleDepthFake, QAClass)
              do_not_expect_∃module(:InnerModuleDepthFake, QAModule)
              do_not_expect_∃module(:InnerClassDepth1, QAClass)
              do_not_expect_∃module(:InnerClassDepth1, QAModule)
            end
          end
          context 'for cases: sub_sub_module &' do
            it 'positive' do
              expect_∃module(:InnerModuleDepth2, QAClass::InnerModuleDepth1)
              expect_∃module(:InnerModuleDepth2, QAModule::InnerModuleDepth1)
            end
            it 'negative' do
              do_not_expect_∃module(:InnerModuleDepthFake, QAClass::InnerModuleDepth1)
              do_not_expect_∃module(:InnerModuleDepthFake, QAModule::InnerModuleDepth1)
            end
          end
          context 'for cases: bad args' do
            it 'first arg: module_name' do
              expect{∃module?(nil) }.to raise_error(ArgumentError)
              expect{∃module?(5) }.to raise_error(ArgumentError)
            end
            it 'second arg: module_owner' do
              expect{∃module?(:VERSION, nil) }.to raise_error(ArgumentError)
              expect{∃module?(:VERSION, 5) }.to raise_error(ArgumentError)
            end
          end
        end
      end

      context 'adds function: ∃class?' do
        context 'handling needed scenarios' do
          context 'for cases: global &' do
            it 'positive' do
              expect_∃class(:QAClass)
            end
            it 'negative' do
              do_not_expect_∃class(:QAClassFake)
              do_not_expect_∃class(:Ruuuby)
            end
          end
          context 'for cases: sub_classes &' do
            it 'positive' do
              expect_∃class(:InnerClassDepth1, QAClass)
              expect_∃class(:InnerClassDepth1, QAModule)

              expect_∃class(:WrongParamType, ::Ruuuby::ParamErr)
            end
            it 'negative' do
              do_not_expect_∃class(:InnerClassDepth1, Ruuuby)
              do_not_expect_∃class(:InnerClassDepth1, Ruuuby)
              do_not_expect_∃class(:InnerModuleDepth1, QAClass)
              do_not_expect_∃class(:InnerModuleDepth1, QAModule)
              do_not_expect_∃class(:InnerClassDepthFake, QAClass)
              do_not_expect_∃class(:InnerClassDepthFake, QAModule)
            end
          end
          context 'for cases: bad args' do
            it 'first arg: module_name' do
              expect{∃class?(nil)}.to raise_error(ArgumentError)
              expect{∃class?(5)}.to raise_error(ArgumentError)
            end
            it 'second arg: module_owner' do
              expect{∃class?(:VERSION, 5)}.to raise_error(ArgumentError)
              expect{∃class?(:VERSION, {})}.to raise_error(ArgumentError)
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
            expect(√(ℂ(25))).to eq(5.0)
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
  context 'performance', :performance do

    context 'func{∃module?} runs fast enough' do
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

    context 'func{∃class?} runs fast enough' do
      context 'for cases: global &' do
        it 'true-positive' do
          expect{∃class?(:QAClass)}.to perform_very_quickly
          expect{∃class?('QAClass')}.to perform_very_quickly
        end
        it 'true-negative' do
          expect{∃class?(:Ruuuby)}.to perform_very_quickly
          expect{∃class?('Ruuuby')}.to perform_very_quickly
        end
      end
      context 'for cases: sub_class &' do
        it 'true-positive' do
          expect{∃class?(:InnerClassDepth1, QAClass)}.to perform_very_quickly
          expect{∃class?('InnerClassDepth1', QAClass)}.to perform_very_quickly
        end
        it 'true-negative' do
          expect{∃class?(:InnerModuleDepth1, QAClass)}.to perform_very_quickly
          expect{∃class?('InnerModuleDepth1', QAClass)}.to perform_very_quickly
        end
      end
    end

    context 'func{∃class?} runs fast enough' do
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
