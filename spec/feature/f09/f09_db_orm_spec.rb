# encoding: UTF-8

RSpec.describe 'f09_db_orm' do

  context 'db_orm', :db do
    context 'defines f09' do
      it 'passes ORM audit' do
        audit_feature(f09, 'f09', 0, 'add math `notation & operations` for both `set`(ex: `Set`) and `multiset`(ex: `Array`)')
      end
    end
  end

end
