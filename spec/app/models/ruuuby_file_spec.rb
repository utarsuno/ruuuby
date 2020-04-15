# coding: utf-8

RSpec.describe 'ruuuby_file.rb' do

  context 'ApplicationRecord{RuuubyFile}', :db do

    context 'defines module[Syntax]' do
      it 'exists' do
        expect_∃module(:Syntax, ::RuuubyFile)
      end
      context 'dynamically adds needed fetch functions' do
        it 'func{syntax_unix_path}' do
          expect_syntax(RuuubyFile, :syntax_unix_path, RuuubyFile::Syntax::UNIX_PATH)
        end
      end
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
