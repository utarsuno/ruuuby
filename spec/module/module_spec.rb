# coding: utf-8

RSpec.describe 'module' do

  context 'extends class[Module]' do

    context 'adding needed functions' do

      context 'function{⨍_add_aliases}' do
        context 'handles needed scenarios' do
          context 'cases: negative' do
            it 'bad args' do
              expect{
                module FakeModule
                  def fake_func;end
                  ⨍_add_aliases(:fake_func, nil)
                end
              }.to raise_error(ArgumentError)

              expect{
                ⨍_add_aliases(:fake_func, nil)
              }.to raise_error(RSpec::Core::ExampleGroup::WrongScopeError)

              expect{
                module FakeModule
                  def fake_func;end
                  ⨍_add_aliases(nil, [:aaa])
                end
              }.to raise_error(TypeError)

              expect{
                module FakeModule
                  def fake_func;end
                  ⨍_add_aliases(:fake_func, [])
                end
              }.to raise_error(ArgumentError)
            end
          end
        end
      end

      context 'operations {get_all_defined[modules|classes]}' do
        context 'function{get_all_defined_modules} handles needed scenarios' do
          it 'cases: positive' do
            expect≈≈(💎.get_all_defined_modules, [:QA, :Paths, :BuiltWith, :References])
          end
        end
        context 'function{get_all_defined_classes} handles needed scenarios' do
          it 'cases: positive' do
            expect≈≈(💎.get_all_defined_classes, [:RuuubyORM, :RuuubyAPI, :RuuubyEngine])
          end
        end
      end

      context 'operations {∋?, ∌?, ∈?, ∉?}' do
        context 'function{∋?} handles needed scenarios' do
          it 'cases: positive' do
            expect(StandardError.∋?(RuntimeError)).to eq(true)
          end
          it 'cases: negative' do
            expect(RuntimeError.∋?(StandardError)).to eq(false)
            expect(StandardError.∋?(Ruuuby)).to eq(false)
            expect(Ruuuby.∋?(StandardError)).to eq(false)
          end
        end
        context 'function{∌?} handles needed scenarios' do
          it 'cases: positive' do
            expect(RuntimeError.∌?(StandardError)).to eq(true)
            expect(Ruuuby.∌?(StandardError)).to eq(true)
            expect(StandardError.∌?(Ruuuby)).to eq(true)
          end
          it 'cases: negative' do
            expect(StandardError.∌?(RuntimeError)).to eq(false)
          end
        end
        context 'function{∈?} handles needed scenarios' do
          it 'cases: positive' do
            expect(RuntimeError.∈?(StandardError)).to eq(true)
          end
          it 'cases: negative' do
            expect(StandardError.∈?(RuntimeError)).to eq(false)
            expect(StandardError.∈?(Ruuuby)).to eq(false)
            expect(Ruuuby.∈?(StandardError)).to eq(false)
          end
        end
        context 'function{∉?} handles needed scenarios' do
          it 'cases: positive' do
            expect(StandardError.∉?(RuntimeError)).to eq(true)
            expect(StandardError.∉?(Ruuuby)).to eq(true)
            expect(Ruuuby.∉?(StandardError)).to eq(true)
          end
          it 'cases: negative' do
            expect(RuntimeError.∉?(StandardError)).to eq(false)
          end
        end
      end # end: {operations {∋?, ∌?, ∈?, ∉?}}

    end

    context 'by adding function{∃⨍_alias?}' do
      context 'handling needed scenarios' do
        it 'cases: true-positive' do
          expect(::Module.∃⨍_alias?(:const_defined?, :∃const?)).to eq(true)
        end
        it 'cases: false-positive' do
          expect(::Module.∃⨍_alias?(:const_defined?, :AAA)).to eq(false)
          expect(::Module.∃⨍_alias?(:private, :∃const?)).to eq(false)
        end
        it 'cases: true-negative' do
          expect(::Module.∃⨍_alias?(:bla, :bla)).to eq(false)
        end
        it 'cases: bad params' do
          expect{::Module.∃⨍_alias?(nil, :bla)}.to raise_error(ArgumentError)
          expect{::Module.∃⨍_alias?(:bla, nil)}.to raise_error(ArgumentError)
        end
      end
    end

    context 'by adding function{∃⨍?}' do
      context 'handling needed scenarios' do
        it 'cases: true-positive' do
          expect(::Array.∃⨍?(:⊕)).to eq(true)
          expect(::Array.∃⨍?(:disjunctive_union)).to eq(true)
        end
        it 'cases: false-positive' do
          expect(::Array.∃⨍?(:∃⨍?)).to eq(false)
        end
        it 'cases: true-negative' do
          expect(::Array.∃⨍?(:not_a_real_func)).to eq(false)
        end
        it 'cases: bad params' do
          expect{::Array.∃⨍?(nil)}.to raise_error(ArgumentError)
          expect{::Array.∃⨍?(::Array)}.to raise_error(ArgumentError)
          expect{::Array.∃⨍?(1337)}.to raise_error(ArgumentError)
        end
      end
    end

  end

  #  __   ___  __   ___  __   __                   __   ___
  # |__) |__  |__) |__  /  \ |__)  |\/|  /\  |\ | /  ` |__
  # |    |___ |  \ |    \__/ |  \  |  | /~~\ | \| \__, |___
  context 'performance', :performance do

    context 'the following funcs perform fast enough' do

      context 'f13' do
        context 'func{∃⨍_alias?} for cases:' do
          it 'positive' do
            expect{::Module.∃⨍_alias?(:const_defined?, :∃const?)}.to perform_quickly
          end
          it 'negative' do
            expect{::Module.∃⨍_alias?(:bla, :bla)}.to perform_quickly
            expect{::Module.∃⨍_alias?(:const_defined?, :AAA)}.to perform_quickly
          end
        end

        context 'func{∃⨍?} for cases:' do
          it 'positive' do
            expect{::Array.∃⨍?(:⊕)}.to perform_very_quickly
            expect{::Array.∃⨍?(:disjunctive_union)}.to perform_very_quickly
          end
          it 'negative' do
            expect{::Array.∃⨍?(:not_a_real_func)}.to perform_very_quickly
            expect{::Array.∃⨍?(:∃⨍?)}.to perform_very_quickly
          end
        end
      end

      context 'operations {get_all_defined[modules|classes]}' do
        context 'function{get_all_defined_modules} handles needed performance scenarios' do
          it 'cases: positive' do
            expect{💎.get_all_defined_modules}.to perform_very_quickly
          end
        end
        context 'function{get_all_defined_classes} handles needed performance scenarios' do
          it 'cases: positive' do
            expect{💎.get_all_defined_classes}.to perform_very_quickly
          end
        end
      end # end: {operations {get_all_defined[modules|classes]}}

      context 'operations {∋?, ∌?, ∈?, ∉?}' do
        context 'func{∋?} for cases:' do
          it 'positive' do
            expect{StandardError.∋?(RuntimeError)}.to perform_very_quickly
          end
          it 'negative' do
            expect{RuntimeError.∋?(StandardError)}.to perform_very_quickly
            expect{StandardError.∋?(Ruuuby)}.to perform_very_quickly
          end
        end
        context 'func{∌?} for cases:' do
          it 'positive' do
            expect{RuntimeError.∌?(StandardError)}.to perform_very_quickly
            expect{Ruuuby.∌?(StandardError)}.to perform_very_quickly
          end
          it 'negative' do
            expect{StandardError.∌?(RuntimeError)}.to perform_very_quickly
          end
        end
        context 'func{∈?} for cases:' do
          it 'positive' do
            expect{RuntimeError.∈?(StandardError)}.to perform_very_quickly
          end
          it 'negative' do
            expect{StandardError.∈?(RuntimeError)}.to perform_very_quickly
            expect{StandardError.∈?(Ruuuby)}.to perform_very_quickly
          end
        end
        context 'func{∉?} for cases:' do
          it 'positive' do
            expect{StandardError.∉?(RuntimeError)}.to perform_very_quickly
            expect{Ruuuby.∉?(StandardError)}.to perform_very_quickly
          end
          it 'negative' do
            expect{RuntimeError.∉?(StandardError)}.to perform_very_quickly
          end
        end
      end # end: {operations {∋?, ∌?, ∈?, ∉?}}

    end

  end

end
