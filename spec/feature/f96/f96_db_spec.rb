# coding: UTF-8

RSpec.describe 'f96_db' do

  context 'db', :db do
    context 'feature{f96}' do
      it 'passes ORM audit' do
        audit_feature(f96, 'f96', 'painlessly support multiple Operation Systems (ex: Alpine Linux, macOS, etc)')
      end
    end

  end

end
