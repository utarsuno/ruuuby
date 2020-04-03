# encoding: UTF-8

RSpec.describe 'f12' do

  context 'needed global funcs get added to main' do

    context 'func{📁}' do
      it 'aliases ::File' do
        expect(📁).to eq(::File)
      end
    end

    context 'func{📂}' do
      it 'aliases ::File' do
        expect(📂).to eq(::File)
      end
    end

    context 'func{🗄️}' do
      it 'aliases ::Dir' do
        expect(🗄️).to eq(::Dir)
      end
    end

  end

  context 'audits', :audits do

    context 'feature(f12) passes audits (tests not relating to observed functionality)' do
      it 'module is defined in correct location' do
        expect_∃module(:MainF12, ::Ruuuby::Feature::Extendable)
      end
      context 'funcs provided are defined in correct location' do
        it 'for m{MainF12}' do
          expect_∃⨍(:📁, ::Ruuuby::Feature::Extendable::MainF12)
          expect_∃⨍(:📂, ::Ruuuby::Feature::Extendable::MainF12)
          expect_∃⨍(:🗄️, ::Ruuuby::Feature::Extendable::MainF12)
        end
      end
    end

  end

end
