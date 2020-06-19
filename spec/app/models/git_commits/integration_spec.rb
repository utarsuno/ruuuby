# coding: UTF-8

RSpec.describe 'git_commits.rb' do

  context 'ApplicationRecord{GitCommit}', :db do

    context 'hybrid tests against{RuuubyRelease}' do

      it 'RuuubyRelease{num_released} should match GitCommit{num_release_tags}' do
        expect(::RuuubyRelease.num_released).to eq(::GitCommit.num_release_tags)
      end

    end

  end

end
