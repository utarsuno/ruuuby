# encoding: UTF-8

using ::Object::ContextSuperscripts

RSpec.describe 'f16' do

  context 'audit', :audit do

    it 'funcs mapped from{-9} to {9} provide expected symbol' do
      expect(⁻⁹).to eq(:⁻⁹)
      expect(⁻⁸).to eq(:⁻⁸)
      expect(⁻⁷).to eq(:⁻⁷)
      expect(⁻⁶).to eq(:⁻⁶)
      expect(⁻⁵).to eq(:⁻⁵)
      expect(⁻⁴).to eq(:⁻⁴)
      expect(⁻³).to eq(:⁻³)
      expect(⁻²).to eq(:⁻²)
      expect(⁻¹).to eq(:⁻¹)
      expect(⁰).to eq(:⁰)
      expect(⁹).to eq(:⁹)
      expect(⁸).to eq(:⁸)
      expect(⁷).to eq(:⁷)
      expect(⁶).to eq(:⁶)
      expect(⁵).to eq(:⁵)
      expect(⁴).to eq(:⁴)
      expect(³).to eq(:³)
      expect(²).to eq(:²)
      expect(¹).to eq(:¹)
    end

    context 'feature{16} passes audits' do
      it 'module{ContextSuperscripts} is defined in correct location' do
        expect_∃ᵐ(:ContextSuperscripts, ::Object)
      end
    end
  end

end
