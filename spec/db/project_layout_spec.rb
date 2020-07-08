# encoding: UTF-8

RSpec.describe 'db/seed.rb' do

  context 'db', :db do

    context 'general file expectations' do
      context 'only 1 file exists' do
        it 'w/ extensions{.gemspec}' do
          expect(::RuuubyFile.num_where(*['extensions = ?', '.gemspec'])).to eq(1)
        end
        it 'w/ extensions{.ruby-version}' do
          expect(::RuuubyFile.num_where(*['extensions = ?', '.ruby-version'])).to eq(1)
        end
        it 'w/ full_name{Rakefile}' do
          expect(::RuuubyFile.num_where(*['path_full = ? AND extensions = ?', 'Rakefile', ''])).to eq(1)
        end
        it 'w/ full_name{Gemfile}' do
          expect(::RuuubyFile.num_where(*['path_full = ? AND extensions = ?', 'Gemfile', ''])).to eq(1)
        end
        context 'for GIT' do
          it 'w/ {.gitignore}' do
            expect(::RuuubyFile.num_where(*['path_full = ? AND extensions = ? AND is_virtual = ?', '.gitignore', '', false])).to eq(1)
          end
          it 'w/ {.gitattributes}' do
            expect(::RuuubyFile.num_where(*['path_full = ? AND extensions = ? AND is_virtual = ?', '.gitattributes', '', false])).to eq(1)
          end
        end
      end
    end

  end
end
