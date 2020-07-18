# coding: UTF-8

RSpec.describe 'f31_b00' do

  context 'feature{f31} functionality for' do

    context 'behavior{b00}' do

      it 'exists as needed' do
        the_ref = 💎.engine.api_git
        the_id  = the_ref.🆔
        expect(the_ref.ⓣ).to eq(::Ruuuby::MetaData::GitAPI)
        expect(the_ref.🆔).to eq(💎.engine.api_git.🆔)
        expect(the_ref.🆔).to eq(the_id)
        expect(💎.engine.api_git.🆔).to eq(the_ref.🆔)
      end

      context 'func{release_tags}' do
        context 'locale', :locale do
          it 'fetches tags w/ correct naming schemas' do
            release_tags = 💎.engine.api_git.release_tags
            # 30 is an arbitrary number
            expect(release_tags.length > 30).to eq(true)
            expect(release_tags[0][0].length).to eq(3)
            expect(release_tags[0][0].ⓣ).to eq(Array)
            expect(release_tags[0][1].ⓣ).to eq(String)
            expect(release_tags[0][1].∅?).to eq(false)
          end
          it 'returns the same obj, not one w/ a new obj_id' do
            💎.engine.api_git.release_tags
            expect(💎.engine.api_git.release_tags.🆔).to eq(💎.engine.api_git.release_tags.🆔)
          end
        end
      end

      context 'func{branch_names}' do
        context 'locale', :locale do
          it 'correctly fetches all branch names' do
            expect(💎.engine.api_git.branch_names).to eq(%w(master origin/master wip_jruby))
          end
        end
        it 'returns the same obj, not one w/ a new obj_id' do
          💎.engine.api_git.branch_names
          expect(💎.engine.api_git.branch_names.🆔).to eq(💎.engine.api_git.branch_names.🆔)
        end
      end

      context 'func{∃commit?}' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            expect(💎.engine.api_git.∃commit?('43d3e4d52c4b12f97b0c94976dc9417c511e7f34')).to eq(true)
          end
          it 'cases: negative' do
            expect(💎.engine.api_git.∃commit?('45d3e2d5224b12f97b0c945679c2524c511e7f81')).to eq(false)
          end
          it 'cases: error' do
            expect{💎.engine.api_git.∃commit?(nil)}.to raise_error(ArgumentError)
            expect{💎.engine.api_git.∃commit?(1)}.to raise_error(ArgumentError)
          end
        end
      end

      context 'func{fetch_commits_until}' do
        context 'handles needed scenarios' do

          context 'db', :db do
            #it 'cases: positive' do
            # TODO:
            #end
          end

          it 'cases: error' do
            expect{💎.engine.api_git.fetch_commits_until(nil)}.to raise_error(ArgumentError)
            expect{💎.engine.api_git.fetch_commits_until('45d3e2d5224b12f97b0c945679c2524c511e7f81')}.to raise_error(RuntimeError)
          end
        end
      end

    end # end: {behavior{b00}}
  end

  context 'git_locale', :locale do
    context 'gem{Rugged} has needed configs' do
      it 'expected features' do
        expect≈≈(::Rugged.features, [:threads, :https, :ssh])
      end
    end
    # for more info, see: {https://git-scm.com/docs/gitattributes}
    context 'preferred {git-attributes} are set' do
      it 'for binary-like files' do
        %w(*.jpg *.jpeg *.png *.pdf *.bundle *.o).∀{|scenario| expect(💎.engine.api_git.∃attribute?(scenario, {'diff' => false, 'text' => false})).to eq(true)}
      end
      it 'for{Ruby}' do
        %w(*.rb *.gemspec).∀{|scenario| expect(💎.engine.api_git.∃attribute?(scenario, {'diff' => 'ruby', 'text' => 'ruby', 'eol' => 'lf'})).to eq(true)}
      end
      it 'for{C}' do
        %w(*.c *.h).∀{|scenario| expect(💎.engine.api_git.∃attribute?(scenario, {'diff' => 'cpp', 'text' => 'cpp', 'eol' => 'lf'})).to eq(true)}
      end
      it 'for{Web-related}' do
        expect(💎.engine.api_git.∃attribute?('*.html', {'diff' => 'html', 'text' => 'html', 'eol' => 'lf'})).to eq(true)
        expect(💎.engine.api_git.∃attribute?('*.css', {'diff' => 'css', 'text' => 'css', 'eol' => 'lf'})).to eq(true)
        expect(💎.engine.api_git.∃attribute?('*.md', {'diff' => 'markdown', 'text' => 'markdown', 'eol' => 'lf'})).to eq(true)
      end
      it 'for{Java}' do
        expect(💎.engine.api_git.∃attribute?('*.java', {'diff' => 'java', 'text' => 'java', 'eol' => 'lf'})).to eq(true)
      end
      it 'for{Python}' do
        expect(💎.engine.api_git.∃attribute?('*.py', {'diff' => 'python', 'text' => 'python', 'eol' => 'lf'})).to eq(true)
      end
      it 'for{PHP}' do
        expect(💎.engine.api_git.∃attribute?('*.php', {'diff' => 'php', 'text' => 'php', 'eol' => 'lf'})).to eq(true)
      end
      it 'for{plain-text}' do
        %w(*.txt *.text *.log *.csv).∀{|scenario| expect(💎.engine.api_git.∃attribute?(scenario, {'diff' => 'text', 'text' => 'text', 'eol' => 'lf'})).to eq(true)}
      end
    end
  end

  context 'additional tests possible w/ gem{Rugged}', :audit do
    it '.gitignore' do
      expect(::Rugged.dotgit_ignore?('.gitignore')).to eq(true)
      expect(::Rugged.dotgit_ignore?('.gitattributes')).to eq(false)
    end
    it '.gitattributes' do
      expect(::Rugged.dotgit_attributes?('.gitignore')).to eq(false)
      expect(::Rugged.dotgit_attributes?('.gitattributes')).to eq(true)
    end
  end

end
