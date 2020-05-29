# coding: UTF-8

RSpec.describe 'f99_db' do

  context 'db', :db do
    context 'feature{f99}' do
      it 'passes ORM audit' do
        audit_feature(f99, 'f99', '`Java-extensions`/`JRuby`')
      end
    end

  end

end
