# encoding: UTF-8

RSpec.describe 'f09' do

  context 'audit', :audit do

    context 'feature(f09) passes audits' do
      it 'module is defined in correct location' do
        expect_∃ᵐ(:ArrayF08, ::Ruuuby::Feature::Includable)
        expect_∃ᵐ(:ArrayF09, ::Ruuuby::Feature::Includable)
      end
    end

  end

end
