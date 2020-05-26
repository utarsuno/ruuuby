# coding: UTF-8

RSpec.describe 'f04_db' do

  context 'db', :db do
    context 'defines f04' do
      it 'passes ORM audit' do
        audit_feature(f04, 'f04', '`∅` to alias concept of `empty`')
      end
    end
  end

end
