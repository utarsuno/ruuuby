# coding: utf-8

RSpec.describe 'module' do

  context 'extends class[Module]' do
    it 'by creating needed aliases' do
      RuuubyTestHelper::CONFIG_MODULE[:ruby].∀{ |func| expect(::Module.∃func?(func)).to eq(true) }
      RuuubyTestHelper::CONFIG_MODULE[:aliases].∀{ |base_func, aliased_func| expect(::Module.∃func?(aliased_func)).to eq(true) }
    end

    context 'by adding function: ∃func_alias?' do
      context 'handling needed scenarios' do
        it 'cases: true-positive' do
          expect(::Module.∃func_alias?(:const_defined?, :∃const?)).to eq(true)
        end
        it 'cases: false-positive' do
          expect(::Module.∃func_alias?(:const_defined?, :AAA)).to eq(false)
          expect(::Module.∃func_alias?(:private, :∃const?)).to eq(false)
        end
        it 'cases: true-negative' do
          expect(::Module.∃func_alias?(:bla, :bla)).to eq(false)
        end
        it 'cases: bad params' do
          expect{::Module.∃func_alias?(nil, :bla)}.to raise_error(ArgumentError)
          expect{::Module.∃func_alias?(:bla, nil)}.to raise_error(ArgumentError)
        end
      end
    end

    context 'by adding function: ∃func?' do
      context 'handling needed scenarios' do
        it 'cases: true-positive' do
          expect(::Array.∃func?(:⊕)).to eq(true)
          expect(::Array.∃func?(:disjunctive_union)).to eq(true)
        end
        it 'cases: false-positive' do
          expect(::Array.∃func?(:∃func?)).to eq(false)
        end
        it 'cases: true-negative' do
          expect(::Array.∃func?(:not_a_real_func)).to eq(false)
        end
        it 'cases: bad params' do
          expect{::Array.∃func?(nil)}.to raise_error(ArgumentError)
          expect{::Array.∃func?(::Array)}.to raise_error(ArgumentError)
          expect{::Array.∃func?(1337)}.to raise_error(ArgumentError)
        end
      end
    end

  end

  #  __   ___  __   ___  __   __                   __   ___
  # |__) |__  |__) |__  /  \ |__)  |\/|  /\  |\ | /  ` |__
  # |    |___ |  \ |    \__/ |  \  |  | /~~\ | \| \__, |___
  context 'performance', :'performance' do

    context 'func[∃func_alias?] runs fast enough' do
      context 'for cases: global &' do
        it 'true-positive' do
          expect{::Module.∃func_alias?(:const_defined?, :∃const?)}.to perform_very_quickly
        end
        it 'true-negative' do
          expect{::Module.∃func_alias?(:bla, :bla)}.to perform_very_quickly
        end
        it 'false-positive' do
          expect{::Module.∃func_alias?(:const_defined?, :AAA)}.to perform_very_quickly
        end
      end
    end

    context 'func[∃func?] runs fast enough' do
      context 'for cases: global &' do
        it 'true-positive' do
          expect{::Array.∃func?(:⊕)}.to perform_very_quickly
          expect{::Array.∃func?(:disjunctive_union)}.to perform_very_quickly
        end
        it 'true-negative' do
          expect{::Array.∃func?(:not_a_real_func)}.to perform_very_quickly
        end
        it 'false-positive' do
          expect{::Array.∃func?(:∃func?)}.to perform_very_quickly
        end
      end
    end
  end

end
