# encoding: UTF-8

RSpec.describe 'f19_db_orm' do

  context 'db_orm', :db do
    context 'defines f19' do
      it 'passes ORM audit' do
        audit_feature(f19, 'f19', 0, 'add support for automatic-differentiation')
      end
    end
  end

end
