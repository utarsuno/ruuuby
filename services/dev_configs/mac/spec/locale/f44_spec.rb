# encoding: UTF-8

RSpec.describe 'ruby' do
  context 'locale', :preferences do

    context 'recommended settings for {zsh}' do
      it 'expected version{5.8} matches' do
        expect(💻('zsh --version')).to eq('zsh 5.8 (x86_64-apple-darwin18.7.0)')
      end
    end

  end
end
