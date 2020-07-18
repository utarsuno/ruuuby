# encoding: UTF-8

RSpec.describe 'f21' do

  context 'audit', :audit do

    context 'feature(f21) passes audits' do
      it 'module is defined in correct location' do
        expect_∃ᵐ(:StringF21, ::Ruuuby::Feature::Includable)
      end
      context 'funcs provided are' do
        it 'defined in correct location' do
          expect_∃⨍(:digit?, ::Ruuuby::Feature::Includable::StringF21)
          expect_∃⨍(:to_num?, ::Ruuuby::Feature::Includable::StringF21)
          expect_∃⨍(:to_num, ::Ruuuby::Feature::Includable::StringF21)
        end
      end
    end

  end

end
