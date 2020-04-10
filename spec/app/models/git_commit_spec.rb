# coding: utf-8

RSpec.describe 'git_commit.rb' do

  context 'ApplicationRecord{GitCommit}', :db do

    context 'ORM operations' do

      before :all do
        @fake_release = RuuubyRelease.spawn(1, 2, 3)
      end

      after :all do
        @fake_release.♻️!
      end

      context 'static-func{spawn}' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            fake_git_commit = GitCommit.spawn('fake_str_a', data_git_author_date, data_git_hash, @fake_release)
            expect(fake_git_commit.commit_subject).to eq('fake_str_a')
            expect(fake_git_commit.commit_author_date).to eq(data_git_author_date)
            expect(fake_git_commit.commit_hash).to eq(data_git_hash)
            expect(fake_git_commit.ruuuby_release).to eq(@fake_release)

            fake_git_commit.♻️!
          end
          context 'cases: error' do
            it 'bad commit_subject' do
              expect{GitCommit.spawn(1337, data_git_author_date, data_git_hash, @fake_release)}.to raise_error(ActiveRecord::RecordInvalid)
            end
            it 'bad commit_hash' do
              expect{GitCommit.spawn('fake_str_a', data_git_author_date, 'yikes', @fake_release)}.to raise_error(ActiveRecord::RecordInvalid)
            end
            it 'bad commit_author_date' do
              expect{GitCommit.spawn('fake_str_a', 'yikes', data_git_hash, @fake_release)}.to raise_error(ActiveRecord::RecordInvalid)
            end
          end
        end
      end

    end # end: {ORM operations}

  end

end
