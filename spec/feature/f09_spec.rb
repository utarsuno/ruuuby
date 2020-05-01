# coding: UTF-8

RSpec.describe 'f09' do

  context 'audits', :audits do

    context 'feature(f09) passes audits (tests not relating to observed functionality)' do
      it 'module is defined in correct location' do
        expect_∃module(:ArrayF08, ::Ruuuby::Feature::Includable)
        expect_∃module(:ArrayF09, ::Ruuuby::Feature::Includable)
      end
    end

  end

end
