# coding: UTF-8

RSpec.describe Ruuuby do

  context 'ruuuby audits', :audit do

    context 'defines a version number' do
      it 'has a version number' do
        expect(Ruuuby::VERSION.str?).to eq(true)
        expect(Ruuuby::VERSION.❄️?).to eq(true)
      end
    end

    context 'Ruuuby added as module' do
      it 'exists' do
        expect_∃ᴹ(:Ruuuby)
      end
    end

  end # end: audit

end
