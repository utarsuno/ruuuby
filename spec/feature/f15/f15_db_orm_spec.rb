# encoding: UTF-8

RSpec.describe 'f15_db_orm' do

  context 'db_orm', :db do
    context 'defines f15' do
      it 'passes ORM audit' do
        audit_feature(f15, 'f15', 0, 'enable quicker tracking and auditing of features across versions')
      end
    end
  end

end
