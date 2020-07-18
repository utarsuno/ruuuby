# encoding: UTF-8

RSpec.describe 'f06' do

  context 'functionality' do

  end

  context 'audit', :audit do
    context 'feature(f06) passes audits' do
      it 'module is defined in correct location' do
        expect_∃ᵐ(:ObjectF06, ::Ruuuby::Feature::Includable)
      end
    end
  end

end
