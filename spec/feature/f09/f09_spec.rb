# coding: UTF-8

RSpec.describe 'f09' do

  context 'audits', :audits do

    context 'feature(f09) passes audits (tests not relating to observed functionality)' do
      it 'module is defined in correct location' do
        expect(🧬.∃ᵐ?(:ArrayF08, ::Ruuuby::Feature::Includable)).to eq(true)
        expect(🧬.∃ᵐ?(:ArrayF09, ::Ruuuby::Feature::Includable)).to eq(true)
      end
    end

  end

end
