# coding: UTF-8

RSpec.describe 'f10_db' do

  context 'db', :db do
    context 'defines f10' do
      it 'passes ORM audit' do
        audit_feature(f10, 'f10', 'offer special character aliases for natural ease of readability')
      end
    end
  end

end
