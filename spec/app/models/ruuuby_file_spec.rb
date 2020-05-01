# coding: utf-8

RSpec.describe 'ruuuby_file.rb' do

  context 'ApplicationRecord{RuuubyFile}', :db do

    context 'defines module[Syntax]' do
      it 'exists' do
        expect_∃module(:Syntax, ::RuuubyFile)
      end
      context 'dynamically adds needed fetch functions' do
        context 'func{syntax_unix_path}' do
          it 'exists' do
            expect_syntax(RuuubyFile, :syntax_unix_path, RuuubyFile::Syntax::UNIX_PATH)
          end
          it 'handles cases: positive' do
            expect('/'.match?(::RuuubyFile.syntax_unix_path)).to eq(true)
            expect('./'.match?(::RuuubyFile.syntax_unix_path)).to eq(true)
            expect('../'.match?(::RuuubyFile.syntax_unix_path)).to eq(true)
            expect('../.'.match?(::RuuubyFile.syntax_unix_path)).to eq(true)
            expect('.././a'.match?(::RuuubyFile.syntax_unix_path)).to eq(true)
            expect('../../a'.match?(::RuuubyFile.syntax_unix_path)).to eq(true)
            expect('/a/a..'.match?(::RuuubyFile.syntax_unix_path)).to eq(true)
            expect('~/'.match?(::RuuubyFile.syntax_unix_path)).to eq(true)
            expect('~/a'.match?(::RuuubyFile.syntax_unix_path)).to eq(true)
            expect('~/a/a'.match?(::RuuubyFile.syntax_unix_path)).to eq(true)
            expect('~/.'.match?(::RuuubyFile.syntax_unix_path)).to eq(true)
            expect('~/..'.match?(::RuuubyFile.syntax_unix_path)).to eq(true)
          end
          it 'handles cases: negative' do

          end
        end

        it 'func{syntax_uid}' do
          expect_syntax(RuuubyFile, :syntax_uid, RuuubyFile::Syntax::UID)
        end
      end
      context 'with needed constants (that are not cached)' do
        context 'exist as needed' do
          it '::RuuubyRelease::Syntax::SQL_UID' do
            expect_syntax_wo_cache(RuuubyFile, :SQL_UID, RuuubyFile::Syntax::SQL_UID)
          end
        end
      end # end: {with needed constants (that are not cached)}
    end # end: {defines module[Syntax]}

    context 'ORM operations' do
      before :all do
      end
      after :all do
      end

      context 'static-func{spawn}' do
        context 'handles needed scenarios' do
          context 'cases: positive' do
            it 'can be created' do
              #ruuuby_file = RuuubyFile.spawn
            end
          end
          context 'cases: error' do
            it 'bad commit_subject' do
            end
          end
        end
      end # end: {static-func{spawn}}

      context 'instance-funcs' do
      end # end: {instance-funcs}
    end # end: {ORM operations}

  end

end
