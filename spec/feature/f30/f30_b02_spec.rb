# coding: UTF-8

RSpec.describe 'f30_b02' do

  context 'feature{f30} functionality for' do
    context 'behavior{b02}' do

      it 'exists as needed' do
        expect_feature_behavior_as_needed(🧬, ::Math::Space::NucleotideSpace)
      end

      context 'func{∃ᶜ?}' do
        context 'handling needed scenarios' do
          context 'cases: positive' do
            it 'for regular Ruby Classes' do
              expect(🧬.∃ᶜ?(:Class)).to eq(true)
              expect(🧬.∃ᶜ?(:String)).to eq(true)
              expect(🧬.∃ᶜ?(:Integer)).to eq(true)
              expect(🧬.∃ᶜ?(:Symbol)).to eq(true)
              expect(🧬.∃ᶜ?(:NilClass)).to eq(true)
              expect(🧬.∃ᶜ?(:TrueClass)).to eq(true)
              expect(🧬.∃ᶜ?(:FalseClass)).to eq(true)
            end
            it 'for global data' do
              expect(🧬.∃ᶜ?(:QAClass)).to eq(true)
            end
            it 'for sub-classes' do
              expect(🧬.∃ᶜ?(:InnerClassDepth1, QAClass)).to eq(true)
              expect(🧬.∃ᶜ?(:InnerClassDepth1, QAModule)).to eq(true)

              expect(🧬.∃ᶜ?(:WrongParamType, ::Ruuuby::ParamErr)).to eq(true)
            end
          end
          context 'cases: negative' do
            it 'for regular Ruby objs' do
              expect{🧬.∃ᶜ?(nil)}.to raise_error(ArgumentError)
              expect{🧬.∃ᶜ?('String')}.to raise_error(ArgumentError)
            end
            it 'for global data' do
              expect(🧬.∃ᶜ?(:QAClassFake)).to eq(false)
              expect(🧬.∃ᶜ?(:Ruuuby)).to eq(false)
            end
            it 'for sub-classes' do
              expect(🧬.∃ᶜ?(:InnerClassDepth1, Ruuuby)).to eq(false)
              expect(🧬.∃ᶜ?(:InnerModuleDepth1, QAClass)).to eq(false)
              expect(🧬.∃ᶜ?(:InnerModuleDepth1, QAModule)).to eq(false)
              expect(🧬.∃ᶜ?(:InnerClassDepthFake, QAClass)).to eq(false)
              expect(🧬.∃ᶜ?(:InnerClassDepthFake, QAModule)).to eq(false)
            end
          end
          context 'cases: error' do
            it 'first arg: module_name' do
              expect{🧬.∃ᶜ?(nil)}.to raise_error(ArgumentError)
              expect{🧬.∃ᶜ?(5)}.to raise_error(ArgumentError)
            end
            it 'second arg: module_owner' do
              expect{🧬.∃ᶜ?(:VERSION, 5)}.to raise_error(ArgumentError)
              expect{🧬.∃ᶜ?(:VERSION, {})}.to raise_error(ArgumentError)
            end
          end
        end
      end # end: {func{∃ᶜ?}}

      context 'func{∋ˢ?}' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            expect(🧬.∋ˢ?(💎.api)).to eq(true)
            expect(🧬.∋ˢ?(💎.orm)).to eq(true)
            expect(🧬.∋ˢ?(💎.engine)).to eq(true)
          end
          it 'cases: negative' do
            expect(🧬.∋ˢ?(💎.cli)).to eq(false)
            expect(🧬.∋ˢ?(String)).to eq(false)
            expect(🧬.∋ˢ?(1337)).to eq(false)
          end
        end
      end # end: {func{∋ˢ?}}

      context 'func{∃ᵐ?}' do
        context 'handling needed scenarios' do
          context 'cases: positive' do
            it 'for regular Ruby modules' do
              expect(🧬.∃ᵐ?(:Kernel)).to eq(true)
            end
            it 'for global data' do
              expect(🧬.∃ᵐ?(:Ruuuby)).to eq(true)
              expect(🧬.∃ᵐ?(:QAModule)).to eq(true)
            end
            it 'for sub-modules' do
              expect(🧬.∃ᵐ?(:ParamErr, ::Ruuuby)).to eq(true)
              expect(🧬.∃ᵐ?(:InnerModuleDepth1, QAClass)).to eq(true)
              expect(🧬.∃ᵐ?(:InnerModuleDepth1, QAModule)).to eq(true)
            end
            it 'for sub-sub-modules' do
              expect(🧬.∃ᵐ?(:InnerModuleDepth2, QAClass::InnerModuleDepth1)).to eq(true)
              expect(🧬.∃ᵐ?(:InnerModuleDepth2, QAModule::InnerModuleDepth1)).to eq(true)
            end
          end
          context 'cases: negative' do
            it 'for regular Ruby data' do
              [:Class, :String, :NilClass, :Symbol].∀{|scenario| expect(🧬.∃ᵐ?(scenario)).to eq(false)}
              ['String', 1337, nil].∀{|scenario| expect{🧬.∃ᵐ?(scenario)}.to raise_error(ArgumentError)}
            end
            it 'for global data' do
              expect(🧬.∃ᵐ?(:BigDecimal)).to eq(false)
              expect(🧬.∃ᵐ?(:RuuubyFake)).to eq(false)
            end
            it 'for sub-modules' do
              expect(🧬.∃ᵐ?(:VERSIONFAKE, ::Ruuuby)).to eq(false)
              expect(🧬.∃ᵐ?(:InnerModuleDepth1, ::Ruuuby)).to eq(false)
              expect(🧬.∃ᵐ?(:InnerModuleDepth1, ::Ruuuby)).to eq(false)
              expect(🧬.∃ᵐ?(:InnerModuleDepthFake, ::QAClass)).to eq(false)
              expect(🧬.∃ᵐ?(:InnerModuleDepthFake, ::QAModule)).to eq(false)
              expect(🧬.∃ᵐ?(:InnerClassDepth1, ::QAClass)).to eq(false)
              expect(🧬.∃ᵐ?(:InnerClassDepth1, ::QAModule)).to eq(false)
            end
            it 'for sub-sub-modules' do
              expect(🧬.∃ᵐ?(:InnerModuleDepthFake, QAClass::InnerModuleDepth1)).to eq(false)
              expect(🧬.∃ᵐ?(:InnerModuleDepthFake, QAModule::InnerModuleDepth1)).to eq(false)
            end
          end
          context 'cases: error' do
            it 'first arg: module_name' do
              expect{🧬.∃ᵐ?(nil)}.to raise_error(ArgumentError)
              expect{🧬.∃ᵐ?(5)}.to raise_error(ArgumentError)
            end
            it 'second arg: module_owner' do
              expect{🧬.∃ᵐ?(:VERSION, nil)}.to raise_error(ArgumentError)
              expect{🧬.∃ᵐ?(:VERSION, 5)}.to raise_error(ArgumentError)
            end
          end
        end
      end # end: {func{∃ᵐ?}}

    end
  end # end: {functionality}

  #  __   ___  __   ___  __   __                   __   ___
  # |__) |__  |__) |__  /  \ |__)  |\/|  /\  |\ | /  ` |__
  # |    |___ |  \ |    \__/ |  \  |  | /~~\ | \| \__, |___
  context 'performance', :performance do

    context 'func{∃ᶜ?}' do
      context 'handling needed scenarios' do
        context 'cases: positive' do
          it 'for global data' do
            expect{🧬.∃ᶜ?(:QAClass)}.to perform_very_quickly
          end
          it 'for sub-classes' do
            expect{🧬.∃ᶜ?(:InnerClassDepth1, QAClass)}.to perform_very_quickly
            expect{🧬.∃ᶜ?(:InnerClassDepth1, QAModule)}.to perform_very_quickly
            expect{🧬.∃ᶜ?(:WrongParamType, ::Ruuuby::ParamErr)}.to perform_very_quickly
          end
        end
        context 'cases: negative' do
          it 'for global data' do
            expect{🧬.∃ᶜ?(:QAClassFake)}.to perform_very_quickly
            expect{🧬.∃ᶜ?(:Ruuuby)}.to perform_very_quickly
          end
          it 'for sub-classes' do
            expect{🧬.∃ᶜ?(:InnerClassDepth1, Ruuuby)}.to perform_very_quickly
            expect{🧬.∃ᶜ?(:InnerModuleDepth1, QAClass)}.to perform_very_quickly
            expect{🧬.∃ᶜ?(:InnerModuleDepth1, QAModule)}.to perform_very_quickly
            expect{🧬.∃ᶜ?(:InnerClassDepthFake, QAClass)}.to perform_very_quickly
            expect{🧬.∃ᶜ?(:InnerClassDepthFake, QAModule)}.to perform_very_quickly
          end
        end
      end
    end # end: {func{∃ᶜ?}}

    context 'func{∃ᵐ?}' do
      context 'handling needed scenarios' do
        context 'cases: positive' do
          it 'for global data' do
            expect{🧬.∃ᵐ?(:Ruuuby)}.to perform_very_quickly
            expect{🧬.∃ᵐ?(:QAModule)}.to perform_very_quickly
          end
          it 'for sub-modules' do
            expect{🧬.∃ᵐ?(:ParamErr, ::Ruuuby)}.to perform_very_quickly
            expect{🧬.∃ᵐ?(:InnerModuleDepth1, QAClass)}.to perform_very_quickly
            expect{🧬.∃ᵐ?(:InnerModuleDepth1, QAModule)}.to perform_very_quickly
          end
          it 'for sub-sub-modules' do
            expect{🧬.∃ᵐ?(:InnerModuleDepth2, QAClass::InnerModuleDepth1)}.to perform_very_quickly
            expect{🧬.∃ᵐ?(:InnerModuleDepth2, QAModule::InnerModuleDepth1)}.to perform_very_quickly
          end
        end
        context 'cases: negative' do
          it 'for global data' do
            expect{🧬.∃ᵐ?(:BigDecimal)}.to perform_very_quickly
            expect{🧬.∃ᵐ?(:RuuubyFake)}.to perform_very_quickly
          end
          it 'for sub-modules' do
            expect{🧬.∃ᵐ?(:VERSIONFAKE, ::Ruuuby)}.to perform_very_quickly
            expect{🧬.∃ᵐ?(:InnerModuleDepth1, ::Ruuuby)}.to perform_very_quickly
            expect{🧬.∃ᵐ?(:InnerModuleDepth1, ::Ruuuby)}.to perform_very_quickly
            expect{🧬.∃ᵐ?(:InnerModuleDepthFake, ::QAClass)}.to perform_very_quickly
            expect{🧬.∃ᵐ?(:InnerModuleDepthFake, ::QAModule)}.to perform_very_quickly
            expect{🧬.∃ᵐ?(:InnerClassDepth1, ::QAClass)}.to perform_very_quickly
            expect{🧬.∃ᵐ?(:InnerClassDepth1, ::QAModule)}.to perform_very_quickly
          end
          it 'for sub-sub-modules' do
            expect{🧬.∃ᵐ?(:InnerModuleDepthFake, QAClass::InnerModuleDepth1)}.to perform_very_quickly
            expect{🧬.∃ᵐ?(:InnerModuleDepthFake, QAModule::InnerModuleDepth1)}.to perform_very_quickly
          end
        end
      end
    end # end: {func{∃ᵐ?}}

  end # end: {performance}

end
