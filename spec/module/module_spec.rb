# coding: utf-8

RSpec.describe 'module' do

  context 'extends class[Module]' do

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

    end

  end

end
