# coding: UTF-8

RSpec.describe 'f07_db_orm' do

  context 'db_orm', :db do
    context 'defines f07' do
      it 'passes ORM audit' do
        audit_feature(f07, 'f07', 0, 'enable quick clean up functions for `enumerables`')
      end
    end
  end

end
