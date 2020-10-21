# encoding: UTF-8

RSpec.describe 'f15_spec' do

  context 'f15', :db do
  end

  context 'ruuuby', :audit do
    context 'defines a version number' do
      it 'as a frozen string' do
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
