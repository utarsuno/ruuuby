# encoding: UTF-8

RSpec.describe 'f20_db_orm' do

  context 'db_orm', :db do
    context 'defines f20' do
      it 'passes ORM audit' do
        audit_feature(f20, 'f20', 0, 'enable easier (general) syntax & pattern parsing')
      end
    end
  end

end
