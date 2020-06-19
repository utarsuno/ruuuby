# coding: UTF-8

RSpec.describe 'ruuuby_files.rb' do
  context 'ApplicationRecord{RuuubyFile}', :db do
    context 'defines module[Syntax]' do
      it 'exists' do
        expect_∃ᵐ(:Syntax, ::RuuubyFile)
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
            expect('//'.match?(::RuuubyFile.syntax_unix_path)).to eq(false)
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
  end
end
