# coding: utf-8

RSpec.describe 'types.rb' do
  let(:virtual_types){::Ruuuby::VirtualTypes}

  context 'defines needed constants' do
    context 'constant(🅱️)' do
      it 'has correct value' do
        expect(virtual_types::🅱️).to eq([::TrueClass, ::FalseClass])
      end
      it 'can not be changed' do
        expect{virtual_types::🅱️ = 5}.to raise_error(FrozenError)
      end
    end

    context 'constant(STRY)' do
      it 'has correct value' do
        expect(virtual_types::STRY).to eq([::Symbol, ::String])
      end
      it 'can not be changed' do
        expect{virtual_types::STRY = 5}.to raise_error(FrozenError)
      end
    end

    context 'constant(NUMS)' do
      it 'has correct value' do
        expect(virtual_types::NUMS).to eq([::Integer, ::Float, ::Complex, ::Rational, ::BigDecimal])
      end
      it 'can not be changed' do
        expect{virtual_types::NUMS = 5}.to raise_error(FrozenError)
      end
    end

    context 'constant(COUNTABLES)' do
      it 'has correct value' do
        expect(virtual_types::COUNTABLES).to eq([::String, ::Set, ::Array])
      end
      it 'can not be changed' do
        expect{virtual_types::COUNTABLES = 5}.to raise_error(FrozenError)
      end
    end
  end
end
