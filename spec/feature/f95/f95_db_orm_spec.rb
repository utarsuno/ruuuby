# coding: UTF-8

RSpec.describe 'f95_db_orm' do

  context 'db_orm', :db do
    context 'feature{f95}' do
      it 'passes ORM audit' do
        audit_feature(f95, 'f95', 0, 'enable pure a `Ruby` only build')
      end
    end

  end

end
