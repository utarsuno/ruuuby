# coding: UTF-8

RSpec.describe 'f04_db_orm' do

  context 'db_orm', :db do
    context 'defines f04' do
      it 'passes ORM audit' do
        audit_feature(f04, 'f04', 0, '`∅` to alias concept of `empty`')
      end
    end
  end

end
