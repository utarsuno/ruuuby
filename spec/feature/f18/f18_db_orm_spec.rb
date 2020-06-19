# coding: UTF-8

RSpec.describe 'f18_db_orm' do

  context 'db_orm', :db do
    context 'defines f18' do
      it 'passes ORM audit' do
        audit_feature(f18, 'f18', 0, 'represent needed fields of math into organized groupings w/ abstractions')
      end
    end
  end

end
