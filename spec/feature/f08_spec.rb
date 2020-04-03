# encoding: UTF-8

RSpec.describe 'f08' do

  context 'audits', :audits do

    context 'feature(f08) passes audits (tests not relating to observed functionality)' do
      it 'module is defined in correct location' do
        expect_∃module(:StringF08, ::Ruuuby::Feature::Includable)
      end
    end

  end

end
