# coding: UTF-8

RSpec.describe 'f26' do

  context 'functionality' do
    it 'main adds funcs{📅, 🕒, 📅🕒}' do
      expect(📅).to eq(::Date)
      expect(🕒).to eq(::Time)
      expect(📅🕒).to eq(::DateTime)
    end
  end # end: {functionality}

  context 'audits', :audits do
    context 'feature(f26) passes audits (tests not relating to observed functionality)' do
      it 'module is defined in correct location' do
        expect_∃module(:StringF26, ::Ruuuby::Feature::Includable)
        expect_∃module(:MainF26, ::Ruuuby::Feature::Extendable)
      end
      context 'funcs provided are' do
        context 'defined in correct location' do
          it 'for module{StringF26}' do
            expect_∃⨍(:iso8601?, ::Ruuuby::Feature::Includable::StringF26)
            expect_∃⨍(:as_iso8601, ::Ruuuby::Feature::Includable::StringF26)
          end
          it 'for module{MainF26}' do
            expect_∃⨍(:📅, ::Ruuuby::Feature::Extendable::MainF26)
            expect_∃⨍(:🕒, ::Ruuuby::Feature::Extendable::MainF26)
            expect_∃⨍(:📅🕒, ::Ruuuby::Feature::Extendable::MainF26)
          end
        end
      end
    end
  end
end
