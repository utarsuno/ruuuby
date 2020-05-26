# encoding: UTF-8

RSpec.describe 'f21' do

  context 'audits', :audits do

    context 'feature(f21) passes audits (tests not relating to observed functionality)' do
      it 'module is defined in correct location' do
        expect(🧬.∃ᵐ?(:StringF21, ::Ruuuby::Feature::Includable)).to eq(true)
      end
      context 'funcs provided are' do
        it 'defined in correct location' do
          expect_∃⨍(:digit?, ::Ruuuby::Feature::Includable::StringF21)
          expect_∃⨍(:to_radian, ::Ruuuby::Feature::Includable::StringF21)
          expect_∃⨍(:to_num?, ::Ruuuby::Feature::Includable::StringF21)
          expect_∃⨍(:to_num, ::Ruuuby::Feature::Includable::StringF21)
        end
      end
    end

  end

end
