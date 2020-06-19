# coding: UTF-8

RSpec.describe 'f99_db_orm' do

  context 'db_orm', :db do
    context 'feature{f99}' do
      it 'passes ORM audit' do
        audit_feature(f99, 'f99', 0, '`Java-extensions`/`JRuby`')
      end
    end

  end

end
