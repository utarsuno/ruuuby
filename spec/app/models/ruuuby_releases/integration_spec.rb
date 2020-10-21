# encoding: UTF-8

RSpec.describe 'ruuuby_release.rb' do

  context 'ApplicationRecord{RuuubyRelease}', :db do

    context 'hybrid tests against{api_git}' do

      it 'RuuubyRelease{num_released} should match number of found release tags' do
        expect(::RuuubyRelease.num_released).to eq($git.release_tags.length)
      end

    end

  end

end
