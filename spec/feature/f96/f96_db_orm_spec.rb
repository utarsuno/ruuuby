# encoding: UTF-8

RSpec.describe 'f96_db_orm' do

  context 'db_orm', :db do
    context 'feature{f96}' do
      it 'passes ORM audit' do
        audit_feature(f96, 'f96', 0, 'painlessly support multiple Operation Systems (ex: Alpine Linux, macOS, etc)')
      end
    end

  end

end
