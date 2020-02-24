# coding: utf-8

RSpec.describe 'module' do

  context 'extends class[Module]' do
    it 'by creating needed aliases' do
      # TODO: investigate this case, expect(::Module.∃func_alias?(:private, :🙈)).to eq(true)
      expect(::Module.∃func_alias?(:private_constant, :🙈constants⟶)).to eq(true)
      expect(::Module.∃func_alias?(:∃const?, :const_defined?)).to eq(true)
      expect(::Module.∃func_alias?(:∃func?, :method_defined?)).to eq(true)
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
  end

end
