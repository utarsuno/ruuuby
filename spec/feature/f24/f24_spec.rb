# encoding: UTF-8

RSpec.describe 'f24' do

  context 'audit', :audit do

    context 'feature(f24) passes audits' do
      it 'module is defined in correct location' do
        expect_∃ᵐ(:StringF24, ::Ruuuby::Feature::Includable)
      end
      context 'funcs provided are' do
        it 'defined in correct location' do
          expect_∃⨍(:🐫?, ::Ruuuby::Feature::Includable::StringF24)
          expect_∃⨍(:🐫⬇?, ::Ruuuby::Feature::Includable::StringF24)
          expect_∃⨍(:🐍⬆?, ::Ruuuby::Feature::Includable::StringF24)
          expect_∃⨍(:🐍?, ::Ruuuby::Feature::Includable::StringF24)
          expect_∃⨍(:to_🐍, ::Ruuuby::Feature::Includable::StringF24)
          expect_∃⨍(:to_🐫, ::Ruuuby::Feature::Includable::StringF24)
        end
      end
    end

  end

end
