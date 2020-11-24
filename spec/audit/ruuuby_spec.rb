# encoding: UTF-8

RSpec.describe 'ruuuby' do

  context 'ruuuby', :audit do
    context 'defines version numbers for' do
      it 'for frozen constant{VERSION}' do
        expect(Ruuuby::VERSION.str?).to eq(true)
        expect(Ruuuby::VERSION.❄️?).to eq(true)
      end
    end
    context 'Ruuuby exists on "global" scope' do
      it 'as a module' do
        expect_∃ᴹ(:Ruuuby)
      end
    end
  end # end: audit

end
