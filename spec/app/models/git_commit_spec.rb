# coding: UTF-8

RSpec.describe 'git_commit.rb' do

  context 'ApplicationRecord{GitCommit}', :db do

    context 'ORM operations' do

      before :all do
        @fake_release_older = RuuubyRelease.spawn(0, 0, 99)
        @fake_release_newer = RuuubyRelease.spawn(99, 0, 0)
        expect(@fake_release_newer > @fake_release_older).to eq(true)
        expect(@fake_release_older < @fake_release_newer).to eq(true)
        expect(@fake_release_older > @fake_release_newer).to eq(false)
        expect(@fake_release_newer < @fake_release_older).to eq(false)
      end

      after :all do
        @fake_release_older.♻️!
        @fake_release_newer.♻️!
      end

      context 'static-func{spawn}' do
        context 'handles needed scenarios' do
          context 'cases: positive' do
            it 'can be created' do
              fake_git_commit = GitCommit.spawn('fake_str_a', data_git_author_date, data_git_hash, @fake_release_older)
              expect(fake_git_commit.commit_subject).to eq('fake_str_a')
              expect(fake_git_commit.commit_author_date).to eq(data_git_author_date)
              expect(fake_git_commit.commit_hash).to eq(data_git_hash)
              expect(fake_git_commit.ruuuby_release).to eq(@fake_release_older)
              fake_git_commit.♻️!
            end
            it 'allows non-normalized iso8601 formatted (and then saves as normalized)' do
              fake_git_commit = GitCommit.spawn('fake_str_a', data_git_author_date_wo_normalization, data_git_hash, @fake_release_older)
              expect(fake_git_commit.commit_author_date).to eq(data_git_author_date)
              fake_git_commit.♻️!
            end
          end
          context 'cases: error' do
            it 'bad commit_subject' do
              expect{GitCommit.spawn('1337', data_git_author_date, data_git_hash, @fake_release_older)}.to raise_error(ActiveRecord::RecordInvalid)
            end
            it 'bad commit_hash' do
              expect{GitCommit.spawn('fake_str_a', data_git_author_date, 'yikes', @fake_release_older)}.to raise_error(ArgumentError)
            end
            it 'bad commit_author_date' do
              expect{GitCommit.spawn('fake_str_a', 'yikes', data_git_hash, @fake_release_older)}.to raise_error(ArgumentError)
            end
          end
        end
      end # end: {static-func{spawn}}

      context 'instance-funcs' do
        context 'func{<}' do
          context 'handles needed scenarios' do
            context 'cases: positive' do
              it 'within the same release' do
                fake_git_commit_oldest = GitCommit.spawn('fake_str_a', data_git_author_date_oldest, data_git_hash, @fake_release_older)
                fake_git_commit_older  = GitCommit.spawn('fake_str_a', data_git_author_date_older, data_git_hash, @fake_release_newer)
                fake_git_commit_newer  = GitCommit.spawn('fake_str_a', data_git_author_date_newer, data_git_hash, @fake_release_newer)
                expect(fake_git_commit_older < fake_git_commit_newer).to eq(true)
                expect(fake_git_commit_oldest < fake_git_commit_newer).to eq(true)
                expect(fake_git_commit_oldest < fake_git_commit_older).to eq(true)
                fake_git_commit_newer.♻️!
                fake_git_commit_older.♻️!
                fake_git_commit_oldest.♻️!
              end
            end
            context 'cases: negative' do
              it 'within the same release' do
                fake_git_commit_older = GitCommit.spawn('fake_str_a', data_git_author_date_older, data_git_hash, @fake_release_newer)
                fake_git_commit_newer = GitCommit.spawn('fake_str_a', data_git_author_date_newer, data_git_hash, @fake_release_newer)
                expect(fake_git_commit_newer < fake_git_commit_older).to eq(false)
                fake_git_commit_newer.♻️!
                fake_git_commit_older.♻️!
              end
            end
          end
        end # end: {func{<}}
        context 'func{>}' do
          context 'handles needed scenarios' do
            it 'cases: positive' do
              fake_git_commit_oldest = GitCommit.spawn('fake_str_a', data_git_author_date_oldest, data_git_hash, @fake_release_older)
              fake_git_commit_older  = GitCommit.spawn('fake_str_a', data_git_author_date_older, data_git_hash, @fake_release_newer)
              fake_git_commit_newer  = GitCommit.spawn('fake_str_a', data_git_author_date_newer, data_git_hash, @fake_release_newer)
              expect(fake_git_commit_newer > fake_git_commit_older).to eq(true)
              expect(fake_git_commit_newer > fake_git_commit_oldest).to eq(true)
              expect(fake_git_commit_older > fake_git_commit_oldest).to eq(true)
              fake_git_commit_newer.♻️!
              fake_git_commit_older.♻️!
              fake_git_commit_oldest.♻️!
            end
            it 'cases: negative' do
              fake_git_commit_oldest = GitCommit.spawn('fake_str_a', data_git_author_date_oldest, data_git_hash, @fake_release_older)
              fake_git_commit_older  = GitCommit.spawn('fake_str_a', data_git_author_date_older, data_git_hash, @fake_release_newer)
              fake_git_commit_newer  = GitCommit.spawn('fake_str_a', data_git_author_date_newer, data_git_hash, @fake_release_newer)
              expect(fake_git_commit_older > fake_git_commit_newer).to eq(false)
              expect(fake_git_commit_oldest > fake_git_commit_newer).to eq(false)
              expect(fake_git_commit_oldest > fake_git_commit_older).to eq(false)
              fake_git_commit_newer.♻️!
              fake_git_commit_older.♻️!
              fake_git_commit_oldest.♻️!
            end
          end
        end # end: {func{>}}
      end # end: {instance-funcs}
    end # end: {ORM operations}

  end

end
