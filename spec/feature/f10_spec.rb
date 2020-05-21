# coding: UTF-8

RSpec.describe 'f10' do

  context 'functionality' do
    context 'func{🌽}' do
      it 'exists' do
        expect(🌽).to eq(::Kernel)
      end
    end
  end

  context 'audits', :audits do

    context 'feature(f10) passes audits (tests not relating to observed functionality)' do
      it 'module is defined in correct location' do
        expect(🧬.∃ᵐ?(:MethodF10, ::Ruuuby::Feature::Includable)).to eq(true)
        expect(🧬.∃ᵐ?(:MainF10, ::Ruuuby::Feature::Extendable)).to eq(true)
      end
    end

  end

end
